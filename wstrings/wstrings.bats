#!/usr/bin/env bats

@test "detects 8-bit strings" {
  result="$(echo -ne hello | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 16-bit little-endian strings" {
  result="$(echo -ne "h\0e\0l\0l\0o\0" | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 16-bit big-endian strings" {
  result="$(echo -ne "\0h\0e\0l\0l\0o" | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 32-bit little-endian strings" {
  result="$(echo -ne "h\0\0\0e\0\0\0l\0\0\0l\0\0\0o\0\0\0" | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 32-bit big-endian strings" {
  result="$(echo -ne "\0\0\0h\0\0\0e\0\0\0l\0\0\0l\0\0\0o" | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "can take input from file" {
  result="$(./wstrings <(echo hello))"
  [ "$result" == "      0 hello" ]
}
