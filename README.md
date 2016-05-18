# `no_new_privs` -- set `NO_NEW_PRIVS`

A trivial program to set [`NO_NEW_PRIVS`] before `execvp(3)`-ing
  another program.

This is released under the [ISC license](LICENSE.md).

[`NO_NEW_PRIVS`]: https://www.kernel.org/doc/Documentation/prctl/no_new_privs.txt

## Dependencies

- Linux 3.5 or greater  
  This is when `PR_SET_NO_NEW_PRIVS` was introduced.
- A C99-compliant compiler
- [`ronn`] for compiling the manpage

[`ronn`]: https://rtomayko.github.io/ronn/
