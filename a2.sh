#Menu for job pending and request 
print_menu() {
    echo "View Pending Job"
    echo "Submit Job request"
    echo "Job list"
    echo "Job Queue"
    echo "Completed Job"
    echo "Exit"
}


#View job
Job_View() {
    #Input for User in Job StudentID, Job name, etc.
    read -rp "Enter StudentID: " rp1
    read -rp "Enter Job Name: " rp2
    read -rp "Enter Execution Time: " rp3
    read -rp "Enter Priority time: " rp4

    #condition if user didn't enter StudentID
    if [[ -z "$rp1" || -z "$rp2" || -z "$rp3" ]]; then
    echo "Invalid response" 

    #condition if user enter wrong number
    elif [[ "$rp4" -lt 1 || "$rp4" -gt 10 ]]; then
        echo "Invalid response"
    else
    printf "%s\n" "$rp1, $rp2, $rp3, $rp4" >> "job_pending.txt"
    sudo cat /workspaces/advos1/job_pending.txt
    #For function of storing job 
    fi
    
}


Job_request() {
    #When Output request for a Job, it stores on text
    read -rp "Request Job here: " ans1
    if [[ -z "$ans1" ]]; then
    echo "Please enter Job request!!"
    else
        printf "$ans1" >> "job_request.txt"
    echo "Job has been requested" #Test when output is sent
    fi

}

#Sort file (Jobs)
Job_listed() {

echo "Job view sorted"

sort -t ',' -k4,4n /workspaces/advos1/job_pending.txt #sorting method priority

echo "Processing task" 
sleep 2 #Pausing task
echo "Processing done"
Job_schedule "Job data stored"

}

#Storing data of Job that is currently pending
Job_queue() {

    echo "Job in queue"
    sudo cat /workspaces/advos1/job_queue.txt

}

#Logged job when user enters studentid, priority time, etc.
Job_schedule() {
local job_message=$1
printf "%s %s\n" "$(date '+%Y -%m -%d %H:%M:%S')" "$job_message" >> "scheduler_log.txt"

}

#When Pending Job completed, option for Job completed will move to another text file
Job_completed() {
    mv /workspaces/advos1/job_pending.txt /workspaces/advos1/completed_jobs.txt 
}


Exit() {

        read -rp "Do you wish to exit? (Type Y or N): " exs 
        if [[ "$exs" != [Yy] && "$exs" != [Nn] ]]; then
        echo "Please Enter Y or N!!"
        Exit #If condition not Y or N, calls function back

        elif [[ "$exs" = "Y" || "$exs" = "y" ]]; then
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
    3) Job_listed ;;
    4) Job_queue ;;
    5) Job_completed ;;
    6) Exit ;;
    *) echo "Please try again" ;;
    esac
    echo
    done
}
main_loop