
abstract class NewsState{}

class AppInitiliState extends NewsState{}
class AppBottomNaveState extends NewsState{}

class AppBussinessLoadingState extends NewsState{}
class AppGetBusinessSucess extends NewsState{}
class AppGetBusinessError extends NewsState{
  String error;
  AppGetBusinessError(this.error);

}

class AppSportsLoadingState extends NewsState{}
class AppGetSportsSucess extends NewsState{}
class AppGetSportsError extends NewsState{
  String error;
  AppGetSportsError(this.error);

}

class AppScienceLoadingState extends NewsState{}
class AppGetScienceSucess extends NewsState{}
class AppGetScienceError extends NewsState{
  String error;
  AppGetScienceError(this.error);

}

class AppChangeModeState extends NewsState{}


class AppSearchLoadingState extends NewsState{}
class AppGetSearchSucess extends NewsState{}
class AppGetSearchError extends NewsState{
  String error;
  AppGetSearchError(this.error);

}

class AppSelectedItemState extends NewsState{}
class AppSetSetSDesktopState extends NewsState{}