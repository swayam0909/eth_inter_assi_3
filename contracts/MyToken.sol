// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken is ERC20, Ownable {
    constructor() ERC20("Ananya Sharma", "AS") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");
        return super.transfer(to, amount);
    }

    // New function to get the token balance of an address
    function getMyTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }
}
