// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce_app/core/usecase/usecase.dart' as _i729;
import 'package:e_commerce_app/data/data_sources/remote/auth_remote_data_source.dart'
    as _i1065;
import 'package:e_commerce_app/data/data_sources/remote/category_remote_data_source.dart'
    as _i398;
import 'package:e_commerce_app/data/data_sources/remote/order_remote_data_source.dart'
    as _i591;
import 'package:e_commerce_app/data/data_sources/remote/product_remote_data_source.dart'
    as _i398;
import 'package:e_commerce_app/data/repositories_impl/auth_repository_impl.dart'
    as _i873;
import 'package:e_commerce_app/data/repositories_impl/category_repository_impl.dart'
    as _i971;
import 'package:e_commerce_app/data/repositories_impl/order_repository_impl.dart'
    as _i150;
import 'package:e_commerce_app/data/repositories_impl/product_repository_impl.dart'
    as _i902;
import 'package:e_commerce_app/domain/repository/auth/auth_repository.dart'
    as _i281;
import 'package:e_commerce_app/domain/repository/category/category_repository.dart'
    as _i691;
import 'package:e_commerce_app/domain/repository/order/order_repository.dart'
    as _i624;
import 'package:e_commerce_app/domain/repository/product/product_repository.dart'
    as _i672;
import 'package:e_commerce_app/domain/usecases/auth/get_ages_use_case.dart'
    as _i410;
import 'package:e_commerce_app/domain/usecases/auth/get_user_use_case.dart'
    as _i372;
import 'package:e_commerce_app/domain/usecases/auth/is_logged_in_use_case.dart'
    as _i126;
import 'package:e_commerce_app/domain/usecases/auth/send_password_reset_email_use_case.dart'
    as _i86;
import 'package:e_commerce_app/domain/usecases/auth/sign_in_use_case.dart'
    as _i754;
import 'package:e_commerce_app/domain/usecases/auth/sign_up_use_case.dart'
    as _i376;
import 'package:e_commerce_app/domain/usecases/category/get_categories_use_case.dart'
    as _i469;
import 'package:e_commerce_app/domain/usecases/order/add_to_cart_use_case.dart'
    as _i939;
import 'package:e_commerce_app/domain/usecases/order/get_cart_products_use_case.dart'
    as _i907;
import 'package:e_commerce_app/domain/usecases/order/get_orders_use_case.dart'
    as _i318;
import 'package:e_commerce_app/domain/usecases/order/order_registration_use_case.dart'
    as _i918;
import 'package:e_commerce_app/domain/usecases/order/remove_cart_product_use_case.dart'
    as _i78;
import 'package:e_commerce_app/presentation/bloc/auth/age_display_cubit.dart'
    as _i599;
import 'package:e_commerce_app/presentation/bloc/auth/age_selection_cubit.dart'
    as _i338;
import 'package:e_commerce_app/presentation/bloc/auth/gender_selection_cubit.dart'
    as _i841;
import 'package:e_commerce_app/presentation/bloc/button/button_cubit.dart'
    as _i328;
import 'package:e_commerce_app/presentation/bloc/categories/categories_display_cubit.dart'
    as _i395;
import 'package:e_commerce_app/presentation/bloc/order/orders_display_cubit.dart'
    as _i765;
import 'package:e_commerce_app/presentation/bloc/product/products_display_cubit.dart'
    as _i87;
import 'package:e_commerce_app/presentation/bloc/splash/splash_cubit.dart'
    as _i790;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i338.AgeSelectionCubit>(() => _i338.AgeSelectionCubit());
    gh.factory<_i841.GenderSelectionCubit>(() => _i841.GenderSelectionCubit());
    gh.factory<_i328.ButtonCubit>(() => _i328.ButtonCubit());
    gh.lazySingleton<_i1065.AuthRemoteDataSource>(
      () => _i1065.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i591.OrderRemoteDataSource>(
      () => _i591.OrderRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i398.ProductRemoteDataSource>(
      () => _i398.ProductRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i398.CategoryRemoteDataSource>(
      () => _i398.CategoryRemoteDataSourceImpl(),
    );
    gh.factory<_i87.ProductsDisplayCubit>(
      () => _i87.ProductsDisplayCubit(gh<_i729.UseCase<dynamic, dynamic>>()),
    );
    gh.lazySingleton<_i672.ProductRepository>(
      () => _i902.ProductRepositoryImpl(gh<_i398.ProductRemoteDataSource>()),
    );
    gh.lazySingleton<_i691.CategoryRepository>(
      () => _i971.CategoryRepositoryImpl(gh<_i398.CategoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i624.OrderRepository>(
      () => _i150.OrderRepositoryImpl(gh<_i591.OrderRemoteDataSource>()),
    );
    gh.lazySingleton<_i939.AddToCartUseCase>(
      () => _i939.AddToCartUseCase(gh<_i624.OrderRepository>()),
    );
    gh.lazySingleton<_i907.GetCartProductsUseCase>(
      () => _i907.GetCartProductsUseCase(gh<_i624.OrderRepository>()),
    );
    gh.lazySingleton<_i318.GetOrdersUseCase>(
      () => _i318.GetOrdersUseCase(gh<_i624.OrderRepository>()),
    );
    gh.lazySingleton<_i918.OrderRegistrationUseCase>(
      () => _i918.OrderRegistrationUseCase(gh<_i624.OrderRepository>()),
    );
    gh.lazySingleton<_i78.RemoveCartProductUseCase>(
      () => _i78.RemoveCartProductUseCase(gh<_i624.OrderRepository>()),
    );
    gh.lazySingleton<_i281.AuthRepository>(
      () => _i873.AuthRepositoryImpl(gh<_i1065.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i469.GetCategoriesUseCase>(
      () => _i469.GetCategoriesUseCase(gh<_i691.CategoryRepository>()),
    );
    gh.factory<_i395.CategoriesDisplayCubit>(
      () => _i395.CategoriesDisplayCubit(gh<_i469.GetCategoriesUseCase>()),
    );
    gh.factory<_i765.OrdersDisplayCubit>(
      () => _i765.OrdersDisplayCubit(gh<_i318.GetOrdersUseCase>()),
    );
    gh.lazySingleton<_i410.GetAgesUseCase>(
      () => _i410.GetAgesUseCase(gh<_i281.AuthRepository>()),
    );
    gh.lazySingleton<_i372.GetUserUseCase>(
      () => _i372.GetUserUseCase(gh<_i281.AuthRepository>()),
    );
    gh.lazySingleton<_i126.IsLoggedInUseCase>(
      () => _i126.IsLoggedInUseCase(gh<_i281.AuthRepository>()),
    );
    gh.lazySingleton<_i86.SendPasswordResetEmailUseCase>(
      () => _i86.SendPasswordResetEmailUseCase(gh<_i281.AuthRepository>()),
    );
    gh.lazySingleton<_i754.SignInUseCase>(
      () => _i754.SignInUseCase(gh<_i281.AuthRepository>()),
    );
    gh.lazySingleton<_i376.SignUpUseCase>(
      () => _i376.SignUpUseCase(gh<_i281.AuthRepository>()),
    );
    gh.factory<_i790.SplashCubit>(
      () => _i790.SplashCubit(gh<_i126.IsLoggedInUseCase>()),
    );
    gh.factory<_i599.AgeDisplayCubit>(
      () => _i599.AgeDisplayCubit(gh<_i410.GetAgesUseCase>()),
    );
    return this;
  }
}
