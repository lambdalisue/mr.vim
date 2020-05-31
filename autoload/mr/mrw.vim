let g:mr#mrw#filename = get(g:, 'mr#mrw#filename', '~/.cache/mr/mrw')
let s:mrw = mr#_new(expand(g:mr#mrw#filename))

function! mr#mrw#list() abort
  return s:mrw.list()
endfunction

function! mr#mrw#start_recording() abort
  augroup mr-mrw-internal
    autocmd! *
    autocmd BufWritePost * call s:mrw.record(expand('<afile>:p'))
  augroup END
endfunction

function! mr#mrw#stop_recording() abort
  augroup mr-mrw-internal
    autocmd! *
  augroup END
endfunction