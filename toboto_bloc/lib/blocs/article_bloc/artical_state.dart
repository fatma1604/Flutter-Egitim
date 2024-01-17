abstract class ArticaleState {}

class ArticlesIntital extends ArticaleState {
//verinin yüklemediği veya başlatılmadığı durum

}

class ArticlesLoding extends ArticaleState {
  //yükleme aşamasını temsil ediyor
}

class ArticlesLoaded extends ArticaleState {
  //başarıyla yüklendi
}

class ArticlesError extends ArticaleState {
  //herangi bir hata için 
}
