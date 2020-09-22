   /* 
 *  Generic ProxyCat Kitty Module Example
 *  VERSION: 1.0
 *  
 */

pragma solidity ^0.6.0;

contract HappyGraph {
    function list_friends(address guy) public view returns(string memory){}
}

contract Kitty{
   
    function feed(address guy) public view returns(string memory) {
       HappyGraph hg=HappyGraph(0xd2523438645a559E97B961Ea40891c22e1Fda0EC);
       return hg.list_friends(guy);
   }
   
}
