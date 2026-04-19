# Neovim config

Install required tools:

```bash
brew install tree-sitter-cli
brew install ripgrep fd
```

To use biome as a `.astro`/`.html` file formatter, create a `biome.json` file
at the root of the Astro project with the following content:

```json
{
  "html": {
    "experimentalFullSupportEnabled": true,
    "formatter": {
      "enabled": true
    }
  }
}
```
