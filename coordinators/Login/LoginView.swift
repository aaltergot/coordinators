class LoginView: LoginViewType, LoginViewIn {

    var viewOut: LoginViewOut?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut?.viewDidLoad()
    }

    private func setupView() {
        self.title = "Login"
    }

    @IBAction func loginButtonPressed() {
        viewOut?.loginButtonPressed()
    }
}
