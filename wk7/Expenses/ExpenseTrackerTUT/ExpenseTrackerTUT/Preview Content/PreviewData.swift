//
//  PreviewData.swift
//  ExpenseTrackerTUT
//
//  Created by ahmed casual on 10/19/23.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "BOFA", account: "Visa BOFA", merchant: "Apple", amount: 12.45, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction] (repeating: transactionPreviewData, count: 10)
