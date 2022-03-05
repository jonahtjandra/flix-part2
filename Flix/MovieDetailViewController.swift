//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by Jonah Tjandra on 3/4/22.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let baseUrlImage = "https://www.themoviedb.org/t/p/w500"
        movieTitle.text = self.movie.Title
        releaseDate.text = self.movie.Date
        overview.text = self.movie.Description
        overview.sizeToFit()
        backdropImage.af.setImage(withURL: URL(string: baseUrlImage + self.movie.BackdropImageUrl)!)
        posterImage.af.setImage(withURL: URL(string: baseUrlImage + self.movie.PosterImageUrl)!)
        // Do any additional setup after loading the view.
    }
    
    func configure(with movie:Movie) {
        self.movie = movie
    }

}
