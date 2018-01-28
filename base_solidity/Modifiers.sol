pragma solidity ^0.4.16;

contract Modifiers {

  // Указание constant перед переменными, позволяет снизить стоимость по газу
  // контракта, т.к. виртуальная машина эфира понимает, что данная переменная не будет
  // изменяться в дальнейшем и не резервирует доп. ресурсы под нее
	uint constant a = 5;

	mapping (address => uint) map;

  // view говорит о том, что мы будем обращаться к функциям контракта, но при
  // этом изменение состояния не будет
	function viewFunction(address _user) public view returns (uint) {
		return map[_user] * 2;
	}
  // Это функция будет дороже стоит по газу чем предыдущая, несмотря на одинаковый код,
  // т.к. для этой функции резервируется дополнительная память в VM Ethereum
  function notViewFunction(address _user) public returns (uint) {
		return map[_user] * 2;
	}

  // pure говорит о том, что мы вообще из данной функции не будем обращаться к
  // другим функциям.
  // Стоимость по газу с указанием pure ниже, чем без нее с аналогичным кодом
	function pureFunctionForAdd(uint _a, uint _b) public pure returns (uint) {
		return _a + _b;
	}

  // Данная функция без pure стоит дороже по газу чем предыдущая
	function notPureFunctionForAdd(uint _a, uint _b) public returns (uint) {
		return _a + _b;
	}
}
