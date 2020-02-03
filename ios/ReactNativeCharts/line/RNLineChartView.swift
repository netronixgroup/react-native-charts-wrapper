//  Created by xudong wu on 24/02/2017.
//  Copyright wuxudong
//

import Charts
import SwiftyJSON

class RNLineChartView: RNBarLineChartViewBase {
    let _chart: LineChartView;
    let _dataExtract : LineDataExtract;
    
    override var chart: LineChartView {
        return _chart
    }
    
    override var dataExtract: DataExtract {
        return _dataExtract
    }
    
    override init(frame: CoreGraphics.CGRect) {
        
        self._chart = LineChartView(frame: frame)
        self._dataExtract = LineDataExtract()
        
        super.init(frame: frame);
        
        self._chart.delegate = self
        
        self.addSubview(_chart);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK :- Overriding RNBarLineChartViewBase
    override func setScaleEnabled(_  enabled: Bool) {
        // Fallback to disable property setting
    }

    override func setScaleXEnabled(_  enabled: Bool) {
        // Fallback to disable property setting
    }

    override func setScaleYEnabled(_  enabled: Bool) {
        // Fallback to disable property setting
    }

    override func setPinchZoom(_  enabled: Bool) {
        // Fallback to disable property setting
    }
    
    override func setAxisScaleProfile(_ config: NSDictionary) {
        if let xAxisScaling = config["xAxisScaling"] as? Bool, let yAxisScaling = config["yAxisScaling"] as? Bool {
            self._chart.setScaleEnabled(xAxisScaling || yAxisScaling)
            self._chart.pinchZoomEnabled = xAxisScaling || yAxisScaling
            self._chart.scaleXEnabled = xAxisScaling
            self._chart.scaleYEnabled = yAxisScaling
        } else {
            print("Incorrect axisScaleProfile parameters")
        }
    }
}
