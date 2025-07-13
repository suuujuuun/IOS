// MotionManager.swift (새 파일)
import Foundation
import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()

    @Published var x: Double = 0.0
    @Published var y: Double = 0.0

    init() {
        // 60fps로 데이터 업데이트
        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll  // 좌우 기울기
            self?.y = motion.pitch // 상하 기울기
        }
    }
}

