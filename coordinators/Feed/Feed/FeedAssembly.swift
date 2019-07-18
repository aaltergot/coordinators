class FeedAssembly {
    
    func createModule(_ inOut: @escaping FeedInOut) -> FeedViewType {
        let view = FeedView(
            nibName: String(describing: FeedView.self),
            bundle: nil
        )
        let presenter = FeedPresenter(viewIn: view, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
