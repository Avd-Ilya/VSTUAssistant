//
//  AimyboxCusSkl.swift
//  AimyboxUI
//
//  Created by Avdeev Ilya Aleksandrovich on 14.07.2021.
//  Copyright © 2021 NSI. All rights reserved.
//

import Aimybox
import AimyboxUI
import Foundation

public class ScheduleSkill: CustomSkill {

    public typealias TRequest = AimyboxRequest

    public typealias TResponse = AimyboxResponse


    public func onRequest(_ request: AimyboxRequest) -> AimyboxRequest {
        let group = Data(base64Encoded: String("ИВТ-263"))
        request.data["group"] = group
        return request
    }

    public func canHandle(response: AimyboxResponse) -> Bool {
        if response.query.contains("расписание") {
            return true
        }else {
         return false
        }
    }

    public func onResponse(_ response: AimyboxResponse, _ aimybox: Aimybox, default handler: (Response) -> ()) -> AimyboxResponse {

        return response
    }
}
