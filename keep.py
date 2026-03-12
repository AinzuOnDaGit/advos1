#KEEP IF NEED TO SAVE


import fleep

with open("assignments/assignment_sent.txt", "rb") as file:
    info = fleep.get(file.read(128))
print(info.extension_matches("pdf"))


def asgn2(): #Check all submission
    file_read = open("advos1/assignments/", "r")
    print(file_read.read())
    
mypath = "/workspaces/advos1/assignments" 

#user_data = load_data(path)

# Check all submission

# import OS module
import os
# Get the list of all files and directories
path = "/workspaces/advos1/assignments" 
dir_list = os.listdir(path)
print("Files and directories in '", path, "' :")
# prints all files
print(dir_list)
