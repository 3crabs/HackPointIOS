//
//  RegistrationTeamMockData.swift
//  HackPoint
//
//  Created by Maxim Butin on 26.06.2022.
//

import Foundation

struct User: Codable {
    var name: String
    var skills: String?
}


struct Team {
    
    var name: String
    var description: String
    var nameProject: String
    var users: [User]
}

class RegistrationTeamMockData {
    
    static func getData() -> [Team] {
        [
            Team(name: "3CRABS",
                 description: "Сделали приложение для оценки хакатона",
                 nameProject: "Оценочка",
                 users: [
                    User(name: "Бутин Максим", skills: "iOS"),
                    User(name: "Ефанов Михаил", skills: "back end"),
                    User(name: "Ефанова Нелли", skills: "Презентация"),
                    User(name: "Бурят Саня", skills: "ПМ"),
                 ]
                ),
            Team(name: "CRABS",
                 description: "Форматер для GO. Утилита для разработчиков",
                 nameProject: "Go-форматер",
                 users: [
                    User(name: "Федоров Владимир", skills: "back end"),
                    User(name: "Семи Нассери", skills: "back end"),
                    User(name: "Анастасия", skills: "Вхожу ВАЙТИ"),
                    User(name: "Бурят Саня", skills: "ПМ"),
                 ]
                ),
            Team(name: "Шар",
                 description: "Проект по обмену вещами между людьми (обратное Avito). Должен снизить уровень генерируемого мусора, и улучшить благосостояние малоимущих людей.",
                 nameProject: "Шар",
                 users: [
                    User(name: "Дмитрий", skills: "back end"),
                    User(name: "Ваня", skills: "back end"),
                 ]
                ),
            Team(name: "Ctrl-я",
                 description: "Мы разрабатываем мобильное приложение (игру), в котором пользователь выступает тренером для искусственного интеллекта (бота). Пользователь обучает бота играть в игру, после того, как бот начинает играть в силу пользователя, его можно отправить сражаться с ботами других людей, поскольку партии между ботами происходят очень быстро, мы получим достаточно объективную рейтинговую оценку скилла подготовленности бота или тренера.",
                 nameProject: "Ctrl-я",
                 users: [
                    User(name: "Чувак 1", skills: "back end"),
                    User(name: "Чувак 2", skills: "back end"),
                    User(name: "Чувак 3", skills: "Вхожу ВАЙТИ"),
                    User(name: "Чувак 4", skills: "ПМ"),
                 ]
                ),
            Team(name: "Галеон",
                 description: "Главной идеей является создание библиотеки электронных проектов, средства разработки:  HTML/CSS, Bootstrap, прочие язык программирования Photoshop.",
                 nameProject: "Галеон",
                 users: [
                    User(name: "Чувак 1", skills: "back end"),
                    User(name: "Чувак 2", skills: "back end"),
                    User(name: "Чувак 3", skills: "Вхожу ВАЙТИ"),
                    User(name: "Чувак 4", skills: "ПМ"),
                 ]
                ),
        ]
    }
}
