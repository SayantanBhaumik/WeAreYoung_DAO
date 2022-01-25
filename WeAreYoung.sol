//Base contract
//to be governed by governance token

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// we want governance token to own this base contract
import "@openzeppelin/contracts/access/Ownable.sol";

//smart contract which will be governed by weareyoung governance token
contract WeAreYoung is Ownable {
      
    address public owner= this ;

    uint256 private permissableMembers;

    event MemberNumberIncreased(uint256 _revisedPermissableMembers);

    
    modifier onlyOwner{
        require(msg.sender==owner , "not valid access");
        _;
    }
    
    //setter function
    function setNewMembers(uint256 _revisedPermissableMembers)private onlyOwner  returns(bool){
        permissableMembers =_revisedPermissableMembers;
        emit MemberNumberIncreased( permissableMembers);
        return true;

    }

    //getter function 
    funtion retrieve() private view returns(uint256){
        return  permissableMembers;
    }

}
