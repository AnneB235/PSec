#!/bin/bash

# Script to show warning messages about USB security

messages=(
    "You just plugged in a random USB stick? Really?"
    "Seriously: What did you think was on it? Free bitcoins?"
    "You are part of a penetration test. You passed. As a victim."
)

for msg in "${messages[@]}"; do
    zenity --warning --text="$msg" --title="USB Security Awareness"
done