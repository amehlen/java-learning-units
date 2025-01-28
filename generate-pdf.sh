#!/bin/bash

# Define paths
current_folder="/$(pwd)"
asciidoc_file="src/docs/index.adoc"
theme_file="src/docs/resources/themes/custom-theme.yml"
fonts_folder="src/docs/resources/fonts"
output_folder="output"
output_file="$output_folder/java-learning-units.pdf"
docker_image="asciidoctor/docker-asciidoctor"

# Prepare output folder
rm -rf "$output_folder" && mkdir -p "$output_folder"

# Generate PDF
docker run --rm -v "$current_folder:/documents/" "$docker_image" asciidoctor-pdf \
  -r asciidoctor-diagram \
  -r asciidoctor-mathematical \
  -a pdf-theme="$theme_file" \
  -a pdf-fontsdir="$fonts_folder" "$asciidoc_file" \
  -o "$output_file"

echo "PDF generated at: $output_file"