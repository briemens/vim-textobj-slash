if exists('g:loaded_textobj_slash')
  finish
endif

call textobj#user#plugin('slash', {
\      '/': {
\        '*sfile*': expand('<sfile>:p'),
\        'select-a': 'a/',  '*select-a-function*': 's:select_a',
\        'select-i': 'i/',  '*select-i-function*': 's:select_i'
\      }
\    })

function! s:select_a()
  normal! F/

  let end_pos = getpos('.')

  normal! f/

  let start_pos = getpos('.')
  return ['v', start_pos, end_pos]
endfunction

" ciao_come_stai

function! s:select_i()
  let initial_pos = getpos('.')

  normal! T/

  let start_pos = getpos('.')

  if start_pos == initial_pos
    normal! b

    let start_pos = getpos('.')
  endif

  normal! t/

  let end_pos = getpos('.')

  if end_pos == start_pos
    normal! e

    let end_pos = getpos('.')
  endif

  return ['v', start_pos, end_pos]
endfunction

let g:loaded_textobj_slash = 1
