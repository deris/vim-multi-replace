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

if exists('g:loaded_multi_replace')
  finish
endif
let g:loaded_multi_replace = 1

let s:save_cpo = &cpo
set cpo&vim


command! -nargs=* -range -complete=customlist,multi_replace#complete_replace
  \ MultiReplace <line1>,<line2>call multi_replace#replace(<q-args>)

let g:multi_replace_delim_pattern = get(g:, 'multi_replace_delim_pattern', "\n")
let g:multi_replace_cycle_replace = get(g:, 'multi_replace_cycle_replace', 0)


let &cpo = s:save_cpo
unlet s:save_cpo

" __END__
" vim: foldmethod=marker
