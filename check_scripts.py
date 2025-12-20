import os

def check_files(directory, keyword):
    """
    Recursively check for a keyword in markdown files within a directory.
    Prints the relative path and line number where the keyword is found.
    """
    print(f"Starting Test 1: Checking for keyword '{keyword}' in {directory}")
    
    # Walk through the directory
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".md"):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        for line_num, line in enumerate(f, 1):
                            if keyword in line:
                                # Get relative path for cleaner output
                                rel_path = os.path.relpath(file_path)
                                print(f"{rel_path}:{line_num}")
                except Exception as e:
                    print(f"Could not read file {file_path}: {e}")

if __name__ == "__main__":
    # Test 1: Check for 'cite' in docs folder
    check_files("docs", "cite")
