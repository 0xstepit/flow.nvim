local M = {}

--- @param c table: The available colors.
--- @return table: Treesitter plugin highlights.
function M.get(c, _)
  local theme = {

    TreesitterContext = { bg = c.grey[2] },
    TreesitterContextLineNumber = { link = "TreesitterContext" },
    -- TODO: verify the sp with another terminal.
    -- sp works only if the terminal support it.
    -- TreesitterContextBottom = { fg = c.comment, sp = c.fluo, underline = false },
    -- TreesitterContextLineNumberBottom = { link = "TreesitterContextBottom" },
    TreesitterContextSeparator = { fg = c.fg_border },

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
    ["@tag"] = { link = "Label" },
    ["@tag.attribute"] = { link = "@property" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    ["@comment.note"] = { fg = c.hint },
    ["@comment.error"] = { fg = c.error },
    ["@comment.hint"] = { fg = c.hint },
    ["@comment.info"] = { fg = c.info },
    ["@comment.warning"] = { fg = c.warning },
    ["@comment.todo"] = { fg = c.todo },

    ["@type"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@type.qualifier"] = { link = "@keyword" },
    ["@operator"] = { link = "Operator" }, -- For any operator: `+`, but also `->` and `*` in C.

    --- Punctuation
    ["@punctuation.delimiter"] = { link = "Delimiter" }, -- For delimiters ie: `.`
    ["@punctuation.bracket"] = { fg = c.purple }, -- For brackets and parens.
    ["@punctuation.special"] = { link = "Special" }, -- For special symbols (e.g. `{}` in string interpolation)

    --- Literals
    ["@string.documentation"] = { fg = c.yellow },
    ["@string.regexp"] = { fg = c.cyan }, -- For regexes.
    ["@string.escape"] = { fg = c.cyan }, -- For escape characters within a string.

    --- Functions
    ["@constructor"] = { fg = c.purple }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    ["@variable.parameter"] = { fg = c.grey[6] }, -- For parameters of a function.
    ["@variable.parameter.builtin"] = { fg = c.yellow }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

    --- Keywords
    ["@keyword"] = { link = "Keyword" }, -- For keywords that don't fall in previous categories.
    ["@keyword.function"] = { link = "Function" }, -- For keywords used to define a function.

    ["@label"] = { link = "Label" }, -- For labels: `label:` in C and `:label:` in Lua.

    --- Types
    ["@type.builtin"] = { fg = c.cyan },
    -- the two below should be equal because the last substitute former
    ["@variable.member"] = { fg = c.cyan }, -- For fields.
    ["@property"] = { fg = c.cyan },

    --- Identifiers
    ["@variable"] = { fg = c.fg }, -- any variable name that does not have another highlight, like in go "local util"
    ["@variable.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.
    ["@module.builtin"] = { fg = c.red }, -- Variable names that are defined by the languages, like `this` or `self`.

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
    ["@lsp.type.interface"] = { fg = c.cyan },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.lifetime"] = { link = "@keyword.storage" },
    ["@lsp.type.namespace"] = { link = "@module" },
    ["@lsp.type.method"] = { link = "Function" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@variable.parameter" },
    -- ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.typeAlias"] = { link = "@type.definition" },
    ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = c.error },
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
    ["@lsp.typemod.type.defaultLibrary"] = { fg = c.cyan },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = c.cyan },
    ["@lsp.typemod.variable.callable"] = { link = "@function" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },
    ["@lsp.typemod.variable.static"] = { link = "@constant" },

    -- Golang
    ["@module.go"] = { fg = c.blue },
    ["@keyword.function.go"] = { link = "Statement" },
    ["@lsp.type.namespace.go"] = { link = "@module.go" },

    -- Rust
    -- ["@lsp.type.enumMembers.rust"] = { fg = colors.grey[6] },

    -- YAML
    ["@property.yaml"] = { fg = c.yellow },

    -- Just
    ["@function.just"] = { link = "Function" },
    ["@function.call.just"] = { link = "@variable.parameter" },
  }

  return theme
end

return M
