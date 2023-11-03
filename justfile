# list all the available recipes
default:
    @just --list --unsorted

# build the PDF to `dist/output.pdf`
build DESIGN:
    #!/bin/sh -e
    if [ ! $INPUT_FILE_PATH ]; then
        INPUT_FILE_PATH="./src/{{DESIGN}}/data.nix"
    fi

    WARNING='\e[0;33mwarning\e[0;37m'
    ERROR='\e[0;31merror\e[0;37m'

    if [ ! -d "./src/{{DESIGN}}" ]; then
        echo -e "${ERROR}: The design '{{DESIGN}}' doesn't exist"
        exit 1
    fi

    mkdir -p dist
    nix eval --json --file $INPUT_FILE_PATH > dist/data.json
    echo "JSON file generated successfully!"

    if [ $USE_TAILWINDCSS ]; then
        npx tailwindcss -i ./src/app.css -o ./dist/tailwind.css
        echo "TailwindCSS generated successfully!"
    fi

    vite build --config vite.config.just.ts --ssr --log-level error
    node dist/ssr.js {{DESIGN}} "$(cat ./dist/data.json)"
    echo "Distributable files generated successfully!"

    prince dist/{{DESIGN}}.html --page-margin=20mm --page-size=letter -o 'dist/output.pdf' --no-warn-css
    echo "PDF generated successfully!"

# HMR for building the PDF
watch DESIGN:
    watchexec "just build {{DESIGN}}" \
        --clear --restart --no-vcs-ignore \
        --watch "src/{{DESIGN}}" \
        --watch $INPUT_FILE_PATH \
        --watch justfile
