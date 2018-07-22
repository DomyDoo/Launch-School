famous_words = "seven years ago..."

add_words = "Four score and "

# This way concatenates, but does not mutate
puts add_words + famous_words

# This method mutates
puts famous_words.prepend(add_words)


famous_words = "seven years ago..."
# This way also mutates
puts add_words << famous_words

