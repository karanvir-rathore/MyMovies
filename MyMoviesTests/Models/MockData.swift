//
//  MovieDetailMock.swift
//  MyMoviesTests
//
//  Created by Rathore, Karanvir on 26/12/22.
//

import Foundation

struct MockData {
    
    static let movieJson = """
    {
        "adult": false,
        "backdrop_path": "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
        "genre_ids": [878, 12, 14, 28],
        "id": 76600,
        "original_language": "en",
        "original_title": "Avatar: The Way of Water",
        "overview": "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
        "popularity": 11276.345,
        "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
        "release_date": "2022-12-14",
        "title": "Avatar: The Way of Water",
        "video": false,
        "vote_average": 8.1,
        "vote_count": 1211
    }
    """
    
    static let movieDetailsJson = """
    {
        "adult": false,
        "backdrop_path": "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
        "belongs_to_collection": {
            "id": 87096,
            "name": "Avatar Collection",
            "poster_path": "/uO2yU3QiGHvVp0L5e5IatTVRkYk.jpg",
            "backdrop_path": "/iaEsDbQPE45hQU2EGiNjXD2KWuF.jpg"
        },
        "budget": 460000000,
        "genres": [{
            "id": 878,
            "name": "Science Fiction"
        }, {
            "id": 12,
            "name": "Adventure"
        }, {
            "id": 14,
            "name": "Fantasy"
        }, {
            "id": 28,
            "name": "Action"
        }],
        "homepage": "https://www.avatar.com/movies/avatar-the-way-of-water",
        "id": 76600,
        "imdb_id": "tt1630029",
        "original_language": "en",
        "original_title": "Avatar: The Way of Water",
        "overview": "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
        "popularity": 11276.345,
        "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
        "production_companies": [{
            "id": 574,
            "logo_path": "/iB6GjNVHs5hOqcEYt2rcjBqIjki.png",
            "name": "Lightstorm Entertainment",
            "origin_country": "US"
        }, {
            "id": 127928,
            "logo_path": "/cxMxGzAgMMBhTXkcpYYCxWCOY90.png",
            "name": "20th Century Studios",
            "origin_country": "US"
        }],
        "production_countries": [{
            "iso_3166_1": "US",
            "name": "United States of America"
        }],
        "release_date": "2022-12-14",
        "revenue": 609800000,
        "runtime": 192,
        "spoken_languages": [{
            "english_name": "English",
            "iso_639_1": "en",
            "name": "English"
        }],
        "status": "Released",
        "tagline": "Return to Pandora.",
        "title": "Avatar: The Way of Water",
        "video": false,
        "vote_average": 8.059,
        "vote_count": 1219
    }
    """
    
    static func generate<T: Decodable>(data: Data, model: T.Type) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
