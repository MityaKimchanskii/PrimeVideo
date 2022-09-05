//
//  Movie.swift
//  PrimeVideo
//
//  Created by Mitya Kim on 9/3/22.
//

import Foundation

struct CollectionViewCellModel: Equatable {
    let movieName: String
}

struct TableViewCellModel {
    var movies: [[CollectionViewCellModel]]
}

let movie1 = CollectionViewCellModel(movieName: "25")
let movie2 = CollectionViewCellModel(movieName: "28")
let movie3 = CollectionViewCellModel(movieName: "3")
let movie4 = CollectionViewCellModel(movieName: "4")
let movie5 = CollectionViewCellModel(movieName: "5")
let movie6 = CollectionViewCellModel(movieName: "6")
let movie7 = CollectionViewCellModel(movieName: "7")
let movie8 = CollectionViewCellModel(movieName: "8")
let movie9 = CollectionViewCellModel(movieName: "9")
let movie10 = CollectionViewCellModel(movieName: "10")
let movie11 = CollectionViewCellModel(movieName: "11")
let movie12 = CollectionViewCellModel(movieName: "12")
let movie13 = CollectionViewCellModel(movieName: "13")
let movie14 = CollectionViewCellModel(movieName: "14")
let movie15 = CollectionViewCellModel(movieName: "15")
let movie16 = CollectionViewCellModel(movieName: "16")
let movie17 = CollectionViewCellModel(movieName: "25")
let movie18 = CollectionViewCellModel(movieName: "18")
let movie19 = CollectionViewCellModel(movieName: "19")
let movie20 = CollectionViewCellModel(movieName: "20")
let movie21 = CollectionViewCellModel(movieName: "21")
let movie22 = CollectionViewCellModel(movieName: "22")
let movie23 = CollectionViewCellModel(movieName: "23")
let movie24 = CollectionViewCellModel(movieName: "24")

let movieList1 = [movie1, movie2, movie3, movie7,  movie9, movie10, movie11, movie12, movie13, movie17, movie18, movie19, movie23, movie24]

let movieList2 = [movie2, movie3, movie4, movie5, movie6, movie10, movie11, movie12, movie13, movie14, movie15, movie16, movie17, movie18, movie19,  movie22, movie23, movie24]

let movieList3 = [movie9, movie10, movie11, movie12, movie13, movie14, movie15, movie16, movie17, movie18, movie19, movie20]

let headerList = [movie1, movie18, movie23]

let movieList5 = [movie3, movie7, movie8, movie5, movie6, movie10, movie13, movie14, movie15,  movie18]

let objectArray = [headerList, movieList1, movieList2, movieList3, movieList5]
