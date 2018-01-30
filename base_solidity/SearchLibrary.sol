// Версия solidity
pragma solidity ^0.4.16;
// Объявляем название библиотеки
library SimpleSeach {

    // Создаем функцию для просмотра массива
    function searchFor(uint[] storage self, uint _value) returns (uint) {

        // Проходимся по массиву
        for (uint i = 0; i < self.length; i++){
            // Если нашли число - возвращаем его индекс
            if (self[i] == _value) return i;
        }

        // Если не нашли число, возвращаем uint(-1)
        // Это хороший тон, возврщать -1, если элемент не найден, потому что
        // если вернуть 0, то может оказаться, что на этом индексе может оказаться
        // элемент
        return uint(-1);
    }
}

// Создаем простенький контракт
contract ContractWithArrays {
    // Указываем, что будем использовать нашу библиотеку для
    using SimpleSeach for uint[];
    // [1,2,3,4,5,6,7,8,9] - например у нас будет вот такой вот массив чисел
    uint[] public bigArrayOfNumbers;
    // Функция для того, чтобы добавить число в массив
    function push(uint _value) public {
      bigArrayOfNumbers.push(_value);
    }
    // Функция, которой мы будем заменять старое число на новое
    // 1,9 => [9,2,3,4,5,6,7,8,9]
    // 10,1 => [1,2,3,4,5,6,7,8,9,1]
    function replace(uint _old, uint _new) public {
        // Ищем позицию с помощью библиотеки
        uint position = bigArrayOfNumbers.searchFor(_old);
        // Если позиция такая не была найдена - добавляем элемент
        if (position == uint(-1)) {
          bigArrayOfNumbers.push(_new);
        }
        // Иначе - заменяем его
        else {
          bigArrayOfNumbers[position] = _new;
        }
    }
}
