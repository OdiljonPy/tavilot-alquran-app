
import 'package:get_it/get_it.dart';

import '../../repository/auth_repository.dart';
import '../../repository/impl/auth_repository_impl.dart';
import '../handlers/handlers.dart';
import '../routes/app_router.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  // getIt.registerSingleton<SettingsRepository>(SettingsSettingsRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  // getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  // getIt.registerSingleton<ShopsRepository>(ShopsRepositoryImpl());
  // getIt.registerSingleton<BrandsRepository>(BrandsRepositoryImpl());
  // getIt.registerSingleton<GalleryRepositoryFacade>(GalleryRepository());
  // getIt.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  // getIt.registerSingleton<CurrenciesRepository>(CurrenciesRepositoryImpl());
  // getIt.registerSingleton<AddressRepository>(AddressRepositoryImpl());
  // getIt.registerSingleton<PaymentsRepository>(PaymentsRepositoryImpl());
  // getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  // getIt.registerSingleton<NotificationRepository>(NotificationRepositoryImpl());
  // getIt.registerSingleton<UsersRepository>(UsersRepositoryImpl());
  // getIt.registerSingleton<CommentsRepository>(CommentsRepositoryImpl());
  // getIt.registerSingleton<WalletRepository>(WalletRepositoryImpl());
  // getIt.registerSingleton<StoriesRepository>(StoriesRepositoryImpl());
  // getIt.registerSingleton<AdsRepository>(AdsRepositoryImpl());
  // getIt.registerSingleton<DiscountsRepository>(DiscountsRepositoryImpl());
  // getIt.registerSingleton<StockRepository>(StockRepositoryImpl());
  // getIt.registerSingleton<SubscriptionsRepository>(SubscriptionsRepositoryImpl());
  // getIt.registerSingleton<LooksRepository>(LooksRepositoryImpl());
  // getIt.registerSingleton<ServiceMasterRepository>(ServiceMasterRepositoryImpl());
  // getIt.registerSingleton<ServiceRepository>(ServiceRepositoryImpl());
}

final dioHttp = getIt.get<HttpService>();
final appRouter = getIt.get<AppRouter>();

// final settingsRepository = getIt.get<SettingsRepository>();
final authRepository = getIt.get<AuthRepository>();
// final productsRepository = getIt.get<ProductsRepository>();
// final shopsRepository = getIt.get<ShopsRepository>();
// final brandsRepository = getIt.get<BrandsRepository>();
// final galleryRepository = getIt.get<GalleryRepositoryFacade>();
// final categoriesRepository = getIt.get<CategoriesRepository>();
// final currenciesRepository = getIt.get<CurrenciesRepository>();
// final addressRepository = getIt.get<AddressRepository>();
// final commentsRepository = getIt.get<CommentsRepository>();
// final paymentsRepository = getIt.get<PaymentsRepository>();
// final walletRepository = getIt.get<WalletRepository>();
// final ordersRepository = getIt.get<OrdersRepository>();
// final notificationRepository = getIt.get<NotificationRepository>();
// final usersRepository = getIt.get<UsersRepository>();
// final storiesRepository = getIt.get<StoriesRepository>();
// final adsRepository = getIt.get<AdsRepository>();
// final discountRepository = getIt.get<DiscountsRepository>();
// final stockRepository = getIt.get<StockRepository>();
// final subscriptionRepository = getIt.get<SubscriptionsRepository>();
// final looksRepository = getIt.get<LooksRepository>();
// final serviceMasterRepository = getIt.get<ServiceMasterRepository>();
// final serviceRepository = getIt.get<ServiceRepository>();
