import os
import filecmp
import logging

def file_detect():
    fdcheck = input("Submit a file here: File must be .PDF or .DOCX: ")
    fdpath = "/workspaces/advos1"
    path_content = "/workspaces/advos1/assignments"

    fd_join = os.path.join(fdpath, fdcheck)

    # Check extension
    ex_path = os.path.splitext(fd_join)[1].lower()
    if ex_path not in [".pdf", ".docx"]:
        print("INVALID FILE TYPE")
        return

    # Check if file exists in source
    if not os.path.isfile(fd_join):
        print("FILE DOES NOT EXIST, TRY AGAIN")
        return

    # Loop through existing assignment files
    for ex2_file in os.listdir(path_content):
        existing_path = os.path.join(path_content, ex2_file)

        if os.path.isfile(existing_path):

            # ✅ Check BOTH name and content
            same_name = (fdcheck == ex2_file)
            same_content = filecmp.cmp(fd_join, existing_path, shallow=False)

            if same_name and same_content:
                print("ERROR!!! Same file name AND content already exists")
                data_log()
                logging.warning("Duplicate file (name + content)")
                return

    # File size check
    fd_size = os.path.getsize(fd_join)
    if fd_size > 5_000_000:
        print("FILE SIZE LARGE, Must be lower than 5MB")
        return

    print("File accepted!")