/* 
 *  ProxyCat
 *  VERSION: 1.8
 *  
 */

pragma solidity ^0.6.0;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract ENS {
    
      function owner(bytes32 node) public view returns (address) {}
    
}

contract IMVDProxy {
    function getMVDFunctionalitiesManagerAddress() external view returns(address){}
    function getDelegates() external view returns(address[] memory){}
    function getToken() external view returns(address){}
    function getMVDFunctionalityProposalManagerAddress() external view returns(address){}
    function getStateHolderAddress() external view returns(address){}
    function getMVDFunctionalityModelsManagerAddress() external view returns(address){}
    function getMVDWalletAddress() external view returns(address){}
    function getDoubleProxyAddress() external view returns(address){}
    
}


contract IMVDFunctionalitiesManager {
    function getFunctionalityData(string calldata codeName) external view returns(address, uint256, string memory, address, uint256){}
    function getFunctionalitiesAmount() external view returns(uint256){}
    function functionalitiesToJSON() external view returns(string memory){}
    function functionalitiesToJSON(uint256 start, uint256 l) external view returns(string memory functionsJSONArray){}
    function functionalityNames() external view returns(string memory){}
    function functionalityNames(uint256 start, uint256 l) external view returns(string memory functionsJSONArray){}
    function functionalityToJSON(string calldata codeName) external view returns(string memory){}
}


