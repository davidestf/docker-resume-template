# Use Ubuntu as base image
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    pandoc \
    texlive-xetex \
    texlive-fonts-extra \
    fonts-font-awesome \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
WORKDIR /app

# Copy your template files
COPY template.tex /app/
COPY fontawesome.lua /app/

# Create an entrypoint script
RUN echo '#!/bin/bash\n\
if [ -z "$1" ]; then\n\
    echo "Please provide the input markdown file as an argument"\n\
    exit 1\n\
fi\n\
pandoc -o /output/cv.pdf "$1" \
    --template=/app/template.tex \
    --lua-filter=/app/fontawesome.lua \
    --pdf-engine=xelatex \
    --metadata linkReferences=true' > /app/generate-cv.sh \
    && chmod +x /app/generate-cv.sh

# Create output directory
RUN mkdir /output

# Set the entrypoint
ENTRYPOINT ["/app/generate-cv.sh"]
