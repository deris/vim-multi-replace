" multi-replace - replacing matched pattern strings with register strings(separated by delimiter) in order
" Version: 0.1.0
" Copyright (C) 2016 deris0126
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

let s:save_cpo = &cpo
set cpo&vim

" vital
let s:V = vital#of('vim_multi_replace')
let s:O = s:V.import('OptionParser')
let s:parser_multi_replace = s:O.new()
let s:parser_multi_replace.disable_auto_help = 1

" Public API {{{1
function! multi_replace#replace(...) range
  call s:multi_replace([join(map(copy(a:000), 'escape(v:val, " ")'), ' ')], a:firstline, a:lastline)
endfunction

function! multi_replace#complete_replace(arglead, cmdline, cursorpos)
  return s:parser_multi_replace.complete(a:arglead, a:cmdline, a:cursorpos)
endfunction
"}}}

" Private {{{1
" define options
call s:parser_multi_replace.on('--pattern=VALUE', 'specify pattern for specifying replacek target')
call s:parser_multi_replace.on('--delim=VALUE', 'delimiter of replace source')
call s:parser_multi_replace.on('--[no-]cycle', 'enable cycle replace')
call s:parser_multi_replace.on('--register=VALUE', 'specify register',
  \ { 'pattern' : '^[0-9a-zA-Z"*+]$' })

function! s:multi_replace(cmd_args, fline, lline)
  let reg = v:register == '' ? '"' : v:register
  let parsed_args = call(s:parser_multi_replace.parse, a:cmd_args, s:parser_multi_replace)
  let a:options = [
    \ get(parsed_args, 'pattern', ''),
    \ get(parsed_args, 'delim', g:multi_replace_delim_pattern),
    \ get(parsed_args, 'cycle', g:multi_replace_cycle_replace),
    \ get(parsed_args, 'register', reg),
    \ ]

  let pattern = a:options[0]
  let delim   = a:options[1]
  let s:cycle = a:options[2]
  let reg     = a:options[3]

  let s:sp_reg = split(getreg(reg), delim)
  let s:index = 0
  if empty(s:sp_reg)
    return
  endif
  silent! execute printf('%d,%ds/%s/\=s:get_from_reg()/g', a:fline, a:lline, pattern)
endfunction

function! s:get_from_reg()
  if !s:cycle && s:index >= len(s:sp_reg)
    return submatch(0)
  endif

  let index = s:index
  let s:index += 1
  if s:cycle && s:index >= len(s:sp_reg)
    let s:index = s:index < len(s:sp_reg) ? s:index : 0
  endif
  return s:sp_reg[index]
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__ "{{{1
" vim: foldmethod=marker
