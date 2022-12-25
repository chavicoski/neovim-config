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
                { formatCommand = "prettier ${INPUT}" },
            },
            typescript = {
                { formatCommand = "prettier ${INPUT}" },
            },
            svelte = {
                { formatCommand = "prettier ${INPUT}" },
            },
            html = {
                { formatCommand = "prettier ${INPUT}" },
            },
            json = {
                { formatCommand = "prettier ${INPUT}" },
            }
        }
    }
}
