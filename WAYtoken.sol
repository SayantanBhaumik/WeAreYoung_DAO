//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//allows us to keep track how many tokens different people hold at different blocks
//prevents flash loan
import "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract WeAreYoungGovernanceToken is ERC20Votes{

    //total supply of 10,000 ; decimals : 18
    //token supply in WEI
    uint256 public totalSupply = 10000 * 10 ** 18;

    constructor() 
        ERC20("WE ARE YOUNG Governance Token","WAY")
        ERC20Permit("WeAreYoungGovernanceToken")
        public {
            _mint(msg.sender,totalSupply);
        }

        // Move voting power when tokens are transferred
        //we are overriding the inherited function
        function _afterTokenTransfer(
            address _from,
            address _to,
            uint256 _amount
        ) internal override(ERC20Votes) {

            super._afterTokenTransfer(_from,_to,_amount);
        }


}
