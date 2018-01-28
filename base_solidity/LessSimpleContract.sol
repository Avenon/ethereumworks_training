// Указываем версию для компилятора
pragma solidity ^0.4.11;

// Объявляем контракт
contract LessSimpleContract {
    //  Объявляем переменную donator, хранящую значение типа Адресс
    // Public означает то, что значение этой переменной будет видно всем
    address public donator;

    // Объявляем переменную owner, в которой будет содержаться значение типа Адрес
    address public owner;

    // Объявляем переменную value, в которой будет содержаться значение типа uint
    uint public value;

    // Объявляем переменную lastTimeForDonate, в которой будет содержаться значение uint
    uint public lastTimeForDonate;

    // Объявляем переменную lastTimeForValue, в которой будет содержаться значение uint
    uint public lastTimeForValue;

    // // Объявляем переменную timeOut, в которой будет содержаться заранее определенное значение  типа uint
    uint timeOut = 120 seconds;

    // Эта функция выполнится в момент инициализации смарт-контракта
    function LessSimpleContract() {
        // Присваиваем в owner адрес того, кто задеплоил смарт-контракта
        owner = msg.sender;
    }

    // Функция для приема эфира
    // Отсутствие названия говорит о том, что эта функция будет вызвана в момент,
    // когда на адрес контракта переводятся деньги
    // Без названия
    // Модификатор payable - Модификатор, который означает что вместе с вызовом функции могут передаваться эфиры

    function () payable {
        // Проверяем, что переведено достаточное число эфира
        require(msg.value > 1 finney);

        // Проверяем, что выполнено условие по времени
        // Время с последней отправки средств плюс заданное значение, меньше текущего времени
        require(lastTimeForDonate + timeOut < now);

        // Вызываем внутреннюю функцию
        setDonator(msg.sender);
    }

    // Функция для приема эфира и установки значения
    // Функция принимает переменную _value в формате uint
    // Модификатор payable
    // Подчеркивание служит для того, чтобы лучше понимать, что значение данной переменной
    // пришло из вне, и используется в этой функции
    // служит для удобства, чтобы сразу видить где эта внешняя переменная учавствует в функции
    function buyValue(uint _value) payable {
        // Проверяем, что переведено достаточное число эфира
        require(msg.value > 1 finney);

        // Проверяем, что выполнено условие по времени
        require(lastTimeForValue + timeOut < now);

        // Вызываем внутреннюю функцию
        setValue(_value);
    }
    // Функция установки нового значения
    // Модификатор internal, означает, что эта функция недоступна для вызова вне контракта
    // (uint _value) означает, что функция принимает значение типа uint, которое будет
    // доступно по имени _value
    function setValue(uint _value) internal {
        // Присваиваем новое значение value
        // Установка нового времени
        value = _value;
        lastTimeForValue = now;
    }

    // Функция установки нового адреса donator
    // Модификатор internal
    function setDonator(address _donator) internal {
        // Присваиваем новое значение donator
        // Установка нового времени
        donator = _donator;
        lastTimeForDonate = now;
    }
}