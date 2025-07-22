# serverset_apps

A collection of setup and deployment scripts for server applications supporting Python, R, Quarto, and more across Linux (RHEL/Fedora) and macOS environments.

---

##Features

- Installs required system packages on **RHEL/Fedora** and **macOS**  
- Sets up a **Python virtual environment** with Jupyter, Pandas, Matplotlib, and Quarto  
- Installs **Quarto CLI** via `.rpm` or Homebrew  
- Installs essential **R packages** and initializes `renv` for reproducible R environments  

---

## Getting Started

### Requirements

- For **RHEL/Fedora**: `sudo` access and `dnf`  
- For **macOS**: `brew` installed and accessible from terminal  

### Usage

#### On RHEL/Fedora:

```bash
chmod +x setup_rhel.sh
./setup_rhel.sh
```
#### On macOS Local

```bash
chmod +x setup_macos.sh
./setup_macos.sh
```
