# Проект "Факт дня"

Проект "Факт дня" создан с использованием архитектурного паттерна MVC (Model-View-Controller). Он включает в себя простое приложение, позволяющее просматривать и добавлять факты дня.

## Описание проекта

Цель проекта - изучение архитектуры MVC, жизненного цикла UIViewController и создания пользовательского интерфейса программно, без использования Storyboard.

## Структура проекта

Проект состоит из следующих компонентов:

- `Phrases.swift`: Класс модели, в котором хранится массив фактов и реализована логика для предоставления новых фактов.
- `ViewController.swift`: Контроллер, управляющий отображением фактов и взаимодействием с пользователем.
- `AppDelegate.swift`: Класс делегата приложения, в котором можно добавить дополнительную логику при запуске приложения.

## Создание элементов кодом

Все элементы интерфейса, включая `UILabel` и две `UIButton`, созданы программно с использованием кода в файле `ViewController.swift`.

## Функциональность

Приложение "Факт дня" обладает следующей функциональностью:

- Отображение факта дня в `UILabel`.
- Возможность запросить новый факт по нажатию на кнопку "Показать факт".
- Добавление нового факта в список при нажатии на кнопку "Добавить факт".

<div>
  <img src="Assets/01.png" alt="02" height="500" style="margin-right: 30px;">
  <img src="Assets/02.png" alt="03" height="500" style="margin-right: 30px;">
  <img src="Assets/03.png" alt="01" height="500">
</div>

## Жизненный цикл UIViewController

- `viewDidLoad`: Вызывается после загрузки представления в память. Используется для инициализации элементов интерфейса и подготовки данных.
- `viewWillAppear`: Вызывается перед тем, как представление станет видимым. Здесь можно выполнять необходимые операции перед появлением на экране.
- `viewDidAppear`: Вызывается после того, как представление становится видимым. Используется, например, для запуска анимаций или обновления данных.
- `viewWillDisappear` и `viewDidDisappear`: Вызываются перед и после того, как представление перестает быть видимым.

## Запуск проекта

Для запуска проекта выполните следующие шаги:

1. Откройте проект в Xcode.
2. Запустите симулятор, выбрав устройство для запуска.
3. Интерфейс приложения "Факт дня" будет отображен на экране.

## Дополнительные исследования

Проект может быть расширен следующим образом:

- Реализация анимаций для более привлекательного взаимодействия с пользователем.
- Сохранение фактов в постоянное хранилище, такое как UserDefaults или CoreData.
