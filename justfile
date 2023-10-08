# list all the available recipes
default:
    @just --list --unsorted

# build the PDF to `dist/output.pdf`
build PRESET:
    #!/bin/sh -e
    DATAFILE=./src/{{PRESET}}/data.nix

    WARNING='\e[0;33mwarning\e[0;37m'
    ERROR='\e[0;31merror\e[0;37m'

    if [ ! -d "./src/{{PRESET}}" ]; then
        echo -e "${ERROR}: The build preset '{{PRESET}}' doesn't exist"
        exit 1
    fi

    if [ ! -f $DATAFILE ]; then
        export DATAFILE=$DATAFILE.example
        echo -e "${WARNING}: 'data.nix' not found! Using 'data.nix.example'"
    fi

    mkdir -p dist
    nix eval --json --file $DATAFILE > dist/data.json
    echo "JSON file generated successfully!"

    if [ $USE_TAILWINDCSS ]; then
        npx tailwindcss -i ./src/app.css -o ./dist/tailwind.css
        echo "TailwindCSS generated successfully!"
    fi

    vite build --config vite.config.just.ts --ssr --log-level error
    node dist/ssr.js {{PRESET}} "$(cat ./dist/data.json)"
    echo "Distributable files generated successfully!"

    prince dist/{{PRESET}}.html --page-margin=20mm --page-size=letter -o 'dist/output.pdf' --no-warn-css
    echo "PDF generated successfully!"

# HMR for building the PDF
watch PRESET:
    watchexec --clear --restart --watch src --no-vcs-ignore 'just build {{PRESET}}'
