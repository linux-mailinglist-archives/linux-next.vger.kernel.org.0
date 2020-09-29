Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E80927BD3F
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 08:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgI2Gle (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 02:41:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:34462 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgI2Gle (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 02:41:34 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3ECB952FDC07AFB705E2;
        Tue, 29 Sep 2020 14:41:29 +0800 (CST)
Received: from [10.174.179.91] (10.174.179.91) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 29 Sep 2020 14:41:28 +0800
Subject: Re: linux-next: build warning after merge of the tty tree
To:     Greg KH <greg@kroah.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200929160111.18719071@canb.auug.org.au>
From:   miaoqinglang <miaoqinglang@huawei.com>
Message-ID: <2e36e978-1276-6b86-3956-4346fc04093f@huawei.com>
Date:   Tue, 29 Sep 2020 14:41:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200929160111.18719071@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



在 2020/9/29 14:01, Stephen Rothwell 写道:
> Hi all,
> 
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> drivers/tty/serial/mvebu-uart.c: In function 'mvebu_uart_probe':
> drivers/tty/serial/mvebu-uart.c:806:6: warning: unused variable 'ret' [-Wunused-variable]
>    806 |  int ret, id, irq;
>        |      ^~~
> 
> Introduced by commit
> 
>    b63537020db3 ("serial: mvebu-uart: simplify the return expression of mvebu_uart_probe()")
> 
Hi Greg,

Sorry about the noise for remaining the unused variable 'ret' in commit 
b63537020db3.

Should I send another patch to clean up this warning or send another v2 
patch instead?

Thanks.
