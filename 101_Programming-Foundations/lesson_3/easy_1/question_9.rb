flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney_array = flintstones.to_a[2]

p barney_array

# Or

barney_array_2 = flintstones.assoc("Barney")

p barney_array_2