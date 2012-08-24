" checksyntax.vim -- Check syntax when saving a file (php, ruby, tex ...)
" @Author:      Tom Link (micathom AT gmail com)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     04-Mai-2005.
" @Last Change: 2012-08-24.
" GetLatestVimScripts: 1431 0 :AutoInstall: checksyntax.vim
" @Revision:    414

if exists('g:loaded_checksyntax')
    finish
endif
let g:loaded_checksyntax = 200


if !exists('g:checksyntax')
    let g:checksyntax = {}
endif


if !exists('g:checksyntax_auto')
    " If 1, enable automatic syntax checks after saving a file.
    " If 2, enable automatic syntax checks when saving and loading a 
    " file.
    " NOTE: This variable must be customized in vimrc before loading 
    " this plugin.
    let g:checksyntax_auto = 1
endif


augroup CheckSyntax
    autocmd!
    if g:checksyntax_auto >= 1
        autocmd CheckSyntax BufWritePost * call checksyntax#Check(0)
    endif
    if g:checksyntax_auto >= 2
        autocmd CheckSyntax BufEnter * if !exists('b:checksyntax_runs')
                    \ | call checksyntax#Check(0, 0, &ft, 1)
                    \ | endif
    endif
augroup END


" :display: CheckSyntax[!] [NAME]
" Check the current buffer's syntax (type defaults to &filetype).
" Or use NAME instead of &filetype.
"
" With the bang !, run all alternatives (see 
" |g:checksyntax#run_alternatives|).
command! -bang -nargs=? CheckSyntax call checksyntax#Check(1, "<bang>", <f-args>)


" @TPluginInclude
if !hasmapto(':CheckSyntax')
    if empty(maparg('<F5>', 'n'))
        noremap <F5> :CheckSyntax<cr>
    endif
    if empty(maparg('<F5>', 'i'))
        inoremap <F5> <c-o>:CheckSyntax<cr>
    endif
    if empty(maparg('<C-F5>', 'n'))
        noremap <F5> :CheckSyntax!<cr>
    endif
    if empty(maparg('<C-F5>', 'i'))
        inoremap <F5> <c-o>:CheckSyntax!<cr>
    endif
endif

