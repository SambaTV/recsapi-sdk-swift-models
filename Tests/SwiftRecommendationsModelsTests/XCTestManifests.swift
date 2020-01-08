import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftRecommendationsModelsTests.allTests),
    ]
}
#endif
