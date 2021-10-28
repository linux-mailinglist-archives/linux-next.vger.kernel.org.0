Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEC143E15A
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 14:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhJ1M5K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 08:57:10 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:56717 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhJ1M5K (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 08:57:10 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Uu.SxT._1635425680;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0Uu.SxT._1635425680)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 28 Oct 2021 20:54:41 +0800
Subject: Re: linux-next: Tree for Oct 25
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shile Zhang <shile.zhang@linux.alibaba.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <20211027224231.1634cc6c@canb.auug.org.au>
 <864bbf0b-e6db-1a97-80f5-a92968a4e086@linux.alibaba.com>
 <20211028155126.0b187410@canb.auug.org.au>
 <8c917fd9-c569-560e-5d6f-e19417f61cdf@linux.alibaba.com>
 <20211028234846.78e715df@canb.auug.org.au>
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <cef396ef-373d-6a02-62f2-191c440cec14@linux.alibaba.com>
Date:   Thu, 28 Oct 2021 20:54:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211028234846.78e715df@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


在 2021/10/28 下午8:48, Stephen Rothwell 写道:
> Hi Xianting,
>
> On Thu, 28 Oct 2021 15:59:02 +0800 Xianting Tian <xianting.tian@linux.alibaba.com> wrote:
>> 在 2021/10/28 下午12:51, Stephen Rothwell 写道:
>>> Hi Xianting,
>>>
>>> On Thu, 28 Oct 2021 09:51:00 +0800 Xianting Tian <xianting.tian@linux.alibaba.com> wrote:
>>>> 在 2021/10/27 下午7:42, Stephen Rothwell 写道:
>>>>> Hi all,
>>>>>
>>>>> On Mon, 25 Oct 2021 20:49:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>>> There seems to be something amiss with cnosole output in today's release
>>>>>> (at least on my ppc qemu boot tests).
>>>>> The console output seems to be back today.  I assume its repair had
>>>>> something to do with commit
>>>>>
>>>>>      60f41e848492 ("Revert "tty: hvc: pass DMA capable memory to put_chars()"")
>>>>>    >> hi Stephen，
>>>> Thanks for the info, Could you share more details about the issue you met? is it about early console print issue?
>>>>   
>>> Here is the diff between my boot logs:
>> thanks, I checked the log, Can I understand it as you missed some early bootup log  when use new release?
> yes, the console messages stopped for a while when we switched from the
> bootconsole to the final hvc0 console.
thanks, it makes sense, this commit broken the early console mechanism, 
I will submit the fix patch for reviewing soon.
>
>>> @@ -124,81 +124,9 @@
>>>     clocksource: timebase mult[1f40000] shift[24] registered
>>>     Console: colour dummy device 80x25
>>>     printk: console [hvc0] enabled
>>> - printk: console [hvc0] enabled
>>> - printk: bootconsole [udbg0] disabled
>>>     printk: bootconsole [udbg0] disabled
>>> - pid_max: default: 32768 minimum: 301
>>> - Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
>>> - Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> 	.
> 	.
> 	.
