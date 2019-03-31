call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
  \ 'name': 'buffer',
  \ 'whitelist': ['*'],
  \ 'blacklist': ['go'],
  \ 'completor': function('asyncomplete#sources#buffer#completor'),
  \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
  \ 'name': 'file',
  \ 'whitelist': ['*'],
  \ 'priority': 10,
  \ 'completor': function('asyncomplete#sources#file#completor')
  \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
  \ 'name': 'tags',
  \ 'whitelist': ['ruby'],
  \ 'completor': function('asyncomplete#sources#tags#completor'),
  \ 'config': {
  \    'max_file_size': 50000000,
  \  },
  \ }))
