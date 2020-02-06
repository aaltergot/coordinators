import Foundation

public class SelfStudyServiceLocator {
    public static var shared: (
        HasLoginService
        & HasUserInfoService
      //& SplitTestService
    )!
}
