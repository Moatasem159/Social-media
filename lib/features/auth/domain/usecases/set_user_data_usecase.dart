import 'package:social_media/core/api/api_result.dart';
import 'package:social_media/features/auth/data/models/user_data_model.dart';
import 'package:social_media/features/auth/domain/repositories/sign_with_provider_repository.dart';
class SetUserDataUsecase {
  final SignInRepository _signWithProviderRepository;
  const SetUserDataUsecase(this._signWithProviderRepository);
  Future<ApiResult<void>> call(UserData user) => _signWithProviderRepository.setUserData(user);
}