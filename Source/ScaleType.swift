//
//  ScaleType.swift
//  Lotus
//
//  Created by Vladislav Kondrashkov on 8/31/19.
//  Copyright © 2019 Vladislav Kondrashkov. All rights reserved.
//

/**
 Defines changing dimension for scaling animation
 */
public enum ScaleType {
    /**
     Indicates that scaling animation would change width via transform.
     */
    case width

    /**
     Indicates that scaling animation would change height via transform
     */
    case height
}
