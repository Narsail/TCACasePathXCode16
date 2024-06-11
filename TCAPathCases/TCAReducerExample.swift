//
//  TCAReducerExample.swift
//  TCAPathCases
//
//  Created by David Moeller on 11/06/2024.
//

import Foundation
import ComposableArchitecture

import ComposableArchitecture

@Reducer
struct ParentReducer {
  
  @ObservableState
  struct State: Equatable {
    @Presents var destination: Destination.State?
  }
  
  enum Action {
    case destination(PresentationAction<Destination.Action>)
  }
  
  @Reducer(state: .equatable)
  enum Destination {
    case child(ChildReducer)
  }
  
  var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case .destination:
        return .none
      }
    }
    .ifLet(\.$destination, action: \.destination)
  }
  
}

import ComposableArchitecture

@Reducer
struct ChildReducer {
  
  @ObservableState
  struct State: Equatable {
    var count: Int = 0
  }
  
  enum Action {
    case increaseCount
  }
  
  var body: some Reducer<State, Action> {
    Reduce { state, action in
      switch action {
      case .increaseCount:
        state.count += 1
        return .none
      }
    }
  }
}
