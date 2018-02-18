# ethereumworks_training
Ethereum Blockchain Development Courses

В данном репозитории я описываю то, что изучил на курсе [www.ethereumworks.com](https://ethereumworks.com/ "Рарзаботка на блокчейне Ethereum"). Это курс по основам Solidity,
разработке на блокчейне Ethereum, написанию Dapp приложений.

В каждой папке шаг за шагом появляется новый код, по новым темам, который мы проходим на курсах.

В папке **base_solidity** - находятся основы по Solidity, примеры простых контрактов, основы синтаксиса, структуры данных языка Solidity,примеры абстракций, интерфейсов.

В файле **environment.md** - Описан процесс запуска geth+mist для деплоя контрактов в private-network на локальной ноде.

В папке **DAO** - пример простого DAO приложения, который позволяет проводить голосование за изменение названия переменной за токены.

В папке **ICO** - два контракта ICO, один wrongICO - пример того как не нужно делать. И **MinimalisticICO.sol** -- пример контракта, который можно использовать для проведения ICO.

В папке **tokens** - Лежат примеры контракта токена, согласно стандрарту ERC20.

В папке **Web3 Simple Example** - Показано, как подключить библиотеку web3js к html файлу.


**Итоговый проект**
Данные проект был сделан по итогам всего курса и лежит в папке **DApp Example**.
Контракт ICO [etw-silaev-ico.herokuapp.com](https://etw-silaev-ico.herokuapp.com/ "Контракт ICO")
Контракт смены переменной за токены [etw-silaev-app.herokuapp.com](https://etw-silaev-app.herokuapp.com/ "Контракт приложения")

Для покупки токенов, нужно воспользоваться контрактом ICO по ссылке выше, затем вызвать приложение по второй ссылке, где за купленные токены можно поменять переменную