contract proxycat{ 

    string public version="1.8";
    address dc;
    function cat(address cat_call,string memory cat_query,address address_value) public returns(string memory){
        dc=cat_call;
        string memory query=append(cat_query,"(address)","");
        //bytes4(keccak256("setA(uint256)",address_value));
        //dc.call(bytes4(keccak256("fun(uint256)")), 1);
        //dc.call(0x00,0x00);
        return "";
    }
    
    function token(address token_address) public view returns(string memory) {
        ERC20 myToken;
        myToken = ERC20(token_address);
        string memory temp;
        string memory temp2;
        temp2 = append("{","\"address\":\"",toString(token_address));
        temp = append(temp2,"\"name\":\"",myToken.name());
        temp2=append(temp,"\",\"symbol\":\"",myToken.symbol());
        temp=append(temp2,"\",\"totalSupply\":",bytes32ToString(uintToBytes(myToken.totalSupply())));
        temp2=append(temp,",\"decimals\":",bytes32ToString(uintToBytes(myToken.decimals())));
        temp=append(temp2,"}","");
        return temp;
    }
    
    
    function balanceOf(address token,address wallet) public view returns(string memory){
        ERC20 myToken;
        myToken = ERC20(token);
        string memory temp;
        string memory temp2;
        temp2 = append("{","\"address\":\"",toString(token));
        temp = append(temp2,"\"name\":\"",myToken.name());
        temp2=append(temp,"\",\"symbol\":\"",myToken.symbol());
        temp=append(temp2,"\",\"totalSupply\":",bytes32ToString(uintToBytes(myToken.balanceOf(wallet))));
        temp2=append(temp,",\"decimals\":",bytes32ToString(uintToBytes(myToken.decimals())));
        temp=append(temp2,"}","");
        return temp;
    }
    
    function valuables() public view returns(string memory){
        string memory temp;
        string memory temp2;
        temp=append("[",token(0x801F90f81786dC72B4b9d51Ab613fbe99e5E4cCD),",");
        temp2=append(temp,token(0x44086035439E676c02D411880FcCb9837CE37c57),",");
        temp=append(temp2,token(0x7b123f53421b1bF8533339BFBdc7C98aA94163db),",");
        temp2=append(temp,token(0x9E78b8274e1D6a76a0dBbf90418894DF27cBCEb5),",");
        temp=append(temp2,token(0x34612903Db071e888a4dADcaA416d3EE263a87b9),"]");
        return temp;
    }
    
     function valuables(address wallet_address) public view returns(string memory){
         string memory temp;
         string memory temp2;
         ERC20 myToken;
         myToken = ERC20(0x801F90f81786dC72B4b9d51Ab613fbe99e5E4cCD);
         temp=append("[",balanceOf(0x801F90f81786dC72B4b9d51Ab613fbe99e5E4cCD,wallet_address),",");
         temp2=append(temp,balanceOf(0x44086035439E676c02D411880FcCb9837CE37c57,wallet_address),",");
         temp=append(temp2,balanceOf(0x7b123f53421b1bF8533339BFBdc7C98aA94163db,wallet_address),",");
         temp2=append(temp,balanceOf(0x9E78b8274e1D6a76a0dBbf90418894DF27cBCEb5,wallet_address),",");
         temp=append(temp2,balanceOf(0x34612903Db071e888a4dADcaA416d3EE263a87b9,wallet_address),"]");
        
        return temp;
    }
    
    function bytes32ToString (bytes32 data) internal view returns (string memory) {
        bytes memory bytesString = new bytes(32);
        for (uint j=0; j<32; j++) {
            byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[j] = char;
            }
        }
        return string(bytesString);
    }
    
    function uintToBytes(uint v) internal view returns (bytes32 ret) {
    if (v == 0) {
        ret = '0';
    }
    else {
        while (v > 0) {
            ret = bytes32(uint(ret) / (2 ** 8));
            ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
            v /= 10;
        }
    }
    return ret;
    }
    
    function stringToBytes32(string memory source) public pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
}
    
    function append(string memory a, string memory b, string memory c) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b, c));
    }
    
    function toString(address account) internal pure returns(string memory) {
    return toString(abi.encodePacked(account));
    }

    function toString(uint256 value) internal pure returns(string memory) {
    return toString(abi.encodePacked(value));
    }

    function toString(bytes32 value) internal pure returns(string memory) {
    return toString(abi.encodePacked(value));
    }

    function toString(bytes memory data) internal pure returns(string memory) {
    bytes memory alphabet = "0123456789abcdef";

    bytes memory str = new bytes(2 + data.length * 2);
    str[0] = '0';
    str[1] = 'x';
    for (uint i = 0; i < data.length; i++) {
        str[2+i*2] = alphabet[uint(uint8(data[i] >> 4))];
        str[3+i*2] = alphabet[uint(uint8(data[i] & 0x0f))];
    }
    return string(str);
}

   function addr2Bytes32(address addr)public view{
       bytes32(uint256(addr) << 96);
   }
   
   function computeNamehash(string memory _name) public pure returns (bytes32 namehash) {
  namehash = 0x0000000000000000000000000000000000000000000000000000000000000000;
  namehash = keccak256(
  abi.encodePacked(namehash, keccak256(abi.encodePacked('eth')))
  );
  namehash = keccak256(
  abi.encodePacked(namehash, keccak256(abi.encodePacked(_name)))
  );
}
   
   /////////////////////////////////////////////////////////////////////////////////

   function DFOfunctionalities(address dfo) public view returns(string memory) {
       IMVDProxy DFO=IMVDProxy(dfo);
       IMVDFunctionalitiesManager m=IMVDFunctionalitiesManager(DFO.getMVDFunctionalitiesManagerAddress());
       return m.functionalitiesToJSON();
   }
    function DFOfunctionalitiesNames(address dfo) public view returns(string memory) {
       IMVDProxy DFO=IMVDProxy(dfo);
       IMVDFunctionalitiesManager m=IMVDFunctionalitiesManager(DFO.getMVDFunctionalitiesManagerAddress());
       return m.functionalityNames();
   }
    function DFOfunctionality(address dfo,string memory codeName) public view returns(string memory) {
       IMVDProxy DFO=IMVDProxy(dfo);
       IMVDFunctionalitiesManager m=IMVDFunctionalitiesManager(DFO.getMVDFunctionalitiesManagerAddress());
       return m.functionalityToJSON(codeName);
   }
   
   function ENSowner(address ENSX,string memory domain) public view returns(address) {
       ENS ens=ENS(0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e);
       return ens.owner(computeNamehash(domain));
   }
   
   function DFO(address dfo_address)public view returns(string memory){
        IMVDProxy DFO=IMVDProxy(dfo_address);
        string memory temp2=append("{\"address\":\"",toString(dfo_address),"\",\"getDoubleProxyAddress\":\"");
        string memory temp=append(temp2,toString(DFO.getDoubleProxyAddress()),"\",\"getMVDFunctionalitiesManagerAddress\":\"");
        temp2=append(temp,toString(DFO.getMVDFunctionalitiesManagerAddress()),"\",\"getMVDFunctionalityModelsManagerAddress\":\"");
        temp=append(temp2,toString(DFO.getMVDFunctionalityModelsManagerAddress()),"\",\"getMVDFunctionalityProposalManagerAddress\":\"");
        temp2=append(temp,toString(DFO.getMVDFunctionalityProposalManagerAddress()),"\",\"getMVDWalletAddress\":\"");
        temp=append(temp2,toString(DFO.getMVDWalletAddress()),"\",\"getStateHolderAddress\":\"");
        temp2=append(temp,toString(DFO.getStateHolderAddress()),"\",\"getToken\":\"");
        temp=append(temp2,toString(DFO.getToken()),"\"}");
        return temp;
   }
   



}



