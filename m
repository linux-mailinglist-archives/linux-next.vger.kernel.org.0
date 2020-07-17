Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAAA7222FF1
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 02:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgGQAZX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 20:25:23 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:41572 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbgGQAZX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Jul 2020 20:25:23 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 720149525F149080D880;
        Fri, 17 Jul 2020 08:25:21 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.238) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 17 Jul 2020
 08:25:11 +0800
Subject: Re: [PATCH -next v2] usb: usbtest: reduce stack usage in test_queue
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-next@vger.kernel.org>, <gustavoars@kernel.org>,
        <stern@rowland.harvard.edu>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <qiang.zhang@windriver.com>,
        "Wanghui (John)" <john.wanghui@huawei.com>
References: <20200716082735.66342-1-cuibixuan@huawei.com>
 <42fe1a83-38a5-816b-9258-8a344008f398@huawei.com>
 <20200716142620.GB2176745@kroah.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <24bb2664-ce98-ff63-4ec5-ae4969f22602@huawei.com>
Date:   Fri, 17 Jul 2020 08:25:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200716142620.GB2176745@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.238]
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/7/16 22:26, Greg KH wrote:
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
>> ---
>>  drivers/usb/misc/usbtest.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
> What changed from v1?  Always put that below the --- line.
> 
> Please fix up and resend a v2.
Thank you,it's my mistake. I resend a v2.

