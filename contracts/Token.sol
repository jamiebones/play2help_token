//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;


import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Play2Help is Initializable, ERC20Upgradeable, ERC20BurnableUpgradeable, OwnableUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    receive() external payable {}

    function initialize(string memory name, string memory tokenSymbol) initializer public {
        __ERC20_init(name, tokenSymbol);
        __ERC20Burnable_init();
        __Ownable_init();
    }

    function mint(address payable to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }


    function transferOwnerShip(address payable newOwner) external onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function recoverTokenFromContract() external onlyOwner {
        uint assetBalance;
        address self = address(this);
        assetBalance = self.balance;
        //transfer
        (bool success, ) = payable(msg.sender).call{value: assetBalance}("");
        require(success, "transfer failed");
    }
}
