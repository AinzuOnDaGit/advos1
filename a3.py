def log1(num=3):
    
    while num != 0:
        user1 = input("Enter username: ")
        if user1 == "jd824":
            print("Granted")
            break
        else:
            num -= 1 
            print(f"Nuh uh {num} Chance")

            print("Try again") if num else print("Too many wrong attempts. You are locked out!")
            
            
def main_menu():
    print("Welcome please enter choice: ")
    print("1. Login simulation")


    while True:
        model = input("Enter choice: ")
        if model == "1":
            log1()
            break
        else:
            print("Invalid choice")

if __name__ == "__main__":
    main_menu()