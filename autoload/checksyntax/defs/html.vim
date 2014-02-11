" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    2


call checksyntax#AddChecker('html?',
            \ {
            \ 'cmd': 'tidy -eq',
            \ 'efm': 'line %l column %c - %m'
            \ }
            \ )


