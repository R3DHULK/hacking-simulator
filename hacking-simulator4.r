# Set up the system
password <- "secret"
firewall <- 1
security_level <- 1
vulnerabilities <- c("weak_password", "unpatched_system")

# Game loop
while (TRUE) {
  
  # Clear the screen
  cat("\014")
  
  # Display the system status
  cat("SYSTEM STATUS\n")
  cat("Password: ", ifelse(security_level >= 2, password, "********"), "\n")
  cat("Firewall: ", firewall, "\n")
  cat("Security Level: ", security_level, "\n")
  cat("Vulnerabilities: ", paste(vulnerabilities, collapse = ", "), "\n\n")
  
  # Get the player's action
  cat("What do you want to do?\n")
  cat("1. Crack password\n")
  cat("2. Attack firewall\n")
  cat("3. Exploit vulnerabilities\n")
  cat("4. Do nothing\n\n")
  action <- as.integer(readline("Enter your choice: "))
  
  # Perform the selected action
  if (action == 1) {
    if (security_level >= 2) {
      cat("The password has already been cracked.\n\n")
    } else {
      guessed_password <- readline("Enter your guess for the password: ")
      if (guessed_password == password) {
        cat("Password cracked!\n\n")
        security_level <- 2
      } else {
        cat("Incorrect password.\n\n")
      }
    }
  } else if (action == 2) {
    if (firewall == 0) {
      cat("The firewall has already been bypassed.\n\n")
    } else {
      attack_strength <- as.integer(readline("Enter your attack strength (1-10): "))
      if (attack_strength >= firewall) {
        cat("Firewall bypassed!\n\n")
        firewall <- 0
        security_level <- max(security_level, 3)
      } else {
        cat("Firewall not bypassed.\n\n")
      }
    }
  } else if (action == 3) {
    if (length(vulnerabilities) == 0) {
      cat("No vulnerabilities to exploit.\n\n")
    } else {
      exploit <- readline(paste("Enter the vulnerability to exploit (", paste(vulnerabilities, collapse = "/"), "): ", sep = ""))
      if (exploit %in% vulnerabilities) {
        cat("Vulnerability exploited!\n\n")
        vulnerabilities <- setdiff(vulnerabilities, exploit)
        security_level <- max(security_level, 4)
      } else {
        cat("Invalid vulnerability.\n\n")
      }
    }
  } else if (action == 4) {
    cat("You do nothing.\n\n")
  } else {
    cat("Invalid choice.\n\n")
  }
  
  # Check for win condition
  if (security_level == 5) {
    cat("You win!\n")
    break
  }
  
  # Check for lose condition
  if (firewall == 0 && length(vulnerabilities) == 0) {
    cat("You lose!\n")
    break
  }
  
  # Wait for input to continue
  readline("Press enter to continue...")
}
