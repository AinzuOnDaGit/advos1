def exmd1():
    ex1 = input("Do you wish to exit? Press Y or N: ").islower()
    if ex1 == "y":
        print("Simulation exit")
        quit()        

    elif ex1 == "n":
        print("Continue simulation")
    else:
        print("Invalid choice")
exmd1()
