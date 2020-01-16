# Тестовое задание «Breweries list»

Задание выполняется на Swift 5, поддержка iOS 12 & текущая версия iOS. UI выполнять в Storyboard (и/или XIB).
Интерфейс должен быть адаптирован под все размеры экранов iPhone актуальные под указанную версию iOS. По
выполнению работы, прислать архив с проектом.
При проверке учитывается: архитектура, работоспособность, структура проекта, code style, использованные
решения. Можно использовать сторонние библиотеки и менеджеры зависимостей (CocoaPods, Carthage, и т.д.).
Дизайн приложения в psd в архиве с заданием.

# Требования:

1. Соответствие UI дизайну приложенному к заданию.
2. Приложение не должно падать и иметь блокирующих состояний.
3. При старте отображать список пивоварен (запрос No1).
4. Скрывать поля которые отсутствуют в ответе сервера.
5. При поиске использовать запрос No2 (можно сделать как live search так и поиск по нажатию на кнопку
    “Search”)
6. Сохранять все полученные данные в базу данных. (база на усмотрение исполнителя)
7. При отключении от интернета приложение должно показывать результаты из хранилища. Алгоритм такой:
    показать данные из базы, отправить запрос API, если пришли, то сохранить данные в базу, показать
    обновленные из базы.

# API:

1. Запрос для получения списка пивоварен
GET ​ _https://api.openbrewerydb.org/breweries_
2. Запрос для поиска пивоварен по названию
GET ​ _https://api.openbrewerydb.org/breweries?by_name= {query}_

# (больше информации по API ​https://www.openbrewerydb.org/​)

Пример ответа:
[ ...
{
id: 299,
name: "Almanac Beer Company",
street: "651B W Tower Ave",
city: "Alameda",
state: "California",
country: "United States",
longitude: "-122.306283180899",
latitude: "37.7834497667258",
phone: "4159326531",
website_url: "http://almanacbeer.com",
},
... ]
