local M = {}

-- Defines the highlight group colors for git.
--- @param c table: The available colors.
--- @return table: Git highlights.
function M.get(c, _)
  local theme = {

    gitKeyword = { fg = c.blue },
    gitIdentityKeyword = { link = "gitKeyword" },
    gitCommitSummary = { fg = c.bg_visual },
    gitDate = { fg = c.light_blue },
    gitDiff = { fg = c.grey[4] },

    -- Diff
    diffAdded = { fg = c.git.add, bg = c.diff.add },
    diffRemoved = { fg = c.git.delete, bg = c.diff.delete },
    diffChanged = { fg = c.git.change, bg = c.diff.change },
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
    GitSignsAddPreview = { bg = c.diff.add },
    GitSignsChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = { fg = c.grey[4] },

    -- Fugitive
    fugitiveHeader = { fg = c.grey[6] },
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
  }

  return theme
end

return M
