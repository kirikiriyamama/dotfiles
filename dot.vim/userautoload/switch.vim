nnoremap ! :Switch<CR>

autocmd FileType ruby let b:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['.blank?', '.present?'],
    \   ['include', 'extend'],
    \   ['class', 'module'],
    \   ['.map', 'map!'],
    \   ['attr_accessor', 'attr_reader', 'attr_writer'],
    \   ['describe', 'context', 'specific', 'example'],
    \   ['before', 'after'],
    \   ['be_true', 'be_false'],
    \   ['get', 'post', 'put', 'delete'],
    \   ['==', 'eq', 'eql', 'equal'],
    \ ]

autocmd FileType Gemfile,Berksfile let b:switch_custom_definitions =
    \ [
    \   ['=', '<', '<=', '>', '>=', '~>'],
    \ ]
