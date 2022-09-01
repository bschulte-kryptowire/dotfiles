local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("json", {
	s("laireth", {
    t("{ \"type\": \"header\", \"content\": \""), i(1, "headerName"), t("\"}")
	})
})

ls.add_snippets("json", {
  s("lairetl", {
    t("{ \"type\": \"list\", \"items\": ["), i(1, "items"), t("]}")
  })
})
