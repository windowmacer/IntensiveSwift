# Проект "Movies Collection"

Проект "Movies Collection" создан для изучения работы с коллекциями (UICollectionView) в iOS-приложениях. Приложение представляет собой коллекцию постеров фильмов, где каждая ячейка коллекции отображает постер одного фильма. Пользователь может листать коллекцию вправо или влево, чтобы посмотреть все постеры.

## Описание проекта

Цель проекта - изучение основ работы с UICollectionView, создание кастомных ячеек и взаимодействие с делегатом коллекции.

## Структура проекта

Проект включает в себя следующие компоненты:

- **StructImage.swift:** Модель данных, представляющая информацию о фильмах.
- **CollectionCell.swift:** Класс для создания кастомной ячейки коллекции с постерами фильмов.
- **ViewController.swift:** Главный контроллер, управляющий коллекцией и отображением постеров.

## Изученные концепции

- Использование `UICollectionView` для отображения данных в виде коллекции.
- Создание кастомных ячеек коллекции с использованием `UICollectionViewCell`.
- Взаимодействие с делегатом коллекции (`UICollectionViewDelegate`) для обработки событий.
- Работа с `UICollectionViewFlowLayout` для настройки внешнего вида коллекции.

## Функциональность

Проект "Movies Collection" предоставляет следующую функциональность:

- **Главный экран:**
  - Отображение коллекции постеров фильмов.
  - Кастомные ячейки, содержащие постеры и возможность дополнительной информации.
  - Прокрутка коллекции вправо и влево для просмотра всех постеров.

<div>
  <img src="Assets/01.png" alt="02" height="500" style="margin-right: 30px;">
  <img src="Assets/02.png" alt="03" height="500" style="margin-right: 30px;">
  <img src="Assets/03.png" alt="01" height="500">
</div>

## Запуск проекта

Для запуска проекта выполните следующие шаги:

1. Откройте проект в Xcode.
2. Убедитесь, что CollectionViewController.swift выбран как основной контроллер интерфейса.
3. Запустите симулятор, выбрав устройство для запуска.
4. Интерфейс приложения "Movies Collection" с коллекцией постеров фильмов будет отображен на экране.
