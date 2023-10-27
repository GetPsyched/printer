# printer

Style your documents deterministically.

## Features

- **Fearless styling:** Style once and forget about it ever breaking.
- **Version control:** Supercharge your documents with Git; know what changed when and why!
- **Mass production:** Automate building repetitive documents using [the JSON API](#using-the-api).
- **Presets (WIP):** Same you, different look? Create new styles without losing old ones.

## Purpose

This project isn't meant to be used out of the box; instead, this project provides an infrastructure for compiling custom data and pre-defined designs into HTML/PDF conveniently. The idea is that you define the designs and data formats and utilise the conversion structure provided by this project.

## Usage

1. Clone this repository.
2. Run `nix develop` within this project's directory to install our build dependencies.
3. Run `npm install` to install our package dependencies.

### Using the CLI

1. Rename `src/*/data.nix.example` to `src/*/data.nix` and populate it with the necessary information.
2. Run `just` to see the available command options.
   - `build <design>`: Build the PDF choosing a design.
   - `watch <design>`: Watch the build. As you change files, the PDF will regenerate automatically.
3. View your generated PDF at `dist/output.pdf`.

> **Note**
> To use TailwindCSS, set `USE_TAILWINDCSS` to `1`.

### Using the API

1. Run `npm run dev` for local hosting and `npm run start` for production hosting.
2. The API routes are as follows:
   - `POST <url>/pdf?target=<design>`:
     - `design` must match the exact folder name that you have stored for your design.
     - The body must be formatted as such:
       ```json
       {
         "options": { "tailwindcss": true },
         "data": {}
       }
       ```
   - `POST <url>/html?target=<design>`: The rules are the same as the PDF endpoint.

## Developing your own designs

Setup the project? Good. Here's what you need to know to kick-start developing your own designs:

- The directory where you will be creating your design(s) is `src/<design>`.
- Within this directory, you must create a `page.svelte` file. This is the entry point of your design. From here, you can either expand to multiple `.svelte` files via imports or stick to one, it's up to you.
  - For importing the data into your `page.svelte` file, export a variable named `data` (see other designs for reference)
  - If you want to use TailwindCSS for styling, please see how to enable compiling TailwindCSS [below](#usage).
- Once you've created your design, you have 2 options to feed it data.

  1. Using the CLI
  2. By running the server and calling the relevant API endpoints.

  I recommend that you use option 1 for non-automated use cases, and option 2 for automated ones.

## Acknowledgements

Thanks to [@maan2003](https://github.com/maan2003) for sharing his experience with building PDFs out of plaintext which helped kick-start this project!
