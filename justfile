# list all the available recipes
default:
    @just --list --unsorted

# build the PDF to `dist/output.pdf`
build PRESET:
    #!/bin/sh -e
    PORT=32212
    URL=http://127.0.0.1:$PORT
    DATAFILE=./src/routes/{{PRESET}}/data.nix

    WARNING='\e[0;33mwarning\e[0;37m'
    ERROR='\e[0;31merror\e[0;37m'

    if [ ! -f $DATAFILE ]; then
        export DATAFILE=$DATAFILE.example
        echo -e "${WARNING}: 'data.nix' not found! Using 'data.nix.example'"
    fi

    mkdir -p dist
    nix eval --json --file $DATAFILE > dist/{{PRESET}}-data.json
    echo "JSON file generated successfully!"

    if [ $USE_TAILWINDCSS ]; then
        bunx tailwindcss -i ./src/app.css -o ./dist/tailwind.css
        echo "TailwindCSS generated successfully!"
    fi

    bunx --bun vite build --ssr --log-level error
    (cd dist && bun ssr.js {{PRESET}})
    echo "Distributable files generated successfully!"

    echo "Launching server at $URL"
    busybox httpd -p $PORT -f -h dist &
    prince $URL --page-margin=0 --page-size=letter -o 'dist/output.pdf' --no-warn-css
    echo "PDF generated successfully!"

    echo "Killing busybox httpd server"
    pkill busybox

# HMR for building the PDF
watch PRESET:
    watchexec --clear --restart --watch src --no-vcs-ignore 'just build {{PRESET}}'
