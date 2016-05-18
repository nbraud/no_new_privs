// no_new_privs: A simple NO_NEW_PRIVS executor
// Copyright (c) 2016, Nicolas Braud-Santoni `<nicolas@braud-santoni.eu>`

#include <err.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/prctl.h>

int main(int argc, char *const * argv) {
  if (argc <= 1) {
    fprintf(stdout, "Too few arguments");
    return EXIT_FAILURE;
  }

  if (prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0) != 0)
    perror("Failed to set NO_NEW_PRIVS");

  execvp(argv[1], argv+1);
  err(EXIT_FAILURE, "Failed to start %s", argv[1]);
}
