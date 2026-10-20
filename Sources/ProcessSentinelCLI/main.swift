import Foundation
import ProcessSentinelCore

@main
struct Main {
    static func main() async {
        print("=== ProcessSentinelCLI ===")
        let engine = ProcessSentinelEngine(cpuThreshold: 75.0)
        let sample = [
            ProcessRecord(pid: 101, name: "Xcode", cpuUsage: 12.5, memoryMB: 4096, threshold: 75.0),
            ProcessRecord(pid: 202, name: "RunawayCompiler", cpuUsage: 92.4, memoryMB: 8192, threshold: 75.0),
            ProcessRecord(pid: 303, name: "WindowServer", cpuUsage: 4.1, memoryMB: 512, threshold: 75.0)
        ]
        let runaways = await engine.detectRunaways(processes: sample)
        print("Detected \(runaways.count) runaway processes:")
        for r in runaways {
            print(" - PID \(r.pid): \(r.name) at \(r.cpuUsage)% CPU")
        }
    }
}
