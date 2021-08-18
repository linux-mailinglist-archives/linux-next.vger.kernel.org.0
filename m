Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FFC43F02E8
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 13:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235504AbhHRLmi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 07:42:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3660 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbhHRLmh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Aug 2021 07:42:37 -0400
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.201])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GqQvf30y7z6H6nx;
        Wed, 18 Aug 2021 19:41:02 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 13:41:59 +0200
Received: from [10.202.227.179] (10.202.227.179) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 18 Aug 2021 12:41:58 +0100
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Bart Van Assche <bvanassche@acm.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
References: <20210817194710.1cb707ba@canb.auug.org.au>
 <c27c2909-1701-b972-dd7c-98bdc53ab8f9@huawei.com>
 <41d95ecd-5657-8f32-cf1a-a6d249f91cd6@acm.org>
From:   John Garry <john.garry@huawei.com>
Message-ID: <70e483d8-39ae-3ab3-1374-96b7d2b8374a@huawei.com>
Date:   Wed, 18 Aug 2021 12:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <41d95ecd-5657-8f32-cf1a-a6d249f91cd6@acm.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.179]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18/08/2021 04:07, Bart Van Assche wrote:
> On 8/17/21 2:51 AM, John Garry wrote:
>> sorry... I only built x86 and arm64 allmodconfig. Let me check this.
> Build testing for tree-wide changes is tricky. You may want to use a
> build bot for such testing. From
> https://01.org/lkp/documentation/0-day-test-service:
> 
> Q: Which git tree and which mailing list will be tested? How can I
> opt-in or opt-out from it?
> 
> A: 0-Day monitors hundreds of git trees and tens of mailing lists. You
> can obtain detailed tree and mailing list information from the source
> code under the lkp-tests/repo directory. If you want to add or remove
> your tree from the 0-Day test system, send an email to the LKML,
> specifying your git tree URL.

Thanks for the info! Quite useful.

Unfortunately there is code which has internal build switches - like 
qla1280.c and DEBUG_QLA1280, which Martin mentioned - so harder to spot. 
I suppose that's the risk with internal build switches.

Thanks again,
John
