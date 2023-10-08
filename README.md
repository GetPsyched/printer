# printer

A printer that eats Nix/JSON, poops out HTML, and births a PDF.

## Features

- Decouple your data and styling.
- Define multiple presets for the same data.
- Effortlessly mass produce builds for similar data.
- Version control over styling and data file formats.

## Purpose

This project isn't meant to be used out of the box; instead, this project provides an infrastructure for compiling custom data and pre-defined presets into HTML/PDF conveniently. The idea is that you define the presets and data formats and utilise the conversion structure provided by this project.

So, here's what you need to know to develop your own presets:

- The directory where you will be creating your preset(s) is `src/<preset>`.
- Within this directory, you must create a `page.svelte` file. This is the entry point of your preset. From here, you can either expand to multiple `.svelte` files via imports or stick to one, it's up to you.
  - For importing the data into your `page.svelte` file, export a variable named `data` (see other presets for reference)
- Once you've created your preset, you have 2 options to feed it data.

  1. Using the CLI
  2. By running the server and calling the relevant API endpoints.

  I recommend that you use option 1 for non-automated use cases, and option 2 for automated ones.

See [Usage](#usage) for details on setting up the project and other details.

## Usage

1. Clone this repository.
2. Run `nix develop` within this project's directory to install our build dependencies.
3. Run `bun install` to install our package dependencies.
4. Rename `src/*/data.nix.example` to `src/*/data.nix` and populate it with your details.

### Using the CLI

1. Run `just` to see the available command options.
   - `build <preset>`: Build the PDF choosing a preset.
   - `watch <preset>`: Watch the build. As you change files, the PDF will regenerate automatically.
2. View your generated PDF at `dist/output.pdf`.

### Using the API

1. Run `bun run dev` for local hosting and `bun run start` for production hosting.
2. The API routes are as follows:
   - `POST <url>/pdf?target=<preset>`:
     - `preset` must match the exact folder name that you have stored for your preset.
     - The body must be formatted as such:
       ```json
       {
         "options": { "tailwindcss": true },
         "data": {}
       }
       ```
   - `POST <url>/html?target=<preset>`: The rules are the same as the PDF endpoint.

## Acknowledgements

Thanks to [@maan2003](https://github.com/maan2003) for sharing his experience with building PDFs out of plaintext which helped kick-start this project!
