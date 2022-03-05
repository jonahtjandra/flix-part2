//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Jonah Tjandra on 3/4/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    private var movies = [Movie]() {
        didSet {
            movieCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        MovieService.shared.fetchMovies { moviesData in
            self.movies = moviesData
        }
        let layout = movieCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        
        let width = view.frame.size.width/2
        layout.itemSize = CGSize(width: width-7, height: width*1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let baseUrlImage = "https://www.themoviedb.org/t/p/w500"
        cell.posterView.af.setImage(withURL: URL(string: baseUrlImage + movies[indexPath.row].PosterImageUrl)!)
        return cell
    }
    

}
