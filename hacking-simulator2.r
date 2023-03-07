# Hacking Simulator
# By ChatGPT

# Set up the target system
password <- "mysecretpassword"
target_system <- list(
  files = list(
    "document.txt" = "This is a sensitive document.\n"
  ),
  password = password
)

# Main game loop
while (TRUE) {
  # Clear the screen
  cat("\014")

  # Display the game menu
  cat("============================\n")
  cat("    Welcome to Hacking 101   \n")
  cat("============================\n")
  cat("1) View Files\n")
  cat("2) Crack Password\n")
  cat("3) Quit\n\n")
  choice <- readline("Enter choice: ")

  # Handle the user's choice
  if (choice == "1") {
    # View Files
    cat("\n=== Files ===\n")
    for (file_name in names(target_system$files)) {
      cat(file_name, "\n")
    }
    file_choice <- readline("\nEnter filename: ")
    if (file_choice %in% names(target_system$files)) {
      cat(target_system$files[[file_choice]], "\n")
    } else {
      cat("File not found!\n")
    }
    readline("\nPress Enter to continue...")
  } else if (choice == "2") {
    # Crack Password
    cat("\n=== Password Cracker ===\n")
    attempts <- 0
    while (TRUE) {
      password_guess <- readline("Enter password guess: ")
      if (password_guess == target_system$password) {
        cat("Password cracked in ", attempts, " attempts!\n")
        readline("\nPress Enter to continue...")
        break
      } else {
        cat("Wrong password!\n")
        attempts <- attempts + 1
      }
    }
  } else if (choice == "3") {
    # Quit
    cat("\nGoodbye!\n")
    break
  } else {
    # Invalid choice
    cat("\nInvalid choice!\n")
    readline("Press Enter to continue...")
  }
}
