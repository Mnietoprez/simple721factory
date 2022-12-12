// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Token.sol";

contract Factory {

  mapping (uint => address) idToCollectionAddress;
  address public Owner;

    constructor(){
        Owner = msg.sender;
    }

  modifier onlyOwner(){
    require(msg.sender==Owner, "You don't have permissions to call this function");
    _;
  }

  modifier notRepeatedIndex(uint256 id_) {
    require(idToCollectionAddress[id_] == address(0x0), "You have already minted a collection with this index" );
    _;
  }

  function createCollection(uint256 id_, string memory name_, string memory symbol_) public onlyOwner() notRepeatedIndex( id_) {
    // Crea una instancia del contrato ERC721 que gestionará la colección de NFTs
    Collection coleccion = new Collection(name_, symbol_, msg.sender);
    // Devuelve la instancia del contrato ERC721 para que los usuarios puedan interactuar con él
    idToCollectionAddress[id_] = address(coleccion);
  }

    function returnCollectionAddress(uint id_) public view returns(address){
        return idToCollectionAddress[id_];
    }
}
