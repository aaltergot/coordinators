import Foundation

class AppServiceLocator:
    HasLoginService,
    HasCredentialStore,
    HasUserInfoService,
    HasBookIntroLessonService {
    
    static var shared = AppServiceLocator(
        loginService: LoginServiceImpl.shared,
        credentialStore: CredentialStoreImpl(),
        userInfoService: UserInfoServiceImpl(),
        bookIntroLessonService: BookIntroLessonServiceImpl()
    )
    
    private(set) var loginService: LoginService
    private(set) var credentialStore: CredentialStore
    private(set) var userInfoService: UserInfoService
    private(set) var bookIntroLessonService: BookIntroLessonService
    
    init(
        loginService: LoginService,
        credentialStore: CredentialStore,
        userInfoService: UserInfoService,
        bookIntroLessonService: BookIntroLessonService
    ) {
        self.loginService = loginService
        self.credentialStore = credentialStore
        self.userInfoService = userInfoService
        self.bookIntroLessonService = bookIntroLessonService
    }
}

