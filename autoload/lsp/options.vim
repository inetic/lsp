vim9script

# LSP plugin options
# User can override these by calling the OptionsSet() function.
export var lspOptions: dict<any> = {
  # In insert mode, complete the current symbol automatically
  # Otherwise, use omni-completion
  autoComplete: true,
  # In normal mode, highlight the current symbol automatically
  autoHighlight: false,
  # In insert mode, show the current symbol signature automatically
  showSignature: true,
  # In insert mode, echo the current symbol signature in the status line
  # instead of showing it in a popup
  echoSignature: false,
  # Automatically highlight diagnostics messages from LSP server
  autoHighlightDiags: true,
  # Automatically populate the location list with new diagnostics
  autoPopulateDiags: false,
  # Show the symbol documentation in the preview window instead of in a popup
  hoverInPreview: false,
  # Focus on the location list window after LspShowReferences
  keepFocusInReferences: false,
  # Suppress adding a new line on completion selection with <CR>
  noNewlineInCompletion: false,
  # Outline window size
  outlineWinSize: 20,
  # Open outline window on right side
  outlineOnRight: false,
  # Suppress diagnostic hover from appearing when the mouse is over the line
  # instead of the signature
  noDiagHoverOnLine: true,
  # Show a diagnostic message on a status line
  showDiagOnStatusLine: false,
  # Make diagnostics show in a popup instead of echoing
  showDiagInPopup: true,
  # Don't print message when a configured language server is missing.
  ignoreMissingServer: false,
  # Customize all LSP kinds from the completion popup
  lspKinds: {},
  # Use a floating menu to show the code action menu instead of asking for input
  usePopupInCodeAction: false
}

export var defaultLspKinds: dict<string> = {
  text: 't',
  method: 'm',
  function: 'f',
  constructor: 'C',
  field: 'F',
  variable: 'v',
  class: 'c',
  interface: 'i',
  module: 'M',
  property: 'p',
  unit: 'u',
  value: 'V',
  enum: 'e',
  keyword: 'k',
  snippet: 'S',
  color: 'C',
  file: 'f',
  reference: 'r',
  folder: 'F',
  enumMember: 'E',
  constant: 'd',
  struct: 's',
  event: 'E',
  operator: 'o',
  typeParameter: 'T'
}

# get a custom LSP kind to use in the completion
export def GetLspKind(name: string): string
  if has_key(lspOptions.lspKinds, name)
    return lspOptions.lspKinds[name]
  endif

  return defaultLspKinds[name]
enddef

# set LSP options from user provided options
export def OptionsSet(opts: dict<any>)
  for key in opts->keys()
    lspOptions[key] = opts[key]
  endfor
enddef

# vim: tabstop=8 shiftwidth=2 softtabstop=2
