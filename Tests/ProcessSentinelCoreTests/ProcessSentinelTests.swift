import Testing
@testable import ProcessSentinelCore

@Test func testRunawayDetection() async {
    let engine = ProcessSentinelEngine(cpuThreshold: 50.0)
    let procs = [
        ProcessRecord(pid: 1, name: "normal", cpuUsage: 10.0, memoryMB: 100, threshold: 50.0),
        ProcessRecord(pid: 2, name: "heavy", cpuUsage: 85.0, memoryMB: 2000, threshold: 50.0)
    ]
    let runaways = await engine.detectRunaways(processes: procs)
    #expect(runaways.count == 1)
    #expect(runaways[0].name == "heavy")
}
