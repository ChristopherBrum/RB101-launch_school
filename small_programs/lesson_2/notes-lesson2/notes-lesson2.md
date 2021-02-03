TRUTHINESS
  Textbook
    - Truthiness differs from true in that Ruby considers more than the true object to be "truthy". In fact, Ruby is a very liberal language and considers everything to be truthy other than false and nil.
    - This means that we can use any expression in a conditional, or with logical operators, and as long as it doesn't evaluate to false or nil, it is considered true. Note that an expression that Ruby considers true is not the same as the true object. This is what "truthiness" means.
    - Remember this rule: everything in Ruby is considered "truthy" except for false and nil.

  Notes
    - What do we mean when we say truthiness?
        - In ruby everything is an object and ruby treats all valid objects as truthy, meaning they are truly object but do not hold the boolean value of true.
        - When testing an object in a conditional statement the object will evaluate to true unless it is either explicitly assigned the value false or has a value of nil.
    - What is a boolean data types only purpose?
        - To evaluate to true or false.
    - Why can you call a #method on a boolean value?
        - Because booleans are represented by the true object and the false object. Meaning they have classes behind them.
    - What is the order of precedence and why is it important?
        - Order of precedence is the order in which conditional expressions are executed based on their operators.
        - first to last
        - comparison operators <, ≤, ≥, >
        - equality operators ==, !=
        - logical and &&
        - logical or ||
    - Can you chain multiple logical and (&&) and or(||) operators together and how many and in what order?
        - You can chain as many as you want together.
        - They will be executed left to right.
    - What does the term 'short circuiting' refer to with logical operators?
        - When using logical and && or || operators they are evaluated left to right. If the expression on the left of an or || operater evaluates to true it will 'short circuit' and immediately return true without evaluating the condition on the right of the operator because it has already met the criteria for returning true.
        - Similarly when the condition to the left of a logical && operator evaluates to false it doesn't check the right expression and returns false because it has already met the criteria to evaluate to false.
    - Everything in ruby is considered truthy except for what?
        - nil and false


PSEUDO_CODE
  Textbook
    - When you write Ruby, you are writing for the Ruby interpreter to process. If you make a syntax error, the Ruby interpreter will complain, saying it doesn't know how to process the broken syntax. If there are no errors, the interpreter will be able to parse the code, and perform the instructions in the code. Because programming code must be error-free, you must follow a very precise format when programming. A missing period or an additional comma will cause the entire program to break down.
    - Pseudo-code, on the other hand, is meant for humans to read. It's not meant for machines or programs to process, and therefore there's no rigid format to follow. Human brains are far more flexible and powerful than programming language interpreters or compilers.
    - There are two layers to solving any problem:
        1. The logical problem domain layer.
        2. The syntactical programming language layer.
  
  Notes
    - What's the difference between programming code and psuedo-code?
        - Pseudo-code is the english language version of running through the steps/process that the programming code will eventually exist.
        - Programming code is when you translate the pseudo-code into a programming language that the editor can parse and interpret.
    - What is the point of psuedo-code?
        - Pseudo-code allows you to think through the steps needed to solve a problem in english before translating into a programming language.
        - It separates the mental task of thinking through the logic of the problem and the actual implementation of that logic within a programming language.
    - What are the two layers of solving a problem?
        1. The logical problem domain layer
        2. The syntactical programming language layer
    - What keywords do we use in psuedo-code that will help us translate it into programming code?
        - START - signifies the beginning of our program.
        - SET - signifies when we're assigning a variable with a value.
        - WHILE - signifies loop logic.
        - IF/ELSE IF/ELSE - signifies a conditional statement.
        - GET - signifies obtaining a value from the user.
        - PRINT - signifies we want to print something out to the screen.
        - READ - signifies we're retrieving a value from a variable.
        - END - signifies the end of the program.
    - Once we've written our psuedo-code what's the next step?
        - Start with clarifying your inputs and outputs.
        - Write out your informal pseudo-code: this is in plain english and describes the logical steps the code must take from input to output.
        - Then formalize the pseudo-code: utilizing the keywords described above structure your pseudo-code like a program. State what variable names are and what they will be assigned to.
        - Once the formal pseudo-code is completed you can then focus on translating the pseudo-code into programming code to test its functionality.
    - After the programming code has been written and is functioning what do we do?
        - Now is time to refactor your code to see if there's better ways to achieve the same functionality.
        - Check your edge cases.
        - Make sure your code adheres to best practices and style guides.


