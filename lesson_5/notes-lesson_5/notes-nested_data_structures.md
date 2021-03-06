- TextBook
    - With nested arrays each inner array can be accessed in the same way that you'd access any other array element; the trick is to remember that it's another collection you're referencing.
    - Recall that Ruby gives us a very convenient way to update array elements, the #[ ] method.

        arr = [[1, 3], [2]]
        arr[1] = "hi there"
        arr                     # => [[1, 3], "hi there"]

    - The arr[1] = "hi there" is a destructive action that permanently changed the second element in the arr array; it replaced the entire [2] inner array with the string "hi there".

        arr = [[1, 3], [2]]
        arr[0][1] = 5

        arr # => [[1, 5], [2]]

    - Sometimes you'll find yourself in need of copying an entire collection, mostly when we want to save the original collection before performing some major modifications. Ruby provides two methods that let us copy an object, including collections: dup and clone. Both of these methods create a shallow copy of an object. This means that only the object that the method is called on is copied. If the object contains other objects - like a nested array - then those objects will be shared, not copied. This has major impact to nested collections.
    - Only mutable objects can be frozen because immutable objects, like integers, are already frozen. We can check if an object is frozen with the frozen? method.
    - What does freeze actually freeze? freeze only freezes the object it's called on. If the object it's called on contains other objects, those objects won't be frozen. For example, if we have a nested array the nested objects can still be modified after calling freeze.
- Notes
    - How do you reference a nested array element?
        - To reference a nested array you need to reference its index within the parent array using the #[ ] method. That will return the nested array. To return an element within the nested array chain another #[ ] method onto the first that references the the individual element in the nested array.
    - How can you add additional elements to a nested array?
        - By referencing the nested array within the parent array as described above, then using the #<< #push or #append methods to add an element to the end of the nested array.
    - What's the difference between #<< #append and #push?
        - They are very similar in function but the #<< method allows only one element to be appended to a collection where #push and #append will allow you to add multiple elements.
        - If you attempt to append multiple strings at once with the #<< it will concatenate the strings before appending them.
    - How can we add a new key/value pair to a hash nested in an array?
        - The nested hash must be referenced by the index number of the parent array using the Array#[ ] method. Then chaining the Hash#[ ] method with the desired key as the argument, will return the associated value from the nested hash.
    - When and how do you have multiple ways to reference the same object in a nested array?
        - If you initialize a collection using variables referencing other hashes, you can reference a nested object by chaining the #[ ] method or by referencing the variable associated with a  nested object.

        a = [1, 3]
        b = [2]
        arr = [a, b]
        arr # => [[1, 3], [2]]

        a[1]  # returns ⇒ 3
        arr[0][1]  # returns ⇒ 3

    - What are two methods at our disposal for making a shallow copy of an object?
        - The Object#dup and the Object#clone methods will both create shallow clones of an object.
    - What is a shallow copy and how does it effect the copied object?
        - A shallow copy means that the object copied is a separate object from the object that which it was copied from, but the elements within the copied object are all references to the elements within the original object.
        - Therefore if you mutate the elements within the copied object, the elements in the original object will also be mutated.
    - Whats the difference between #dup and #clone?
        - If the copied object was 'frozen' (made immutable) the #clone method will retain its frozen state but the #dup method will not.
    - What does the Object#freeze method do?
        - It makes the object it's called on immutable.
        - The elements within a frozen object can still be mutated or transformed but the object itself cannot be mutated.
    - What objects can be frozen?
        - Mutable object can have the #freeze method called on them. Classes such as; Integer, Float, and Symbol are immutable and so already frozen.
    - What is deep copy and what is it in ruby?
        - Ruby has no built in way of creating a deep or an easy way to implement one.
        - A deep copy would create a new copy of the collection object, but a new copy of every object within the collection as well.