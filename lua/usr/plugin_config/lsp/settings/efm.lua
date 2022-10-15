return {
    init_options = { documentFormatting = true },
    settings = {
        rootMarkers = { ".git/" },
        languages = {
            python = {
                { formatCommand = "black --quiet -", formatStdin = true },
                { formatCommand = "isort --quiet -", formatStdin = true }
            }
        }
    }
}
