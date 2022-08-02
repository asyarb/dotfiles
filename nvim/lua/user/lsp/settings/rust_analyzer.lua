return {
	["rust-analyzer"] = {
		updates = { channel = "stable" },
		notifications = { cargoTomlNotFound = true },
		assist = {
			importGroup = true,
			importMergeBehaviour = "full",
			importPrefix = "by_crate",
		},
		callInfo = {
			full = true,
		},
		cargo = {
			allFeatures = true,
			autoreload = true,
			loadOutDirsFromCheck = true,
		},
		checkOnSave = {
			command = "clippy",
			allFeatures = true,
			extraArgs = "--tests",
		},
		completion = {
			addCallArgumentSnippets = true,
			addCallParenthesis = true,
			postfix = {
				enable = true,
			},
			autoimport = {
				enable = true,
			},
		},
		diagnostics = {
			enable = true,
			enableExperimental = true,
		},
		hoverActions = {
			enable = true,
			debug = true,
			gotoTypeDef = true,
			implementations = true,
			run = true,
			linksInHover = true,
		},
		inlayHints = {
			chainingHints = true,
			parameterHints = true,
			typeHints = true,
		},
		lens = {
			enable = true,
			debug = true,
			implementations = true,
			run = true,
			methodReferences = true,
			references = true,
		},
		procMacro = {
			enable = true,
		},
	},
}
