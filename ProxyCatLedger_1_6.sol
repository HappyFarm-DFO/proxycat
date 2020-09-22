/* 
 *  ProxyCat Ledger
 *  VERSION: 1.6
 *  kitty: 0xc4891Ef19Ee282D0e19901ff7Dcfb591043B19dF
 */

pragma solidity ^0.6.0;



contract ProxycatLedger{ 
    
    uint256 public cats=0;
    address public master;

    struct Kitty{
        address kitty;
        string label;
        string family;
        string abi;
    }
    
    mapping(string => mapping(string => Kitty)) public kittiesByFamily;
    mapping(uint256 => Kitty) public kittylist;
    mapping(address => uint256) public kittyindex;
    mapping(string => string[]) public kittyfamily;
    string[] public gensList;
    
    string public version="1.1";
   
    constructor()public {master=msg.sender;}
    
    function addCall(address kitty,string memory family,string memory label,string memory abi) public returns(uint256){
        if(msg.sender!=master)revert();
        
        if(kittyfamily[family].length==0){gensList.push(family);}
        
        if(kittiesByFamily[family][label].kitty==address(0x0)){
            cats++;
            kittiesByFamily[family][label]=Kitty(kitty,label,family,abi);
            kittylist[cats]=Kitty(kitty,label,family,abi);
            kittyindex[kitty]=cats;
            kittyfamily[family].push(label);
            
        }else{
            kittylist[kittyindex[kittiesByFamily[family][label].kitty]]=Kitty(kitty,label,family,abi);
            kittiesByFamily[family][label]=Kitty(kitty,label,family,abi);
            kittyindex[kittiesByFamily[family][label].kitty]=0;
            kittyindex[kitty]=kittyindex[kittiesByFamily[family][label].kitty];
        }
        return cats;
    }
    
    
    function getKitty(uint256 index) public view returns(address,string memory,string memory,string memory){
        return (kittylist[index].kitty,kittylist[index].family,kittylist[index].label,kittylist[index].abi);
    }
    
    function getKitty(address kitty)public view returns(address,string memory,string memory,string memory){
        return (kitty,kittylist[kittyindex[kitty]].family,kittylist[kittyindex[kitty]].label,kittylist[kittyindex[kitty]].abi);
    }
    
    function getKitty(string memory family,string memory label) public view returns(address,string memory){
        return (kittiesByFamily[family][label].kitty,kittiesByFamily[family][label].abi);
    }
    
    function familyCount(string memory family)public view returns(uint256){
        return kittyfamily[family].length;
    }
    
    function familyList(string memory family,uint256 index)public view returns(string memory){
        return kittyfamily[family][index];
    }
    
    function gensCount()public view returns(uint256){
        return gensList.length;
    }
    
    function setMaster(address new_master)public returns(bool){
        if(msg.sender!=master)revert();
        master=new_master;
        return true;
    }
    
}
