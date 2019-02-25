//
//  AppDelegate.swift
//  Llama
//
//  Created by Mathias Quintero on 24.02.19.
//  Copyright © 2019 Mathias Quintero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let example = """
        let helloWorld = "Hello World"

        type List<T> = T::List<T> | ()

        List<T>.count = match self with
            | h::t -> 1 + t.count()
            | () -> 0

        List<T>.reduce(_ accumulator, _ nextResult) = match self with
            | h::t -> t.reduce(nextResult(accumulator, h))
            | () -> accumulator

        List<T>.map(f) = match self with
            | h::t -> f(h)::t.map(f)
            | () -> ()

        List<T>.flatMap(f) = match self with
            | h::t -> f(h).appending(list: t.flatMap(f))
            | () -> ()

        List<T>.appending(_ element) = match self with
            | h::t -> h::t.appending(element)
            | () -> element::()

        List<T>.reversed = match self with
            | h::t -> t.reversed().appending(h)
            | () -> ()

        List<T>.insertSorted(_ element) = match self with
            | h::t -> element::self if element < h else h::t.insertSorted(element)
            | () -> element::()

        List<T>.sorted = self.reduce((), (acc, elm) -> acc.insertSorted(elm))

        { appending: (T) -> Self }<T>.appending(list: List<T>) = match l with
            | h::t -> self.appending(h).appending(list: t)
            | () -> self

        { appending: (T) -> Self, reversed: () -> Self }<T>.prepending(_ element: T) = self.reversed()
                                                                                           .appending(element)
                                                                                           .reversed()
        """
        
        do {
            let identifier = try Array<Expression>(input: example)
            print(identifier)
        } catch {
            print(error)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

