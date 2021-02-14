import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PTSideBarMenuTests.allTests),
    ]
}
#endif
