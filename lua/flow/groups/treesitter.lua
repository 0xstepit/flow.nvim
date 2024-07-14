local M = {}

function M.get(colors)
  local theme = {

    TreesitterContext = { bg = colors.bg_dark },
    -- Linked
    ["@annotation"] = { link = "PreProc" },
    ["@attribute"] = { link = "PreProc" },
    ["@boolean"] = { link = "Boolean" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@comment"] = { link = "Comment" },
    ["@keyword.conditional"] = { link = "Conditional" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@keyword.debug"] = { link = "Debug" },
    ["@keyword.directive.define"] = { link = "Define" },
    ["@keyword.exception"] = { link = "Exception" },
    ["@number.float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.call"] = { link = "@function" },
    ["@function.macro"] = { link = "Macro" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.coroutine"] = { link = "@keyword" },
    ["@keyword.operator"] = { link = "@operator" },
    ["@keyword.return"] = { link = "@keyword" },
    ["@function.method"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.method" },
    ["@namespace.builtin"] = { link = "@variable.builtin" },
    ["@none"] = {},
    ["@number"] = { link = "Number" },
    ["@keyword.directive"] = { link = "PreProc" },
    ["@keyword.repeat"] = { link = "Repeat" },
    ["@keyword.storage"] = { link = "StorageClass" },
    ["@string"] = { link = "String" },
    ["@markup.link.label"] = { link = "SpecialChar" },
    ["@markup.link.label.symbol"] = { link = "Identifier" },
    ["@tag"] = { link = "Label" },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },
    ["@markup"] = { link = "@none" },
    ["@markup.environment"] = { link = "Macro" },
    ["@markup.environment.name"] = { link = "Type" },
    ["@markup.raw"] = { link = "String" },
    ["@markup.math"] = { link = "Special" },
    ["@markup.strong"] = { bold = true },
    ["@markup.emphasis"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.heading"] = { link = "Title" },

    ["@comment.note"] = { fg = colors.hint },
    ["@comment.error"] = { fg = colors.error },
    ["@comment.hint"] = { fg = colors.hint },
    ["@comment.info"] = { fg = colors.info },
    ["@comment.warning"] = { fg = colors.warning },
    ["@comment.todo"] = { fg = colors.todo },

    ["@markup.link.url"] = { link = "Underlined" },
    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "@keyword" },
    ["@operator"] = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { fg = colors.base13 }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = colors.fg_dark }, -- For brackets and parens.
    ["@punctuation.special"] = { fg = colors.base12 }, -- For special symbols (e.g. `{}` in string interpolation)
    ["@markup.list"] = { fg = colors.base13 }, -- For special punctutation that does not fall in the catagories before.
    ["@markup.list.markdown"] = { fg = colors.orange, bold = true },

    --- Literals
    ["@string.documentation"] = { fg = colors.yellow },
    ["@string.regexp"] = { fg = colors.base12 }, -- For regexes.
    ["@string.escape"] = { fg = colors.purple }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = colors.purple }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = colors.yellow }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = colors.yellow }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { fg = colors.red }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { fg = colors.purple }, -- For keywords used to define a function.

    ["@label"] = { fg = colors.cyan }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = colors.cyan },
    -- the two below should be equal because the last substitute former
    ["@variable.member"] = { fg = colors.cyan }, -- For fields.
    ["@property"] = { fg = colors.cyan },

    --- Identifiers
    ["@variable"] = { fg = colors.fg }, -- any variable name that does not have another highlight, like in go "local util"
    ["@variable.builtin"] = { fg = colors.red1 }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = colors.red1 }, -- Variable names that are defined by the languages, like `this` or `self`.

    --- Text
    -- ["@markup.raw.markdown"] = { fg = colors.cyan},
    ["@markup.raw.markdown_inline"] = { bg = colors.terminal_black, fg = colors.cyan },
    ["@markup.link"] = { fg = colors.blue14 },

    ["@markup.list.unchecked"] = { fg = colors.cyan }, -- For brackets and parens.
    ["@markup.list.checked"] = { fg = colors.green1 }, -- For brackets and parens.

    ["@diff.plus"] = { link = "DiffAdd" },
    ["@diff.minus"] = { link = "DiffDelete" },
    ["@diff.delta"] = { link = "DiffChange" },

    ["@module"] = { link = "Include" },

    -- LSP Semantic Token Groups
    ["@lsp.type.boolean"] = { link = "@boolean" },
    ["@lsp.type.builtinType"] = { link = "@type.builtin" },
    ["@lsp.type.comment"] = { link = "@comment" },
    ["@lsp.type.decorator"] = { link = "@attribute" },
    ["@lsp.type.deriveHelper"] = { link = "@attribute" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.escapeSequence"] = { link = "@string.escape" },
    ["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
    ["@lsp.type.generic"] = { link = "@variable" },
    ["@lsp.type.interface"] = { fg = colors.cyan },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.error },
    ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
    ["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
    ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
    ["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = colors.cyan },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = colors.cyan },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },
  }

  return theme
end

return M
