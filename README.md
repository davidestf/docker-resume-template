# Docker Resume Template Generator

This project provides a dockerized solution for generating PDF resumes from markdown files using LaTeX templates and FontAwesome icons.

## Directory Structure
```
docker-resume-template/
├── cv-examples/
│   ├── your-cv-temaplate.md
├── Dockerfile
├── fontawesome.lua
├── output/
├── README.md
└── template.tex
```

## Installation

1. Clone the repository:
```bash
git clone
cd docker-resume-template
```

2. Build the Docker image:
```bash
docker build -t cv-generator .
```

## Usage

Generate your PDF resume using:
```bash
docker run \
    -v /root/docker-resume-template/output:/output \
    -v /root/docker-resume-template/cv-examples/cv-dev.md:/input.md \
    cv-generator /input.md
```

The generated PDF will be in the `output` directory.

## Customization

- Put your CV markdown file in `cv-examples/` directory
- Edit `template.tex` for layout changes
- Modify `fontawesome.lua` for other adjustments


## Contributing

Feel free to submit pull requests and issues.
