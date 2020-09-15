/* 
 *  ProxyCat
 *  VERSION: 1.3
 *  
 */

pragma solidity ^0.6.0;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract proxycat{ 

    string public version="1.3";
    
    function token(address token_address) public view returns(string memory) {
        ERC20 myToken;
        myToken = ERC20(token_address);
        string memory temp;
        string memory temp2;
        temp = append("{","\"name\":\"",myToken.name());
        temp2=append(temp,"\",\"symbol\":\"",myToken.symbol());
        temp=append(temp2,"\",\"totalSupply\":",bytes32ToString(uintToBytes(myToken.totalSupply())));
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
         myToken.balanceOf(wallet_address);
         temp=append("[{\"BEANS\",\"0x801F90f81786dC72B4b9d51Ab613fbe99e5E4cCD\",\"",bytes32ToString(uintToBytes(myToken.balanceOf(wallet_address))),"\"},");
         myToken = ERC20(0x44086035439E676c02D411880FcCb9837CE37c57);
         myToken.balanceOf(wallet_address);
         temp=append("{\"uSD\",\"0x44086035439E676c02D411880FcCb9837CE37c57\",\"",bytes32ToString(uintToBytes(myToken.balanceOf(wallet_address))),"\"},");
         myToken = ERC20(0x7b123f53421b1bF8533339BFBdc7C98aA94163db);
         myToken.balanceOf(wallet_address);
         temp=append("{\"build\",\"0x7b123f53421b1bF8533339BFBdc7C98aA94163db\",\"",bytes32ToString(uintToBytes(myToken.balanceOf(wallet_address))),"\"},");
         myToken = ERC20(0x9E78b8274e1D6a76a0dBbf90418894DF27cBCEb5);
         myToken.balanceOf(wallet_address);
         temp=append("{\"Unifi\",\"0x9E78b8274e1D6a76a0dBbf90418894DF27cBCEb5\",\"",bytes32ToString(uintToBytes(myToken.balanceOf(wallet_address))),"\"},");
         myToken = ERC20(0x34612903Db071e888a4dADcaA416d3EE263a87b9);
         myToken.balanceOf(wallet_address);
         temp=append("{\"ARTE\",\"0x34612903Db071e888a4dADcaA416d3EE263a87b9\",\"",bytes32ToString(uintToBytes(myToken.balanceOf(wallet_address))),"\"}]");
        
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
    
    function append(string memory a, string memory b, string memory c) internal pure returns (string memory) {
        return string(abi.encodePacked(a, b, c));
    }
}