FLOWCHART
  Textbook
    - Using a flowchart helps us map out the logical sequence of a possible solution in a visual way.
    - Note that the arrows show the "flow" of the logic, and that we're taking great pains to specifically draw out the iteration logic. This helps us map out the step-by-step logic our program would need to solve this problem. This is called the imperative or procedural way to solve a problem. In many higher level programming languages, basic concepts (like for example, iterating over a collection) are encapsulated into a method. In Ruby, for example, we have a handy each method that allows us to iterate over an Array collection. Using each is the declarative way of solving a problem.
    - When working with flowcharts, we are going to be imperative in our approach, and we'll visually show how to loop manually, rather than using any declarative constructs built in to the language.
    - Doing this will force you to understand the logic much better, and also force you to "think like a computer", which will help debug logical errors in your code. Over time, as you get better at "thinking like a computer", you can reach for the higher level declarative syntax.
  Notes
    - Why are flowcharts useful in programming?
        - Flowcharts are a visual way of looking at the logic of your program and how data and input flow through that logic.
        - It's often clarifying to see the logic displayed in this way as opposed to writing it out with words only.
    - Why would a flowchart be helpful for a programming beginner?
        - Flowcharts help build up the ability to think like a computer when your brain is new to that way of thinking.
        - Having a more visual way to understand the logical flow of program helps train your brain to think.
    - What is it called when we use flowcharts as a way to visually solve a problem?
        - Using flowcharts to visually map out the logic in your program is considered a *imperative* or *procedural* approach to solving a problem.
        - When extracting the logic out of your flowchart or out of a SUBPROCESS within your program is considered a declarative way of solving a problem.
    - How does using a flowchart help us in designing programs?
        - Flowcharts help us visualize the way information flows through a program. Being able to visually see how things interact aide in translating that into programming code.
        - Visualizing the way information will flow through a program also helps us develop a better overview of the programs architecture and how to build the most efficient and bug free program.
    - Where does pseudo-code fit in with flowcharts?
        - Because flowcharts give us a visual way of seeing how a programs structure process information we will have a more clear understanding of how to put that into pseudo-code and, eventually, into programming code.


PRECEDENCE
  Textbook
    - The meaning of an expression in Ruby is determined by what is called operator precedence. It’s a set of rules that dictate how Ruby determines what operands each operator takes.
    - Another way to think of precedence is that it controls the order of evaluation. Operations involving operators with high precedence get evaluated before operations involving low precedence. When two operations involve operators of the same precedence, the operations occur left-to-right (or right-to-left in some cases). However, thinking of precedence in this way can sometimes lead to unexpected results when using the || and && short-circuit operators or the ternary operator (a ? b : c). It's safer to think of precedence as the mechanism used by Ruby to determine which operands get passed to each operator.
    - An operator that has higher precedence than another is said to bind more tightly to its operands. In the expression 3 + 5 * 7, the * operator binds more tightly to its operands, 5 and 7, than does the + operator. Thus, + binds to 3 and the return value of 5 * 7 instead of 3 and 5.
    - From time to time, you may hear or read somebody saying that precedence determines the order in which expressions get evaluated. The evaluation process is more complicated than just determining what gets evaluated first, though. In fact, precedence in Ruby is only part of the story; the other parts are either left-to-right evaluation, right-to-left evaluation, short-circuiting, and ternary expressions.
    - As it turns out, blocks have the lowest precedence of all operators. But between the two, { } has slightly higher precedence than do...end. This has an effect on which method call the block gets passed to. That's why we get the unexpected result.
    - How exactly did we get #<Enumerator: [1, 2, 3]:map>? With do...end being the “weakest” of all the operators, array.map gets bound to p, which first invokes array.map, returning an Enumerator object. The Enumerator is then passed to p, along with the block. p prints the Enumerator, but doesn't do anything with the block.

  Notes
    - What does order precedence mean?
        - Precedence refers to the priority with which operators are executed.
        - For example a * operator has a higher precedence than a + operator, meaning it takes a higher priority and with be executed before a + operator.
    - How can you ensure an expression executes in the order you desire?
        - Using parenthesis is a great way to ensure the desired pattern of operator execution.
    - What does the term **bind** refer to in relation to precedence?
        - Bind is referring to the values attached to either side of an operator.
        - When the operation is simple, like 3 + 8, there's not much confusion. There's only one possible value the operator can bind to on either side of itself, in which to evaluate.
        - But it becomes more complicated with multiple operators.
        - 8 + 7 / 5 ≥ 9 * 8 || true
        - The above situation will not be executed left to right because there are varying levels of precedence. For example the || logical or operator cannot bind to any value on the left until all of the operators are evaluated according to their precedence.
        - Basically bind is what an operator must do to a value on each side of itself before it can execute.
    - Besides deciding what gets evaluated first, what else does precedence determine?
        - Precedence also decides the direction in which an expression is evaluated.
        - For example: left-right evaluation, right-left evaluation, short circuiting, and ternary expressions.
    - When does right-to-left evaluation occur?
        - If an expression that has 2 operators in it and the operator on the right has a higher precedence than the one on the left the expression on the right will be evaluated and then the one on the left.
        - Additionally making multiple assignments at once will execute right-to-left:
        - a = b = c = 10
        - As well a multiple modifiers:
        - puts a if a == b if a == c
        - These are not good practice in ruby and should be avoided.
    - Why are ternary operators common places of confusion when it comes to precedence?
        - Ternary operators can be confusing because they are 'short-circuiting' operators. Meaning that depending on whether the condition is met or not will determine which of the code will be executed.
        - With ||, && and ?: expressions as soon as the condition is met the expression is returned.
    - How do blocks fit in order precedence?
        - do/end blocks have a different precedence than { } blocks do. The { } block has a higher precedence than the do/end block.
            - For example, the **parenthesis** in the following code should illuminate how the { } block has a higher precedence to array.map than array.map does to p.
            - And the do/end block has a lower precedence to arr.map than arr.map does to p.

            array = [1, 2, 3]

            p(array.map) do |num|
                num + 1                         
            end                                 

            #  => <Enumerator: [1, 2, 3]:map>

            p(array.map { |num| num + 1 })     

            #  => [2, 3, 4]

    - What does the #tap method do?
        - The #tap method allows you to 'tap into' a method or method chain and print the return value at that point in the method/chain.
        - It's a useful debugging tool.
    - When in doubt about the precedence rules what should you do?
        - Using parenthesis will allow you to have complete control of the order of execution.


