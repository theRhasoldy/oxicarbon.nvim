local colorscheme_name = "oxicarbon"

vim.api.nvim_set_var("colors_name", colorscheme_name)
local colorscheme = require(colorscheme_name)

local colors = {
  none = { nil, 0 },
  background = { "#121212", 1 },
  normal = { "#d9d5ee", 2 },
  faded = { "#5a566f", 3 },
  faded_lighter = { "#716d86", 4 },
  faded_darker = { "#353344", 5 },
  cursor = { "#2a2938", 6 },
  pumpkin = { "#ffbdbf", 7 },
  gum = { "#F69C99", 8 },
  fire = { "#f68673", 9 },
  plump = { "#e5759b", 10 },
  violet = { "#cda9e0", 11 },
  dawn = { "#c17ab2", 12 },
  lukewarm = { "#50af84", 13 },
  aqua = { "#4d8eae", 14 },
  error = { "#ff5e77", 15 },
  warning = { "#ffcda2", 16 },
  diffAdd = { "#2D453F", 16 },
  diffDelete = { "#6B373F", 16 },
  diffChange = { "#3A2D45", 16 },
  diffText = { "#5A4869", 16 },
}

colorscheme.highlight_all({
  -- Editor UI {{{
  ColorColumn = { fg = colors.none, reverse = true },
  NormalFloat = { bg = colors.none },
  FloatBorder = { bg = colors.background, fg = colors.faded_darker },
  Pmenu = function(self)
    return { fg = self.Normal.fg, bg = colors.faded_darker }
  end,
  PmenuSbar = { bg = colors.faded_darker },
  PmenuSel = "CursorLine",
  PmenuThumb = { bg = colors.faded_darker },
  WildMenu = "PmenuSel",
  LineNr = { fg = colors.faded },
  -- Status Line
  StatusLine = { bg = nil },
  StatusLineNC = function(self)
    return { fg = colors.normal, bg = self.StatusLine.bg }
  end,
  StatusLineTerm = "StatusLine",
  StatusLineTermNC = "StatusLineNC",
  -- Tabline
  TabLine = function(self)
    return { fg = self.Normal.fg, bg = self.StatusLine.bg }
  end,
  TabLineFill = function(self)
    return { fg = self.TabLine.bg, bg = colors.black }
  end,
  TabLineSel = function(self)
    return { fg = self.TabLine.fg, bg = self.Normal.bg }
  end,
  -- Line Highlighting
  QuickFixLine = function(self)
    return { bg = self.StatusLine.bg }
  end,
  Visual = { bg = colors.faded_darker },
  VisualNOS = { bg = colors.faded_darker },
  -- }}}

  -- Cursor {{{
  Cursor = { fg = colors.pink, bg = colors.pink, reverse = true },
  CursorIM = "Cursor",
  CursorColumn = { bg = colors.cursor },
  CursorLine = { bg = colors.cursor },
  CursorLineNr = function(self)
    return { fg = colors.plump, bg = self.LineNr.bg, bold = true }
  end,
  -- }}}

  -- Treesitter context {{{
  TreesitterContext = "Normal",
  TreesitterContextLineNumber = "CursorLineNr",
  -- }}}

  -- Plaintext {{{
  -- Basic styles {{{
  Normal = { fg = colors.normal, bg = colors.none },
  Title = { fg = colors.faded, bold = true },
  Bold = { bold = true },
  Italic = { italic = true },
  Underlined = { underline = true },
  -- "Non"-text
  NonText = { fg = colors.faded_darker },
  Ignore = { fg = colors.faded },
  Whitespace = "NonText",
  Conceal = "NonText",
  EndOfBuffer = "NonText",
  -- Literals
  Constant = { fg = colors.gum },
  String = { fg = colors.normal },
  Character = { fg = colors.pumpkin },
  Number = { fg = colors.gum },
  Float = "Number",
  Boolean = { fg = colors.lukewarm },
  -- Syntax
  Comment = { fg = colors.faded_lighter, italic = true },
  Conditional = { fg = colors.violet, italic = true },
  Debug = "WarningMsg",
  Delimiter = { fg = colors.plump, bold = true },
  Exception = { fg = colors.lukewarm, bold = true },
  Function = { fg = colors.plump },
  Identifier = { fg = colors.violet },
  Keyword = { fg = colors.aqua },
  Label = { fg = colors.gum, bold = true },
  Noise = "Delimiter",
  Operator = { fg = colors.faded_lighter, bold = true },
  Repeat = { fg = colors.plump, bold = true },
  Statement = { fg = colors.lukewarm },
  StorageClass = { fg = colors.fire, bold = true },
  Structure = { fg = colors.lukewarm, bold = true },
  Tag = "Underlined",
  Type = { fg = colors.dawn },
  Typedef = { fg = colors.fire, italic = true },
  -- Pre-processor
  Define = { fg = colors.gum, nocombine = true },
  Include = { fg = colors.aqua, nocombine = true },
  Macro = { fg = colors.lukewarm, italic = true },
  PreCondit = { fg = colors.pumpkin, italic = true },
  PreProc = { fg = colors.pumpkin },
  -- Special
  Special = { fg = colors.pumpkin, bold = true },
  SpecialChar = { fg = colors.lukewarm, italic = true },
  SpecialComment = { fg = colors.pumpkin, bold = true, nocombine = true },
  SpecialKey = "Character",
  -- InlayHints
  LSPInlayHint = { fg = colors.faded_lighter, italic = true },
  -- }}}

  -- Treesitter {{{
  -- Misc
  ["@comment"] = "Comment",
  ["@error"] = "Error",
  ["@preproc"] = "PreProc", -- various preprocessor directives & shebangs
  ["@define"] = "Define", -- preprocessor definition directives
  ["@operator"] = "Operator", -- For any operator: +, but also -> and * in C.
  -- Punctuation
  ["@punctuation.delimiter"] = "Delimiter", -- For delimiters ie: .
  ["@punctuation.bracket"] = { fg = colors.pumpkin }, -- For brackets and parenthesis.
  ["@punctuation.special"] = { fg = colors.violet }, -- For special punctutation that does not fall in the catagories before.
  -- Literals
  ["@string"] = "String", -- For strings.
  ["@string.regex"] = { fg = colors.gum, bold = true }, -- For regexes.
  ["@string.escape"] = { fg = colors.fire, italic = true }, -- For escape characters within a string.
  ["@string.special"] = { fg = colors.aqua }, -- other special strings (e.g. dates)
  ["@character"] = "Character", -- character literals
  ["@character.special"] = "SpecialChar", -- special characters (e.g. wildcards)
  ["@boolean"] = "Boolean", -- For booleans.
  ["@number"] = "Number", -- For all numbers
  ["@float"] = "Number", -- For floats.
  -- Functions
  ["@function"] = "Function", -- For function (calls and definitions).
  ["@function.builtin"] = { fg = colors.fire }, -- For builtin functions: table.insert in Lua.
  ["@function.call"] = "@function", -- function calls
  ["@function.macro"] = { fg = colors.pumpkin }, -- For macro defined functions (calls and definitions): each macro_rules in RusC.
  ["@method"] = { fg = colors.plump }, -- For method calls and definitions.
  ["@method.call"] = "@method", -- method calls
  ["@constructor"] = { fg = colors.aqua }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
  ["@parameter"] = { fg = colors.violet, italic = true }, -- For parameters of a function.
  -- Keywords
  ["@keyword"] = "Keyword", -- For keywords that don't fall in previous categories.
  ["@keyword.function"] = { fg = colors.violet }, -- For keywords used to define a function.
  ["@keyword.operator"] = { fg = colors.violet }, -- For new keyword operator
  ["@keyword.return"] = { fg = colors.fire, bold = true, italic = true },
  -- JS & derivative
  ["@keyword.export"] = { fg = colors.fire, italic = true },
  ["@conditional"] = "Conditional", -- For keywords related to conditionnals.
  ["@repeat"] = "Repeat", -- For keywords related to loops.
  -- @debug            ; keywords related to debugging
  ["@label"] = "Label", -- For labels: label: in C and :label: in Lua.
  ["@include"] = "Include", -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
  ["@exception"] = "Exception", -- For exception related keywords.
  -- Types

  ["@type"] = "Type", -- For types.
  ["@type_identifier"] = "Type", -- For types.
  ["@type.builtin"] = { fg = colors.lukewarm }, -- For builtin types.
  ["@type.definition"] = "Operator", -- type definitions (e.g. `typedef` in C)
  ["@type.qualifier"] = { fg = colors.lukewarm }, -- type qualifiers (e.g. `const`)
  ["@storageclass"] = "StorageClass", -- visibility/life-time/etc. modifiers (e.g. `static`)
  ["@attribute"] = "Constant", -- attribute annotations (e.g. Python decorators)
  ["@field"] = { fg = colors.violet }, -- For fields.
  ["@property"] = { fg = colors.violet }, -- Same as TSField.
  -- Identifiers

  ["@variable"] = { fg = colors.pumpkin }, -- Any variable name that does not have another highlight.
  ["@variable.builtin"] = { fg = colors.lukewarm }, -- Variable names that are defined by the languages, like this or self.
  ["@constant"] = { fg = colors.gum }, -- For constants
  ["@constant.builtin"] = { fg = colors.fire }, -- For constant that are built in the language: nil in Lua.
  ["@constant.macro"] = "Macro", -- For constants that are defined by macros: NULL in C.
  ["@namespace"] = { fg = colors.lukewarm, italic = true }, -- For identifiers referring to modules and namespaces.
  ["@symbol"] = { fg = colors.gum },
  -- Text

  ["@text"] = { fg = colors.normal }, -- For strings considerated text in a markup language.
  ["@text.strong"] = { fg = colors.pumpkin, bold = true }, -- bold
  ["@text.emphasis"] = { fg = colors.pumpkin, italic = true }, -- italic
  ["@text.underline"] = "Underline", -- underlined text
  ["@text.strike"] = { fg = colors.normal, strikethrough = true }, -- strikethrough text
  ["@text.title"] = "Ttile", -- titles like: # Example
  ["@text.literal"] = { fg = colors.pumpkin }, -- used for inline code in markdown and for doc in python (""")
  ["@text.uri"] = { fg = colors.violet, italic = true, underline = true }, -- urls, links and emails
  ["@text.math"] = { fg = colors.aqua }, -- math environments (e.g. `$ ... $` in LaTeX)
  ["@text.environment"] = { fg = colors.lukewarm }, -- text environments of markup languages
  ["@text.environment.name"] = { fg = colors.aqua }, -- text indicating the type of an environment
  ["@text.reference"] = { fg = colors.gum, bold = true }, -- references
  ["@text.todo"] = { fg = colors.lukewarm }, -- todo notes
  -- Tags
  ["@tag"] = { fg = colors.gum }, -- Tags like html tag names.
  ["@tag.attribute"] = { fg = colors.violet, italic = true }, -- Tags like html tag names.
  ["@tag.delimiter"] = { fg = colors.fire }, -- Tag delimiter like < > /
  -- Semantic tokens
  ["@class"] = { fg = colors.dawn },
  ["@struct"] = { fg = colors.aqua },
  ["@enum"] = { fg = colors.lukewarm },
  ["@enumMember"] = { fg = colors.aqua },
  ["@event"] = { fg = colors.fire },
  ["@interface"] = { fg = colors.gum },
  ["@modifier"] = { fg = colors.plump },
  ["@regexp"] = { fg = colors.pumpkin },
  ["@typeParameter"] = { fg = colors.lukewarm },
  ["@decorator"] = { fg = colors.pumpkin },
  -- Language specific:

  -- css
  ["@property.css"] = { fg = colors.pumpkin },
  ["@property.id.css"] = { fg = colors.violet },
  ["@property.class.css"] = { fg = colors.lukewarm },
  ["@type.css"] = { fg = colors.pumpkin },
  ["@type.tag.css"] = { fg = colors.lukewarm },
  ["@string.plain.css"] = { fg = colors.pumpkin },
  ["@number.css"] = { fg = colors.gum },
  -- toml
  ["@property.toml"] = { fg = colors.plump }, -- Differentiates between string and properties
  -- json
  ["@label.json"] = { fg = colors.aqua }, -- For labels: label: in C and :label: in Lua.
  -- lua
  ["@constructor.lua"] = { fg = colors.gum }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
  -- typescript
  ["@constructor.typescript"] = { fg = colors.lukewarm },
  -- TSX (Typescript React)
  ["@type.dart"] = "Type",
  ["@constructor.tsx"] = { fg = colors.lukewarm },
  ["@tag.attribute.tsx"] = { fg = colors.gum, italic = true },
  -- cpp
  ["@property.cpp"] = { fg = colors.lukewarm },
  -- yaml
  ["@field.yaml"] = { fg = colors.gum }, -- For fields.
  -- Ruby
  ["@symbol.ruby"] = { fg = colors.fire },
  -- PHP
  ["@type.qualifier.php"] = "Keyword", -- type qualifiers (e.g. `const`)
  ["@method.php"] = "Function",
  ["@method.call.php"] = "Function",
  -- }}}
  -- Markup {{{

  ["@markup"] = "@none",
  ["@markup.emphasis"] = {
    italic = true,
  },
  ["@markup.environment"] = "Macro",
  ["@markup.environment.name"] = "Type",
  ["@markup.heading"] = "Title",
  ["@markup.heading.1.markdown"] = {
    bold = true,
    fg = "#7aa2f7",
  },
  ["@markup.heading.2.markdown"] = {
    bold = true,
    fg = "#e0af68",
  },
  ["@markup.heading.3.markdown"] = {
    bold = true,
    fg = "#9ece6a",
  },
  ["@markup.heading.4.markdown"] = {
    bold = true,
    fg = "#1abc9c",
  },
  ["@markup.heading.5.markdown"] = {
    bold = true,
    fg = "#bb9af7",
  },
  ["@markup.heading.6.markdown"] = {
    bold = true,
    fg = "#9d7cd8",
  },
  ["@markup.link"] = {
    fg = "#1abc9c",
  },
  ["@markup.link.label"] = "SpecialChar",
  ["@markup.link.label.symbol"] = "Identifier",
  ["@markup.link.url"] = "Underlined",
  ["@markup.list"] = {

    fg = "#89ddff",
  },
  ["@markup.list.checked"] = {
    fg = "#73daca",
  },
  ["@markup.list.markdown"] = {
    bold = true,
    fg = "#ff9e64",
  },
  ["@markup.list.unchecked"] = {
    fg = "#7aa2f7",
  },
  ["@markup.math"] = "Special",
  ["@markup.raw"] = "String",
  ["@markup.raw.markdown_inline"] = {
    bg = "#414868",
    fg = "#7aa2f7",
  },
  ["@markup.strikethrough"] = {
    strikethrough = true,
  },
  ["@markup.strong"] = {
    bold = true,
  },
  ["@markup.underline"] = {
    underline = true,
  },
  -- }}}

  -- LSP {{{
  ["@lsp.mod.constant"] = "Constant",
  ["@lsp.mod.readonly"] = "Constant",
  ["@lsp.type.boolean"] = "Boolean",
  ["@lsp.type.character"] = "Character",
  ["@lsp.type.float"] = "Float",
  ["@lsp.type.parameter"] = "@parameter",
  ["@lsp.type.interface"] = "Function",
  ["@lsp.type.namespace"] = "@namespace",
  ["@lsp.type.number"] = "Number",
  ["@lsp.type.operator"] = "Operator",
  ["@lsp.type.string"] = "String",
  ["@lsp.type.class"] = "@class",
  ["@lsp.type.enum"] = "@enum",
  ["@lsp.type.type"] = "@type",
  ["@lsp.type.macro"] = "Macro",
  ["@lsp.type.method"] = "@method",
  ["@lsp.type.function"] = "@function",
  ["@lsp.type.struct"] = "@struct",
  ["@lsp.type.variable"] = "@variable",
  ["@lsp.type.decorator"] = "@decorator",
  ["@lsp.type.typeParameter"] = "@typeParameter",
  ["@lsp.type.property"] = "@property",
  --}}}

  -- Folds
  FoldColumn = { bg = colors.faded, bold = true },
  Folded = { bg = nil, italic = true },
  UfoFoldedEllipsis = { fg = colors.pumpkin, bold = true },
  -- Diffs
  DiffAdd = { fg = colors.black, bg = colors.diffAdd },
  diffAdded = "DiffAdd",
  DiffChange = { fg = colors.diffChange },
  DiffDelete = function(self)
    return { fg = self.DiffAdd.fg, bg = colors.diffDelete }
  end,
  DiffviewDiffAdd = { bg = colors.diffAdd },
  DiffviewDiffDelete = { bg = colors.diffDelete },
  DiffviewDiffChange = { bg = colors.diffChange },
  DiffviewDiffText = { bg = colors.diffText },
  DiffText = { bg = colors.diffText },
  diffRemoved = "DiffDelete",
  -- Searching
  IncSearch = { bold = true, underline = true },
  Search = { sp = colors.white, underline = true },
  MatchParen = { fg = colors.plump, bold = true, underline = true },
  -- Spelling
  SpellBad = { sp = colors.error, undercurl = true },
  SpellCap = { sp = colors.warning, undercurl = true },
  SpellLocal = { sp = colors.green, undercurl = true },
  SpellRare = { sp = colors.orange, undercurl = true },
  -- Conditional Column Highlighting
  SignColumn = {},
  -- Messages
  Error = { fg = colors.error, bold = true },
  ErrorMsg = { fg = colors.error, bold = true },
  ModeMsg = { fg = colors.warning },
  Question = { fg = colors.orange_light, underline = true },
  Info = { fg = colors.faded, bold = true },
  InfoMsg = { fg = colors.faded, bold = true },
  Hint = { fg = colors.violet, bold = true },
  HintMsg = { fg = colors.violet, bold = true },
  Todo = { fg = colors.black, bg = colors.cyan, bold = true },
  Warning = { fg = colors.warning, bold = true },
  WarningMsg = { fg = colors.warning, bold = true },
  -- Diagnostics
  debugBreakpoint = "ErrorMsg",
  debugPC = "ColorColumn",
  DiagnosticError = "Error",
  DiagnosticFloatingError = "ErrorMsg",
  DiagnosticSignError = "DiagnosticFloatingError",
  DiagnosticWarn = "Warning",
  DiagnosticFloatingWarn = "WarningMsg",
  DiagnosticSignWarn = "DiagnosticFloatingWarn",
  DiagnosticHint = "Hint",
  DiagnosticFloatingHint = "HintMsg",
  DiagnosticSignHint = "DiagnosticFloatingHint",
  DiagnosticInfo = "Info",
  DiagnosticFloatingInfo = "InfoMsg",
  DiagnosticSignInfo = "DiagnosticFloatingInfo",
  DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
  DiagnosticUnderlineHint = { sp = colors.violet, undercurl = true },
  DiagnosticUnderlineInfo = { sp = colors.faded_lighter, undercurl = true },
  DiagnosticUnderlineWarn = { sp = colors.warning, undercurl = true },
  -- Misc
  Directory = { fg = colors.pumpkin },
  VertSplit = { fg = colors.faded_darker },
  -- Telescope {{{
  TelescopeNormal = { bg = colors.background },
  TelescopeBorder = "FloatBorder",
  TelescopeTitle = "Title",
  TelescopeSelection = "CursorLine",
  -- }}}

  -- Whichkey {{{
  WhichKey = "Normal",
  WhichKeyFloat = "Normal",
  -- }}}

  -- Gitsigns
  GitSignsAdd = { fg = colors.lukewarm },
  GitSignsChange = { fg = colors.fire },
  GitSignsDelete = { fg = colors.plump },
  GitSignsCurrentLineBlame = { fg = colors.faded_lighter },
  -- lazy.nvim
  LazyButton = "TabLine",
  LazyButtonActive = "TabLineSel",
  LazyCommit = "Number",
  LazyCommitIssue = "LazyUrl",
  LazyCommitType = "Type",
  LazyDir = "Directory",
  LazyH1 = "markdownH1",
  LazyH2 = "markdownH2",
  LazyProp = "@field",
  LazyReasonEvent = "Repeat",
  LazyReasonFt = "Conditional",
  LazyReasonImport = "Function",
  LazyReasonKeys = "String",
  LazyReasonPlugin = "Label",
  LazyReasonSource = "Include",
  LazyReasonStart = "Constant",
  LazySpecial = "Special",
  LazyTaskOutput = "Statement",
  LazyUrl = "Underlined",
  -- LSPSaga
  SagaNormal = { bg = colors.background },
  TitleString = { fg = colors.plump, bold = true },
  TitleIcon = "TitleString",
  TitleSymbol = { bg = colors.none },
  TitleFileIcon = "Title",
  RenameBorder = { fg = colors.plump },
  RenameNormal = { fg = colors.plump },
  CodeActionText = "Normal",
  DefinitionCount = "Number",
  DefinitionIcon = "Special",
  ReferencesCount = "Number",
  ReferencesIcon = "DefinitionIcon",
  TargetFileName = "Directory",
  TargetWord = "Title",
  -- nvim-cmp
  CmpItemAbbr = "Normal",
  CmpItemAbbrMatchFuzzy = { fg = colors.gum, underline = true },
  CmpItemAbbrMatchFuzzyDefault = { fg = colors.gum, underline = true },
  CmpItemKindClass = "@class",
  CmpItemKindColor = "Label",
  CmpItemKindConstant = "Constant",
  CmpItemKindConstructor = "@constructor",
  CmpItemKind = "Type",
  CmpItemKindEnum = "@enum",
  CmpItemKindEnumMember = "@enumMember",
  CmpItemKindEvent = "Repeat",
  CmpItemKindField = "@field",
  CmpItemKindFile = "File",
  CmpItemKindFolder = "CmpItemKindFileDefault",
  CmpItemKindFunction = "Function",
  CmpItemKindInterface = "Type",
  CmpItemKindKeyword = "Keyword",
  CmpItemKindMethod = "CmpItemKindFunctionDefault",
  CmpItemKindModule = "Include",
  CmpItemKindOperator = "Operator",
  CmpItemKindProperty = "@property",
  CmpItemKindReference = "StorageClass",
  CmpItemKindSnippet = "Boolean",
  CmpItemKindStruct = "Structure",
  CmpItemKindText = "Comment",
  CmpItemKindTypeParameter = "Typedef",
  CmpItemKindUnit = "CmpItemKindStructDefault",
  CmpItemKindValue = "CmpItemKindConstantDefault",
  CmpItemKindVariable = "@variable",
  -- Noice
  NoiceCmdlinePopup = { fg = colors.fire, bold = true },
  NoiceCmdlineIcon = "NoiceCmdlinePopup",
  NoiceCmdlinePopupBorder = "NoiceCmdlinePopup",
  NoicePopupBorder = "FloatBorder",
  NoicePopupmenuBorder = "FloatBorder",
  NoiceCmdlinePopupBorderHelp = "NoiceCmdlineIconHelp",
  NoiceCmdlinePopupBorderLua = "NoiceCmdlineIconLua",
  NoiceCmdlineIconHelp = { fg = colors.lukewarm },
  NoiceCmdlineIconLua = { fg = colors.aqua },
  NoiceCmdlineIconSearch = { fg = colors.gum },
  -- Notify
  NotifyERRORBorder = "Error",
  NotifyWARNBorder = "Warning",
  NotifyINFOBorder = "Info",
  NotifyDEBUGBorder = "Debug",
  NotifyTRACEBorder = "NonText",
  NotifyERRORIcon = "Error",
  NotifyWARNIcon = "Warning",
  NotifyINFOIcon = "Info",
  NotifyDEBUGIcon = "Debug",
  NotifyTRACEIcon = "NonText",
  NotifyERRORTitle = "Error",
  NotifyWARNTitle = "Warning",
  NotifyINFOTitle = "Info",
  NotifyDEBUGTitle = "Debug",
  NotifyTRACETitle = "NonText",
  -- symbols-outline.nvim
  FocusedSymbol = {},
  SymbolsOutlineConnector = "Delimiter",
  -- todo-comments.nvim
  TodoFgFIX = function(self)
    return { fg = self.ErrorMsg.fg }
  end,
  TodoFgHACK = { fg = colors.warning },
  TodoFgNOTE = "DiagnosticFloatingHint",
  TodoFgPERF = "DiagnosticFloatingInfo",
  TodoFgTODO = function(self)
    return { fg = self.Todo.bg, italic = true }
  end,
  TodoFgWARN = function(self)
    return { fg = self.WarningMsg.fg }
  end,
  TodoBgFIX = function(self)
    return { fg = colors.black, bg = self.TodoFgFIX.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoBgHACK = function(self)
    return { fg = colors.black, bg = self.TodoFgHACK.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoBgNOTE = function(self)
    return { fg = colors.black, bg = self.TodoFgNOTE.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoBgPERF = function(self)
    return { fg = colors.black, bg = self.TodoFgPERF.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoBgTODO = function(self)
    return { fg = colors.black, bg = self.TodoFgTODO.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoBgWARN = function(self)
    return { fg = colors.black, bg = self.TodoFgWARN.fg, bold = true, italic = true, nocombine = true }
  end,
  TodoSignFIX = "TodoFgFIX",
  TodoSignHACK = "TodoFgHACK",
  TodoSignNOTE = "TodoFgNOTE",
  TodoSignPERF = "TodoFgPERF",
  TodoSignTODO = "TodoFgTODO",
  TodoSignWARN = "TodoFgWARN",
  -- trouble.nvim
  TroubleCount = function(self)
    local definition = vim.deepcopy(self.Number)
    definition.underline = true
    return definition
  end,
  -- vim-indent-guides
  IndentGuidesOdd = { bg = colors.gray_darker },
  IndentGuidesEven = { bg = colors.gray },
})

colorscheme.highlight_terminal({
  [1] = colors.black,
  [2] = colors.error_dark,
  [3] = colors.green_dark,
  [4] = colors.orange,
  [5] = colors.blue,
  [6] = colors.magenta_dark,
  [7] = colors.teal,
  [8] = colors.gray,
  [9] = colors.gray_dark,
  [10] = colors.error,
  [11] = colors.green,
  [12] = colors.warning,
  [13] = colors.turqoise,
  [14] = colors.purple,
  [15] = colors.cyan,
  [16] = colors.gray_light,
})

return colors
