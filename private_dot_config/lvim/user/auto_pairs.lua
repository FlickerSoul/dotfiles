local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')

npairs.setup {
    check_ts = true,
}
npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")


-- npairs.add_rules({
--   Rule("$", "$",{"tex", "latex"})
--     -- don't add a pair if the next character is %
--     :with_pair(cond.not_after_regex("%%"))
--     -- don't add a pair if  the previous character is xxx
--     :with_pair(cond.not_before_regex("xxx", 3))
--     -- don't move right when repeat character
--     :with_move(cond.none())
--     -- don't delete if the next character is xx
--     :with_del(cond.not_after_regex("xx"))
--     -- disable adding a newline when you press <cr>
--     :with_cr(cond.none())
--   },
--   -- disable for .vim files, but it work for another filetypes
--   Rule("a","a","-vim")
-- )
--

-- npairs.add_rule(Rule("$$","$$","tex"))
-- npairs.add_rules({
--     Rule("$$","$$","tex")
--     :with_pair(function(opts)
--             print(vim.inspect(opts))
--             if opts.line=="aa $$" then
--             -- don't add pair on that line
--               return false
--             end
--         end)
--     }
-- )

require("nvim-treesitter.configs").setup { autopairs = { enable = true } }
local ts_conds = require("nvim-autopairs.ts-conds")

-- TODO: can these rules be safely added from "config.lua" ?
-- press % => %% is only inside comment or string
npairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}

-- jump pass closed parenthesis 
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
for _,bracket in pairs(brackets) do
  Rule('', ' '..bracket[2])
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == bracket[2] end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(bracket[2])
end

-- jump pass ; and ,
for _,punct in pairs { ",", ";" } do
    require "nvim-autopairs".add_rules {
        require "nvim-autopairs.rule"("", punct)
            :with_move(function(opts) return opts.char == punct end)
            :with_pair(function() return false end)
            :with_del(function() return false end)
            :with_cr(function() return false end)
            :use_key(punct)
    }
end

