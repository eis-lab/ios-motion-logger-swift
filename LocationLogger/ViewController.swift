//
//  ViewController.swift
//  LocationLogger
//
//  Created by Jaewon Choi on 2023/03/02.
//

import UIKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController, CLLocationManagerDelegate {

    let motionManager: CMMotionManager = CMMotionManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let locationManager = CLLocationManager()
        locationManager.delegate = self

        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        motionManager.stopAccelerometerUpdates()
        motionManager.stopGyroUpdates()
        motionManager.stopMagnetometerUpdates()

        if motionManager.isAccelerometerAvailable {
            print("Accelerometer is available")
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                guard let acceleraometerData = data else { return }
                print("Accelerometer: \(acceleraometerData)")
            }
        }

        if motionManager.isGyroAvailable {
            print("Gyro is available")
            motionManager.gyroUpdateInterval = 0.01
            motionManager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
                guard let gyroData = data else { return }
                print("Gyro: \(gyroData)")
            }
        }

        if motionManager.isMagnetometerAvailable {
            print("Magnetometer is available")
            motionManager.magnetometerUpdateInterval = 0.01
            motionManager.startMagnetometerUpdates(to: OperationQueue.main) { (data, error) in
                guard let magnetometerData = data else { return }
                print("Mag: \(magnetometerData)")
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            print(location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(region)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print(region)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }

    func locationManager(_ manager: CLLocationManager, didFailRangingFor beaconConstraint: CLBeaconIdentityConstraint, error: Error) {
        print(error)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

