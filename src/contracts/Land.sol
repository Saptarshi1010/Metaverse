// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Land is ERC721 {
    uint public cost = 1 ether;
    uint public maxSupply = 5;
    uint public totalSupply = 0; //initial value is 0

    struct Building {
        string name;
        address owner;
        int8 posl;
        int8 posb;
        int8 posh;
        uint sizel;
        uint sizeb;
        uint sizeh;
    }

    Building[] public allBuildings;

    constructor(
        string memory _name,
        string memory _symbol,
        uint _cost
    ) ERC721(_name, _symbol) {
        cost = _cost;
        allBuildings.push(
            Building("Residential Complex", address(0), 0, 0, 0, 0, 0, 0)
        );
        allBuildings.push(
            Building("Continental", address(0), 0, 0, 0, 0, 0, 0)
        );
        allBuildings.push(Building("University", address(0), 0, 0, 0, 0, 0, 0));
        allBuildings.push(
            Building("Shopping Mall", address(0), 0, 0, 0, 0, 0, 0)
        );
        allBuildings.push(
            Building("Garden Plaza", address(0), 0, 0, 0, 0, 0, 0)
        );
        allBuildings.push(
            Building("Industry Builing", address(0), 0, 0, 0, 0, 0, 0)
        );
    }

    function mint(uint _id) public payable {
        uint supply = totalSupply;
        require(maxSupply >= supply, "not enough supply");
        totalSupply = totalSupply + 1;

        //making sure the plot of land is not already bought
        require(allBuildings[_id - 1].owner == address(0));

        require(msg.value >= 1 ether, "not enough ether");

        //one address will now call this functionm
        allBuildings[_id - 1].owner == msg.sender;

        // it handles buying of  all the islands
        _safeMint(msg.sender, _id);
    }

    function transferFrom(
        address from,
        address to,
        uint tokenId
    ) public override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721 token transfer caller is not the owner not approved"
        );
        //now we update the building ownership
        allBuildings[tokenId - 1].owner = to;
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint tokenId,
        bytes memory _data
    ) public override {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721 token transfer caller is not the owner not approved"
        );
        //now we update the building ownership
        allBuildings[tokenId - 1].owner = to;
        _safeTransfer(from, to, tokenId, _data);
    }

    // returns all the builings
    function getBuildings() public view returns (Building[] memory) {
        return allBuildings;
    }

    //returns a specific building
    function getparticularBuilding(
        uint _id
    ) public view returns (Building memory) {
        return allBuildings[_id - 1];
    }
}
