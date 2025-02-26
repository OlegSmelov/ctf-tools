# CTF Tools

A collection of tools for capturing flags. 🚩

| Name | Description |
| - | - |
| [wstrings](wstrings) | A wrapper for `strings` that finds wide strings (both little and big-endian, 16 and 32 bit) in addition to regular strings. |

## Installation

```sh
git clone https://github.com/OlegSmelov/ctf-tools.git

export PATH="$PWD/ctf-tools/bin:$PATH"
# then add an equivalent PATH override to your shell profile
```

**macOS note:** Tools are written with Linux in mind, and thus require GNU utils to run. Install `coreutils` and `binutils` with Homebrew, and make them the default for your current shell. BSD tools often lack features.
