# Test Case Language Compiler

This compiler generates a XML file that can be imported on [Testlink](http://testlink.org/), an Open Source Test Management Tool.

Although very useful for test management, Testlink has a lot of things to improve in the usability of the test case creation interface and test step reuse. Using any text editor and this simple language, on the other hand, you can dramatically improve your productivity.

The Test Case Language was created with this things in mind:

1. **Avoid verbosity**: Test cases are really simple structures, so why fill the language with boilerplate syntax? We have curly braces and an "arrow" (i.e. => ) as the main language elements.
1. **Based on Testlink, not restricted to**: The language was created to be used with Testlink but is not restricted to it. The language may be compiled/exported to other programs/formats in the future.
1. **Let the text editor help you**: The syntax/usage tips should be created to use the full power of the modern text editors, facilitating operations like find and replace (with or without regular expressions), column editing, syntax highlighting and syntax folding.

## Getting started

### Installation

To be written. Use NPM!

### Usage

Below is a sample TestCase ('\*.tst') file that illustrates the language syntax. You can see this file and even more examples (an their resulting XMLs) on the folder: [docs/samples](docs/samples)

```
Here you put the name of the test suite {

  And here the name of the test case {
    Here you put a step => Then, the expected result
    In the following line, you put the next step => And it's expected result
  }

  //A line that starts with 'PRE:' is not a step, it's a precondition for the test case
  test 2 {
    PRE: A test can have one or more preconditions.
    PRE: That's another precondition.

    Step => Result
  }

  //An element that starts with the token "DEF:" is not part of the test suite.
  //It's the definition of an reusable element
  DEF: login_steps {
    PRE: This precondition will be added on the tests that include this reusable element

    This step will be added on the tests during inclusion => The expect step result
  }

  DEF: logout_steps {
    Step => Result
  }

  //Reusable elements can be included in tests
  test 3 {
    INCLUDE: login_steps    
  }

  //More than one element can be included in the test case, in any order.
  //They can also be mixed with test specific steps and preconditions
  test 4 {
    PRE: Test 4 precondition

    INCLUDE: login_steps
    Another step only for test 4 => Expected result
    INCLUDE: logout_steps
  }

}
```
