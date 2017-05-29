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
