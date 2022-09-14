//
//  MyDeviceActivityReport.swift
//  MyDeviceActivityReport
//
//  Created by Jun Guo on 2022-09-14.
//

import DeviceActivity
import SwiftUI

@main
struct MyDeviceActivityReport: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        TotalActivityReport { totalActivity in
            TotalActivityView(totalActivity: totalActivity)
        }
        // Add more reports here...
    }
}
