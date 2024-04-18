//
//  ViewControllerDos.swift
//  PruebasCheps
//
//  Created by Oscar Prado on 19/03/24.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var segmentControl: UISegmentedControl!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var movies: [Movies] = []
    
    func loadMovies(year: Int, title: String, gender: String, rating: String, actors: String, duration: String, synopsis: String, image: UIImage?) -> Movies{
        let movReturn = Movies(year: year , title: title, gender: gender, rating: rating, actors: actors, synopsis: synopsis, duartion: duration, image: image)
        return movReturn
    }
    
    //ciclo de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = false
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MovieCell")
        movies.append(loadMovies(year: 1967, title: "Naranja Mecanica", gender: "thriller", rating: "9/10", actors: "Malcom McDowell, Adrienne Corri", duration: "136m", synopsis: "Alex es un joven muy agresivo que tiene dos pasiones: la violencia desaforada y Beethoven. Es el jefe de la banda de los drugos, que dan rienda suelta a sus instintos más salvajes aterrorizando a la población.", image: UIImage(named: "NaranjaMecanica")))
        movies.append(loadMovies(year: 2003, title: "Buscando a Nemo" , gender: "Infantil" , rating: "8/10" , actors: "Alber brooks, Willem Defoe" , duration: "100m" , synopsis: "Nemo, un pequeño pececillo, muy querido y protegido por su padre, se pierde fuera de la gran barrera del arrecife australiano, después de ser capturado por este arrecife, Nemo terminará en una pecera en Sidney. Su padre, un pez payaso, parte en su búsqueda y se embarca en una peligrosa aventura con Dory, un pez con muy poca memoria. Al mismo tiempo, Nemo y sus nuevos amigos ya traman un plan para escapar de la pecera.", image: UIImage(named: "") ))
        movies.append(loadMovies(year: 2014, title: "Interestellar", gender: "Ciencia ficción/Aventura", rating: "10/10", actors: "Matthew McConaughey, Anne Hathaway" , duration: "169m", synopsis: "Un grupo de científicos y exploradores, encabezados por Cooper, se embarcan en un viaje espacial para encontrar un lugar con las condiciones necesarias para reemplazar a la Tierra y comenzar una nueva vida allí. La Tierra está llegando a su fin y este grupo necesita encontrar un planeta más allá de nuestra galaxia que garantice el futuro de la raza humana.", image: nil))
        movies.append(loadMovies(year: 2023, title: "Opphenheimer", gender: "Terror/Pieza de época", rating: "9/10", actors: "Cillian Murphy", duration: "180m", synopsis: "Durante la Segunda Guerra Mundial, el teniente general Leslie Groves designa al físico J. Robert Oppenheimer para un grupo de trabajo que está desarrollando el Proyecto Manhattan, cuyo objetivo consiste en fabricar la primera bomba atómica.", image: nil))
        movies.append(loadMovies(year: 2007, title: "El Hombre Aranaña 3", gender: "Acción/Ciencia ficción", rating: "8/10", actors: "Tobey Maguire, Kirsten Dunst", duration: "130m", synopsis: "Peter Parker sufre una terrible transformación cuando su traje se vuelve negro y libera su personalidad oscura y vengativa. Afrontará el mayor desafío de su vida al tener que redescubrir la humildad y compasión que lo hacen ser quien es: un héroe.", image: nil))
        movies.append(loadMovies(year: 2022, title: "Moonfall", gender: "Ciencia ficción/Acción", rating: "7/10", actors: "Patrick Wilson, Halle Berry", duration: "130m", synopsis: "Una fuerza misteriosa golpea a la Luna fuera de su órbita y la envía en choque directo contra la Tierra a toda velocidad. Unas semanas antes del impacto con el mundo al borde de la aniquilación, la ejecutiva de la NASA y ex astronauta Jo Fowler está convencida de tener la clave para salvar nuestro planeta. Pero solo el astronauta Brian Harper y el teórico conspiranoico KC Houseman la creen. Todos juntos montarán una misión fuera de lo común.", image: nil))
        movies.append(loadMovies(year: 2019, title: "Godzilla 2", gender: "Ciencia ficción/Acción", rating: "8/10", actors: "Millie Bobby, Kyle Chandler", duration: "132", synopsis: "Seguimos las aventuras de unos criptzóologos de una agencia mientras tratan de enfrentarse a unos monstruos entre los que se encuentra el propio Godzilla. Entre todos intentarán frenar a estas ancianas criaturas que harán todo lo posible por sobrevivir, arriesgando toda la vida de los humanos.", image: nil))
        movies.append(loadMovies(year: 2010, title: "Infierno", gender: "Crimen/Comedia", rating: "7/10", actors: "Damián Alcazar, Joaquin Cosío", duration: "146m", synopsis: "Benjamín García se involucra en el negocio del narcotráfico después de ser deportado de los Estados Unidos, pero pronto escubre que la vida criminal no es tan lucrativa como él lo pensaba.", image: nil))
        movies.append(loadMovies(year: 2004, title: "Matado Cabos", gender: "Comedia/Acción", rating: "8/10", actors: "Tonny Dalton, Silverio Palacios", duration: "94m", synopsis: "Una comedia oscura y poco convencional sobre un grupo de adolescentes de la Ciudad de México envueltos en un secuestro que involucra a una leyenda de lucha libre retirada y un loro.", image: nil))
        movies.append(loadMovies(year: 2007, title: "Encantada", gender: "Comedia/Musical", rating: "8/10", actors: "Amy Adams, Patrick Demsey", duration: "107m", synopsis: "La bella princesa Giselle es transportada por un hechizo de la malvada reina Narissa desde su mágico mundo a la moderna y caótica Manhattan actual. Inmersa en un entorno que desconoce, Giselle deambula por un mundo desorganizado.", image: nil))

       }
    override func viewWillAppear(_ animated: Bool) {
        self.setUpInterface()
        title = "Movies"
    
    }
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
    // Interfaz Grafica
    
    func setUpInterface(){
        
    }
    
    @IBAction func btnLogOut(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true,completion: nil)
        let defaults = UserDefaults.standard
            defaults.set(false, forKey: "userRegistered")
            
            dismiss(animated: true, completion: nil)

    }
    
    @IBAction func btnChangeView(_ sender: UIBarButtonItem) {
        collectionView.isHidden = !collectionView.isHidden
        tableView.isHidden = !tableView.isHidden
    }
    
    let barButton = UIBarButtonItem()
    
    
    
}
    
//Configuracion de Collectionn View, cantidad de ventanas y que mostrar
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 163.0, height: 154.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! HomeCollectionViewCell
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.yearLabel.text = "\(movie.year)"
        cell.imageView.image = movie.image
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentMovie = movies[indexPath.row]
        let detailsViewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailsViewController.currentMovies = currentMovie
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! HomeTableViewCell
        let movie = movies[indexPath.row]
        cell.titleLabel2.text = movie.title
        cell.yearLabel2.text = "\(movie.year)"
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentMovie = movies[indexPath.row]
        let detailsViewController = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        detailsViewController.currentMovies = currentMovie
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
    
    
    


