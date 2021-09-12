    import XCTest
    @testable import Summer

    final class SummerTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            XCTAssertEqual(Summer().text, "Hello, World!")
//            Container.register(protocolType: Animal.self, name: "cat") {
//                CatClass()
//            }
//            Container.register(protocolType: Animal.self, name: "dog") {
//                DogClass()
//            }
//            let human = HumanClass()
//            human.play()
            
            Container.register(protocolType: ParentProtocol.self) {
                Parent()
            }
            Container.register(protocolType: ChildProtocol.self) {
                Child()
            }
            let test = Parent()
            test.test()
        }
    }
