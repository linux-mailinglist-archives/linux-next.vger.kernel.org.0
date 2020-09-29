Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D780027C035
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 10:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgI2I6T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 04:58:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14705 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727403AbgI2I6S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 04:58:18 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 1D71CC3F387B2EA285FF;
        Tue, 29 Sep 2020 16:58:17 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 16:58:12 +0800
Subject: Re: linux-next: build warning after merge of the tty tree
To:     Greg KH <greg@kroah.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200929160111.18719071@canb.auug.org.au>
 <2e36e978-1276-6b86-3956-4346fc04093f@huawei.com>
 <20200929073213.GA409833@kroah.com>
From:   miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <0993ddd8-dc95-c08b-2d6e-5a057519fa35@huawei.com>
Date:   Tue, 29 Sep 2020 16:58:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200929073213.GA409833@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



在 2020/9/29 15:32, Greg KH 写道:
> On Tue, Sep 29, 2020 at 02:41:27PM +0800, miaoqinglang wrote:
>>
>>
>> 在 2020/9/29 14:01, Stephen Rothwell 写道:
>>> Hi all,
>>>
>>> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
>>> produced this warning:
>>>
>>> drivers/tty/serial/mvebu-uart.c: In function 'mvebu_uart_probe':
>>> drivers/tty/serial/mvebu-uart.c:806:6: warning: unused variable 'ret' [-Wunused-variable]
>>>     806 |  int ret, id, irq;
>>>         |      ^~~
>>>
>>> Introduced by commit
>>>
>>>     b63537020db3 ("serial: mvebu-uart: simplify the return expression of mvebu_uart_probe()")
>>>
>> Hi Greg,
>>
>> Sorry about the noise for remaining the unused variable 'ret' in commit
>> b63537020db3.
>>
>> Should I send another patch to clean up this warning or send another v2
>> patch instead?
> 
> A fix-up patch would be best, as this is already in my tree.
> 
> thanks,
> 
> greg k-h
> .A fix-up patch has been sent.
Thanks
> 
