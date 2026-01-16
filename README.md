# 💰 FundMe Smart Contract

FundMe is a simple crowdfunding-style **smart** contract
where users can send ETH to the contract, and only the owner (deployer) is allowed to withdraw all the collected funds.


## Project Overview 📝 

This FundMe contract is a simple decentralized crowdfunding tool where users donate ETH above a minimum USD value,tracked on-chain. 
It mainly teaches Solidity concepts like 
modifiers, libraries, price oracles, receive/fallback, and gas‑optimized withdrawals for more advanced crowdfunding designs. 


## ⭐️ Features

- Accepts ETH deposits from any address.
- Tracks funders and their contributed amounts.
- Enforces a minimum USD threshold using a price feed.
- Restricts withdrawals of the entire balance to the owner only.


## Core functionality

This smart contract has a simple fund() function that lets anyone send ETH (the native cryptocurrency) to it.


## Owner withdrawal logic 🧠

    Only the contract owner (the deployer or a specified address) can call withdraw() 
    to pull out the total ETH balance from the contract to their own wallet.


 ## Chainlink integration 🔗💰
A PriceConverter-style library uses the Chainlink AggregatorV3Interface 
to read the latest ETH/USD price from a Data Feed contract on the selected network (e.g., Sepolia)



## Refrences 🔗🔗

- Completed as part of the **Cyfrin Solidity Smart Contract** course (FundMe project module).
    https://updraft.cyfrin.io/courses/solidity
- Chainlink price feed integration followed from:
    https://docs.chain.link/data-feeds/price-feeds/addresses



