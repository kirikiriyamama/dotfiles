nnoremap ! :Switch<CR>

autocmd FileType ruby let b:switch_custom_definitions =
    \ [
    \   ['if', 'unless'],
    \   ['.blank?', '.present?'],
    \   ['include', 'extend'],
    \   ['class', 'module'],
    \   ['.map', 'map!'],
    \   ['attr_accessor', 'attr_reader', 'attr_writer'],
    \ ]

autocmd FileType Gemfile,Berksfile let b:switch_custom_definitions =
    \ [
    \   ['=', '<', '<=', '>', '>=', '~>'],
    \ ]

autocmd FileType rspec let b:switch_custom_definitions =
    \ [
    \   ['describe', 'context', 'specific', 'example'],
    \   ['before', 'after'],
    \   ['be_true', 'be_false'],
    \   ['get', 'post', 'put', 'delete'],
    \   ['==', 'eql', 'equal'],
    \ ]
