# CursorFig

Cross-platform configuration files for Cursor IDE and development environment setup.

## Overview

This repository contains a comprehensive set of configuration files for:
- Cursor IDE settings
- Development environment configurations
- Code formatting rules
- Linting preferences
- Build tools settings
- Testing frameworks
- Security configurations
- Performance monitoring

## Directory Structure

```
CursorFig/
├── .vscode/               # VSCode/Cursor IDE settings
├── .github/              # GitHub Actions and workflows
├── config/               # General configurations
│   ├── editor/          # Editor-specific settings
│   ├── linting/         # Linting configurations
│   ├── formatting/      # Code formatting rules
│   ├── build/           # Build tool configurations
│   ├── testing/         # Test framework settings
│   └── security/        # Security configurations
└── platform/            # Platform-specific configurations
    ├── macos/
    ├── windows/
    ├── linux/
    ├── qubes/
    ├── tails/
    └── arch/
```

## Setup Instructions

### Prerequisites
- Git
- Node.js (v18.x or later)
- npm (v9.x or later)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/CursorFig.git
```

2. Navigate to the directory:
```bash
cd CursorFig
```

3. Run the platform-specific setup script:

**macOS/Linux/Unix-based systems:**
```bash
./scripts/setup.sh
```

**Windows:**
```powershell
.\scripts\setup.ps1
```

### Platform-Specific Notes

#### macOS
- Supports both Intel and Apple Silicon
- Requires Xcode Command Line Tools
- Compatible with macOS Sonoma (14.0) and later

#### Windows
- Supports Windows 10/11 (x64)
- Requires Windows Subsystem for Linux (WSL2) for best experience
- PowerShell 7.0 or later recommended

#### Linux
- Supports major distributions (Ubuntu, Fedora, Debian)
- Requires systemd
- X11 or Wayland compatible

#### Qubes OS
- Tested on Qubes 4.1
- Requires appropriate template setup
- Follow Qubes-specific security guidelines

#### Tails
- Persistent storage must be enabled
- Configurations will need to be re-applied after each boot
- Use secure sync methods

#### Arch Linux
- Follows Arch Linux principles
- Uses pacman for package management
- AUR support included

## Configuration Files

### Core Configurations
- `.eslintrc.json`: JavaScript/TypeScript linting rules
- `.prettierrc`: Code formatting preferences
- `tsconfig.json`: TypeScript compiler settings
- `next.config.js`: Next.js framework configuration
- `.env.example`: Environment variables template

### IDE Settings
- `.vscode/settings.json`: Editor preferences
- `.vscode/extensions.json`: Recommended extensions
- `.vscode/launch.json`: Debugging configurations

### Security
- Security headers configuration
- CORS settings
- Rate limiting rules
- Authentication templates

### Testing
- Jest configuration
- Cypress settings
- Lighthouse CI setup

## Usage

1. Copy the relevant configuration files to your project
2. Modify as needed for your specific requirements
3. Run the appropriate setup script for your platform

## Maintenance

- Regular updates via GitHub Actions
- Security patches applied automatically
- Compatibility checks for new platform versions

## Contributing

1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## License

MIT License - See LICENSE file for details

## Support

- GitHub Issues for bug reports
- Discussions for questions
- Wiki for documentation
