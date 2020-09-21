/* 
 *  ProxyCat Ledger
 *  VERSION: 1.10
 *  kitty: 0xc4891Ef19Ee282D0e19901ff7Dcfb591043B19dF
 */

pragma solidity ^0.6.0;



contract ProxycatLedger{ 
    
    uint256 public cats=0;
    address public master;

    struct Kitty{
        address kitty;
        string label;
    }
    
    mapping(string => Kitty) public kitties;
    mapping(uint256 => Kitty) public list;
    mapping(address => uint256) public index;
    
    string public version="1.0";
   
    constructor(address set_master)public {master=set_master;}
    
    function addCall(address kitty,string memory label) public returns(uint256){
        kitties[label]=Kitty(kitty,label);
        list[cats]=Kitty(kitty,label);
        index[kitty]=cats;
        cats++;
        return cats;
    }
    
    function getKitty(string memory label) public view returns(address){
        return kitties[label].kitty;
    }
    
    function setMaster(address new_master)public returns(bool){
        if(msg.sender!=master)revert();
        master=new_master;
        return true;
    }
    
    function addressToLabel(address kitty)public view returns(string memory){
        return list[index[kitty]].label;
    }
    
    function labelToAddress(string memory label)public view returns(address){
        return kitties[label].kitty;
    }
    

}
