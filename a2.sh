#Menu for job pending and request 

print_menu() {
    echo "View Pending Job"
    echo "Submit Job request"
    echo "Process Job"
    echo "Exit"
}





#View job
Job_View() {
    #Input for User in Job StudentID, Job name, etc.
    read -rp "Enter StudentID: " rp1
    read -rp "Enter Job Name: " rp2
    read -rp "Enter Execution Time: " rp3
    read -rp "Enter Priority time: " rp4

    if [[ "$rp4" -lt 1 || "$rp4" -gt 10 ]]; then
        echo "Invalid response"
    else
    printf "%s\n" "$rp1, $rp2, $rp3, $rp4" >> "job_pending.txt"
    sudo cat /workspaces/advos1/job_pending.txt 
    fi
}

Job_request() {
    #When Output request for a Job, it stores on text
    read -rp "Request Job here: " ans1
        printf "$ans1" >> "job_request.txt"
    echo "Job has been requested" #Test when output is sent
}

Job_queue() {

    printf "%s %s\n" "$(date '+%Y -%m -%d %H:%M:%S')" "$msg" >> "job_queue.txt"

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