import Foundation

public class LeadGenServiceLocator {
    public static var shared: (
        HasCredentialStore
        & HasUserInfoService
        & HasBookIntroLessonService
    )!
}
