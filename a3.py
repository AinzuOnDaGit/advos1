import sys #system exit
import time #Countdown
import logging #Log timestamp
import shutil #Move file to directory

def asgn1():
    sm1 = input("Submit name file here: ")
    text_file = open("assignment_sent.txt", "a")
    shutil.move("/workspaces/advos1/assignment_sent.txt", "/workspaces/advos1/assignments")
    text_file.write(sm1)
    text_file.close


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
            print(f"Wrong Password {num} Tries left")
        
        if num == 0:
            print("Try again") if num else print("Too many wrong attempts. You are locked out!")
            time.sleep(60)
            logging.basicConfig(format='%(asctime)s %(message)s')
            logging.warning("Login Attempt Failed")
            sys.exit


def main_menu():
    print("Welcome please enter choice: ")
    print("1. Login simulation")
    print("2. Submission")


    while True:
        model = input("Enter choice: ")
        if model == "1":
            log1()
            break
        elif model == "2":
            asgn1()
            break

        else:
            print("Invalid choice")
        

if __name__ == "__main__":
    main_menu()