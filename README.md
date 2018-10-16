# Smart contract crowdsale

This project is for smart contracts developments for crowdsale

## Contracts

Please see the [contracts/](contracts) directory.

### Dependencies

Contracts are written in [Solidity](https://solidity.readthedocs.io/en/develop/) and this project integrates with [Truffle](https://github.com/ConsenSys/truffle). It also use an Ethereum client for testing and development [testrpc](https://github.com/ethereumjs/testrpc).

```sh
# Install local node dependencies:
$ npm install
```

```sh
# Install testrpc tolaunch daemon node running on port 8545
$ npm install -g ganache-cli
```

```sh
# Launch daemon node
$ ganache-cli
```

### Test

```sh
# Test the contract
$ ./scripts/test.sh
```
