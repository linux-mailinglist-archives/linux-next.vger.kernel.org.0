Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3963341DC6
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 14:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhCSNKr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 09:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhCSNK0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 09:10:26 -0400
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966A3C06174A;
        Fri, 19 Mar 2021 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
         s=42; h=Date:Message-ID:From:Cc:To;
        bh=qyl78rH+CQEMzVJyJ1SzVvYcEK1y17Tmg67PTGfJeTg=; b=x7XnhvHd7wdwfflWyP3v7HZX04
        xbvcx8leSC3+eymowMLRTCMa3XhiFh4EOl3IecVaVIGP2BusrHaVI9FfDQQyr7u97e3Ere3Ai2Bfz
        hkLOz4FnjukEMRR94YcEh+UYCyO1kVc+SAtOWvNCRXJ25AVzapX86aPNChZQWS9FJaGKK9MKPrGhk
        Z3Ot5lw/aPWuuhEQG2DG4Fleice4laU0P9uLVjl+jZaSOBm6Wf3p7+IUiIrEfet5+Huey8b04yOLa
        c7LWPdNB6amV0nF6nqgDQmjYjIfqZu9FPSppWlHVazcFktUdtwxOoFm1RajzHn8WrTPtsw1Iy/+Sc
        nUNPhvz+BaBKPXsXGv3liBqAKxA0ZPUHo9WlryNfQIdgYDscNOe0zb5No2p+koRfWxgVUkpe7LtI4
        kZSzUteS1PqOaIiX2w7J9URmiIYBoGukgOFGJr8QMCKRm8nZIDrZtdazKghgpWxlLTfZPQ+j4Dw6L
        BRe3hp54LQPEAWOQBSiD2cHQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
        (Exim)
        id 1lNEtP-0002b5-Il; Fri, 19 Mar 2021 13:10:19 +0000
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210319101654.638e8e95@canb.auug.org.au>
 <7ced6739-4458-2b5b-af5a-d3aa9d37656d@kernel.dk>
 <14e60889-156e-7682-71c1-7b86c9b019a5@samba.org>
 <6fc61af0-e113-15d3-dd71-a0415b0f546f@kernel.dk>
From:   Stefan Metzmacher <metze@samba.org>
Message-ID: <6cf57986-45c6-fb00-eb19-c7f4aeac82a5@samba.org>
Date:   Fri, 19 Mar 2021 14:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6fc61af0-e113-15d3-dd71-a0415b0f546f@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Am 19.03.21 um 14:08 schrieb Jens Axboe:
> On 3/19/21 2:02 AM, Stefan Metzmacher wrote:
>>
>> Am 19.03.21 um 00:25 schrieb Jens Axboe:
>>> On 3/18/21 5:16 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Commit
>>>>
>>>>   c2c6c067c050 ("io_uring: remove structures from include/linux/io_uring.h")
>>>>
>>>> is missing a Signed-off-by from its author.
>>>
>>> Stefan, let me know if you're OK with me adding that, not sure how I missed
>>> that.
>>
>> Yes, sure :-)
>> I guess you removed it while adding 'Link:'
> 
> That was b4, I don't add those manually. But maybe it stripped those too,
> annoying...
> 
>> You may want to remove cc: stable from 3aab52c9a708f7183460d368700181ef0c2a09e6
>> ("io_uring: imply MSG_NOSIGNAL for send[msg]()/recv[msg]() calls")
>> for now.
>>
>> I'll want to do some more test with it on 5.12,
>> I guess we'd then have to backport it to stable as part of the
>> io_thread worker backport. I'll post some more details later
>> to the io-uring list.
> 
> Sure, let's do that. I also dropped the short link sever as well for now.
> I do like it on principle, but it does have a risk of breaking valid
> use cases.

Thanks, I'll resubmit that with the MSG_WAITALL logic.

metze
