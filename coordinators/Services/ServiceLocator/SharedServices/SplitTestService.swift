public protocol HasSplitTestService {
    var splitTestService: SplitTestService { get }
}

public protocol SplitTestService {
}

public class SplitTestServiceImpl: SplitTestService {
}
