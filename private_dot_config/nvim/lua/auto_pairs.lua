local M = {}

function M.setup()
  local npairs = require("nvim-autopairs")
  local Rule = require("nvim-autopairs.rule")
  npairs.setup {
    check_ts = true,
  }
  npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")

  npairs.add_rule(Rule("$$","$$","tex"))
  npairs.add_rules({
  Rule("$$","$$","tex")
    :with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line=="aa $$" then
        -- don't add pair on that line
          return false
        end
    end)
   }
)
end

return M
