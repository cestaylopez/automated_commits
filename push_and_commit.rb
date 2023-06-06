#!/usr/bin/env ruby
require 'open3'

# Check if there are uncommitted changes
def uncommitted_changes?
  `git status --porcelain`.chomp != ''
end

# Commit changes with an automated message
def commit_changes(commit_message)
  `git add --all`
  `git commit -m "#{commit_message}"`
end

# Get the current branch name
def current_branch
  `git symbolic-ref --short HEAD`.chomp
end

# Push changes to the remote repository
def push_changes
  branch = current_branch
  `git push origin #{branch}`
end

# Check if there are uncommitted changes
if uncommitted_changes?
  puts 'There are uncommitted changes. Performing commit and push automatically...'

  # Generate an automated commit message based on the changes being made
  status_output = `git status --porcelain`
  commit_message = "Automated commit: Changes in "

  # Add the names of modified or added files to the commit message
  status_output.each_line do |line|
    file_status = line.strip.split(' ')[0]
    file_name = line.strip.split(' ')[1]

    if file_status == 'M' || file_status == 'A'
      commit_message += "#{file_name}, "
    end
  end

  commit_message.chomp!(', ')

  # Commit and push with the automated message
  commit_changes(commit_message)

  # Configure the git command to use a personal access token instead of credentials
  token = 'YOUR_PERSONAL_ACCESS_TOKEN'  # Replace with your personal access token
  email = 'your-email@example.com'  # Replace with your email address

  `git remote set-url origin git@github.com:cestaylopez/YOUR_URL_PROJECT`
  `git config --global user.email "#{email}"`
  `git push`

  puts 'Push successful. An automated commit has been made with the message: ' + commit_message
else
  puts 'No uncommitted changes. Commit and push are not required.'
end