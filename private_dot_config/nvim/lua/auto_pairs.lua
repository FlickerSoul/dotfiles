local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')

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

