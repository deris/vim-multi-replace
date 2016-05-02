multi-replace
===

vim plugin for replacing match pattern strings with register strings(separated by delim) in order.

Screenshot
---

### Replace match pattern strings with register strings(separated by delimiter "\n")

![screenshot1](https://raw.githubusercontent.com/deris/s/master/vim-multi-replace/vim-multi-replace_01_replace.gif)

### Same as above but using cycle option

![screenshot2](https://raw.githubusercontent.com/deris/s/master/vim-multi-replace/vim-multi-replace_02_replace_cycle.gif)

Usage
---

### Commands
```vim
" Select text linewise and you can use following command
" for replacing match pattern strings with register strings(separated by delim) in order.

" Replace match pattern strings with register strings use default settings(ref. global variables).
:'<,'>MultiReplace
" Same as above but using cycle option
:'<,'>MultiReplace --cycle
" Same as first but delimiter is ','
:'<,'>MultiReplace --delim=,
" Same as first but use named register 'a'
:'<,'>MultiReplace --register=a
" Same as first but use specified pattern '$'
:'<,'>MultiReplace --pattern=$
" Same as :'<,'>MultiReplace (there are no options)
:'<,'>MultiReplace --no-cycle --delim=\n --register='"'
```

### Global variables
```vim
" If you want to customize default settings,
" you can change following gloval variable.

" Following settings is default value.
" default delimiter
let g:multi_replace_delim_pattern = "\n"
" default cycle option
let g:multi_replace_cycle_replace = 0
```


### Operators
```vim
" You can use following operator.

" This operator like :'<,'>MultiReplace (use default options).
map <Leader>r <Plug>(operator-multi-replace)
" This operator like :'<,'>MultiReplace --cycle
map <Leader>R <Plug>(operator-multi-replace-cycle)
```

License
---

MIT License

