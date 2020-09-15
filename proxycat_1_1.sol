/* 
 *  ProxyCat
 *  VERSION: 1.1
 *  
 */

pragma solidity ^0.6.0;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract proxycat{ 

    string public version="1.0";
    
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

