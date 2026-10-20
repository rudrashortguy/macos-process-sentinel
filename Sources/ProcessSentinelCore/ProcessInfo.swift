import Foundation

public struct ProcessRecord: Codable, Sendable, Identifiable {
    public var id: Int32 { pid }
    public let pid: Int32
    public let name: String
    public let cpuUsage: Double
    public let memoryMB: Double
    public let isRunaway: Bool

    public init(pid: Int32, name: String, cpuUsage: Double, memoryMB: Double, threshold: Double) {
        self.pid = pid
        self.name = name
        self.cpuUsage = cpuUsage
        self.memoryMB = memoryMB
        self.isRunaway = cpuUsage > threshold
    }
}

public actor ProcessSentinelEngine {
    private var cpuThreshold: Double

    public init(cpuThreshold: Double = 80.0) {
        self.cpuThreshold = cpuThreshold
    }

    public func evaluate(processes: [ProcessRecord]) -> [ProcessRecord] {
        return processes.map { p in
            ProcessRecord(pid: p.pid, name: p.name, cpuUsage: p.cpuUsage, memoryMB: p.memoryMB, threshold: cpuThreshold)
        }
    }

    public func detectRunaways(processes: [ProcessRecord]) -> [ProcessRecord] {
        return processes.filter { $0.cpuUsage > cpuThreshold }
    }
}
