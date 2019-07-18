class ProfileView: ProfileViewType, ProfileViewIn {
    
    var viewOut: ProfileViewOut?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut?.viewDidLoad()
    }

    private func setupView() {
        self.title = "Profile"
    }

    @IBAction func settingsButtonPressed() {
        viewOut?.settingsButtonPressed()
    }
}
