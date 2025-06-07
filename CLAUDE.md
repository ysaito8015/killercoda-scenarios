# CLAUDE.md - Killercoda Scenarios Project

## Overview
This repository contains interactive educational scenarios for Killercoda, covering numerical computation, machine learning in Elixir, and gnuplot basics.

## Project Structure
- `lean-basic-of-gnuplot/` - Gnuplot tutorial scenarios
- `learning-of-numerical-calculation-by-practice/` - Numerical computation scenarios with C examples
- `machine-learning-in-elixir/` - Elixir ML tutorial scenarios
- `ubuntu-custom-content/` - Custom Ubuntu environment scenarios
- `ubuntu-simple/` - Basic Ubuntu scenario

## Development Guidelines

### Scenario Structure
Each scenario follows the standard Killercoda format:
- `index.json` - Scenario configuration
- `intro.md` - Introduction content
- `step*.md` - Step-by-step instructions
- `finish.md` - Completion content
- `setup.sh` - Environment setup script
- `background.sh` - Background processes

### Content Standards
- Write clear, educational content
- Include practical examples
- Provide working code samples
- Test all commands and code
- Use consistent formatting

### File Naming
- Use lowercase with hyphens for directories
- Number steps sequentially (step1.md, step2.md, etc.)
- Keep backup files (.md~) for drafts

### Quality Checks
Before committing scenarios:
1. Validate JSON syntax in index.json files
2. Test all shell commands
3. Verify code examples compile/run
4. Check markdown formatting
5. Ensure setup scripts work correctly

### Language-Specific Notes

#### C Programming (Numerical Scenarios)
- Use standard C99 or later
- Include proper headers
- Add compilation instructions
- Test on target platform

#### Elixir (ML Scenarios)
- Follow Elixir conventions
- Use Mix project structure when appropriate
- Include dependency information
- Test with target Elixir version

#### Shell Scripts
- Use `#!/bin/bash` shebang
- Include error handling
- Test on Ubuntu environment
- Keep scripts simple and educational

## Testing
Test scenarios locally using:
- Docker containers matching Killercoda environment
- Virtual machines with clean Ubuntu installations
- Manual walkthrough of each step

## Documentation
- Keep content beginner-friendly
- Explain concepts before showing code
- Include expected outputs
- Add troubleshooting sections where needed