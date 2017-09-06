#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.59])
AC_INIT([eclipse],[1.1],snmsts@gmail.com)

AM_CONFIG_HEADER(config.h)
AC_CONFIG_FILES([c/Makefile Makefile])
AC_CONFIG_SRCDIR([c/evaluation.c])
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE([enable])

# Checks for programs.
AC_PROG_CC
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_RANLIB

# Checks for libraries.
# FIXME: Replace `main' with a function in `-leclipse':
AC_CHECK_LIB([eclipse], [main])
# FIXME: Replace `main' with a function in `-leclipsed':
AC_CHECK_LIB([eclipsed], [main])
# FIXME: Replace `main' with a function in `-lgc':
AC_CHECK_LIB([gc], [main])
# FIXME: Replace `main' with a function in `-lm':
AC_CHECK_LIB([m], [main])

# Checks for header files.
AC_CHECK_HEADERS([fcntl.h float.h limits.h locale.h malloc.h memory.h stddef.h stdlib.h string.h sys/time.h sys/timeb.h termios.h unistd.h wchar.h wctype.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_MODE_T
AC_TYPE_OFF_T
AC_TYPE_SIZE_T
AC_TYPE_UID_T

# Checks for library functions.
AC_FUNC_LSTAT_FOLLOWS_SLASHED_SYMLINK
AC_CHECK_FUNCS([floor getcwd gethostbyname gethostname gettimeofday iswprint memmove mkdir pow rmdir select setlocale sqrt strchr strerror uname])

AC_OUTPUT
