import Foundation

class AppServiceLocator:
    HasLoginService,
    HasCredentialStore,
    HasUserInfoService,
    HasBookIntroLessonService {
    
    static var shared = AppServiceLocator()
    
    private(set) var loginService: LoginService!
    private(set) var credentialStore: CredentialStore!
    private(set) var userInfoService: UserInfoService!
    private(set) var bookIntroLessonService: BookIntroLessonService!

    static func setup() {
        self.setup(
            loginService: LoginServiceImpl.shared,
            credentialStore: CredentialStoreImpl(),
            userInfoService: UserInfoServiceImpl(),
            bookIntroLessonService: BookIntroLessonServiceImpl()
        )
    }
    
    static func setup(
        loginService: LoginService,
        credentialStore: CredentialStore,
        userInfoService: UserInfoService,
        bookIntroLessonService: BookIntroLessonService
    ) {
        self.shared.loginService = loginService
        self.shared.credentialStore = credentialStore
        self.shared.userInfoService = userInfoService
        self.shared.bookIntroLessonService = bookIntroLessonService
    }
}
