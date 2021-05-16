//
//  DTONote.swift
//  HackPoint
//
//  Created by Maxim Butin on 16.05.2021.
//

import Foundation

struct DTONoteReferee: Codable {
  let id: Int?
  let name: String?
  let sirname: String?
  let type: String?
  let login: String?
  let password: String?
}

struct DTONoteCriterion: Codable {
  let id: Int?
  let name: String?
}

struct DTONoteText: Codable {
  let id: Int
  let text: String?
}

struct DTOPointWithNotes: Codable {
  let points: [DTONote]
  let note: DTONoteText
  
}

struct DTONote: Codable {
  let id: Int?
  let point: Int?
  let criterionId: Int?
  let refereeId: Int?
  let referee: DTONoteReferee?
  let criterion: DTONoteCriterion?
}

/*
 {
   "points" : [
     {
       "referee" : {
         "password" : "1a1dc91c907325c69271ddf0c944bc72",
         "id" : 1,
         "login" : "log",
         "surname" : "surname",
         "name" : "name",
         "type" : "main"
       },
       "id" : 1121,
       "criterionId" : 10,
       "refereeId" : 1,
       "point" : 0,
       "criterion" : {
         "id" : 10,
         "name" : "Объем работы на хакатоне"
       }
     },
     {
       "referee" : {
         "password" : "1a1dc91c907325c69271ddf0c944bc72",
         "id" : 1,
         "login" : "log",
         "surname" : "surname",
         "name" : "name",
         "type" : "main"
       },
       "id" : 1122,
       "criterionId" : 11,
       "refereeId" : 1,
       "point" : 0,
       "criterion" : {
         "id" : 11,
         "name" : "Презентация, выступление, ораторское мастерство"
       }
     },
     {
       "referee" : {
         "password" : "1a1dc91c907325c69271ddf0c944bc72",
         "id" : 1,
         "login" : "log",
         "surname" : "surname",
         "name" : "name",
         "type" : "main"
       },
       "id" : 1123,
       "criterionId" : 8,
       "refereeId" : 1,
       "point" : 0,
       "criterion" : {
         "id" : 8,
         "name" : "Новизна, актуальность, применимость, возможность коммерциализации"
       }
     },
     {
       "referee" : {
         "password" : "1a1dc91c907325c69271ddf0c944bc72",
         "id" : 1,
         "login" : "log",
         "surname" : "surname",
         "name" : "name",
         "type" : "main"
       },
       "id" : 1124,
       "criterionId" : 9,
       "refereeId" : 1,
       "point" : 0,
       "criterion" : {
         "id" : 9,
         "name" : "Технологическая и техническая реализация"
       }
     }
   ],
   "note" : {
     "id" : 5,
     "text" : "лучшие\nогонь\nлучшие",
     "refereeId" : 1
   }
 }
 */
