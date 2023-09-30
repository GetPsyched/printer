# printer

A printer that eats Nix/JSON, poops out HTML, and births a PDF.

## Features

- Decouple your data and styling.
- Define multiple presets for the same data.
- Effortlessly mass produce builds for similar data.
- Version control over styling and data file formats.

## Usage

1. Clone this repository.
2. Run `nix develop` within this project's directory to install its dependencies.
3. Run `just` to see the available command options.
   - `build <preset>`: Build the PDF choosing a preset (will likely have nested presets in the future)
   - `watch <preset>`: Watch the build. As you change files the PDF will regenerate automatically.

## Project Structure

TODO

## Acknowledgements

Thanks to [@maan2003](https://github.com/maan2003) for sharing his experience with building PDFs out of plaintext which helped kick-start this project!
