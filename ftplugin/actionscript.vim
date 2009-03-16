if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" More information at :help use-cpo-save
let s:cpo_save = &cpo
set cpo-=C

" Load our omnicompletion script.
if exists('&ofu')
  setlocal omnifunc=actionscriptcomplete#CompleteAS
endif

let b:undo_ftplugin = "setl omnifunc<"

" See :help use-cpo-save
let &cpo = s:cpo_save
unlet s:cpo_save
