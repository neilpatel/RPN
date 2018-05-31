# My Custom RPN+ Calculator

This project is an interactive Reverse Polish Notation (RPN+) calculator written in Ruby 2.5.0.
___
## Necessary Files
+ Source Files
	+ args_checker
	+ error_handler
	+ file_mode
	+ keyword_ops
	+ l_n
	+ let_ops
	+ line_executor
	+ print_ops
	+ repl_mode
	+ rpn
		+ Main Source File
	+ token_parser
	+ variables
+ Unit Test Files
	+ args_checker_test
	+ token_parser_test
	+ variables_test

___
## Usage
+ Clone the repository
	+ `git clone https://github.com/neilpatel/RPN.git`
+ To Execute RPN:
	+ `ruby rpn.rb`
___
## Project Functionality
+ Develop an interpreter for a simple language, RPN++. This allows user to calculate using Reverse Polish Notation. 
	+ Also supports simple output exeuctions via the PRINT keyword, variables, and the option to quit. 
+ When running the program wiht one or more arguments, each argument must be considered a path to a file. The program must execute each program stored in that particular filename. 

___
## Project Requirements
+ The program must be named rpn.rb and should be executable from the command line using the command `ruby rpn.rb`.
+ Tokens must be numbers, variable names, operators, or one of the keywords QUIT, LET, or PRINT.
+ A number shall consist of one or more digits. All numbers must be arbitrary precision. 
	+ This means no integer overflow should occur or be considered as valid. 
+ Variable names can be a single letter(A-Z) and must be case-insensitive
+ Operators can be +, -, /, or *, for add, subtract, divide, and multiple, respectively.
+ The keyword QUIT causes the program to terminate. 
+ Any lines or tokens after the QUIT keyword at ignored.
+ The keyword LET is followed by a single-letter variable, then an RPN expression. The RPN expression is evaluated and the value of the variable is set to it. 
+ The keyword PRINT is followed by an expression, and the interpreter shall print the result of that expression to standard output (stdout).
+ Keywords shall be case-insensitive (e.g. `print`, `PRINT`, or `pRiNt` are interchangeable)
+ Keywords shall only start a line (e.g., you cannot have a line such as "1 2 + PRINT 3")
+ Variables shall be considered initialized once they have been LET.  It shall be impossible to declare a variable without initializing it to some value.
+ Referring to a variable which has not previously been LET (i.e. has not been declared) shall result in the program informing the user that the variable is uninitialized and QUIT the program with error code 1.  It should inform the user in the following format: "Line n: Variable x is not initialized." where `x` is the name of the variable and `n` is the line number of the file the error occurred in.
+ The exception to the previous requirement is that if this occurs in REPL mode, the user shall be informed, but the line will simply be ignored.
+ If the stack for a given line is empty OR does not contain the correct number of elements on the stack for that operator, and an operator is applied, the program shall inform the user and QUIT the program with error code 2.  It should inform the user in the following format: "Line n: Operator o applied to empty stack" where `o` is the operator used and `n` is the line number the error occurred in.
+ The exception to the previous requirement is that if this occurs in REPL mode, the user shall be informed, but the line will simply be ignored.
+ If the stack for a given line contains more than one element and the line has been evaluated, the program shall inform the user and QUIT the program with error code 3.  It should inform the user in the following format: "Line n: y elements in stack after evaluation" where `y` is the number of elements in the stack and `n` is the line number the error occurred in.
+ The exception to the previous requirement is that if this occurs in REPL mode, the user shall be informed, but the line will simply be ignored.
+ If an expression used for initializing a LET variable is invalid, the variable is considered to have not been initialized.  For example, "LET A 1 2" is invalid, and A is not initialized.
+ If an invalid keyword is used, the program shall inform the user and QUIT the program with error code 4.  It should inform the user in the following format: "Line n: Unknown keyword k" where `k` is the keyword and `n` is the line number the error occurred in.
+ The exception to the previous requirement is that if this occurs in REPL mode, the user shall be informed, but the line will simply be ignored.
+ All other errors shall result in the program informing the user of the error and exiting with error code 5.  At no point shall the end user of the system see a "raw" exception or stack trace.
+ In REPL mode, the result of each line shall be displayed immediately afterwards before another prompt comes up.
+ In REPL mode, PRINT shall not perform any additional work, as the result of the RPN expression evaluation will already be displayed.
+ In REPL mode, when displaying error messages, the current line shall be considered as the nth command entered. For example, the first line entered shall be considered Line 1, the second line entered Line 2, etc.
+ In REPL mode, the only way to exit will be if the user types QUIT (or Control-C).  No syntax error should cause the program to exit when in REPL mode.
+ This program shall minimize real execution time, even at the expense of memory or CPU usage.
+ The "> " string shall be used as the prompt for REPL mode.  Note that there is a space after the > character.
+ In case of ambiguity in requirements, the sample output shall be considered the ground truth.
+ When reading multiple files, all of the files shall be concatenated into one large file before processing.  For example, when executing file1.rpn and file2.rpn, and file1.rpn initializes a variable A, file2.rpn can use variable A without initializing it.  Similarly, if a QUIT is encountered at the end of file1.rpn, the entire program will quit and no lines in file2.rpn shall be executed.
+ Blank lines in files shall be ignored.
+ Lines in files are considered to be 1-indexed, that is, the first line in a file is line number 1, not 0.
+ Variable values shall not be persisted across executions.  In other words, if I initialize a variable `a`, then quit the program and start it again, variable `a` is no longer initialized.

