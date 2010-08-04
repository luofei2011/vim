" Tab completion based on python_pydiction.vim.
" http://www.vim.org/scripts/script.php?script_id=850

if v:version < 700
  echoerr "actionscript plugin requires at least vim 7"
  finish
endif

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" More information at :help use-cpo-save
let s:cpo_save = &cpo
set cpo-=C

" Gather all actionscript.dict files.
if !exists("s:asdict_location")
  let s:asdict_location=substitute(globpath(&rtp, "dict/actionscript.dict"),
                                 \ "\n",
                                 \ ",",
                                 \ "g")
endif

" Load our omnicompletion script.
if exists('&ofu')
  setlocal omnifunc=actionscriptcomplete#CompleteAS
  let &l:dictionary=s:asdict_location
endif

ino <silent> <buffer> <Tab> 
    \<C-R>=<SID>SetVals()<CR>
    \<C-R>=<SID>TabComplete('down')<CR>
    \<C-R>=<SID>RestoreVals()<CR>

ino <silent> <buffer> <S-Tab> 
    \<C-R>=<SID>SetVals()<CR>
    \<C-R>=<SID>TabComplete('up')<CR>
    \<C-R>=<SID>RestoreVals()<CR>

if !exists("*s:TabComplete")
  function! s:TabComplete(direction)
    if searchpos('[_a-zA-Z0-9.]\%#', 'nb') != [0, 0]
      if !pumvisible()
        return "\<C-X>\<C-K>"
      else
        if a:direction == 'down'
          return "\<C-N>"
        else
          return "\<C-P>"
        endif
      endif
    else
      return "\<Tab>"
    endif
  endfunction
endif

if !exists("*s:SetVals")
  function! s:SetVals()
    let s:asdict_save_isk=&l:iskeyword
    setl iskeyword+=.

    let s:asdict_save_dict=&dictionary
    let &dictionary=s:asdict_location

    let s:asdict_save_cot=&completeopt
    let &completeopt="menu,menuone"
    return ""
  endfunction
endif

if !exists("*s:RestoreVals")
  function! s:RestoreVals()
    let &completeopt=s:asdict_save_cot
    let &dictionary=s:asdict_save_dict
    let &l:iskeyword=s:asdict_save_isk
    return ""
  endfunction
endif

let b:undo_ftplugin = "setl omnifunc< dictionary<"

" See :help use-cpo-save
let &cpo = s:cpo_save
unlet s:cpo_save
