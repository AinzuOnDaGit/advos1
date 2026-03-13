import logging

# Configure the logger
logging.basicConfig(
    filename='app.log',               # Specify the log file name
    level=logging.INFO,               # Set the logging level to INFO
    format='%(asctime)s - %(levelname)s - %(message)s'  # Define the log message format
)

# Write an informational log message
logging.info('This is an informational message')