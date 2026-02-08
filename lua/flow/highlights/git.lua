local M = {}

-- Defines the highlight group colors for git.
--- @param c table: The available colors.
--- @return table: Git highlights.
function M.get(c, _)
  local theme = {

    gitKeyword = { fg = c.blue },
    gitIdentityKeyword = { link = "gitKeyword" },
    gitCommitSummary = { fg = c.fluo },
    gitDate = { fg = c.light_blue },
    gitDiff = { fg = c.grey[6] },

    -- Diff
    diffAdded = { link = "Added" },
    diffRemoved = { link = "Removed" },
    diffChanged = { link = "Changed" },
    diffOldFile = { fg = c.git.delete },
    diffNewFile = { fg = c.git.add },
    diffFile = { fg = c.yellow },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.fg },

    DiffAdd = { link = "Added" }, -- Diff mode: Added line |diff.txt|.
    DiffChange = { link = "Changed" }, -- Diff mode: Changed line |diff.txt|.
    DiffDelete = { link = "Removed" }, -- Diff mode: Deleted line |diff.txt|.
    DiffText = { bg = c.diff.text }, -- Diff mode: Changed text within a changed line |diff.txt|.

    -- GitSigns
    GitSignsAdd = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsAddPreview = { bg = c.Green.very_dark },
    GitSignsDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsDeletePreview = { bg = c.Red.very_dark }, -- diff mode: Deleted line |diff.txt|
    GitSignsChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    -- colors shown when using :Gitsigns toggle_word_diff
    GitSignsDeleteInline = { fg = c.Red.light, bg = c.Red.very_dark }, -- diff mode: Deleted line |diff.txt|
    GitSignsAddInline = { fg = c.Green.light, bg = c.Green.very_dark },
    GitSignsChangeInline = { fg = c.Light_blue.light, bg = c.Light_blue.very_dark }, -- diff mode: Changed line |diff.txt|

    GitSignsCurrentLineBlame = { fg = c.grey[6] },

    -- Fugitive
    fugitiveHeader = { fg = c.grey[8] },
    fugitiveHelpHeader = { link = "fugitiveHeader" },
    fugitiveUntrackedHeading = { fg = c.yellow },
    fugitiveUntrackedModifier = { link = "fugitiveUntrackedHeading" },
    fugitiveUnstagedHeading = { fg = c.light_blue },
    fugitiveUnstagedModifier = { link = "fugitiveUnstagedHeading" },
    fugitiveStagedHeading = { fg = c.green },
    fugitiveStagedModifier = { link = "fugitiveStagedHeading" },
    fugitiveCount = { fg = c.yellow },
    FugitiveblameTime = { link = "gitDate" },

    -- Git-conflict
    GitConflictCurrentLabel = { bg = c.Light_blue.dark },
    GitConflictCurrent = { bg = c.diff.change },
    GitConflictIncomngLabled = { bg = c.Green.dark },
    GitConflictIncoming = { bg = c.diff.add },
    GitConflictAncestor = { bg = c.diff.parent },
    GitConflictAncestorLabel = { bg = c.Cyan.dark },
  }

  return theme
end

return M
