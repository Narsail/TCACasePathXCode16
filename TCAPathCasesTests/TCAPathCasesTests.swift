//
//  TCAPathCasesTests.swift
//  TCAPathCasesTests
//
//  Created by David Moeller on 11/06/2024.
//

import XCTest
import ComposableArchitecture
@testable import TCAPathCases

final class TCAPathCasesTests: XCTestCase {

  @MainActor
  func testExample() async throws {
    let testStore = TestStore(initialState: ParentReducer.State(), reducer: { ParentReducer() })
    
    await testStore.send(\.destination.child.increaseCount) {
      $0.destination?.child?.count = 1
    }
    
  }

}
