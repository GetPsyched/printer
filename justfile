# list all the available recipes
default:
    @just --list --unsorted

# build the PDF to `dist/output.pdf`
build:
    #!/bin/sh -e
    export PORT=32212
    export URL=http://127.0.0.1:$PORT

    mkdir -p dist
    nix eval -f ./data --raw > dist/data.js
    echo "JSON file generated successfully!"

    bunx --bun vite build --ssr --log-level error
    (cd dist && bun ssr.js)
    echo "Distributable files generated successfully!"

    echo "Launching server at $URL"
    busybox httpd -p $PORT -f -h dist &
    prince $URL --page-margin=0 --page-size=letter -o 'dist/output.pdf'
    echo "PDF generated successfully!"

    echo "Killing busybox httpd server"
    pkill busybox

# HMR for building the PDF
watch:
    watchexec --clear --restart 'just build'
