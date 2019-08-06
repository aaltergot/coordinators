class FeedAssembly {
    
    func createModule(_ out: @escaping FeedOut) -> FeedViewType {
        let view = FeedView(
            nibName: String(describing: FeedView.self),
            bundle: nil
        )
        view.out = out
        return view
    }
}
