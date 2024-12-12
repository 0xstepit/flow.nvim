local M = {}

-- Defines the highlight group colors for git.
-- @param c The available colors.
function M.get(c, _)
  local theme = {

    gitCommitSummary = { fg = c.fg_visual },

    -- Diff
    diffAdded = { fg = c.git.add },
    diffRemoved = { fg = c.git.delete },
    diffChanged = { fg = c.git.change },
    diffOldFile = { fg = c.yellow },
    diffNewFile = { fg = c.orange },
    diffFile = { fg = c.cyan },
    diffLine = { fg = c.comment },
    diffIndexLine = { fg = c.purple },

    DiffAdd = { link = "Added" }, -- Diff mode: Added line |diff.txt|.
    DiffChange = { link = "Changed" }, -- Diff mode: Changed line |diff.txt|.
    DiffDelete = { link = "Removed" }, -- Diff mode: Deleted line |diff.txt|.
    DiffText = { bg = c.diff.text }, -- Diff mode: Changed text within a changed line |diff.txt|.

    -- GitSigns
    GitSignsAdd = { fg = c.git.add }, -- diff mode: Added line |diff.txt|
    GitSignsChange = { fg = c.git.change }, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = { fg = c.git.delete }, -- diff mode: Deleted line |diff.txt|
    GitSignsCurrentLineBlame = { fg = c.grey[3] },

    -- Fugitive
    fugitiveHeader = { fg = c.grey[5] },
    fugitiveHelpHeader = { link = "fugitiveHeader" },
    fugitiveUntrackedHeading = { fg = c.yellow },
    fugitiveUntrackedModifier = { link = "fugitiveUntrackedHeading" },
    fugitiveUnstagedHeading = { fg = c.light_blue },
    fugitiveUnstagedModifier = { link = "fugitiveUnstagedHeading" },
    fugitiveStagedHeading = { fg = c.green },
    fugitiveStagedModifier = { link = "fugitiveStagedHeading" },
    fugitiveCount = { fg = c.grey[4] },
  }

  return theme
end

return M
