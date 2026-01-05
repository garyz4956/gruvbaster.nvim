-- Gruvbaster highlight groups
-- Following Alabaster's philosophy: only 4 categories get colors
-- 1. Strings (green)
-- 2. Constants/Numbers (purple)
-- 3. Comments (orange)
-- 4. Definitions (aqua)

local M = {}

--- Generate all highlight groups
--- @param p table Semantic color palette
--- @param config table Configuration options
--- @return table Highlight group definitions
function M.get_highlights(p, config)
  local highlights = {
    -----------------------------------------
    -- Base Gruvbaster groups (for linking)
    -----------------------------------------
    GruvbasterFg0 = { fg = p.fg0 },
    GruvbasterFg1 = { fg = p.fg1 },
    GruvbasterFg2 = { fg = p.fg2 },
    GruvbasterFg3 = { fg = p.fg3 },
    GruvbasterFg4 = { fg = p.fg4 },
    GruvbasterBg0 = { fg = p.bg0 },
    GruvbasterBg1 = { fg = p.bg1 },
    GruvbasterBg2 = { fg = p.bg2 },
    GruvbasterBg3 = { fg = p.bg3 },
    GruvbasterBg4 = { fg = p.bg4 },

    -- 4 semantic colors
    GruvbasterString = { fg = p.string },
    GruvbasterConstant = { fg = p.constant },
    GruvbasterComment = { fg = p.comment },
    GruvbasterDefinition = { fg = p.definition },

    -- Auxiliary colors
    GruvbasterPunctuation = { fg = p.punctuation },
    GruvbasterError = { fg = p.error },
    GruvbasterWarning = { fg = p.warning },
    GruvbasterInfo = { fg = p.info },
    GruvbasterHint = { fg = p.hint },
    GruvbasterOk = { fg = p.ok },

    -----------------------------------------
    -- Vim UI highlight groups
    -----------------------------------------
    Normal = { fg = p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    NormalFloat = { fg = p.fg1, bg = p.bg1 },
    NormalNC = { fg = config.dim_inactive and p.fg2 or p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    FloatBorder = { fg = p.bg4, bg = p.bg1 },
    FloatTitle = { fg = p.fg1, bg = p.bg1 },

    -- Cursor
    Cursor = { reverse = true },
    lCursor = { link = "Cursor" },
    CursorIM = { link = "Cursor" },
    CursorLine = { bg = p.bg1 },
    CursorColumn = { link = "CursorLine" },
    TermCursor = { link = "Cursor" },
    TermCursorNC = { bg = p.bg1 },

    -- Selection
    Visual = { bg = p.bg3 },
    VisualNOS = { link = "Visual" },

    -- Search
    Search = { fg = p.bg0, bg = p.warning },
    IncSearch = { fg = p.bg0, bg = p.constant },
    CurSearch = { link = "IncSearch" },
    Substitute = { fg = p.bg0, bg = p.error },

    -- Line numbers
    LineNr = { fg = p.bg4 },
    LineNrAbove = { fg = p.bg4 },
    LineNrBelow = { fg = p.bg4 },
    CursorLineNr = { fg = p.fg1, bg = p.bg1 },
    CursorLineFold = { fg = p.fg1, bg = p.bg1 },
    CursorLineSign = { bg = p.bg1 },
    SignColumn = { fg = p.bg4, bg = config.transparent_mode and "NONE" or p.bg0 },
    FoldColumn = { fg = p.bg4, bg = config.transparent_mode and "NONE" or p.bg0 },

    -- Folding
    Folded = { fg = p.punctuation, bg = p.bg1 },

    -- Statusline
    StatusLine = { fg = p.fg1, bg = p.bg2 },
    StatusLineNC = { fg = p.fg4, bg = p.bg1 },

    -- Tabline
    TabLine = { fg = p.fg4, bg = p.bg1 },
    TabLineFill = { bg = p.bg0 },
    TabLineSel = { fg = p.fg1, bg = p.bg2 },

    -- Winbar
    WinBar = { fg = p.fg1, bg = p.bg0 },
    WinBarNC = { fg = p.fg4, bg = p.bg0 },
    WinSeparator = { fg = p.bg3, bg = config.transparent_mode and "NONE" or p.bg0 },

    -- Popup menu
    Pmenu = { fg = p.fg1, bg = p.bg1 },
    PmenuSel = { fg = p.bg0, bg = p.definition },
    PmenuSbar = { bg = p.bg2 },
    PmenuThumb = { bg = p.bg4 },
    PmenuKind = { fg = p.punctuation, bg = p.bg1 },
    PmenuKindSel = { fg = p.bg0, bg = p.definition },
    PmenuExtra = { fg = p.fg4, bg = p.bg1 },
    PmenuExtraSel = { fg = p.bg0, bg = p.definition },

    -- Messages
    ModeMsg = { fg = p.fg1 },
    MsgArea = { fg = p.fg1 },
    MsgSeparator = { fg = p.bg4 },
    MoreMsg = { fg = p.definition },
    Question = { fg = p.definition },
    ErrorMsg = { fg = p.error },
    WarningMsg = { fg = p.warning },

    -- Misc UI
    Directory = { fg = p.definition },
    Title = { fg = p.definition },
    Conceal = { fg = p.punctuation },
    NonText = { fg = p.bg3 },
    SpecialKey = { fg = p.bg3 },
    Whitespace = { fg = p.bg3 },
    EndOfBuffer = { fg = p.bg0 },
    WildMenu = { fg = p.bg0, bg = p.definition },
    QuickFixLine = { bg = p.bg2 },
    MatchParen = { bg = p.bg3 },
    ColorColumn = { bg = p.bg1 },

    -- Spelling
    SpellBad = { undercurl = true, sp = p.error },
    SpellCap = { undercurl = true, sp = p.warning },
    SpellLocal = { undercurl = true, sp = p.info },
    SpellRare = { undercurl = true, sp = p.hint },

    -----------------------------------------
    -- Diff
    -----------------------------------------
    DiffAdd = { bg = p.diff_green },
    DiffDelete = { bg = p.diff_red },
    DiffChange = { bg = p.diff_aqua },
    DiffText = { bg = p.diff_green },
    diffAdded = { link = "GruvbasterOk" },
    diffRemoved = { link = "GruvbasterError" },
    diffChanged = { link = "GruvbasterInfo" },
    diffFile = { link = "GruvbasterDefinition" },
    diffNewFile = { link = "GruvbasterDefinition" },
    diffOldFile = { link = "GruvbasterWarning" },
    diffLine = { link = "GruvbasterPunctuation" },
    diffIndexLine = { link = "GruvbasterPunctuation" },

    -----------------------------------------
    -- Diagnostics (wavy underline)
    -----------------------------------------
    DiagnosticError = { fg = p.error },
    DiagnosticWarn = { fg = p.warning },
    DiagnosticInfo = { fg = p.info },
    DiagnosticHint = { fg = p.hint },
    DiagnosticOk = { fg = p.ok },

    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.ok },

    DiagnosticVirtualTextError = { fg = p.error, bg = p.bg1 },
    DiagnosticVirtualTextWarn = { fg = p.warning, bg = p.bg1 },
    DiagnosticVirtualTextInfo = { fg = p.info, bg = p.bg1 },
    DiagnosticVirtualTextHint = { fg = p.hint, bg = p.bg1 },
    DiagnosticVirtualTextOk = { fg = p.ok, bg = p.bg1 },

    DiagnosticFloatingError = { fg = p.error },
    DiagnosticFloatingWarn = { fg = p.warning },
    DiagnosticFloatingInfo = { fg = p.info },
    DiagnosticFloatingHint = { fg = p.hint },
    DiagnosticFloatingOk = { fg = p.ok },

    DiagnosticSignError = { fg = p.error },
    DiagnosticSignWarn = { fg = p.warning },
    DiagnosticSignInfo = { fg = p.info },
    DiagnosticSignHint = { fg = p.hint },
    DiagnosticSignOk = { fg = p.ok },

    -----------------------------------------
    -- Syntax highlighting (Alabaster philosophy)
    -- Only 4 categories get colors!
    -----------------------------------------

    -- Comments (COLORED - orange)
    Comment = { fg = p.comment },

    -- Strings (COLORED - green)
    String = { fg = p.string },
    Character = { fg = p.string },

    -- Constants/Numbers (COLORED - purple)
    Number = { fg = p.constant },
    Float = { fg = p.constant },
    Boolean = { fg = p.constant },
    Constant = { fg = p.constant },

    -- Definitions (COLORED - aqua) - only for function/class names at definition
    Function = { fg = p.definition },

    -- Everything else: NOT colored (uses foreground)

    -- Keywords (NOT colored)
    Statement = { fg = p.fg1 },
    Keyword = { fg = p.fg1 },
    Conditional = { fg = p.fg1 },
    Repeat = { fg = p.fg1 },
    Label = { fg = p.fg1 },
    Exception = { fg = p.fg1 },

    -- Operators (NOT colored)
    Operator = { fg = p.fg1 },

    -- Types (NOT colored)
    Type = { fg = p.fg1 },
    StorageClass = { fg = p.fg1 },
    Structure = { fg = p.fg1 },
    Typedef = { fg = p.fg1 },

    -- Identifiers (NOT colored - references don't get color)
    Identifier = { fg = p.fg1 },

    -- Preprocessor (NOT colored)
    PreProc = { fg = p.fg1 },
    Include = { fg = p.fg1 },
    Define = { fg = p.fg1 },
    Macro = { fg = p.fg1 },
    PreCondit = { fg = p.fg1 },

    -- Special (punctuation - gray)
    Special = { fg = p.punctuation },
    SpecialChar = { fg = p.punctuation },
    Delimiter = { fg = p.punctuation },
    SpecialComment = { fg = p.comment },
    Debug = { fg = p.error },

    -- Tags
    Tag = { fg = p.fg1 },

    -- Underlined
    Underlined = { fg = p.fg1, underline = true },

    -- Ignore
    Ignore = { fg = p.bg4 },

    -- Error
    Error = { fg = p.error },

    -- Todo
    Todo = { fg = p.bg0, bg = p.comment },

    -----------------------------------------
    -- Treesitter highlight groups
    -----------------------------------------

    -- Comments (COLORED)
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"] = { fg = p.error },
    ["@comment.warning"] = { fg = p.warning },
    ["@comment.todo"] = { fg = p.bg0, bg = p.comment },
    ["@comment.note"] = { fg = p.bg0, bg = p.info },

    -- Strings (COLORED)
    ["@string"] = { link = "String" },
    ["@string.documentation"] = { link = "String" },
    ["@string.regexp"] = { fg = p.string },
    ["@string.escape"] = { fg = p.punctuation },
    ["@string.special"] = { fg = p.string },
    ["@string.special.symbol"] = { fg = p.string },
    ["@string.special.path"] = { fg = p.string },
    ["@string.special.url"] = { fg = p.string, underline = true },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { fg = p.punctuation },

    -- Constants/Numbers (COLORED)
    ["@number"] = { link = "Number" },
    ["@number.float"] = { link = "Float" },
    ["@boolean"] = { link = "Boolean" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = p.constant },
    ["@constant.macro"] = { fg = p.constant },

    -- Keywords (NOT colored)
    ["@keyword"] = { fg = p.fg1 },
    ["@keyword.coroutine"] = { fg = p.fg1 },
    ["@keyword.function"] = { fg = p.fg1 },
    ["@keyword.operator"] = { fg = p.fg1 },
    ["@keyword.import"] = { fg = p.fg1 },
    ["@keyword.type"] = { fg = p.fg1 },
    ["@keyword.modifier"] = { fg = p.fg1 },
    ["@keyword.repeat"] = { fg = p.fg1 },
    ["@keyword.return"] = { fg = p.fg1 },
    ["@keyword.debug"] = { fg = p.fg1 },
    ["@keyword.exception"] = { fg = p.fg1 },
    ["@keyword.conditional"] = { fg = p.fg1 },
    ["@keyword.conditional.ternary"] = { fg = p.fg1 },
    ["@keyword.directive"] = { fg = p.fg1 },
    ["@keyword.directive.define"] = { fg = p.fg1 },

    -- Labels (NOT colored)
    ["@label"] = { fg = p.fg1 },

    -- Operators (NOT colored)
    ["@operator"] = { fg = p.fg1 },

    -- Punctuation (gray)
    ["@punctuation.bracket"] = { fg = p.punctuation },
    ["@punctuation.delimiter"] = { fg = p.punctuation },
    ["@punctuation.special"] = { fg = p.punctuation },

    -- Types (NOT colored)
    ["@type"] = { fg = p.fg1 },
    ["@type.builtin"] = { fg = p.fg1 },
    ["@type.qualifier"] = { fg = p.fg1 },
    ["@type.definition"] = { fg = p.definition }, -- Type definitions get color

    -- Attributes (NOT colored)
    ["@attribute"] = { fg = p.fg1 },
    ["@attribute.builtin"] = { fg = p.fg1 },

    -- Functions
    ["@function"] = { fg = p.definition },        -- Function definitions (COLORED)
    ["@function.call"] = { fg = p.fg1 },          -- Function calls (NOT colored)
    ["@function.builtin"] = { fg = p.fg1 },       -- Built-in functions (NOT colored)
    ["@function.macro"] = { fg = p.fg1 },         -- Macro functions (NOT colored)
    ["@function.method"] = { fg = p.definition }, -- Method definitions (COLORED)
    ["@function.method.call"] = { fg = p.fg1 },   -- Method calls (NOT colored)

    -- Constructors (COLORED - they are definitions)
    ["@constructor"] = { fg = p.definition },

    -- Variables (NOT colored - except definitions)
    ["@variable"] = { fg = p.fg1 },
    ["@variable.builtin"] = { fg = p.fg1 },
    ["@variable.parameter"] = { fg = p.fg1 },
    ["@variable.parameter.builtin"] = { fg = p.fg1 },
    ["@variable.member"] = { fg = p.fg1 },

    -- Properties (NOT colored)
    ["@property"] = { fg = p.fg1 },

    -- Modules (NOT colored)
    ["@module"] = { fg = p.fg1 },
    ["@module.builtin"] = { fg = p.fg1 },

    -- Tags (for HTML/XML - NOT colored)
    ["@tag"] = { fg = p.fg1 },
    ["@tag.builtin"] = { fg = p.fg1 },
    ["@tag.attribute"] = { fg = p.fg1 },
    ["@tag.delimiter"] = { fg = p.punctuation },

    -- Markup
    ["@markup"] = { fg = p.fg1 },
    ["@markup.strong"] = { fg = p.fg1, bold = true },
    ["@markup.italic"] = { fg = p.fg1, italic = true },
    ["@markup.strikethrough"] = { fg = p.fg1, strikethrough = true },
    ["@markup.underline"] = { fg = p.fg1, underline = true },
    ["@markup.heading"] = { fg = p.definition, bold = true },
    ["@markup.heading.1"] = { fg = p.definition, bold = true },
    ["@markup.heading.2"] = { fg = p.definition, bold = true },
    ["@markup.heading.3"] = { fg = p.definition, bold = true },
    ["@markup.heading.4"] = { fg = p.definition, bold = true },
    ["@markup.heading.5"] = { fg = p.definition, bold = true },
    ["@markup.heading.6"] = { fg = p.definition, bold = true },
    ["@markup.quote"] = { fg = p.punctuation },
    ["@markup.math"] = { fg = p.constant },
    ["@markup.environment"] = { fg = p.fg1 },
    ["@markup.link"] = { fg = p.info, underline = true },
    ["@markup.link.label"] = { fg = p.info },
    ["@markup.link.url"] = { fg = p.info, underline = true },
    ["@markup.raw"] = { fg = p.string },
    ["@markup.raw.block"] = { fg = p.string },
    ["@markup.list"] = { fg = p.punctuation },
    ["@markup.list.checked"] = { fg = p.ok },
    ["@markup.list.unchecked"] = { fg = p.punctuation },

    -- Diff
    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    -----------------------------------------
    -- LSP Semantic tokens (following 4-color rule)
    -----------------------------------------

    -- Types (NOT colored)
    ["@lsp.type.class"] = { fg = p.fg1 },
    ["@lsp.type.decorator"] = { fg = p.fg1 },
    ["@lsp.type.enum"] = { fg = p.fg1 },
    ["@lsp.type.enumMember"] = { fg = p.constant },
    ["@lsp.type.function"] = { fg = p.fg1 },        -- Function references (NOT colored)
    ["@lsp.type.interface"] = { fg = p.fg1 },
    ["@lsp.type.macro"] = { fg = p.fg1 },
    ["@lsp.type.method"] = { fg = p.fg1 },          -- Method references (NOT colored)
    ["@lsp.type.namespace"] = { fg = p.fg1 },
    ["@lsp.type.parameter"] = { fg = p.fg1 },
    ["@lsp.type.property"] = { fg = p.fg1 },
    ["@lsp.type.struct"] = { fg = p.fg1 },
    ["@lsp.type.type"] = { fg = p.fg1 },
    ["@lsp.type.typeParameter"] = { fg = p.fg1 },
    ["@lsp.type.variable"] = { fg = p.fg1 },

    -- Special LSP types (COLORED)
    ["@lsp.type.comment"] = { link = "Comment" },
    ["@lsp.type.string"] = { link = "String" },
    ["@lsp.type.number"] = { link = "Number" },
    ["@lsp.type.keyword"] = { fg = p.fg1 },
    ["@lsp.type.operator"] = { fg = p.fg1 },

    -- LSP modifiers for definitions (COLORED)
    ["@lsp.mod.declaration"] = { fg = p.definition },
    ["@lsp.mod.definition"] = { fg = p.definition },
    ["@lsp.mod.readonly"] = {},
    ["@lsp.mod.static"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.abstract"] = {},
    ["@lsp.mod.async"] = {},
    ["@lsp.mod.modification"] = {},
    ["@lsp.mod.documentation"] = {},
    ["@lsp.mod.defaultLibrary"] = {},

    -- LSP type + modifier combinations for definitions
    ["@lsp.typemod.function.declaration"] = { fg = p.definition },
    ["@lsp.typemod.function.definition"] = { fg = p.definition },
    ["@lsp.typemod.method.declaration"] = { fg = p.definition },
    ["@lsp.typemod.method.definition"] = { fg = p.definition },
    ["@lsp.typemod.variable.declaration"] = { fg = p.definition },
    ["@lsp.typemod.variable.definition"] = { fg = p.definition },
    ["@lsp.typemod.parameter.declaration"] = { fg = p.definition },
    ["@lsp.typemod.class.declaration"] = { fg = p.definition },
    ["@lsp.typemod.class.definition"] = { fg = p.definition },
    ["@lsp.typemod.interface.declaration"] = { fg = p.definition },
    ["@lsp.typemod.struct.declaration"] = { fg = p.definition },
    ["@lsp.typemod.enum.declaration"] = { fg = p.definition },
    ["@lsp.typemod.type.declaration"] = { fg = p.definition },
    ["@lsp.typemod.type.definition"] = { fg = p.definition },

    -----------------------------------------
    -- Built-in LSP
    -----------------------------------------
    LspReferenceText = { bg = p.bg2 },
    LspReferenceRead = { bg = p.bg2 },
    LspReferenceWrite = { bg = p.bg2 },
    LspCodeLens = { fg = p.punctuation },
    LspCodeLensSeparator = { fg = p.bg4 },
    LspSignatureActiveParameter = { fg = p.definition },
    LspInlayHint = { fg = p.bg4, bg = p.bg1 },

    -----------------------------------------
    -- Plugin: GitSigns
    -----------------------------------------
    GitSignsAdd = { fg = p.ok },
    GitSignsChange = { fg = p.info },
    GitSignsDelete = { fg = p.error },
    GitSignsAddNr = { fg = p.ok },
    GitSignsChangeNr = { fg = p.info },
    GitSignsDeleteNr = { fg = p.error },
    GitSignsAddLn = { bg = p.diff_green },
    GitSignsChangeLn = { bg = p.diff_aqua },
    GitSignsDeleteLn = { bg = p.diff_red },
    GitSignsAddInline = { bg = p.diff_green },
    GitSignsChangeInline = { bg = p.diff_aqua },
    GitSignsDeleteInline = { bg = p.diff_red },
    GitSignsCurrentLineBlame = { fg = p.punctuation },

    -----------------------------------------
    -- Plugin: Telescope
    -----------------------------------------
    TelescopeNormal = { fg = p.fg1, bg = p.bg0 },
    TelescopeBorder = { fg = p.bg4, bg = p.bg0 },
    TelescopeTitle = { fg = p.definition },
    TelescopePromptNormal = { fg = p.fg1, bg = p.bg1 },
    TelescopePromptBorder = { fg = p.bg4, bg = p.bg1 },
    TelescopePromptTitle = { fg = p.definition },
    TelescopePromptPrefix = { fg = p.definition },
    TelescopePromptCounter = { fg = p.punctuation },
    TelescopeResultsNormal = { fg = p.fg1, bg = p.bg0 },
    TelescopeResultsBorder = { fg = p.bg4, bg = p.bg0 },
    TelescopeResultsTitle = { fg = p.definition },
    TelescopePreviewNormal = { fg = p.fg1, bg = p.bg0 },
    TelescopePreviewBorder = { fg = p.bg4, bg = p.bg0 },
    TelescopePreviewTitle = { fg = p.definition },
    TelescopeSelection = { bg = p.bg2 },
    TelescopeSelectionCaret = { fg = p.definition, bg = p.bg2 },
    TelescopeMultiSelection = { bg = p.bg2 },
    TelescopeMultiIcon = { fg = p.definition },
    TelescopeMatching = { fg = p.definition },

    -----------------------------------------
    -- Plugin: nvim-cmp
    -----------------------------------------
    CmpItemAbbr = { fg = p.fg1 },
    CmpItemAbbrDeprecated = { fg = p.fg4, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.definition },
    CmpItemAbbrMatchFuzzy = { fg = p.definition },
    CmpItemKind = { fg = p.punctuation },
    CmpItemMenu = { fg = p.fg4 },
    CmpItemKindText = { fg = p.fg1 },
    CmpItemKindMethod = { fg = p.definition },
    CmpItemKindFunction = { fg = p.definition },
    CmpItemKindConstructor = { fg = p.definition },
    CmpItemKindField = { fg = p.fg1 },
    CmpItemKindVariable = { fg = p.fg1 },
    CmpItemKindClass = { fg = p.fg1 },
    CmpItemKindInterface = { fg = p.fg1 },
    CmpItemKindModule = { fg = p.fg1 },
    CmpItemKindProperty = { fg = p.fg1 },
    CmpItemKindUnit = { fg = p.constant },
    CmpItemKindValue = { fg = p.constant },
    CmpItemKindEnum = { fg = p.fg1 },
    CmpItemKindKeyword = { fg = p.fg1 },
    CmpItemKindSnippet = { fg = p.string },
    CmpItemKindColor = { fg = p.constant },
    CmpItemKindFile = { fg = p.fg1 },
    CmpItemKindReference = { fg = p.fg1 },
    CmpItemKindFolder = { fg = p.fg1 },
    CmpItemKindEnumMember = { fg = p.constant },
    CmpItemKindConstant = { fg = p.constant },
    CmpItemKindStruct = { fg = p.fg1 },
    CmpItemKindEvent = { fg = p.fg1 },
    CmpItemKindOperator = { fg = p.fg1 },
    CmpItemKindTypeParameter = { fg = p.fg1 },

    -----------------------------------------
    -- Plugin: NvimTree
    -----------------------------------------
    NvimTreeNormal = { fg = p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    NvimTreeNormalNC = { fg = p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    NvimTreeRootFolder = { fg = p.definition },
    NvimTreeFolderIcon = { fg = p.punctuation },
    NvimTreeFolderName = { fg = p.fg1 },
    NvimTreeOpenedFolderName = { fg = p.definition },
    NvimTreeEmptyFolderName = { fg = p.fg4 },
    NvimTreeSymlink = { fg = p.info },
    NvimTreeSpecialFile = { fg = p.constant },
    NvimTreeImageFile = { fg = p.fg1 },
    NvimTreeIndentMarker = { fg = p.bg4 },
    NvimTreeGitDirty = { fg = p.warning },
    NvimTreeGitStaged = { fg = p.ok },
    NvimTreeGitMerge = { fg = p.info },
    NvimTreeGitRenamed = { fg = p.info },
    NvimTreeGitNew = { fg = p.ok },
    NvimTreeGitDeleted = { fg = p.error },

    -----------------------------------------
    -- Plugin: neo-tree
    -----------------------------------------
    NeoTreeNormal = { fg = p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    NeoTreeNormalNC = { fg = p.fg1, bg = config.transparent_mode and "NONE" or p.bg0 },
    NeoTreeDirectoryIcon = { fg = p.punctuation },
    NeoTreeDirectoryName = { fg = p.fg1 },
    NeoTreeRootName = { fg = p.definition },
    NeoTreeFileName = { fg = p.fg1 },
    NeoTreeFileIcon = { fg = p.fg1 },
    NeoTreeIndentMarker = { fg = p.bg4 },
    NeoTreeGitAdded = { fg = p.ok },
    NeoTreeGitConflict = { fg = p.error },
    NeoTreeGitDeleted = { fg = p.error },
    NeoTreeGitModified = { fg = p.warning },
    NeoTreeGitUntracked = { fg = p.warning },

    -----------------------------------------
    -- Plugin: WhichKey
    -----------------------------------------
    WhichKey = { fg = p.definition },
    WhichKeyGroup = { fg = p.comment },
    WhichKeyDesc = { fg = p.fg1 },
    WhichKeySeparator = { fg = p.punctuation },
    WhichKeyFloat = { bg = p.bg1 },
    WhichKeyBorder = { fg = p.bg4, bg = p.bg1 },
    WhichKeyValue = { fg = p.fg4 },

    -----------------------------------------
    -- Plugin: Dashboard
    -----------------------------------------
    DashboardHeader = { fg = p.definition },
    DashboardFooter = { fg = p.comment },
    DashboardCenter = { fg = p.fg1 },
    DashboardShortCut = { fg = p.constant },
    DashboardKey = { fg = p.definition },
    DashboardDesc = { fg = p.fg1 },
    DashboardIcon = { fg = p.definition },

    -----------------------------------------
    -- Plugin: Lazy
    -----------------------------------------
    LazyH1 = { fg = p.bg0, bg = p.definition },
    LazyH2 = { fg = p.definition },
    LazyButton = { fg = p.fg1, bg = p.bg2 },
    LazyButtonActive = { fg = p.bg0, bg = p.definition },
    LazySpecial = { fg = p.constant },
    LazyProgressDone = { fg = p.ok },
    LazyProgressTodo = { fg = p.bg4 },

    -----------------------------------------
    -- Plugin: Mason
    -----------------------------------------
    MasonHeader = { fg = p.bg0, bg = p.definition },
    MasonHeaderSecondary = { fg = p.bg0, bg = p.info },
    MasonHighlight = { fg = p.definition },
    MasonHighlightBlock = { fg = p.bg0, bg = p.definition },
    MasonHighlightBlockBold = { fg = p.bg0, bg = p.definition, bold = true },
    MasonHighlightSecondary = { fg = p.info },
    MasonMuted = { fg = p.punctuation },
    MasonMutedBlock = { fg = p.bg0, bg = p.bg4 },

    -----------------------------------------
    -- Plugin: Notify
    -----------------------------------------
    NotifyERRORBorder = { fg = p.error },
    NotifyWARNBorder = { fg = p.warning },
    NotifyINFOBorder = { fg = p.info },
    NotifyDEBUGBorder = { fg = p.punctuation },
    NotifyTRACEBorder = { fg = p.hint },
    NotifyERRORIcon = { fg = p.error },
    NotifyWARNIcon = { fg = p.warning },
    NotifyINFOIcon = { fg = p.info },
    NotifyDEBUGIcon = { fg = p.punctuation },
    NotifyTRACEIcon = { fg = p.hint },
    NotifyERRORTitle = { fg = p.error },
    NotifyWARNTitle = { fg = p.warning },
    NotifyINFOTitle = { fg = p.info },
    NotifyDEBUGTitle = { fg = p.punctuation },
    NotifyTRACETitle = { fg = p.hint },
    NotifyERRORBody = { fg = p.fg1 },
    NotifyWARNBody = { fg = p.fg1 },
    NotifyINFOBody = { fg = p.fg1 },
    NotifyDEBUGBody = { fg = p.fg1 },
    NotifyTRACEBody = { fg = p.fg1 },

    -----------------------------------------
    -- Plugin: Indent Blankline
    -----------------------------------------
    IblIndent = { fg = p.bg2 },
    IblScope = { fg = p.bg4 },
    IblWhitespace = { fg = p.bg2 },

    -----------------------------------------
    -- Plugin: Mini
    -----------------------------------------
    MiniCursorword = { bg = p.bg2 },
    MiniCursorwordCurrent = { bg = p.bg2 },
    MiniIndentscopeSymbol = { fg = p.bg4 },
    MiniIndentscopePrefix = { nocombine = true },
    MiniJump = { fg = p.bg0, bg = p.definition },
    MiniJump2dSpot = { fg = p.definition, bold = true },
    MiniStarterCurrent = {},
    MiniStarterFooter = { fg = p.comment },
    MiniStarterHeader = { fg = p.definition },
    MiniStarterInactive = { fg = p.punctuation },
    MiniStarterItem = { fg = p.fg1 },
    MiniStarterItemBullet = { fg = p.punctuation },
    MiniStarterItemPrefix = { fg = p.definition },
    MiniStarterSection = { fg = p.definition },
    MiniStarterQuery = { fg = p.string },
    MiniStatuslineDevinfo = { fg = p.fg1, bg = p.bg2 },
    MiniStatuslineFileinfo = { fg = p.fg1, bg = p.bg2 },
    MiniStatuslineFilename = { fg = p.fg1, bg = p.bg1 },
    MiniStatuslineInactive = { fg = p.fg4, bg = p.bg1 },
    MiniStatuslineModeCommand = { fg = p.bg0, bg = p.warning },
    MiniStatuslineModeInsert = { fg = p.bg0, bg = p.ok },
    MiniStatuslineModeNormal = { fg = p.bg0, bg = p.definition },
    MiniStatuslineModeOther = { fg = p.bg0, bg = p.info },
    MiniStatuslineModeReplace = { fg = p.bg0, bg = p.error },
    MiniStatuslineModeVisual = { fg = p.bg0, bg = p.constant },
    MiniSurround = { fg = p.bg0, bg = p.definition },
    MiniTablineCurrent = { fg = p.fg1, bg = p.bg2 },
    MiniTablineFill = { bg = p.bg0 },
    MiniTablineHidden = { fg = p.fg4, bg = p.bg1 },
    MiniTablineModifiedCurrent = { fg = p.warning, bg = p.bg2 },
    MiniTablineModifiedHidden = { fg = p.warning, bg = p.bg1 },
    MiniTablineModifiedVisible = { fg = p.warning, bg = p.bg1 },
    MiniTablineTabpagesection = { fg = p.fg1, bg = p.bg2 },
    MiniTablineVisible = { fg = p.fg1, bg = p.bg1 },
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = p.error, bold = true },
    MiniTestPass = { fg = p.ok, bold = true },
    MiniTrailspace = { bg = p.error },

    -----------------------------------------
    -- Plugin: Gitsigns
    -----------------------------------------
    GitSignsAddPreview = { bg = p.diff_green },
    GitSignsDeletePreview = { bg = p.diff_red },

    -----------------------------------------
    -- Plugin: Noice
    -----------------------------------------
    NoiceCmdline = { fg = p.fg1 },
    NoiceCmdlineIcon = { fg = p.definition },
    NoiceCmdlineIconSearch = { fg = p.warning },
    NoiceCmdlinePopup = { fg = p.fg1, bg = p.bg1 },
    NoiceCmdlinePopupBorder = { fg = p.bg4 },
    NoiceCmdlinePrompt = { fg = p.definition },
    NoiceConfirm = { fg = p.fg1, bg = p.bg1 },
    NoiceConfirmBorder = { fg = p.bg4 },
    NoiceCursor = { fg = p.bg0, bg = p.fg1 },
    NoiceFormatConfirm = { fg = p.definition },
    NoiceFormatConfirmDefault = { fg = p.definition },
    NoiceFormatDate = { fg = p.info },
    NoiceFormatEvent = { fg = p.fg4 },
    NoiceFormatKind = { fg = p.definition },
    NoiceFormatLevelDebug = { fg = p.punctuation },
    NoiceFormatLevelError = { fg = p.error },
    NoiceFormatLevelInfo = { fg = p.info },
    NoiceFormatLevelOff = { fg = p.punctuation },
    NoiceFormatLevelTrace = { fg = p.hint },
    NoiceFormatLevelWarn = { fg = p.warning },
    NoiceFormatProgressDone = { fg = p.ok },
    NoiceFormatProgressTodo = { fg = p.bg4 },
    NoiceFormatTitle = { fg = p.definition },
    NoiceLspProgressClient = { fg = p.definition },
    NoiceLspProgressSpinner = { fg = p.definition },
    NoiceLspProgressTitle = { fg = p.fg1 },
    NoiceMini = { fg = p.fg1, bg = p.bg1 },
    NoicePopup = { fg = p.fg1, bg = p.bg1 },
    NoicePopupBorder = { fg = p.bg4 },
    NoicePopupmenu = { fg = p.fg1, bg = p.bg1 },
    NoicePopupmenuBorder = { fg = p.bg4 },
    NoicePopupmenuMatch = { fg = p.definition },
    NoicePopupmenuSelected = { bg = p.bg2 },
    NoiceScrollbar = { bg = p.bg2 },
    NoiceScrollbarThumb = { bg = p.bg4 },
    NoiceSplit = { fg = p.fg1, bg = p.bg0 },
    NoiceSplitBorder = { fg = p.bg4 },
    NoiceVirtualText = { fg = p.comment },

    -----------------------------------------
    -- Plugin: Trouble
    -----------------------------------------
    TroubleNormal = { fg = p.fg1, bg = p.bg0 },
    TroubleText = { fg = p.fg1 },
    TroubleCount = { fg = p.constant },
    TroubleCode = { fg = p.punctuation },
    TroubleFile = { fg = p.definition },
    TroubleLocation = { fg = p.punctuation },
    TroubleFoldIcon = { fg = p.punctuation },
    TroubleIndent = { fg = p.bg4 },
    TroubleSignError = { fg = p.error },
    TroubleSignWarning = { fg = p.warning },
    TroubleSignInformation = { fg = p.info },
    TroubleSignHint = { fg = p.hint },

    -----------------------------------------
    -- Plugin: nvim-dap / nvim-dap-ui
    -----------------------------------------
    DapBreakpoint = { fg = p.error },
    DapBreakpointCondition = { fg = p.warning },
    DapLogPoint = { fg = p.info },
    DapStopped = { fg = p.ok },
    DapStoppedLine = { bg = p.bg2 },
    DapUIScope = { fg = p.definition },
    DapUIType = { fg = p.fg1 },
    DapUIValue = { fg = p.fg1 },
    DapUIModifiedValue = { fg = p.warning },
    DapUIDecoration = { fg = p.definition },
    DapUIThread = { fg = p.ok },
    DapUIStoppedThread = { fg = p.definition },
    DapUIFrameName = { fg = p.fg1 },
    DapUISource = { fg = p.definition },
    DapUILineNumber = { fg = p.definition },
    DapUIFloatBorder = { fg = p.definition },
    DapUIWatchesEmpty = { fg = p.error },
    DapUIWatchesValue = { fg = p.ok },
    DapUIWatchesError = { fg = p.error },
    DapUIBreakpointsPath = { fg = p.definition },
    DapUIBreakpointsInfo = { fg = p.ok },
    DapUIBreakpointsCurrentLine = { fg = p.ok, bold = true },
    DapUIBreakpointsLine = { link = "DapUILineNumber" },
    DapUIBreakpointsDisabledLine = { fg = p.bg4 },
    DapUICurrentFrameName = { link = "DapUIBreakpointsCurrentLine" },
    DapUIStepOver = { fg = p.definition },
    DapUIStepInto = { fg = p.definition },
    DapUIStepBack = { fg = p.definition },
    DapUIStepOut = { fg = p.definition },
    DapUIStop = { fg = p.error },
    DapUIPlayPause = { fg = p.ok },
    DapUIRestart = { fg = p.ok },
    DapUIUnavailable = { fg = p.bg4 },

    -----------------------------------------
    -- Plugin: Aerial
    -----------------------------------------
    AerialLine = { bg = p.bg2 },
    AerialGuide = { fg = p.bg4 },
    AerialClass = { fg = p.fg1 },
    AerialFunction = { fg = p.definition },
    AerialMethod = { fg = p.definition },
    AerialStruct = { fg = p.fg1 },

    -----------------------------------------
    -- Plugin: Navic / Breadcrumbs
    -----------------------------------------
    NavicText = { fg = p.fg1 },
    NavicSeparator = { fg = p.punctuation },
    NavicIconsFile = { fg = p.fg1 },
    NavicIconsModule = { fg = p.fg1 },
    NavicIconsNamespace = { fg = p.fg1 },
    NavicIconsPackage = { fg = p.fg1 },
    NavicIconsClass = { fg = p.fg1 },
    NavicIconsMethod = { fg = p.definition },
    NavicIconsProperty = { fg = p.fg1 },
    NavicIconsField = { fg = p.fg1 },
    NavicIconsConstructor = { fg = p.definition },
    NavicIconsEnum = { fg = p.fg1 },
    NavicIconsInterface = { fg = p.fg1 },
    NavicIconsFunction = { fg = p.definition },
    NavicIconsVariable = { fg = p.fg1 },
    NavicIconsConstant = { fg = p.constant },
    NavicIconsString = { fg = p.string },
    NavicIconsNumber = { fg = p.constant },
    NavicIconsBoolean = { fg = p.constant },
    NavicIconsArray = { fg = p.fg1 },
    NavicIconsObject = { fg = p.fg1 },
    NavicIconsKey = { fg = p.fg1 },
    NavicIconsNull = { fg = p.constant },
    NavicIconsEnumMember = { fg = p.constant },
    NavicIconsStruct = { fg = p.fg1 },
    NavicIconsEvent = { fg = p.fg1 },
    NavicIconsOperator = { fg = p.fg1 },
    NavicIconsTypeParameter = { fg = p.fg1 },

    -----------------------------------------
    -- Plugin: Flash
    -----------------------------------------
    FlashBackdrop = { fg = p.bg4 },
    FlashLabel = { fg = p.bg0, bg = p.definition, bold = true },
    FlashMatch = { fg = p.fg1, bg = p.bg3 },
    FlashCurrent = { fg = p.fg1, bg = p.bg2 },
    FlashPrompt = { fg = p.fg1, bg = p.bg1 },
    FlashPromptIcon = { fg = p.definition },
  }

  return highlights
end

return M
