Install required tools:
```
brew install tree-sitter-cli 
brew install ripgrep fd
```

To enable `.astro` file formatter, a prettier plugin needs to be installed. 
Make sure `pnpm` is already installed: 
```
brew install pnpm
```
At the root of an Astro project:
```
pnpm add --save-dev prettier-plugin-astro
```
Then create a `.prettierrc.mjs` file at the same place:
```
// .prettierrc.mjs
/** @type {import("prettier").Config} */
export default {
  plugins: ['prettier-plugin-astro'],
  overrides: [
    {
      files: '*.astro',
      options: {
        parser: 'astro',
      },
    },
  ],
};
```
