pragma solidity ^0.4.11;

// Объявляем абстракццию данных, в которой назначаем именование функции
contract AbstractContract {
    function test() public returns (uint);
}

// Наследуемся от создааной абстракции, при этом используем наименование функции
// определенное в абстракции, но сам код реализации пишем в данном контракте для
// данной функции
contract RealContract is AbstractContract {
    function test() public returns (uint) {
        return 42;
    }
}
