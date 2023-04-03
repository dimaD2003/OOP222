// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./token2.sol";

// interface Token {
//     function transfer(address _to, uint256 amount) external ;
//     function transferFrom(address _from,address _to, uint256 amount) external;
//  }  
 
interface IERC20 {
 function balanceOf(address account) external view returns (uint256);
 
 }
contract Airdrop {
    
      
          
   //мы должны депонировать монеты в смарт-контракт AirdropToken
    function airdropWithTransfer(
        Token _token, 
        address[] memory _addressArray, 
        uint256[] memory _amountArray) public {

            for (uint8 i = 0; i<_addressArray.length; i++) 
            {
                 _token.transfer(_addressArray[i], _amountArray[i]);
            }
        
    }

    //мы должны сделать appprove() монет для адресса смарт-контракта AirdropToken
    function airdropWithTransferFrom(
        Token _token, 
        address[] memory _addressArray, 
        uint256[] memory _amountArray) public {

            for (uint8 i = 0; i<_addressArray.length; i++) 
            {
                 _token.transferFrom(msg.sender, _addressArray[i], _amountArray[i]);
            }
        
    }


}