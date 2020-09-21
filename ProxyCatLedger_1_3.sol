/* 
 *  ProxyCat Ledger
 *  VERSION: 1.3
 *  kitty: 0xc4891Ef19Ee282D0e19901ff7Dcfb591043B19dF
 */

pragma solidity ^0.6.0;



contract ProxycatLedger{ 
    
    uint256 public cats=1;
    address public master;

    struct Kitty{
        address kitty;
        string label;
        string family;
    }
    
    mapping(string => Kitty) public kitties;
    mapping(uint256 => Kitty) public kittylist;
    mapping(address => uint256) public kittyindex;
    mapping(string => string[]) public kittyfamily;
    
    string public version="1.1";
   
    constructor()public {master=msg.sender;}
    
    function addCall(address kitty,string memory label,string memory family) public returns(uint256){
        if(msg.sender!=master)revert();
        if(kitties[label].kitty==address(0x0)){
            kitties[label]=Kitty(kitty,label,family);
            kittylist[cats]=Kitty(kitty,label,family);
            kittyindex[kitty]=cats;
            kittyfamily[family].push(label);
            cats++;
        }else{
            kittylist[kittyindex[kitties[label].kitty]]=Kitty(kitty,label,family);
            kitties[label]=Kitty(kitty,label,family);
            kittyindex[kitties[label].kitty]=0;
            kittyindex[kitty]=kittyindex[kitties[label].kitty];
        }
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
        return kittylist[kittyindex[kitty]].label;
    }
    
    function labelToAddress(string memory label)public view returns(address){
        return kitties[label].kitty;
    }
    
    function labelToFamily(string memory label)public view returns(string memory){
        return kitties[label].family;
    }
    
    function familyCount(string memory family)public view returns(uint256){
        return kittyfamily[family].length;
    }
    
    function familyList(string memory family,uint256 index)public view returns(string memory){
        return kittyfamily[family][index];
    }
    

}



