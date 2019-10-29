syntax on
filetype indent on
"===================================================
set nu                                              "행번호 표시
set cindent                                         "C 언어용 자동 들여쓰기
set shiftwidth=4                                    "들여쓰기 4칸
set tabstop=4                                       "Tab size 4칸
set expandtab                                       "Tab 대신 Space를 사용함.
set softtabstop=4                                   "Tab을 눌렀을 때 표시되는 간격을 지정.
set smartindent
set fileencoding=utf-8
set tenc=utf-8
set fencs=usc-bom,utf-8,euc-kr.utf-8
"project별 .vimrc 구성파일 허용.
"각 프로젝트에 변경하기 위한 내용이 있으면 프로젝트 폴더 내 .vimrc 파일을 생성 후 변경하고 싶은 속성을 추가한다.
set exrc
"===================================================
set history=1000
set laststatus=2
"set statusline=%h%F%m%r%=[%l:%c(%p%%)]
set mouse=a
set backspace=2
"===================================================
let g:molokai_original = 1
let g:rehash256 =1
set background=dark
"===================================================
set tagbsearch                                      "tagbase검색을 이진검색으로 하기.(검색속도 개선)
set hlsearch                                        "검색어 highlight
set title                                           "titlebar에 현재 사용중인 파일명 표시
set showmatch                                       "일치하는 괄호 highlight
set nowrap                                          "자동 줄바꿈 하지 않음.
set nocompatible                                    "Original VI와 호환하지 않음.
set nowrapscan                                      "검색시 처음으로 되돌아가지 않음.
"set visualbell                                     "에러시 화면 깜빡임.
"set linebreak                                      "라인 끝 word를 다음줄로 내림.
"set listchars=tab:▸\ ,trail:-,nbsp:•,eol:↲,extends:→,precedes:←,space:-
set listchars=tab:▸\ ,nbsp:•,eol:↲,extends:→,precedes:←,
set list

"===================================================
"Trailing white space
"===================================================
function TrimWhiteSpace()
      %s/\s*$//
        ''
endfunction

"===================================================
"Man page 설정
"===================================================
func! Man()
	let sm = expand("<cword>")
	exe "!man -S ko:2:3:4:5:6:7:8 ".sm
endfunc
nmap ,ma : call Man()<cr><cr>

"===================================================
"CSCOPE 설정
"===================================================
set csprg=/usr/bin/cscope
"set nocst                                          "cscope 사용안함.
set nocsverb
if filereadable("./cscope.out")
	cs add cscope.out
endif
set csverb
set csto=0
set cst                                             "cscope 사용
func! Css()
	let cssw = expand("<cword>")
	exe "cs f s ".cssw
endfunc
nmap <c-c>s :call Css()<cr>
nmap <silent><c-\>s :cs f s
func! Csc()
	let cscw = expand("<cword>")
	exe "cs f c ".cscw
endfunc
nmap <c-c>c :call Csc()<cr>
nmap <silent><c-\>c :cs f c
func! Csd()
	let csdw = expand("<cword>")
	exe "cs f d ".csdw
endfunc
nmap <c-c>d :call Csd()<cr>
nmap <silent><c-\>d :cs f d
func! Cse()
	let csew = expand("<cword>")
	exe "cs f e ".csew
endfunc
nmap <c-c>e :call Cse()<cr>
nmap <silent><c-\>e :cs f e
func! Csf()
	let csfw = expand("<cword>")
	exe "cs f f ".csfw
endfunc
nmap <c-c>f :call Csf()<cr>
nmap <silent><c-\>f :cs f f
func! Csg()
	let csgw = expand("<cword>")
	exe "cs f g ".csgw
endfunc
nmap <c-c>g :call Csg()<cr>
nmap <silent><c-\>g :cs f g
func! Cst()
	let cstw = expand("<cword>")
	exe "cs f t ".cstw
endfunc
nmap <c-c>t :call Cst()<cr>
nmap <silent><c-\>t :cs f t

"===================================================
"CTAGS 설정
"===================================================
set tags=./tags
if version >= 500				"vim버전이 5.0 이상일때 수행
	func! Sts()				"
		let st = expand("<cword>")
		exe "sts ".st
	endfunc
	nmap ,st :call Sts()<cr>

	func! Tj()
		let st = expand("<cword>")
		exe "tj ".st
	endfunc
	nmap ,tj :call Tj()<cr>
