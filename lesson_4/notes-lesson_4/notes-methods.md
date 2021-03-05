- Textbook
    - Using loops, such as loop or for, to iterate over a collection can become very repetitive. Ruby provides an easier way to work with collections through the use of built-in methods. In this assignment we'll specifically look at the methods each, select, and map.
    - We can iterate over an array or hash in a manual way by using loop, or we can iterate more idiomatically using each -- they're equivalent, for the most part. One of the main differences between them, however, is the return value. Once each is done iterating, it returns the original collection.
    - To perform selection, select evaluates the return value of the block. The block returns a value on each iteration, which then gets evaluated by select. Similar to a real method, the return value of the block is the return value of the last expression within the block. When evaluating the block's return value, select only cares about its truthiness. Everything in Ruby is considered "truthy" except for nil and false. That's not exactly the same thing as saying everything except nil and false has a value of true in Ruby, but only that it is "truthy". It's a small, but important, distinction. If the return value of the block is "truthy", then the element during that iteration will be selected. If the return value of the block is "falsey" then the element will not be selected.
    - Similar to select, map also considers the return value of the block. The main difference between these two methods is that map uses the return value of the block to perform transformation instead of selection. The key to remember here is that map always performs transformation based on the return value of the block. In this case, the return value of the block will be a boolean. This means that the collection returned by map will be an array of booleans.
    - Array and Hash both have an each method which is specific to them and defines how the items in those collections are iterated over.
    - The select and map (and other) methods are actually defined in a module called Enumerable and are made available to the Array and Hash classes.
- Notes
    - What are the 3 main built in methods used to iterate over collections in ruby?
        - #each, #select and #map
    - How is the #each method different than a loop?
        - The #each method does not require a counter or a break statement. It iterates over each element of a collection and then returns the **original** collection.
    - How does the #select method differ from #each?
        - The #select method will return a new collection containing all elements that the block returns a truthy value from. The length of the collection does not have to be the same length as the original.
    - How does the #select method evaluate what is selected within a collection?
        - The #select method evaluates its block to a boolean value, so if the expression within the block is true or truthy it will be selected to be pushed to the new collection, then it will move on to the next iteration.
    - What would we use #each, #select and #map for?
        - #each would be used for iteration,
        - #select would be used for selection, and
        - #map would be used for transformation.
    - What do each of these methods return?
        - #select returns the original collection.
        - #select returns a new collection containing all values from the original collection that evaluated true/truthy from the method block.
        - #map returns a new array containing the same amount of elements as the original collection, of the return value of the method block.
    - How do these 3 methods differ when is comes to what they do with the return value of their blocks?
        - #each iterates through a collection but does not consider the return value of its block for its own return value.
        - #select returns a new collection based on the truthiness of its block.
        - #map returns a new collection based on the return value of its block.
    - How is #each different from #select and #map?
        - The #each method is actually found in the Array or Hash class but the #select and #map methods are found in the Enumerable class.
    - What is the possible collection lengths that these methods can return?
        - #each and #map will always return a collection the same length as the original but #select returns a collection the same length as the original or less.