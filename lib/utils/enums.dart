enum RequestState {
  none,

  loadMore,
  loadingRef,
  loading,

  success,
  failure,
  offLineFailure,
  empty,
}

enum Type { email, password, passwordConfirm, fName, lName, phone, text }

extension AppStatusX on RequestState {
  bool get isNon => this == RequestState.none;
  bool get isSuccess => this == RequestState.success;
  bool get isError => this == RequestState.failure;
  bool get isLoading => this == RequestState.loading;
  bool get isLoadingRef => this == RequestState.loadingRef;
  bool get isLoadingMore => this == RequestState.loadMore;
  bool get isEmpty => this == RequestState.empty;
  bool get isOffLine => this == RequestState.offLineFailure;
}