endif
"===================================================
"파일 버퍼 설정 (여러개의 파일을 열고 수정할때 사용)
"===================================================
map ,1 :b!1<CR>
"1번 파일 버퍼로 이동
map ,2 :b!2<CR>
"2번 파일 버퍼로 이동
map ,3 :b!3<CR>
"3번 파일 버퍼로 이동
map ,4 :b!4<CR>
"4번 파일 버퍼로 이동
map ,5 :b!5<CR>
"5번 파일 버퍼로 이동
map ,6 :b!6<CR>
"6번 파일 버퍼로 이동
map ,7 :b!7<CR>
"7번 파일 버퍼로 이동
map ,8 :b!8<CR>
"8번 파일 버퍼로 이동
map ,9 :b!9<CR>
"9번 파일 버퍼로 이동
map ,0 :b!10<CR>
"10번 파일 버퍼로 이동
map ,x :bn!<CR>
"다음 파일 버퍼로 이동
map ,z :bp!<CR>
"이전 파일 버퍼로 이동
map ,w :bw<CR>
"현재 파일 버퍼 닫음

"==================================================
"Autocomlpop 설정 (AutoComplPop plugin 설치 필요.)
"==================================================
function! InsertTabWrapper()
	let col = col('.')-1
	if !col||getline('.')[col-1]!~'\k'
		return "\<TAB>"
	else
		if pumvisible()
			return "\<C-N>"
		else
			return "\<C-N>\<C-P>"
		end
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <expr> <CR> pumvisible() ? "<C-Y><CR>":"<CR>"
hi Pmenu ctermbg=LightBlue ctermfg=white
hi PmenuSel ctermfg=Yellow ctermbg=Black
hi PmenusBar ctermfg=white ctermbg=LightBlue

"===================================================
" Vundle Setting.
"===================================================
"set nocompatible                                   "이 문서 위에 선언되어 있음.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"vundle#begin() - vundle#end() 사이에 설치될 플러그인을 설정한다.
"===================================================
"Plugin Plugin_Name
Plugin 'VundleVim/Vundle.vim'                       "필수 Plugin

Plugin 'The-NERD-tree'                              "파일 탐색기
Plugin 'taglist-plus'
Plugin 'AutoComplPop'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'cecscope'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justinmk/vim-syntax-extra'
"Plugin 'lisposter/vim-blackboard'
"Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
Plugin 'a.vim'

"===================================================
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"===================================================

"===================================================
"vim-airline Setting.
"===================================================
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
set laststatus=2                                    "하단 status바 출력(1로 설정할경우 출력하지 않음.
set t_Co=256                                        "256 color 사용 이 코드를 삽입 해야 plugin의 color가 보임.

"===================================================
"vim-cpp-enhanced-highlight
"===================================================
"let g:cpp_class_scope_highlight = 1                "클래스 범위 강조.
"let g:cpp_member_variable_highlight = 1            "멤버 변수 강조.
"let g:cpp_no_function_highlight = 1                "사용자 정의 함수를 강조하지 않음.
"템플릿 기능 강조.
"let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1                              "플러그인 버그 workaround - 중괄호 오류 표시에 문제가 있음. 이 코드는 해당 문제를 해결합니다.
"===================================================
"tmux 셋팅 (TMUX 설치 필요)
"===================================================
"com! -nargs=0 A execute "silent !tmux send-keys C-c \"   source(\'cur.R\')\" C-m" | execute 'redraw!'
"com! -nargs=0 B execute 'silent !tmux send-keys C-c "   make test" C-m' | execute 'redraw!'
"com! -nargs=0 C execute 'silent !tmux send-keys "   grunt" C-m' | execute 'redraw!'

"===================================================
"단축키 변경
"===================================================
"<map command> <desired shortcut> <action>
nmap <silent><c-Up> :wincmd k<cr>
nmap <silent><c-Down> :wincmd j<cr>
nmap <silent><c-Left> :wincmd h<cr>
nmap <silent><c-Right> :wincmd l<cr>
map <F2> v]}zf
map <F3> zo
nmap <silent><F4> :tabe<cr>
nmap <silent><F5> :TlistUpdate<cr>
nmap <silent><F7> :TlistToggle<cr>
nmap <silent><F8> :NERDTree<cr>
nmap <silent><F9> :NERDTreeClose<cr>
nmap <silent><F12> :tabc<cr>
nmap <silent><c-F12> :wqa<cr>
nmap <silent><TAB> :tabn<cr>
nmap <silent><s-TAB> :tabp<cr>

"===================================================
"NERDTree Setting.
"===================================================
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['\.o$', 'cscope.*', 'tags', '\.su$']

"===================================================
"change colorscheme (for sickill/vim-monokai)
"===================================================
"colorscheme monokai
colorscheme molokai
let g:molokai_original = 1

"===================================================
"옵션 순서에 따라 적용되지 않는 것을 수정하기 위해 아래에 배치.
"===================================================
highlight ExtraWhitespace ctermbg=red guibg=red
highlight Search ctermbg=yellow ctermfg=black guibg=yellow guifg=black
match ExtraWhitespace /\s\+$/

