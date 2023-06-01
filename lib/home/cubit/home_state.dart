enum HomeStates { search, favorite, create }

class HomeState {
  const HomeState({
    this.state = HomeStates.search,
  });

  final HomeStates state;
  
  List<Object> get props => [state];
}