___
## Additional Information/Hints
1. If multiple files are input, the line number output if there is an error should be the line of the concatenated file.  For example, if file1.rpn has 5 lines which are all correct, and file2.rpn has 4 lines and the first line is invalid, and the user runs `ruby rpn.rb file1.rpn file2.rpn`, the error should display that it has occurred on line 6.
2. Blank lines should be ignored from a statement perspective (i.e., a blank line is not a syntax error) BUT blank lines should count in terms of line count.  For example, imagine a file which has one valid statement, then two blank lines, then an invalid statement.  The invalid statement has occurred on line 4, _not_ line 2.
3. In cases where multiple errors on a line would be appropriate, you should print out only one error.  It is up to you to decide which one.
4. Note that the exit code ("error code") is NOT printed out.  You may exit with different exit codes by the method exit _x_ where _x_ is the exit code, e.g., `exit 3` to exit with exit code 3.  You may check that this operated properly at the command line by typing `echo $?` in Unix-like systems (Linux, OS X) or `echo %errorlevel%` if you are using the Windows command line.
5. In files, it is legal to have a line which does not result in any output or state being changed.  For example, `6 5 +` is a valid statement.  In such a case, there should be no output and the value is "thrown away".  A REPL always shows the result of the stack if there is no PRINT statement so this should not be an issue for REPLs.
6. It is legal to set one variable equal to another (e.g. `LET A B` will take the value of B and copy it to A).
7. Attempting to enter a decimal at the REPL or in the file should be an error, e.g. `1.5 2.5 +` is invalid.  Only integers should be entered.
8. There is no such thing as order-of-operations or precedence in RPN.  For example, in infix notation, `5 + 2 * 3` could be rewritten as `5 + (2 * 3)`, but not `(5 + 2) * 3`, since multiplication has higher precedence.  However, `5 * 2 + 3` could be rewritten as `(5 * 2) + 3` but not `5 * (2 + 3)`.  `5 2 3 * +` would equal 11.  To change "precedence", you simply change the location of the operators, e.g. `5 2 3 + *`.
9. One way to test your RPN calculations is to use an RPN calculator.  In Emacs this can be reached via `M-x calc`, on OS X or Linux you can get one by typing `dc` at the terminal, in Windows you can install RPN Scientific X ( https://www.microsoft.com/en-us/store/p/rpn-scientific-x/9nblggh64lf4 ) or another program.
10. Note that there is no specific section on the grading rubric for rubocop.  You can get points off for not fixing your rubocop errors but you do not get points "just" for following the rubocop instructions.
11. REPL should NEVER exit except by someone typing the keyword QUIT as explained in the requirements.
12. You are allowed to read in all of the file(s) into an in-memory array.  You do not have to worry about swapping data out due to it being too large to store in memory.
13. There is no limit on the number of possible files being read in, although for testing purposes you may assume that no more than 20 will be read in.
14. You may count all rubocop errors/warnings of the same type as a single error.  For example, if you have a five errors but they are all warning about cyclomatic complexity, you can count that as a single error (and thus only one of your four "get of jail free" cards).
___
## Sample Output
+ 