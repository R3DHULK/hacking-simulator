# Define a function for generating a random IP address
generate_ip <- function() {
  paste(sample(0:255, 4, replace=TRUE), collapse=".")
}

# Set up the initial target
target_ip <- generate_ip()

# Game loop
while (TRUE) {
  # Clear the screen
  cat("\033[2J\033[H")

  # Print the current target IP
  cat("Target IP: ", target_ip, "\n\n")

  # Prompt the user for input
  cat("Enter a command:\n")
  command <- readline("> ")

  # Check the command
  if (command == "hack") {
    # Generate a random success rate
    success_rate <- runif(1)

    # Check if the hack is successful
    if (success_rate >= 0.5) {
      # The hack is successful
      cat("\nHacking successful!\n")
      cat("You have gained access to the target system.\n\n")

      # Prompt the user for further action
      cat("Enter a command:\n")
      command <- readline("> ")

      # Check the command
      if (command == "steal data") {
        # Generate a random amount of data to steal
        data_amount <- sample(1:100, 1)

        # Print the result
        cat("\nData stolen: ", data_amount, " MB\n\n")

        # Set up a new target
        target_ip <- generate_ip()

      } else {
        # Invalid command
        cat("\nInvalid command.\n\n")
      }

    } else {
      # The hack failed
      cat("\nHacking failed.\n\n")
    }

  } else if (command == "exit") {
    # Exit the game loop
    break

  } else {
    # Invalid command
    cat("\nInvalid command.\n\n")
  }
}
