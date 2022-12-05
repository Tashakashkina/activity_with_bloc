import 'dart:async';
import 'package:activities/services/boredService.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredService _boredService;
  HomeBloc(this._boredService) : super(HomeLoadingState()) {
    
    on<LoadApiEvent>((event, emit) async {
      emit(HomeLoadingState());
      final activity = await _boredService.getBoredActivity();
      emit(HomeLoadedState(activity.activity, activity.type, activity.participants, activity.accessibility));
    });

  
  }
}
// on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       throw errorMessage;
    