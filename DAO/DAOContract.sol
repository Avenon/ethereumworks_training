pragma solidity ^0.4.11;

// Интерфейс токена
interface ChangableToken {
    function stop();
    function start();
    function changeSymbol(string name);
    function balanceOf(address user) returns (uint256);
}

// Контракт ДАО
contract DAOContract {

    // Переменная для хранения токена
    ChangableToken public token;

    // Минимальное число голосов
    uint8 public minVotes;

    // Переменная, в которой будем хранить предложенное название
    string public proposalName;

    // Переменная для хранения статуса голосования
    bool public voteActive = false;

    // Структура для хранения голосования
    struct Votes {
        int current;
        uint numberOfVotes;
    }

    // Переменная для структуры голосования
    Votes public election;

    // Функция инициализации
    function DAOContract(ChangableToken _token) {
        token = _token;
    }

    // Фукнция для предложения нового имени
    function newName(string _proposalName) public {
        // Проверяем, что голосование не идет сейчас
        require(!voteActive);
        proposalName = _proposalName;
        voteActive = true;
        // Останавливаем работу токена
        token.stop();
    }

    // Фукнция для голосования
    function vote(bool _vote) public {
        // Проверяем, что идет голосование
        require(voteActive);
        // Логика для голования
        if (_vote) {
            election.current += int(token.balanceOf(msg.sender));
        }
        else {
            election.current -= int(token.balanceOf(msg.sender));
        }

        election.numberOfVotes += token.balanceOf(msg.sender);
    }

    // Функция для смены символа
    function changeSymbol() public {

        // Проверяем, что голование активно
        require(voteActive);

        // Проверяем, что получили достаточное количество голосов
        require(election.numberOfVotes >= minVotes);

        // Если собрали нужное число голосов, то обновляем имя
        if (election.current > 0) {
            token.changeSymbol(proposalName);
        }

        // Сбрасываем все переменные для голосования
        election.numberOfVotes = 0;
        election.current = 0;
        voteActive = false;

        // Возобновляем работу токена
        token.start();
    }
}
