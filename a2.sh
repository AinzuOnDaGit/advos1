#Menu for job pending and request 

print_menu() {
    echo "View Pending Job"
    echo "Submit Job request"
    echo "Process Job"
    echo "Exit"
}

#View job
Job_View() {
}


Exit() {

    read -rp "Do you wish to exit? (Type Y or N): " exs 
        if [[ "$exs" = "Y" || "$exs" = "y" ]]; then
        kill $$
        fi 

        if [[ "$exs" = "N" || "$exs" = "n" ]]; then

        echo "Continue"
        fi
}

main_loop () {
while true; do
print_menu
read -r -p "Select option: " choice
case "$choice" in 
    1) Job_View ;;
    2) Job_request ;;
    3) Job_queue ;;
    4) Exit ;;
    *) echo "Please try again" ;;
    esac
    echo
    done
}
main_loop