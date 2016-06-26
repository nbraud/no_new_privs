no_new_privs(1) -- set the `NO_NEW_PRIVS` `prctl`(2)
====================================================

SYNOPSIS
--------

`no_new_privs` <program> [<arguments> ...]


DESCRIPTION
-----------

`no_new_privs` executes a program, with given arguments,
after setting the `NO_NEW_PRIVS` `prctl`(2) option.

If <program> doesn't contain a slash (/), it is searched for in a
shell-like fashion, in the `PATH` environment variable; see `execvp`(3).

EXIT STATUS
-----------

When ran successfully, `no_new_privs` is replaced (using `execvp`(3))
by the desired program, and thus that program's exit status is used.

When ran unsuccessfully, `no_new_privs` returns `EXIT_FAILURE`.


SEE ALSO
--------

`prctl`(2)

https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt
