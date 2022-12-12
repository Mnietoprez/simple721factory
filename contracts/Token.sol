// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract  Collection  is ERC721{

    address public Owner;

    constructor(string memory name_, string memory symbol_, address owner_) ERC721(name_ , symbol_) {
        Owner = owner_;
    }

    modifier onlyOwner(){
        require(msg.sender==Owner, "You don't have permissions to call this function");
        _;
    }

    function mint(address to_, uint256 tokenId_) public onlyOwner() {
        _mint(to_, tokenId_);

    }

}