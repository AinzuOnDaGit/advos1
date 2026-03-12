import sys #system exit
import time #Countdown
import logging #Log timestamp
import shutil #Move file to directory
import fleep #Using a detection of PDF 
import os

def asgn1():
    file_input = input("Enter the name of the file, with the extention. Example: file1.pdf: ")
    path = "/workspaces/advos1/"
    full_path = os.path.join(path, file_input)
    shutil.move(full_path, "/workspaces/advos1/assignments")

def asgn2(): #Check all submission
    path1 = "/workspaces/advos1/assignments" 
    dir_list = os.listdir(path1)
    print("Files and directories in '", path1, "' :")
    # prints all files
    print(dir_list)	




def log1(num=3):

    user1 = input("Enter Username: ") #User name entering
    # 60 second timer login
    
    while num != 0:

        user2 = input("Enter Password: ")
        if user2 == "jd824":
            print("Granted")
            logging.basicConfig(format='%(asctime)s %(message)s')
            logging.warning("Login Attempt success")
            break
        else:
            num -= 1 
            print(f"Wrong Password {num} Tries left") #Attempt if user gets code wrong
        
        if num == 0:
            print("Try again") if num else print("Too many wrong attempts. You are locked out!")
            time.sleep(60)
            logging.basicConfig(format='%(asctime)s %(message)s') 
            logging.warning("Login Attempt Failed")
            sys.exit

def exmd1():
    ex1 = input("Do you wish to exit? Press Y or N: ").lower()
    if ex1 == "y":
        print("Simulation exit")
        quit()        

    elif ex1== "n":
        print("Continue simulation")
        main_menu()
    else:
        print("Please enter Y or N")
        exmd1()

def main_menu():
    print("Welcome please enter choice: ")
    print("1. Submission")
    print("2. Check submitted files")
    print("3. File detection")
    print("4. Login simulation")
    print("5. Exit")

    while True:
        model = input("Enter choice: ")
        if model == "1":
            asgn1()
            break
        elif model == "2":
            asgn2()
            break
        elif model == "3":
            
            break
        elif model == "4": 
            log1()
            break
        elif model == "5": 
            exmd1()
        else:
            print("Invalid choice")
        

if __name__ == "__main__":
    main_menu()