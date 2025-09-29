#!/bin/bash
set -e  # Exit on error
set -u  # Treat unset variables as errors

# Get source directory
export BDX_R_DOC_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Extract the Python executable
extract_python_exe() {
    local python_exe=""

    # Check if using Conda
    if [[ -n "${CONDA_PREFIX:-}" ]]; then
        python_exe="${CONDA_PREFIX}/bin/python"
    fi

    # Fallback to system Python if Conda Python not found
    if [[ -z "${python_exe}" || ! -f "${python_exe}" ]]; then
        if command -v python3 &> /dev/null; then
            python_exe="$(which python3)"
        elif command -v python &> /dev/null; then
            python_exe="$(which python)"
        fi
    fi

    # Ensure a valid Python executable is found
    if [[ -z "${python_exe}" || ! -f "${python_exe}" ]]; then
        echo -e "[ERROR] Unable to find a valid Python executable." >&2
        echo -e "\tPossible reasons:\n\t1. Conda environment is not activated.\n\t2. Python is not installed.\n\t3. Only 'python3' is available but not 'python'." >&2
        exit 1
    fi

    # Return the result
    echo "${python_exe}"
}

echo "[INFO] Building documentation..."

# Retrieve the Python executable
python_exe=$(extract_python_exe)
echo "${python_exe}"

# # Ensure documentation directory exists
if [ ! -d "${BDX_R_DOC_PATH}/docs" ]; then
    echo "[ERROR] Documentation directory not found: ${BDX_R_DOC_PATH}/docs" >&2
    exit 1
fi

# # Install pip packages
cd "${BDX_R_DOC_PATH}/docs"
${python_exe} -m pip install -r requirements.txt > /dev/null

# # Build the documentation
${python_exe} -m sphinx -b html -d _build/doctrees . _build/current

# # Open the documentation in the default browser
echo -e "[INFO] To open documentation, run:"
echo -e "\n\t\txdg-open $(pwd)/_build/current/index.html\n"

if [[ "$OSTYPE" == "darwin"* ]]; then
    open "$(pwd)/_build/current/index.html"
else
    xdg-open "$(pwd)/_build/current/index.html"
fi

# # Exit neatly
cd - > /dev/null
