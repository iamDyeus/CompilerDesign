# 3/2/25

### Q1. Write a lex program to count the number of new lines, spaces, tabs, and characters from a given text.
```count.l```

### Q2. Count the numbers of Characters
```count2.l```

### Q3. Omit alternate Characters
```count3.l```


# Theory

A **compiler** translates a program written in a high-level programming language into machine code or intermediate code. The compilation process involves several phases:

### Phases of a Compiler:
1. **Lexical Analysis**: Converts a sequence of characters (source code) into tokens. This is done by the **lexical analyzer** (lexer).
2. **Syntax Analysis**: Analyzes the token sequence to ensure correct syntactic structure, producing a **parse tree**.
3. **Semantic Analysis**: Checks for semantic errors (e.g., type mismatches).
4. **Intermediate Code Generation**: Translates the high-level code into an intermediate representation.
5. **Code Optimization**: Optimizes the intermediate code to make it more efficient.
6. **Code Generation**: Converts the intermediate code into target machine code.
7. **Code Linking and Assembly**: Combines object files and generates the final executable.

---

### Structure of a Lex Program

A **lex program** is written to specify patterns for token recognition. The structure is as follows:

1. **Definition Section**:
   - Declares user functions, variables, and regular expressions.

2. **Rules Section**:
   - Contains patterns (regular expressions) and associated actions (code in C).

3. **User Code Section**:
   - Code to be executed at the end of the lexer.

**Example**:
```lex
%{
#include <stdio.h>
%}

digit [0-9]
%%
{digit}+    { printf("Integer: %s\n", yytext); }
.           { printf("Other character: %s\n", yytext); }
%%
```

---

### Compiling a Lex Program

To compile and run a lex program, follow these steps:

1. **Create the Lex File**: Write your lex program in a file, e.g., `count.l`.

2. **Generate C Code**:
   ```
   lex count.l
   ```

3. **Compile the C Code**:
   ```
   gcc lex.yy.c
   ```

4. **Run the Executable**:
   ```
   ./a.out
   ```

5. **End Input**: Use **CTRL+D** to terminate the input and execute the program.

This sequence compiles the lex program, generates the necessary C code, and runs it, producing the desired output.
