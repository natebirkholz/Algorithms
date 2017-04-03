//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let array = [1,87,54,23,77,24,51,62,34,38,11,3,5,69,99,34,12,21,3,1,66,74,5]

var sorted = array.sorted()

let this = sorted.binarySearch(22)

var bst = BinarySearchTree(value: 50)
bst.add(value: 5)
bst.add(value: 22)
bst.add(value: 23)
bst.add(value: 4)
bst.add(value: 11)
bst.add(value: 76)
bst.add(value: 54)
bst.add(value: 64)
bst.add(value: 7)
bst.add(value: 9)

let bs = BucketSorter(numberOfBuckets: 10, maxValue: 100)
let that = bs.bucketSort(array: array)

let hash = HashTable<String, Int>(size: 256)
hash.add(key: "Nate", value: 24)
hash.add(key: "Hannah", value: 354)

let another = hash.find(key: "Hannah")

let ll = LinkedList<Int>()

ll.append(34)
ll.append(24)
ll.push(11)
ll.pop()
ll.append(122)
ll.append(5)
ll.append(23)
ll.append(12)
ll.append(36)

let anArray = array


let newnew = anArray.quicksorted()

//let aNew = MergeSorter.mergeSorted(array: anArray)


