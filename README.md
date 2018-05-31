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
	+ 'ruby rpn.rb'
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
## Sample Output
+ 