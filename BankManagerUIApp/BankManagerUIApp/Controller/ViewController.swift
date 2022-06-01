import UIKit

class ViewController: UIViewController {
    let mainStackView: UIStackView = UIStackView()
    let buttonStackView: UIStackView = UIStackView()
    let labelStackView: UIStackView = UIStackView()
    let scrollStackView: UIStackView = UIStackView()
    let leftScrollView: UIScrollView = UIScrollView()
    let rightScrollView: UIScrollView = UIScrollView()
    let waitingStackView: UIStackView = UIStackView()
    let workingStackView: UIStackView = UIStackView()
    let addClientButton = UIButton()
    let initializationButton = UIButton()
    let timerLabel: TimerLabel = TimerLabel()
    
    override func loadView() {
        view = .init()
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        configureMainStackView()
        mainStackView.addArrangedSubview(buttonStackView)
        configureButtonStackView()
        configureButtons()
        mainStackView.addArrangedSubview(timerLabel)
        configureTimerLabel()
        mainStackView.addArrangedSubview(labelStackView)
        configureLabelStackView()
        configureScrollStackView()
        mainStackView.addArrangedSubview(scrollStackView)
        leftScrollView.addSubview(waitingStackView)
        rightScrollView.addSubview(workingStackView)
        configureWatingStackView()
        configureWorkingStackView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        BankManager.createBank(delegate: self)
    }
    
    private func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        mainStackView.spacing = 10
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func configureButtonStackView() {
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.alignment = .leading
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.addArrangedSubview(addClientButton)
        buttonStackView.addArrangedSubview(initializationButton)
    }
    
    private func configureButtons() {
        addClientButton.setTitle("고객 10명 추가", for: .normal)
        addClientButton.setTitleColor(.systemBlue, for: .normal)
        addClientButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        addClientButton.addTarget(self, action: #selector(openBusiness), for: .touchUpInside)
        initializationButton.setTitle("초기화", for: .normal)
        initializationButton.setTitleColor(.systemRed, for: .normal)
        initializationButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        initializationButton.addTarget(self, action: #selector(initializeBusiness), for: .touchUpInside)
    }
    
    private func configureTimerLabel() {
        timerLabel.leftAnchor.constraint(
            equalTo: mainStackView.leftAnchor,
            constant: 110).isActive = true
    }
    
    @objc func openBusiness() {
        BankManager.openBankForUI()
        guard let timer = timerLabel.timer else {
            timerLabel.startTimer()
            return
        }
        if timer.isValid {
            return
        } else {
            timerLabel.startTimer()
        }
    }
    
    @objc func initializeBusiness() {
        BankManager.resetBankForUI()
        timerLabel.reset()
    }
    
    private func configureLabelStackView() {
        labelStackView.axis = .horizontal
        labelStackView.distribution = .fillEqually
        labelStackView.alignment = .leading
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        let watingLabel = UILabel()
        watingLabel.text = "대기중"
        watingLabel.font = .preferredFont(forTextStyle: .title1)
        watingLabel.textColor = .white
        watingLabel.backgroundColor = .systemGreen
        watingLabel.textAlignment = .center
        let workingLabel = UILabel()
        workingLabel.text = "업무중"
        workingLabel.font = .preferredFont(forTextStyle: .title1)
        workingLabel.textColor = .white
        workingLabel.backgroundColor = .systemIndigo
        workingLabel.textAlignment = .center
        labelStackView.addArrangedSubview(watingLabel)
        labelStackView.addArrangedSubview(workingLabel)
    }
    
    private func configureScrollStackView() {
        scrollStackView.axis = .horizontal
        scrollStackView.distribution = .fillEqually
        scrollStackView.alignment = .fill
        scrollStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollStackView.addArrangedSubview(leftScrollView)
        scrollStackView.addArrangedSubview(rightScrollView)
    }
    
    private func configureWatingStackView() {
        waitingStackView.axis = .vertical
        waitingStackView.distribution = .fill
        waitingStackView.alignment = .fill
        waitingStackView.spacing = 5
        waitingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            waitingStackView.topAnchor.constraint(
                equalTo: leftScrollView.contentLayoutGuide.topAnchor, constant: 5),
            waitingStackView.bottomAnchor.constraint(
                equalTo: leftScrollView.contentLayoutGuide.bottomAnchor),
            waitingStackView.leftAnchor.constraint(
                equalTo: leftScrollView.contentLayoutGuide.leftAnchor),
            waitingStackView.rightAnchor.constraint(
                equalTo: leftScrollView.contentLayoutGuide.rightAnchor),
            waitingStackView.widthAnchor.constraint(equalTo: leftScrollView.widthAnchor)
        ])
    }
    
    private func configureWorkingStackView() {
        workingStackView.axis = .vertical
        workingStackView.distribution = .fill
        workingStackView.alignment = .fill
        workingStackView.spacing = 5
        workingStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workingStackView.topAnchor.constraint(
                equalTo: rightScrollView.contentLayoutGuide.topAnchor, constant: 5),
            workingStackView.bottomAnchor.constraint(
                equalTo: rightScrollView.contentLayoutGuide.bottomAnchor),
            workingStackView.leftAnchor.constraint(
                equalTo: rightScrollView.contentLayoutGuide.leftAnchor),
            workingStackView.rightAnchor.constraint(
                equalTo: rightScrollView.contentLayoutGuide.rightAnchor),
            workingStackView.widthAnchor.constraint(equalTo: rightScrollView.widthAnchor)
        ])
    }
    
    private func setClientLabelToWorkingStackView(client: Client) {
        let clientLabel = ClientInformationLabel(waitingNumber: client.waitingNumber, bankTask: client.bankTask)
        self.workingStackView.addArrangedSubview(clientLabel)
    }
    
    private func removeClientLabel(from stackView: UIStackView, client: Client) {
        let watingNumber = client.waitingNumber
        stackView.arrangedSubviews.forEach {
            let clientLabel = $0 as? ClientInformationLabel
            if clientLabel?.waitingNumber == watingNumber {
                clientLabel?.removeFromSuperview()
            }
        }
    }
}

extension ViewController: BankDelegate {
    func lineUp(client: Client) {
        let clientInformtionLabel = ClientInformationLabel(waitingNumber: client.waitingNumber, bankTask: client.bankTask)
        waitingStackView.addArrangedSubview(clientInformtionLabel)
    }
    
    func closeBusiness(by completedClientCount: Int, workHours: String) {
        DispatchQueue.main.async {
            self.timerLabel.stop()
        }
    }
    
    func startWork(for client: Client) {
        DispatchQueue.main.async {
            self.removeClientLabel(from: self.waitingStackView, client: client)
            self.setClientLabelToWorkingStackView(client: client)
        }
    }
    
    func finishWork(for client: Client) {
        DispatchQueue.main.async {
            self.removeClientLabel(from: self.workingStackView, client: client)
        }
    }
    
    func reset() {
        DispatchQueue.main.async {
            self.timerLabel.stop()
        }
        
        waitingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        workingStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
