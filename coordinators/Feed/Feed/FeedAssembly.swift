class FeedAssembly {
    
    func createModule(_ out: @escaping FeedOut) -> FeedViewType {
        let view = FeedView(
            nibName: String(describing: FeedView.self),
            bundle: nil
        )
        let presenter = FeedPresenter(viewIn: view, out: out)
        view.viewOut = presenter
        return view
    }
}
