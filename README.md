# ๐ฆ ์ํ ์ฐฝ๊ตฌ ๊ด๋ฆฌ ์ฑ

## ๐ ๊ฐ์
ํด๋ฆญํ๋ฉด ํด๋น ๋ชฉ์ฐจ๋ก ์ด๋ํฉ๋๋ค๐

- [1. ํ๋ก์ ํธ ์๊ฐ](#1-ํ๋ก์ ํธ-์๊ฐ) 
    + [ํต์ฌ ํค์๋](##-ํต์ฌ-keyword)
    + [์ฑ ์๊ฐ](##-์ฑ-์๊ฐ)
    + [๊ตฌ์กฐ ์๊ฐ](##-๊ตฌ์กฐ-์๊ฐ)
-  [2. ํ๋ก์ ํธ Output](#2-ํ๋ก์ ํธ-output)
    + [**โจWhat I Learend**](##-what-I-Learned)
        + [Linked List๋ก Queue ํ์ ๊ตฌํ](##-linked-list๋ก-queue-ํ์-๊ตฌํ)
        + [ConsoleApp๊ณผ UIApp์ ๊ณตํต ๋ก์ง ๋ชจ๋ํ](###-consoleapp๊ณผ-uiapp์-๊ณตํต-๋ก์ง-๋ชจ๋ํ)
        + [GCD๋ฅผ ํ์ฉํ ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ ๊ตฌํ](###-gcd๋ฅผ-ํ์ฉํ-๋์์ฑ-ํ๋ก๊ทธ๋๋ฐ-๊ตฌํ)
    + [**๐ฅThrouble Shooting**](##-trouble-shooting)
        + [Client์ ์ฆ๊ฐ์ ๋ฐ๋ฅธ ํ์์๊ฐ ์ฆ๊ฐ ](###-client์-์ฆ๊ฐ์-๋ฐ๋ฅธ-ํ์์๊ฐ-์ฆ๊ฐ)

<br>

# 1. ํ๋ก์ ํธ ์๊ฐ

- ๊ธฐ๊ฐ : 2021.12.20 ~ 2021.12.31
- ์งํ ๋ฐฉ์ : ํ ํ๋ก์ ํธ, ํ์ด ํ๋ก๊ทธ๋๋ฐ
- ํ์ : [๋ฆด๋ฆฌ](https://github.com/yeahg-dev?tab=repositories), [์ฒ์ฌ](https://github.com/forestjae)
- STEP๋ณ ์ฝ๋ ๋ฆฌ๋ทฐ ์งํ / ๋ฆฌ๋ทฐ์ด: [๊ทธ๋ฆฐ](https://github.com/GREENOVER)
- ์คํ๋ณ ๋ฆฌ๋ทฐ ๋ฐ๋ก๊ฐ๊ธฐ๐

| [STEP1 PR](https://github.com/yagom-academy/ios-bank-manager/pull/106) | [STEP2 PR](https://github.com/yagom-academy/ios-bank-manager/pull/124) | [STEP3 PR](https://github.com/yagom-academy/ios-bank-manager/pull/134) | [STEP4 PR](https://github.com/yagom-academy/ios-bank-manager/pull/142) |
| -------- | -------- | -------- | -------- |

<br>

## ํต์ฌ keyword
- `Linked-List` ์๋ฃ๊ตฌ์กฐ๋ก `Queue` ํ์ ๊ตฌํ
- `Generic` ์ดํด ๋ฐ ์ ์ฉ
- Xcode ํ๋ก์ ํธ ํ์ผ ๊ตฌ์กฐ ์ดํด
- `Progamatical UI` (No Storyboard)
- `Delegate Pattern`
- `Timer`
- `๋์์ฑ ํ๋ก๊ทธ๋๋ฐ`์ ๋ํ ์ดํด
- `Dispatch Framework` ํ์ฉํ ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ ๊ตฌํ
    - `DispatchQueue` 
    -  `DispatchWorkItem`
    - `DispatchGroup`
<br>

## ์ฑ ์๊ฐ 
์๋ฌด ๋์ ์ฒ๋ฆฌ๋ฅผ ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ์ผ๋ก ๊ตฌํํ ์ํ ์ฐฝ๊ตฌ ๊ด๋ฆฌ์ฑ์๋๋ค.

์ํ์์ ์๊ธ, ๋์ถ ๊ณ ๊ฐ์ ์์ฅํ ์์๋๋ก ์ฒ๋ฆฌํฉ๋๋ค.

---

์์ฅํ ์์๋๋ก ์๋ฌด๋ฅผ ์ฒ๋ฆฌํ๊ณ , ์๋ฌด๊ฐ ์ข๋ฃ๋๋ฉด ํ์ด๋จธ๊ฐ ์ผ์์ ์งํฉ๋๋ค.

<img src="https://user-images.githubusercontent.com/81469717/171251020-861853a0-52f4-4dba-8d62-72e5572b6852.gif" width = "250">

<br>

์ค๊ฐ์ ๊ณ ๊ฐ 10๋ช์ ๋๊ธฐ์ด์ ์ถ๊ฐํ  ์ ์์ต๋๋ค

<img src ="https://user-images.githubusercontent.com/81469717/171252955-c1ace448-767b-43dd-a3ba-6750bc568bed.gif" width = "250">

<br>

`์ด๊ธฐํ`๋ฅผ ๋๋ฅด๋ฉด ๋ชจ๋  ์๋ฌด๊ฐ ์ค๋จ๋๊ณ , ํ์ด๋จธ๊ฐ 0์ผ๋ก ์ํ๋ฉ๋๋ค.

<img src ="https://user-images.githubusercontent.com/81469717/171253478-0b777b1e-2205-42ec-a1d2-5bcebbf162bc.gif" width = "250">

<br>

## ๊ตฌ์กฐ ์๊ฐ 

### Class Diagram
![](https://i.imgur.com/H7dABci.jpg)

<br>

# 2. ํ๋ก์ ํธ Output
## โจ What I Learned

### Linked List๋ก Queue ํ์ ๊ตฌํ
์ํ์ ๊ณ ๊ฐ ๋๊ธฐ์ด์ FIFO๋ก ๊ด๋ฆฌ ๋๋ฉฐ, ๋ฐ๋ผ์ Queue ์๋ฃ๊ตฌ์กฐ๊ฐ ์ ํฉํฉ๋๋ค. 

Queue๋ฅผ Linked List๋ก ๊ตฌํํ ์ด์ ๋ ์์์ ์ถ๊ฐ ๋ฐ ์ญ์  ์๊ฐ๋ณต์ก๋๊ฐ O(1)๋ก `enqueue`, `dequeue` ๋ฅผ ํจ์จ์ ์ผ๋ก ๊ตฌํํ  ์ ์๊ธฐ ๋๋ฌธ์๋๋ค. 
- `dequeue` ๋ `head` ๋ฅผ ์๋ก์ด ์์๋ก ๋์ฒดํฉ๋๋ค. `head` ์ ์ ๊ทผ ๋ฐ ์์ ์๊ฐ ๋ณต์ก๋ O(1)์๋๋ค. 
- `enqueue` ๋  `tail`์ ์๋ก์ด ์์๋ก ๋์ฒดํฉ๋๋ค. `tail`์ ํ๋กํผํฐ๋ก ๊ตฌํํ์ฌ ์ ๊ทผ๊ณผ ์ถ๊ฐ์ ์๊ฐ๋ณต์ก๋๋ฅผ O(1)๋ก ๊ฐ์ ํ์ต๋๋ค. 

(์ถํ ๋ฆฌ๋ทฐ๋ฅผ ํตํด Double Stack์ผ๋ก๋ Queue๋ฅผ ๊ตฌํํ  ์ ์๊ณ  `enqueue`์ `dequeue`์ ๋ํ ์๊ฐ๋ณต์ก๋๊ฐ ๋์ผํ๋ค๋ ๊ฒ์ ์๊ฒ ๋์์ต๋๋ค.)

[๐LinkedList.swift](https://github.com/yeahg-dev/ios-bank-manager/blob/step4/BankManagerShared/Model/LinkedList.swift)

[๐Queue.swift](https://github.com/yeahg-dev/ios-bank-manager/blob/step4/BankManagerShared/Model/Queue.swift)

<br>

### ConsoleApp๊ณผ UIApp์ ๊ณตํต ๋ก์ง ๋ชจ๋ํ
Mac์ Cosole์ฑ๊ณผ iOS์ UI์ฑ์์ ๊ณตํต์ ์ผ๋ก ์ฌ์ฉ๋๋ ๋น์ง๋์ค๋ก์ง์  `BankManagerShared`ํด๋๋ก ๋ชจ๋ํํ์ฌ, ๋๊ฐ์ ํ๋ซํผ(MacOS, iOS)์์ ๊ณต์ ํ  ์ ์๋๋ก ํ์ต๋๋ค.

๊ทธ๋ฆฌ๊ณ  ์ํ ๊ฐ์ , ์ํ ์ข๋ฃ์ ๊ฐ์ด ์ฌ์ฉ์์ ์ด๋ฒคํธ์ ๋ฐ๋ฅธ ํ๋์ `BankDelegate` ํ๋กํ ์ฝ๋ก ์ ์ํ์ต๋๋ค. 
```swift
protocol BankDelegate {
    func lineUp(client: Client)
    func closeBusiness(by completedClientCount: Int, workHours: String)
    func startWork(for client: Client)
    func finishWork(for client: Client)
    func reset()
}

```
ConsoleApp์ `ConsoleManager`๊ฐ, UIApp์ `ViewController`๊ฐ `BankDelegate`๋ฅผ ์ฑํํ์ฌ ํ๋ซํผ์ ๋ฐ๋ผ ์ปค์คํํ๊ฒ UserInterface๋ฅผ ๊ตฌํํ  ์ ์๋๋ก ์ญํ ์ ๋ถ๋ฆฌํ์ต๋๋ค. Delegateํจํด์ ์ ์ฉํ๋ฉด ์์กด์ฑ์ ์ค์ด๊ณ , ์ ์ฐํ ์ค๊ณ๊ฐ ๊ฐ๋ฅํ๋ค๋ ์ ์ ์ฒด๊ฐํ  ์ ์์์ต๋๋ค. 

<br>

### GCD๋ฅผ ํ์ฉํ ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ ๊ตฌํ
GCD์ API๋ค์ ์ฌ์ฉํด ๋์์ฑ ํ๋ก๊ทธ๋๋ฐ์ ๊ตฌํํด๋ณด์์ต๋๋ค.


- `DispatchQueue` : Queue์์ task๋ฅผ FIFO๋ก ๋ด๋ณด๋ด๋ฉฐ, ์ด๋ค ์ค๋ ๋(main/gloabl)์์ ์ํํ ์ง, ์ด๋ค ๋ฐฉ์(Serially/Concurrently)์ผ๋ก task๋ฅผ ๋ด๋ณด๋ผ์ง ๊ฒฐ์ ํ  ์ ์์
- `DispatchGroup` : ์ฌ๋ฌ task๋ฅผ ํ๋์ ๋จ์๋ก ๋ฌถ์ด ๊ด๋ฆฌ ํ  ์ ์๋ API
- `DispatchSemaphore` : ๊ณต์ ์์์ ๋์์ ์ ๊ทผํ  ์ ์๋ ์ค๋ ๋์ ๊ฐ์๋ฅผ ์ ํํ์ฌ ๋ ์ด์ค ์ปจ๋์์ ๋ง์ ์ ์์


<br>

## ๐ฅ Trouble Shooting
### Client์ ์ฆ๊ฐ์ ๋ฐ๋ฅธ ํ์์๊ฐ ์ฆ๊ฐ  

`distributeClient`๋ฉ์๋์์ `BankClerk`๊ฐ์ฒด๊ฐ `ํด๋ผ์ด์ธํธ Queue`๋ฅผ ์ํํ๋ฉฐ `BankClerk`์ด ๊ฐ์ง๊ณ  ์๋ `workType`๊ณผ `Client`์ `workType`์ด ๋์ผํ ๋๋ง `remove`๋ฉ์๋๋ฅผ ์ฌ์ฉํ์ฌ ๊บผ๋ด์ต๋๋ค. `BankClerk` ๋ฐฐ์ด์ ์ํํ๋ฉฐ ์ฌ๋ฌ ์ฐ๋ ๋์์ ๋น๋๊ธฐ์ ์ผ๋ก `distributeClient`๋ฉ์๋๋ฅผ ์ํํ๊ณ , `Client Queue`๋ ์ธ๋งํฌ์ด๋ฅผ ์ฌ์ฉํด ํ๋ฒ์ ํ๋์ ์ค๋ ๋์์๋ง ์ ๊ทผ ๊ฐ๋ฅํ๋๋ก ์ ํํ์ต๋๋ค.

**๋ฌธ์  ์ ์**

ํ์ง๋ง ๊ฐ์ `WorkType`์ Client๊ฐ ์ฐ์ด์ด ๋๊ธฐํ๋ ๊ฒฝ์ฐ, ์๋ฅผ ๋ค์ด "์๊ธ-์๊ธ-์๊ธ-๋์ถ" ์์๋ก ๊ณ ๊ฐ์ด ์กด์ฌํ ๋ ๋์ถ ๋ด๋น ์ํ์์ด Client๋ฅผ ๋ฐฐ์ ๋ฐ์ง ๋ชปํ๊ณ  ๋๊ณ ์๋ ์๊ฐ์ ๊ธธ์ด์ง๋๋ค. ์ฆ, ๊ณ ๊ฐ์ ์๊ฐ ๋ง์์ง๋ ๊ฒฝ์ฐ ํ์ ์๊ฐ์ด ๊ธธ์ด์ ธ ๋ถ์์ ํ ์ค๊ณ๋ผ๊ณ  ํ๋จํ์์ต๋๋ค.(๊ณ ๊ฐ์ด 5๋ง๋ช ์ ๋๋ฅผ ๋์ด๊ฐ๋ฉด ์ ์๋ฏธํ๊ฒ ์คํ์๊ฐ์ด ๊ธธ์ด์ง๋ ๊ฒ์ ํ์ธํ์์ต๋๋ค.)

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

**ํด๊ฒฐ ์๋**

DispatchSemaphore์ value๋ฅผ ํด๋น ์๋ฌด๋ฅผ ํ  ์ ์๋ ์ํ์์ ์๋ผ๊ณ  ์ ์ํ๊ณ  ์๋์ ๊ฐ์ด ๊ตฌํํ์ต๋๋ค. ๊ฐ๊ฐ์ ์๋ฌด๋ง๋ค DispatchSemaphore๋ฅผ ์์ฑํ์ฌ ๊ฐ ์๋ฌด์ ๋ฐฐ์ ๋ ์ํ์์ ์ ๋งํผ value๋ฅผ ๋ถ์ฌํ์ต๋๋ค.

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
