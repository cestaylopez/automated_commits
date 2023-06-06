# Automated Commits

This Ruby script automates the process of committing and pushing changes to a remote Git repository.

## How it works

1. It checks if there are any uncommitted changes in the local repository.
2. If there are uncommitted changes, it performs a commit with an automated message.
3. It generates an automated commit message based on the changes being made.
4. It adds all modified or added files to the commit.
5. It pushes the changes to the remote repository using the current branch name.
6. It configures the Git command to use a personal access token for authentication.
7. It displays the result of the push operation, including the automated commit message.

## Usage

1. Make sure you have Ruby installed on your system.
2. Replace `YOUR_PERSONAL_ACCESS_TOKEN` with your personal access token from GitHub.
3. Replace `your-email@example.com` with your email address.
4. Replace `YOUR_URL_PROJECT` with the URL of your GitHub project repository.
5. Run the script using the command: `ruby script_name.rb`

**Note:** Before running the script, ensure that you are in the correct directory with the Git repository initialized.

## License

This project is licensed under the [MIT License](LICENSE).
