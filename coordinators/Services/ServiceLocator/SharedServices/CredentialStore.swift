public protocol HasCredentialStore {
    var credentialStore: CredentialStore { get }
}

public protocol CredentialStore {
}

public class CredentialStoreImpl: CredentialStore {
}
