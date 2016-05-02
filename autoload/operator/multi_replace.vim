" multi-replace - operator for vim-multi-replace
" Version: 0.1.0
" Copyright (C) 2016 deris <deris0126@gmail.com>
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

" Public API {{{1
function! operator#multi_replace#replace(motion_wise)  "{{{2
  call s:impl_multi_replace(function('multi_replace#replace'), '', a:motion_wise)
endfunction
"}}}
function! operator#multi_replace#replace_cycle(motion_wise)  "{{{2
  call s:impl_multi_replace(function('multi_replace#replace'), '--cycle', a:motion_wise)
endfunction
"}}}
"}}}

" Private {{{1
function! s:impl_multi_replace(funcref, opt, motions_wise)  "{{{2
  execute printf('%s,%scall a:funcref("%s")', line("'["), line("']"), a:opt)
endfunction
"}}}
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__ "{{{1
" vim: foldmethod=marker
