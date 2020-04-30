#!/usr/bin/env bats

@test "detects 8-bit strings" {
  result="$(echo hello | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 16-bit little-endian strings" {
  result="$(echo aABlAGwAbABvAAo= | base64 -d | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 16-bit big-endian strings" {
  result="$(echo AGgAZQBsAGwAbwo= | base64 -d | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 32-bit little-endian strings" {
  result="$(echo aAAAAGUAAABsAAAAbAAAAG8AAAAK= | base64 -d | ./wstrings)"
  [ "$result" == "      0 hello" ]
}

@test "detects 32-bit big-endian strings" {
  result="$(echo AAAAaAAAAGUAAABsAAAAbAAAAG8K= | base64 -d | ./wstrings)"
  [ "$result" == "      0 hello" ]
}
