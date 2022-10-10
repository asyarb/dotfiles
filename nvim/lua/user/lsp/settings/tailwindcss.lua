return {
	settings = {
		tailwindCSS = {
			classAttributes = { "class", "className", "ngClass", "class:list" },

			experimental = {
				classRegex = { "clsx\\(([^)]*)\\)", "twix\\(([^)]*)\\)" },
			},
		},
	},
}
