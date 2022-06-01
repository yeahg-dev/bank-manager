# 🏦 은행 창구 관리 앱

## 👀 개요
클릭하면 해당 목차로 이동합니다🚀

- [1. 프로젝트 소개](#1-프로젝트-소개) 
    + [핵심 키워드](##-핵심-keyword)
    + [앱 소개](##-앱-소개)
    + [구조 소개](##-구조-소개)
-  [2. 프로젝트 Output](#2-프로젝트-output)
    + [**✨What I Learend**](##-what-I-Learned)
        + [Linked List로 Queue 타입 구현](##-linked-list로-queue-타입-구현)
        + [ConsoleApp과 UIApp의 공통 로직 모듈화](###-consoleapp과-uiapp의-공통-로직-모듈화)
        + [GCD를 활용한 동시성 프로그래밍 구현](###-gcd를-활용한-동시성-프로그래밍-구현)
    + [**💥Throuble Shooting**](##-trouble-shooting)
        + [Client수 증가에 따른 탐색시간 증가 ](###-client수-증가에-따른-탐색시간-증가)

<br>

# 1. 프로젝트 소개

- 기간 : 2021.12.20 ~ 2021.12.31
- 진행 방식 : 팀 프로젝트, 페어 프로그래밍
- 팀원 : [릴리](https://github.com/yeahg-dev?tab=repositories), [숲재](https://github.com/forestjae)
- STEP별 코드 리뷰 진행 / 리뷰어: [그린](https://github.com/GREENOVER)
- 스텝별 리뷰 바로가기👇

| [STEP1 PR](https://github.com/yagom-academy/ios-bank-manager/pull/106) | [STEP2 PR](https://github.com/yagom-academy/ios-bank-manager/pull/124) | [STEP3 PR](https://github.com/yagom-academy/ios-bank-manager/pull/134) | [STEP4 PR](https://github.com/yagom-academy/ios-bank-manager/pull/142) |
| -------- | -------- | -------- | -------- |

<br>

## 핵심 keyword
- `Linked-List` 자료구조로 `Queue` 타입 구현
- `Generic` 이해 및 적용
- Xcode 프로젝트 파일 구조 이해
- `Progamatical UI` (No Storyboard)
- `Delegate Pattern`
- `Timer`
- `동시성 프로그래밍`에 대한 이해
- `Dispatch Framework` 활용한 동시성 프로그래밍 구현
    - `DispatchQueue` 
    -  `DispatchWorkItem`
    - `DispatchGroup`
<br>

## 앱 소개 
업무 동시 처리를 동시성 프로그래밍으로 구현한 은행 창구 관리앱입니다.

은행원은 예금, 대출 고객을 입장한 순서대로 처리합니다.

---

입장한 순서대로 업무를 처리하고, 업무가 종료되면 타이머가 일시정지합니다.

<img src="https://user-images.githubusercontent.com/81469717/171251020-861853a0-52f4-4dba-8d62-72e5572b6852.gif" width = "250">

<br>

중간에 고객 10명을 대기열에 추가할 수 있습니다

<img src ="https://user-images.githubusercontent.com/81469717/171252955-c1ace448-767b-43dd-a3ba-6750bc568bed.gif" width = "250">

<br>

`초기화`를 누르면 모든 업무가 중단되고, 타이머가 0으로 셋팅됩니다.

<img src ="https://user-images.githubusercontent.com/81469717/171253478-0b777b1e-2205-42ec-a1d2-5bcebbf162bc.gif" width = "250">

<br>

## 구조 소개 

### Class Diagram
![](https://i.imgur.com/H7dABci.jpg)

<br>

# 2. 프로젝트 Output
## ✨ What I Learned

### Linked List로 Queue 타입 구현
은행의 고객 대기열은 FIFO로 관리 되며, 따라서 Queue 자료구조가 적합합니다. 

Queue를 Linked List로 구현한 이유는 요소의 추가 및 삭제 시간복잡도가 O(1)로 `enqueue`, `dequeue` 를 효율적으로 구현할 수 있기 때문입니다. 
- `dequeue` 는 `head` 를 새로운 요소로 대체합니다. `head` 의 접근 및 수정시간 복잡도 O(1)입니다. 
- `enqueue` 는  `tail`을 새로운 요소로 대체합니다. `tail`을 프로퍼티로 구현하여 접근과 추가의 시간복잡도를 O(1)로 개선했습니다. 

(추후 리뷰를 통해 Double Stack으로도 Queue를 구현할 수 있고 `enqueue`와 `dequeue`에 대한 시간복잡도가 동일하다는 것을 알게 되었습니다.)

[📁LinkedList.swift](https://github.com/yeahg-dev/ios-bank-manager/blob/step4/BankManagerShared/Model/LinkedList.swift)

[📁Queue.swift](https://github.com/yeahg-dev/ios-bank-manager/blob/step4/BankManagerShared/Model/Queue.swift)

<br>

### ConsoleApp과 UIApp의 공통 로직 모듈화
Mac의 Cosole앱과 iOS의 UI앱에서 공통적으로 사용되는 비지니스로직은  `BankManagerShared`폴더로 모듈화하여, 두개의 플랫폼(MacOS, iOS)에서 공유할 수 있도록 했습니다.

그리고 은행 개점, 은행 종료와 같이 사용자의 이벤트에 따른 행동을 `BankDelegate` 프로토콜로 정의했습니다. 
```swift
protocol BankDelegate {
    func lineUp(client: Client)
    func closeBusiness(by completedClientCount: Int, workHours: String)
    func startWork(for client: Client)
    func finishWork(for client: Client)
    func reset()
}

```
ConsoleApp은 `ConsoleManager`가, UIApp은 `ViewController`가 `BankDelegate`를 채택하여 플랫폼에 따라 커스텀하게 UserInterface를 구현할 수 있도록 역할을 분리했습니다. Delegate패턴을 적용하면 의존성을 줄이고, 유연한 설계가 가능하다는 점을 체감할 수 있었습니다. 

<br>

### GCD를 활용한 동시성 프로그래밍 구현
GCD의 API들을 사용해 동시성 프로그래밍을 구현해보았습니다.


- `DispatchQueue` : Queue에서 task를 FIFO로 내보내며, 어떤 스레드(main/gloabl)에서 수행할지, 어떤 방식(Serially/Concurrently)으로 task를 내보낼지 결정할 수 있음
- `DispatchGroup` : 여러 task를 하나의 단위로 묶어 관리 할 수 있는 API
- `DispatchSemaphore` : 공유자원에 동시에 접근할 수 있는 스레드의 개수를 제한하여 레이스 컨디션을 막을 수 있음


<br>

## 💥 Trouble Shooting
### Client수 증가에 따른 탐색시간 증가  

`distributeClient`메서드에서 `BankClerk`객체가 `클라이언트 Queue`를 순회하며 `BankClerk`이 가지고 있는 `workType`과 `Client`의 `workType`이 동일할때만 `remove`메서드를 사용하여 꺼내옵니다. `BankClerk` 배열을 순회하며 여러 쓰레드에서 비동기적으로 `distributeClient`메서드를 수행하고, `Client Queue`는 세마포어를 사용해 한번에 하나의 스레드에서만 접근 가능하도록 제한했습니다.

**문제 정의**

하지만 같은 `WorkType`의 Client가 연이어 대기하는 경우, 예를 들어 "예금-예금-예금-대출" 순서로 고객이 존재할때 대출 담당 은행원이 Client를 배정받지 못하고 놀고있는 시간은 길어집니다. 즉, 고객의 수가 많아지는 경우 탐색 시간이 길어져 불완전한 설계라고 판단하였습니다.(고객이 5만명 정도를 넘어가면 유의미하게 실행시간이 길어지는 것을 확인하였습니다.)

```swift
 private func makeBankClerksWork() {
    let group = DispatchGroup()
    for bankClerk in bankClerks {
        DispatchQueue.global().async(group: group) {
            self.distributeClient(to: bankClerk)
        }
    }
    group.wait()
}

private func distributeClient(to bankClerk: BankClerk) {
    while !self.clientQueue.isEmpty {
        semaphore.wait()
        var i = 0
        while let client = self.clientQueue.peek(i) {
            if client.workType == bankClerk.workType {
                break
            }
            i += 1
        }
        if let client = self.clientQueue.remove(at: i) {
            semaphore.signal()
            bankClerk.work(for: client)
            semaphore.wait()
            completedClientCount += 1
            semaphore.signal()
        } else {
        semaphore.signal()
        }
    }
}
```

**해결 시도**

DispatchSemaphore의 value를 해당 업무를 할 수 있는 은행원의 수라고 정의하고 아래와 같이 구현했습니다. 각각의 업무마다 DispatchSemaphore를 생성하여 각 업무에 배정된 은행원의 수 만큼 value를 부여했습니다.

```swift
let depositSemaphore = DispatchSemaphore(value: inChargeOfDeposits)
let loanSemaphore = DispatchSemaphore(value: inChargeOfLoan)
let group = DispatchGroup()
        
while let client = self.clientQueue.dequeue() {
    DispatchQueue.global().async(group: group) {
        switch client.bankTask {
        case .deposit:
            depositSemaphore.wait()
            self.makeBankClerkWork(for: client)
            depositSemaphore.signal()
        case .loan:
            loanSemaphore.wait()
            self.makeBankClerkWork(for: client)
            loanSemaphore.signal()
            }
        }
    }
group.wait()
}
```
