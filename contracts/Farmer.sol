// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

contract Farmer is Ownable {
    address public token;
    address public altToken;

    mapping(address => bool) whitelisted;
    address public profitTaker;

    constructor(address _token, address _altToken) {
        token = _token;
        altToken = _altToken;
        profitTaker = msg.sender;
        whitelisted[msg.sender] = true;
    }

    receive() external payable {}


    function withdraw() external onlyOwner {}

    function withdrawToken(address _token) external onlyOwner {}

    function setWhitelisted(address _address, bool isWhitelisted) public onlyOwner {
        whitelisted[_address] = isWhitelisted;
    }

    function setToken(address _token) public onlyOwner {
        token = _token;
    }

    function setAltToken(address _altToken) public onlyOwner {
        altToken = _altToken;
    }
}
