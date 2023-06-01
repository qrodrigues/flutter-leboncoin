import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leboncoin/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void setState(HomeStates state) => emit(HomeState(state: state));
}
