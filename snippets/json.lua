return {
  {
    prefix = 'book',
    body = {
      '{"author": "$1", "title": "$2", "subtitle": "$3", "firstRead": ${4:null}, "rereadYears": [$5]}'
    },
    desc = 'Book schema for personal site',
  },
}
