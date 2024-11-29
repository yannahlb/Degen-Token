# ETH + AVAX Project: Degen Token (ERC-20)

This Solidity program implements a token system for a game platform, which includes functionalities such as minting, transferring, redeeming in-game items, checking token balances, and burning tokens. The DegenToken contract enables players to earn, spend, and manage tokens within the game environment.


## Description

The DegenToken contract allows for minting, burning, transferring, and redeeming tokens. The token system is based on the ERC-20 standard, allowing players to perform various actions with their tokens:
- Mint: Only the owner can mint new tokens and distribute them to players as rewards.
- Transfer: Players can send tokens to other players within the game.
- Redeem: Players can burn tokens to redeem in-game items like health potions, skins, etc.
- Balance Check: Players can check their token balances at any time.
- Burn: Players can burn tokens they no longer need.

## Getting Started

Follow these steps to run the program using Remix, an online Solidity IDE:

1. Create a file named DegenToken.sol in Remix and paste the contract code into it.

2. Ensure to select the appropriate Solidity version (0.8.18) and compile the code.

3. Deploy the contract using Avalanche making sure your Metamask is connected.
   
4. After deploying, interact with the DegenToken contract by using the **mint function** to allow the admin to mint new tokens for players. Players can transfer tokens to others using the **transfer function**, redeem tokens for in-game items via the **redeem function**, and check their token balance at any time with the **check balance** function. Lastly, players have the option to burn tokens they no longer need through the **burn function**.

## Authors

Reannah Lobaton

@yannahlb
