//
//  UbikeModel.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation

struct UbikeModel: Decodable {
    var sno: String? //站點編號
    var sna: String? //站點名稱
    var tot: Int? //站點總停車格數
    var sbi: Int? //目前車輛數
    var sarea: String? //行政區 ex.大安區、中山區
    var mday: String? //微笑單車各場站來源資料更新時間
    var lat: Double? //緯度
    var lng: Double? //經度
    var ar: String? //地址
    var sareaen: String? //英文行政區 ex.大安區、中山區
    var snaen: String? //英文站點名稱
    var aren: String? //英文地址
    var bemp: Int? //空位數量
    var act: String? //站點目前是否禁用 ex."0"禁用中, "1"啟用中
    var srcUpdateTime: String? //微笑單車系統發布資料更新的時間
    var updateTime: String? //北市府交通局數據平台經過處理後將資料存入DB的時間
    var infoTime: String? //微笑單車各場站來源資料更新時間
    var infoDate: String? //微笑單車各場站來源資料更新時間
}
