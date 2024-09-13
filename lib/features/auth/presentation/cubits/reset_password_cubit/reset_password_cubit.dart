import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/core/api/error_handler.dart';
import 'package:social_media/features/auth/domain/usecases/reset_password_usecase.dart';
part 'reset_password_state.dart';
class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  final ResetPasswordUsecase _resetPasswordUsecase;
  ResetPasswordCubit(this._resetPasswordUsecase) : super(const ResetPasswordInitialState());
  resetPassword(String email)async{
    emit(const ResetPasswordLoadingState());
    final ApiResult<void> response=await  _resetPasswordUsecase(email);
    switch (response){
      case ApiSuccess():
        emit(const ResetPasswordSuccessState());
      case ApiFailure():
        emit(ResetPasswordErrorState(error: response.errorHandler.apiError));
    }
  }
}