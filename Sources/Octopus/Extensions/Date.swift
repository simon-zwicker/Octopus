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

	/// First Day of Month
	var firstDayOfMonth: Date? {
		var components = Calendar.current.dateComponents([.year, .month], from: self)
		components.day = 1
		return Calendar.current.date(from: components)
	}

	/// Last Day of Month
	var lastDayOfMonth: Date? {
		var components = Calendar.current.dateComponents([.year, .month], from: self)
		components.month! += 1
		components.day = 0
		return Calendar.current.date(from: components)
	}

	/// Next Month of the same Day
	func nextMonth(_ value: Int = 1) -> Date? {
		var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
		components.month! += value

		if let nextDate = Calendar.current.date(from: components) {
			return nextDate
		} else {
			let range = Calendar.current.range(
				of: .day,
				in: .month,
				for: self.change(value, for: .month)!
			)
			components.day = range?.upperBound ?? components.day
			return Calendar.current.date(from: components)
		}
	}

	// Next Day
	func nextDay(_ value: Int = 1) -> Date? {
		self.change(value, for: .day)
	}

	// Next Week
	func nextWeek(_ value: Int = 1) -> Date? {
		self.change(value, for: .day)
	}

	// Next Year
	func nextYear(_ value: Int = 1) -> Date? {
		self.change(value, for: .year)
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
