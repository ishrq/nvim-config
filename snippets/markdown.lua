return {
  {
    prefix = 'blog',
    body = {
      "---",
      "title: $1",
      "slug: $2",
      "description: $3",
      "tags: [$4]",
      "date: ${CURRENT_YEAR}-${CURRENT_MONTH}-${CURRENT_DATE}T${CURRENT_HOUR}:${CURRENT_MINUTE}:${CURRENT_SECOND}.000+0600",
      "draft: ${5:true}",
      "changelog:",
      '\t- date: ""',
      '\t\tchanges:',
      '\t\t\t- ""',
      "---\n\n",
      "$0"
    },
    desc = "Blog meta for ishrq.com"
  },
  {
    prefix = 'note',
    body = {
      '<div class="border-1 p-4 bg-red-50 dark:bd-red-400">',
      '\t<strong>Note</strong>:<br><br>',
      '\t\t$1',
      '</div>$0',
    },
    desc = 'Note block for ishrq.com'
  },
  {
    prefix = 'pn',
    body = {
      "---",
      "Type: Permanent Note",
      "Topic: ${1:CS}",
      "Title: ${2:Title}",
      "Related:$3",
      "---\n\n",
      "# $2\n$0",
    },
    desc = 'Permanent note',
  },
  {
    prefix = 'ln',
    body = {
      "---",
      "Type: Literature Note",
      "Author: ${1:Author}",
      "${2|Book,Essay,Article,Podcast,Video,Paper|}: ${3:Title}",
      "---\n\n",
      "# $3 by $1\n$0",
    },
    desc = 'Literature note',
  },
  {
    prefix = 'fn',
    body = '[^${1:1}]: ',
    desc = 'Footnote'
  },
  {
    prefix = 'link',
    body = '[${1:Alt}](${2:URL})',
    desc = 'External link'
  },
  {
    prefix = 'img',
    body = '![${1:Alt}](${2:Path})',
    desc = 'Image link'
  },
  {
    prefix = 'td',
    body = '- [${1: }] ',
    desc = 'Todo'
  },
  {
    prefix = 'cb',
    body = {
      "```${1|,plaintex,python,go,javascript,typescript,html,css,rust,c,perl|}",
      "$2",
      "```"
    },
    desc = 'Codeblock'
  },
  {
    prefix = '2x4',
    body = {
      "| $1 | $2 |",
      "| --- | --- |",
      "| $3 | $4 |",
      "| $5 | $6 |",
      "| $7 | $8 |",
      "| $9 | $10 |",
    },
    desc = "Table 2 x 4"
  },
}
