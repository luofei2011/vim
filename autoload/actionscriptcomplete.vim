let s:AS3_CLASSES = {
\ 'flash': {
\   'accessibility': {},
\   'data': {},
\   'display': {
\     'Graphics': {
\       'm': {
\         'beginFill': {
\           'r': 'void',
\           'a': ['color:uint', 'alpha:Number = 1.0']
\         },
\         'endFill': {
\           'r': 'void',
\         },
\       },
\     },
\   },
\ },
\}

function! actionscriptcomplete#CompleteAS(findstart, base)
  if a:findstart
    " Find item start.
    " We return index to last word, which is what omnicomplete will change,
    " but we also store context of preceeding words in expression,
    " connected by dots.
    let line = getline('.')
    let pos = col('.') - 1
    let lastword = -1
    while pos > 0
      let c = line[pos - 1]
      if c =~ '\w'
        let pos -= 1
      elseif line[pos - 1] =~ '\.'
        if lastword == -1
          let lastword = pos
        endif
        let pos -= 1
      else
        break
      endif
    endwhile

    if lastword == -1
      let s:context = ''
      lastword = pos
    else
      let s:context = strpart(line, pos, lastword - pos)
    endif
    return lastword
  else
    let base = a:base
    let context = s:context

    let values = []
    if context == 'flash.'
      let pkg = ['accessibility', 'data', 'desktop', 'display', 'errors',
               \ 'events', 'external', 'filesystem', 'filters', 'geom',
               \ 'html', 'media', 'net', 'printing', 'profiler', 'sampler',
               \ 'security', 'system', 'text', 'ui', 'utils', 'xml']
      let values += pkg
    elseif context == 'flash.display.'
      let cls = ['Bitmap', 'BitmapData', 'DisplayObject', 'Graphics', 'Loader', 'Shape', 'Sprite', 'Stage']
      let values += cls
    endif

    " Add values which have base as a prefix.
    let items = []
    for v in values
      if v =~ '^' . base
        call add(items, v)
      endif
    endfor
    return items
  endif
endfunction
