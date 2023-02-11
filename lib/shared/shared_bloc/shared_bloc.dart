import '../../config/bloc_export.dart';

part 'shared_event.dart';
part 'shared_state.dart';

class SharedBloc extends Bloc<SharedEvent, SharedState> {
  SharedBloc() : super(SharedInitial()) {
    on<SharedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ResetProductEvent>((event, emit) {
      emit(ResetProduct());
    });
    on<AddToCart>((event, emit) {
      emit(AddToCartState());
    });
    on<CartAdd>((event, emit) {
      emit(CartAddState(price: event.price));
    });
    on<CartSub>((event, emit) {
      emit(CartSubState(price: event.price));
    });
    on<NotifyFetch>((event, emit) {
      emit(NotifyFetchState());
    });
    on<ResetCart>((event, emit) {
      emit(ResetCartState());
    });
  }
}
