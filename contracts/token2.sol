// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Token {
mapping (address => uint256) public balance;
mapping (address => mapping (address =>uint256)) public allowance;//  1 адр разреш испоольз др адр его токены
 string  public name;
 string public symb;
 uint256 public totalSyply;

 constructor(string memory _name, string memory _symb){
     name=_name;
     symb=_symb;
    _mint(msg.sender,101);
 }

 function transfer (address _to, uint256 amount) public {
     require( balance[msg.sender] >=amount, " you should have more token");
        balance[msg.sender]-=amount;
        balance[_to]+=amount;
 }



function transferFrom (address _from,address _to, uint256 amount) public {
     require( balance[_from] >=amount, " you should have more token");
     require(allowance[_from][_to]>=amount,  "you should have more token");//надо чтоб  фром разрешил использ его адрес
    balance[_from]-=amount;
    balance[_to]+=amount;
    allowance[_from][_to]-=amount;
}

function approve(address _to, uint256 amount) public {
             allowance[msg.sender][_to]=amount;                    

}
 function _mint(address _to, uint256 amount)internal { 
        balance[_to]+=amount;
 }
}