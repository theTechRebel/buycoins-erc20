# FirstnameLastname Token
# ERC20 Project

Coding challenge posted by BuyCoins Africa

## Part A

1. You're going to create an ERC 20 token. This token will be called `FirstnameLastnameToken`. For example, my token would be called `TimiAjiboyeToken`.
2. There is only one important characteristic of this token is that it's "mintable". This means that an account/address may have the permission to create tokens as they see fit. The owner of the contract (you) can make any account/address a minter.
3. The smart contract for this token should be deployed to the RinkeBy or Kovan network (depending on which is more convenient for you).
4. Make this account; `0xa62ba163e57219fa1e67ec21cC101B5E5167D111` a minter.

## Part B

1. Create a simple dApp webpage with web3.js that allows a minter to create tokens by simply clicking a button. The minter account will go to this web page & sign this transaction via a dApp browser (Metamask, Mist or Coinbase Wallet).
2. The web page should have a simple button and number input field. All the minter needs to do is enter the amount of tokens they want to mint and click the button.
3. Host this webpage wherever you want. Netlify is a good place to host something like this for free.

## Getting Started

Clone this repository locally:

```bash or cmd
git clone https://github.com/theTechRebel/buycoins-erc20.git
```

Install dependencies with npm :

```bash or cmd
npm install
```

Build the App with webpack-cli:

(for windows)
```bash or cmd
.\node_modules\.bin\webpack-cli --mode development
```
(for unix):
```bash or cmd
./node_modules/.bin/webpack-cli --mode development
```

run ganache-cli for a quickstart ethereum blockchain
```sh
$ ganache-cli --gasLimit 15000000 --allowUnlimitedContractSize --host 0.0.0.0
```

Deploy the smart contract onto your Ganache blockchain:

```bash or cmd
truffle migrate
```
Fire up an http server for development
```bash or cmd
npx http-server ./build/app/ -a 0.0.0.0 -p 8000 -c-1
```
Open the app in your browser with a Meta Mask plugin installed (preferably)

http://127.0.0.1:8000/index.html

