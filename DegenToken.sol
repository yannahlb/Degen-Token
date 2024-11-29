
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    
    // Mapping to store the price of each item in tokens
    mapping(string => uint256) public itemPrices;
    
    // Event to notify when a player redeems an item
    event ItemRedeemed(address indexed player, string itemName, uint256 itemPrice);

    // Constructor to initialize the token name and symbol
    constructor() ERC20("Degen", "DGN") {
        // Set some initial items and their prices in tokens
        itemPrices["Health Potion"] = 100;
        itemPrices["Rare Skin"] = 500;
        itemPrices["VIP Access"] = 1000;
    }

    // Minting function: Only the owner can mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transfer function: Allows players to transfer tokens to others (inherited from ERC20)
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    // Redeem function: Players can redeem tokens for items
    function redeem(string memory itemName) public {
        uint256 itemPrice = itemPrices[itemName];
        
        require(itemPrice > 0, "Item not available for redemption.");
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient tokens to redeem item.");
        
        // Burn tokens to redeem the item
        _burn(msg.sender, itemPrice);
        
        // Emit event to notify the game backend
        emit ItemRedeemed(msg.sender, itemName, itemPrice);
    }

    // Balance Check: Returns the token balance of the given address
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Burn function: Any player can burn tokens that they own
    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Owner can add new items and set their prices
    function addItem(string memory itemName, uint256 price) public onlyOwner {
        itemPrices[itemName] = price;
    }

    // Owner can update the price of an existing item
    function updateItemPrice(string memory itemName, uint256 newPrice) public onlyOwner {
        require(itemPrices[itemName] > 0, "Item does not exist.");
        itemPrices[itemName] = newPrice;
    }

    // Owner can remove an item from the store
    function removeItem(string memory itemName) public onlyOwner {
        delete itemPrices[itemName];
    }
}
