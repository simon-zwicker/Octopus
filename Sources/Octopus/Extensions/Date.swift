//
//  Date.swift
//  Octopus
//
//  Created by Simon Zwicker on 24.11.24.
//

import Foundation

public extension Date {
    
    /// Date is a day in a weekend
    var isWeekend: Bool {
        Calendar.current.isDateInWeekend(self)
    }
    
    /// Date is Today
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    /// Year of Date
    var year: Int {
        Calendar.current.component(.year, from: self)
    }
    
    /// Month of Date
    var month: Int {
        Calendar.current.component(.month, from: self)
    }
    
    /// Day of Date
    var day: Int {
        Calendar.current.component(.day, from: self)
    }
    
    /// Hour of Date
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }
    
    /// Minute of Date
    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }
    
    /// Second of Date
    var second: Int {
        Calendar.current.component(.second, from: self)
    }

	/// Next Month of the same Day
	var nextMonth: Date? {
		var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
		components.month! += 1

		if let nextDate = Calendar.current.date(from: components) {
			return nextDate
		} else {
			let range = Calendar.current.range(
				of: .day,
				in: .month,
				for: self.change(1, for: .month)!
			)
			components.day = range?.upperBound ?? components.day
			return Calendar.current.date(from: components)
		}
	}

	// Next Day
	var nextDay: Date? {
		self.change(1, for: .day)
	}

	// Next Week
	var nextWeek: Date? {
		self.change(7, for: .day)
	}

	// Next Year
	var nextYear: Date? {
		self.change(1, for: .year)
	}

	/// difference int by toDate & component
	func difference(to date: Date, component: Calendar.Component) -> DateComponents {
		Calendar.current.dateComponents([component], from: self, to: date)
	}

    /// change date by value & component type
    func change(_ value: Int, for component: Calendar.Component) -> Date? {
        Calendar.current.date(byAdding: component, value: value, to: self)
    }
}
