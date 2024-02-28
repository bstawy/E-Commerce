import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'wish_list_state.dart';

@injectable
class WishListCubit extends Cubit<WishListState> {
  @factoryMethod
  WishListCubit() : super(UnAuthenticatedUserState());
}
