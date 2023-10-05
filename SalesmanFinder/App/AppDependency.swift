//
//  AppDependency.swift
//  SalesmanFinder
//
//  Created by Markus on 05.10.23.
//

import Foundation

/// AppDependency follows the composition root design pattern. It's a structured way to share dependencies between scenes.
///
/// See this post for further explanation: https://simonbs.dev/posts/introducing-the-composition-root-pattern-in-a-swift-codebase/
struct AppDependency {
    var searchRepository: any SearchRepositoryProtocol {
        SearchRepository()
    }
}
