### MobChain
This is a project done during the BIOTS2018 Hackathon. The aim of mobchain is to offer a decentralized car sharing place.

The following is included in the folders:

* doc:            documentation
* example_webui:  An example web interface recieved during the course
* homepage:       The web interface of our mobchain project
* src:            Source code of the mobchain project
* video:          Screen cast of homepage usage

Go to https://n.ethz.ch/~jsieber/ to interact with the currently deployed contracts on the Ropsten test network. Make sure you have installed the MetaMask browser plugin and have selected the Ropsten test network.

## User Interface
Create new user: Add your name and car type, click "Add User", and confirm transaction. You will be rewarded 250 MOB Tokens.
Request Car: Select start and end location and the car type. Currently only two lenders, one with a EV and one with one with a normal car.

## Deploying the contracts using remix
Requirements: FireF with MetaMask plugin
1. Clone repository
2. In MetaMask, select the Ropsten test network and ensure you have some funds in your wallet
3. Open http://remix.ethereum.org/ and add the contracts in src/contracts
4. Select the "run" tab and chose the environment "injected web3"
5. Click "create" and confirm transaction when MetaMask popup comes up
6. Click on the "mobcoin" button to read out the mobcoin address to show your MOB balance in MetaMask.
