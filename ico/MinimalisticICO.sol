// Указываем версию для компилятора
pragma solidity ^0.4.11;

// Объявляем интерфейс для токена
interface Token {
    function transfer(address _reciever, uint256 _value);
}

// Объявляем контракт
contract MyFirstSafeICO {
// Объявляем переменную для стомости токена
    uint public buyPrice;

    // Объявялем переменную для хранения токена
    Token public token;

    // Функция инициализации (принимает токен
    function MyFirstSafeICO(Token _token) {
        // Присваиваем токен
        token = _token;

        // Присваем стоимость
        buyPrice = 10000;
        // ВНИМАНИЕ: стоимость указана в веях для одной минимальной единицы токена (0.0..decimals..1 токена)
    }

    // Функция для прямой отправки эфиров на контракт
    function () payable {
        // Вызываем внутреннюю функцию для покупки токенов
        _buy(msg.sender, msg.value);
    }

    // Вызываемая функция для отправки эфиров на контракт, возвращающая количество купленных токенов
    function buy() payable returns (uint) {
        // Вызываем внутреннюю функцию для покупки токенов
        uint tokens = _buy(msg.sender, msg.value);
        // Возвращаем значение
        return tokens;
    }

    // Внутренняя функция покупки токенов, возвращает число купленных токенов
    function _buy(address _sender, uint256 _amount) internal returns (uint) {

        // Рассчитываем стоимость
        uint tokens = _amount / buyPrice;
        // Отправляем токены с помощью вызова метода токена
        token.transfer(_sender, tokens);
        // Возвращаем значение
        return tokens;
    }
}
