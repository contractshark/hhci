pragma solidity ^0.5.0;

contract C {

  constructor() public {
    fail();
  }

  function fail() public {
    revert("public");
  }
}