return {
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            python = {
                { formatCommand = "black --quiet -", formatStdin = true },
                { formatCommand = "isort --quiet -", formatStdin = true }
            },
            javascript = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            },
            typescript = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            },
            svelte = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            },
            html = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            },
            json = {
                { formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true },
            }
        }
    }
}
