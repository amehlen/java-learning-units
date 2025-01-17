#!/bin/bash

# Current folder (for docker volume)
current_folder="/$(pwd)"
echo "Current folder: $current_folder"

docs_folder="src/docs"
echo "Docs folder: $docs_folder"

asciidoc_file="$docs_folder/index.adoc"
echo "Asciidoc file: $asciidoc_file"

resources_folder="$docs_folder/resources"
echo "Resources folder: $resources_folder"

theme_folder="$resources_folder/themes/custom-theme.yml"
echo "Theme file: $theme_folder"

fonts_folder="$resources_folder/fonts"
echo "Theme file: $fonts_folder"

docker_image="asciidoctor/docker-asciidoctor"
echo "Docker image for asciidoctor: $docker_image"

# Prepare output folder
output_folder="output"
echo "Output folder: $output_folder"

echo "Preparing output folder..."
rm -rf "$output_folder" && mkdir -p "$output_folder"

output_file="$output_folder/java-learning-units.pdf"
echo "Output file: $output_file"

docker run --rm -v "$current_folder:/documents/" $docker_image asciidoctor-pdf \
  -r asciidoctor-diagram \
  -r asciidoctor-mathematical \
  -a pdf-theme="$theme_folder" \
  -a pdf-fontsdir="$fonts_folder" "$asciidoc_file" \
  -o "$output_file"