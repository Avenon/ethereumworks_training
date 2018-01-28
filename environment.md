Разработка в Private Network

1) Запуск geth:

~/ethereum/geth/geth --dev --rpc --rpcaddr "0.0.0.0" --rpccorsdomain "*" --rpcapi "admin,debug,miner,shh,txpool,personal,eth,net,web3" console

2) Запуск mist:
mist --rpc http://localhost:8545 --swarmurl "null"

3) В консоле geth создаем новый аккаунт, с паролем 123:
personal.newAccount('123');

4) Запускаем майнинг:
miner.start()

5) Останавливаем майнинг:
miner.stop()
