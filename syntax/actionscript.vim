" Vim syntax file for ActionScript 3
" Based on ActionScript2 plugin by Igor Dvorsky at:
"   http://www.modesite.net/vim/actionscript.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
  finish
endif
  let main_syntax = 'actionscript'
endif

" based on "JavaScript" VIM syntax by Claudio Fleiner <claudio@fleiner.com>

syn match   actionScriptLineComment			"\/\/.*$"
syn match   actionScriptCommentSkip			"^[ \t]*\*\($\|[ \t]\+\)"
syn region  actionScriptCommentString			start=+"+  skip=+\\\\\|\\"+  end=+"+ end=+\*/+me=s-1,he=s-1 contains=actionScriptSpecial,actionScriptCommentSkip,@htmlPreproc
syn region  actionScriptComment2String			start=+"+  skip=+\\\\\|\\"+  end=+$\|"+  contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptComment				start="/\*"  end="\*/" contains=actionScriptCommentString,actionScriptCharacter,actionScriptNumber
syn match   actionScriptSpecial				"\\\d\d\d\|\\."
syn region  actionScriptStringD				start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptStringS				start=+'+  skip=+\\\\\|\\'+  end=+'+  contains=actionScriptSpecial,@htmlPreproc
syn match   actionScriptSpecialCharacter		"'\\.'"
syn match   actionScriptNumber				"-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"

" Actionscript 3 Statements, Keywords & Directives
syn keyword actionScriptCase case
syn match   actionScriptCase "\<default\>"  " Needs to be defined before default xml namespace.
syn match   actionScriptDirective "\<default\>\s\+xml\s\+namespace\>"
syn match   actionScriptDirective "\<use\>\s\+namespace\>"
syn keyword actionScriptDirective import include
syn keyword actionScriptAttribute dynamic final internal native override private protected public static
syn keyword actionScriptDefinition class const extends function get implements interface namespace package set var
syn keyword actionScriptBoolean true false
syn keyword actionScriptConstant null
syn keyword actionScriptIdentifier arguments this super

" Special types.
syn keyword actionScriptType void Null

" Top level constants.
syn keyword actionScriptConstant Infinity NaN undefined

" Operators
syn keyword actionScriptOperator     as delete instanceof is new typeof

" Top level classes.
syn keyword actionScriptType         int uint
syn keyword actionScriptException    ArgumentError DefinitionError Error EvalError RangeError ReferenceError SecurityError SyntaxError TypeError URIError VerifyError
syn keyword actionScriptType         Array Boolean Date Math Number Object RegExp String XML XMLList
syn keyword actionScriptType         Class Function Namespace QName

syn keyword actionScriptConditional  if else switch and or not
syn keyword actionScriptRepeat       do while for each in
syn keyword actionScriptBranch       break continue
syn keyword actionScriptStatement    return with
syn keyword actionScriptException    try catch finally throw
syn match   actionScriptBraces       "([{}])"

" catch errors caused by wrong parenthesis
syn match   actionScriptInParen      contained "[{}]"
syn region  actionScriptParen        transparent start="(" end=")" contains=actionScriptParen,actionScript.*
syn match   actionScrParenError      ")"

if main_syntax == "actionscript"
  syn sync ccomment actionScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_actionscript_syn_inits")
  if version < 508
    let did_actionscript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink actionScriptOperator Operator
  HiLink actionScriptIdentifier Identifier
  HiLink actionScriptType Type
  HiLink actionScriptBoolean Boolean
  HiLink actionScriptConstant Constant
  HiLink actionScriptTypedef Typedef
  HiLink actionScriptDirective		Include
  HiLink actionScriptDefinition		StorageClass
  HiLink actionScriptAttribute		StorageClass
  HiLink actionScriptComment		Comment
  HiLink actionScriptLineComment	Comment
  HiLink actionScriptSpecial		Special
  HiLink actionScriptStringS		String
  HiLink actionScriptStringD		String
  HiLink actionScriptCharacter		Character
  HiLink actionScriptSpecialCharacter	actionScriptSpecial
  HiLink actionScriptNumber		actionScriptValue
  HiLink actionScriptBraces		Function
  HiLink actionScriptError		Error
  HiLink actionScrParenError		actionScriptError
  HiLink actionScriptInParen		actionScriptError
  HiLink actionScriptConditional	Conditional
  HiLink actionScriptRepeat		Repeat
  HiLink actionScriptBranch Conditional
  HiLink actionScriptCase		Label
  HiLink actionScriptObjects		Operator
  HiLink actionScriptStatement		Statement
  HiLink actionScriptValue		Boolean
  HiLink actionScriptArray		Type
  HiLink actionScriptDate		Type
  HiLink actionScriptMath		Type
  HiLink actionScriptNumberObj		Type
  HiLink actionScriptObject		Function
  HiLink actionScriptString		Type
  HiLink actionScriptColor		Type
  HiLink actionScriptKey		Type
  HiLink actionScriptMouse		Type
  HiLink actionScriptSelection		Type
  HiLink actionScriptSound		Type
  HiLink actionScriptStage		Type
  HiLink actionScriptSystem		Type
  HiLink actionScriptTextFormat		Type
  HiLink actionScriptCommunication	Type
  HiLink actionScriptXMLSocket		Type
  HiLink actionScriptTextField		Type
  HiLink actionScriptException		Exception
  HiLink actionScriptXML			Type
  HiLink actionScriptArrayConstant	Constant
  HiLink actionScriptStringConstant	Constant
  HiLink actionScriptEventConstant	Constant
  HiLink actionScriptTextSnapshot	Type
  HiLink actionScriptID3			Type
  HiLink actionScriptStyleSheet		Type
  HiLink flash8Constants		Constant
  HiLink flash8Functions		Function
  HiLink flash8Properties		Type
  HiLink flash8Classes 			Type
  HiLink actionScriptInclude		Include
  delcommand HiLink
endif

let b:current_syntax = "actionscript"
if main_syntax == 'actionscript'
  unlet main_syntax
endif

" vim: ts=8
