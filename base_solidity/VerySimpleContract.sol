// Указываем версию для компилятора
pragma solidity ^0.4.0;

// Объявляем контракт
contract firstContract {
    // Объявляем переменную donator, в которой будем хранить адрес контракта
    // с которого пришел эфир
    address public donator;

    // Объявляем функцию
    function setDonator() public payable {
        // Присваиваем переменной donator значение адреса того, кто отправил эфиры
        donator = msg.sender;
    }

}
