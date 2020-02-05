public protocol HasUserInfoService {
    var userInfoService: UserInfoService! { get }
}

public protocol UserInfoService {
}

public class UserInfoServiceImpl: UserInfoService {
}
