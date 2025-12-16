return {
  {
    prefix = 'beg',
    body = {
      "\\begin{$1}",
      "$2",
      "\\end{$1}",
      "$0"
    },
    desc = "Begin/End environment"
  },
  {
    prefix = 'im',
    body = '\\$ $1 \\$',
    desc = "Inline math"
  },
  {
    prefix = 'dm',
    body = {
      "\\[",
      "\t$1",
      "\\]",
    },
    desc = "Display math"
  },
  {
    prefix = 'tt',
    body = '\\texttt{$1}$0',
    desc = "Typerighter Text"
  },
  {
    prefix = 'it',
    body = '\\textit{$1}$0',
    desc = "Italic Text"
  },
  {
    prefix = 'em',
    body = '\\emph{$1}$0',
    desc = "Emphasize Text"
  },
  {
    prefix = 'bd',
    body = '\\textbf{$1}$0',
    desc = "Bold Text"
  },
  {
    prefix = 'frac',
    body = '\\frac{$1}{$2}$0',
    desc = "Fraction"
  },
  {
    prefix = 'binom',
    body = '\\binom{$1}{$k}$0',
    desc = "Binomial"
  },
  {
    prefix = 'lim',
    body = '\\lim_{$1 \\to $2}$0',
    desc = "Limit"
  },
  {
    prefix = 'sum',
    body = '\\sum_{n = $1}^{$2}$0',
    desc = "Sum"
  },
  {
    prefix = 'ddx',
    body = '\\frac{d}{dx}',
    desc = 'd/dx',
  },
  {
    prefix = 'dydx',
    body = '\\frac{dy}{dx}',
    desc = 'dy/dx',
  },
  {
    prefix = 'rt',
    body = '\\sqrt{$1}{$2}$0',
    desc = "Root"
  },
  {
    prefix = 'lr',
    body = '\\left$1 $2 \\right$1',
    desc = "Left-Right pair",
  },
  {
    prefix = 'und',
    body = '\\underset{$2}{$1}',
    desc = "Underset",
  },
  {
    prefix = '...',
    body = '\\dots',
    desc = "Dots"
  },
  {
    prefix = 'list',
    body = {
      "\\begin{${1|itemize,enumerate,description|}}",
      "\t\\item $0",
      "\\end{$1}",
    },
    desc = "Lists"
  },
  {
    prefix = 'table',
    body = {
      "\\begin{table}",
      "\\centering",
      "\\caption{${$2:Caption}}",
      "\\label{tab:${$3:Label}}",
      "\\begin{tabular}",
      "$4",
      "\\end{tabular}",
      "\\end{table}",
    },
    desc = "Table"
  },
  {
    prefix = 'fig',
    body = {
      "\\begin{figure}",
      "\\centering",
      "\\includegraphics[width=${$1:0.5}\\textwidth]{${$2:image}}",
      "\\caption{${$3:Caption}}",
      "\\label{fig:${$4:Label}}",
      "\\end{figure}",
      "$0",
    },
    desc = "Figures"
  },
  {
    prefix = 'template',
    body = {
      "\\documentclass[a4paper,12pt]{article}",
      "\\usepackage{caption, float, hyperref, amsmath, amssymbol}",
      "\n",
      "\\author{${1:Author}}",
      "\\date{\\today}",
      "\\title{${2:Title}}",
      "\n",
      "\\begin{document}",
      "\n",
      "\\maketitle",
      "\n",
      "\\newpage",
      "\\tableofcontents",
      "\n",
      "\\newpage",
      "\n",
      "$0",
      "\n",
      "\\end{document}",
    },
    desc = "Basic template"
  },
}
