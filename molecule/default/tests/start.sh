#!/bin/bash
user_name=onefrontal
__create_user() {
  # Create a user to SSH into as.
  useradd $user_name
  SSH_USERPASS=azerty
  echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin $user_name)
  echo ssh ${user_name} password: $SSH_USERPASS
}

__add_user_to_sudoers() {
  echo "${user_name} ALL=(ALL:ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
}

# Call all functions
__create_user
__add_user_to_sudoers