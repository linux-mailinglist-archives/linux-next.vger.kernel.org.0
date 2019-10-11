Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23FF5D3A8E
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2019 10:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfJKIKb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 11 Oct 2019 04:10:31 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2048 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726461AbfJKIKb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Oct 2019 04:10:31 -0400
Received: from lhreml702-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 5045CC7A5D8573E9FA52;
        Fri, 11 Oct 2019 09:10:29 +0100 (IST)
Received: from LHREML523-MBS.china.huawei.com ([169.254.9.5]) by
 lhreml702-cah.china.huawei.com ([10.201.108.43]) with mapi id 14.03.0415.000;
 Fri, 11 Oct 2019 09:10:24 +0100
From:   Jonathan Cameron <jonathan.cameron@huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the staging.current
 tree
Thread-Topic: linux-next: Fixes tag needs some work in the staging.current
 tree
Thread-Index: AQHVf6tMZNXkRie2YEu0GYlsfORIhKdVFtCg
Date:   Fri, 11 Oct 2019 08:10:23 +0000
Message-ID: <53418B0A3A5CEF439F1108674285B0A903FE8CC8@lhreml523-mbs.china.huawei.com>
References: <20191011074242.3d78c336@canb.auug.org.au>
In-Reply-To: <20191011074242.3d78c336@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.226.61]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen

Sorry, I've clearly let another one of these through.

Stupid question of the day.  Don't suppose you can share how you check these?

Thanks,

Jonathan


-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: 10 October 2019 21:43
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Lorenzo Bianconi <lorenzo@kernel.org>; Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: linux-next: Fixes tag needs some work in the staging.current tree

Hi all,

In commit

  85ae3aeedecc ("iio: imu: st_lsm6dsx: forbid 0 sensor sensitivity")

Fixes tag

  Fixes: c8d4066c7246 ("iio: imu: st_lsm6dsx: remove invalid gain value for LSM9DS1")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 0f7e17286b45 ("iio: imu: st_lsm6dsx: remove invalid gain value for LSM9DS1")

-- 
Cheers,
Stephen Rothwell
