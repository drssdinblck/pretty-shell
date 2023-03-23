#!/bin/bash
source ./fancy-printing.sh

print_in_color r "This should be red"
print_in_color g "This should be green"
print_in_color b "This should be blue"
print_in_color p "This should be light purple"

print_n_times 3 'You should see this sentence three times. '

print_banner 'A colorful banner'

print_indented 'This text should be preceded by some chars.'

print_success 'This text should be preceded by some chars and be green.'

print_failure 'This text should be preceded by some chars and red.'
