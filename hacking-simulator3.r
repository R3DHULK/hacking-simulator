# Set up the game
set.seed(123)
password <- paste0(sample(0:9, 4, replace = TRUE), collapse = "")
guesses <- c()
remaining_attempts <- 10

# Game loop
while (remaining_attempts > 0) {
  # Print game status
  cat("\n------------------------------\n")
  cat("Remaining attempts:", remaining_attempts, "\n")
  cat("Previous guesses:", if (length(guesses) > 0) paste(guesses, collapse = " ") else "-", "\n")
  
  # Prompt user for guess
  guess <- readline(prompt = "Enter a 4-digit guess: ")
  
  # Validate guess
  if (!grepl("^[0-9]{4}$", guess)) {
    cat("Invalid guess format. Please enter a 4-digit number.\n")
    next
  }
  if (guess %in% guesses) {
    cat("You already guessed that number.\n")
    next
  }
  
  # Add guess to list of previous guesses
  guesses <- c(guesses, guess)
  
  # Calculate number of correct digits
  correct_digits <- sum(strsplit(password, "")[[1]] == strsplit(guess, "")[[1]])
  
  # End game if correct password is guessed
  if (correct_digits == 4) {
    cat("Congratulations! You hacked the system.\n")
    break
  }
  
  # Calculate number of misplaced digits
  password_counts <- table(strsplit(password, "")[[1]])
  guess_counts <- table(strsplit(guess, "")[[1]])
  misplaced_digits <- sum(pmin(password_counts, guess_counts))
  misplaced_digits <- misplaced_digits - correct_digits
  
  # Print hint
  cat("Incorrect guess. ", correct_digits, " digits are correct and ", misplaced_digits, " digits are misplaced.\n")
  
  # Decrement remaining attempts
  remaining_attempts <- remaining_attempts - 1
}

# Game over
if (remaining_attempts == 0) {
  cat("\nYou failed to hack the system. The password was:", password, "\n")
}
