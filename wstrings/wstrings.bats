#!/usr/bin/env bats

@test "detects 8-bit strings" {
  echo -ne hello | ./wstrings | grep -q hello
}

@test "detects 16-bit little-endian strings" {
  echo -ne "h\0e\0l\0l\0o\0" | ./wstrings | grep -q hello
}

@test "detects 16-bit big-endian strings" {
  echo -ne "\0h\0e\0l\0l\0o" | ./wstrings | grep -q hello
}

@test "detects 32-bit little-endian strings" {
  echo -ne "h\0\0\0e\0\0\0l\0\0\0l\0\0\0o\0\0\0" | ./wstrings | grep -q hello
}

@test "detects 32-bit big-endian strings" {
  echo -ne "\0\0\0h\0\0\0e\0\0\0l\0\0\0l\0\0\0o" | ./wstrings | grep -q hello
}

@test "can take input from file" {
  ./wstrings <(echo hello) | grep -q hello
}
