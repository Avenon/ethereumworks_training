pragma solidity ^0.4.0;


interface AppToken {
    function payment(address _from, uint value) returns (bool);
}

contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function Ownable() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}

contract App is Ownable{

    string public message;
    address public lastDonator;
    AppToken public token;
    // Операция в нашей операции будет стоит 10 токенов, т.е. пользователю
    // нужно заплатить 10 наших токенов, чтобы изменить значение переменной
    // message
    uint public price = 10;

    function App(AppToken _token){
        token = _token;
    }

    function setPrice(uint _price) onlyOwner {
        price = _price;
    }

    function setMessage(string _message) returns (bool){
        if (token.payment(msg.sender, price)){
            message = _message;
            lastDonator = msg.sender;
            return true;
        }
        else {
            // Если платеж не прошел, то возвращам false
            return false;
        }
    }
}
