import 'package:bloc/bloc.dart';
import 'package:toboto_bloc/blocs/article_bloc/artical_envet.dart';
import 'package:toboto_bloc/blocs/article_bloc/artical_state.dart';

class ArticalBloc extends Bloc<ArticalEvent, ArticaleState> {
  ArticalBloc() : super(ArticlesIntital()) {
    on<FetchArticales>(_onFetch);

    on<AddArticle>((event, emit) {});
  }
  void _onFetch(FetchArticales event,Emitter <ArticaleState>emit){}

  void _onAdd(AddArticle event,Emitter<ArticaleState>emit){}
}
