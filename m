Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95A034170D
	for <lists+linux-next@lfdr.de>; Fri, 19 Mar 2021 09:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbhCSICo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Mar 2021 04:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234084AbhCSICU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 19 Mar 2021 04:02:20 -0400
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF6CC06174A;
        Fri, 19 Mar 2021 01:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org;
         s=42; h=Date:Message-ID:From:Cc:To;
        bh=DyCHhhUAm20h3wrxN93KonZiDHxAWXS5wB2i17Uzl5w=; b=y6OCcZMwhIa9MY5qejVnmc5XsA
        Bq68YHy2Zk3sfSnaZYogbciFbbsa+LvaRGRgN/a6ETHmyG4GjH1KPLPzKhLZ4+Vt6ogGxk0nvVhFA
        a3+FNUmKrPgWbJFdPutHmrAtBnUtdpqdge2uUG2CUKzGtN9+b1z7nR5fi4tmZ96IB4ktJPVT1Ad1X
        MUliyHxM2JETkv+NKcYuaOq+U3okpIuPYX4tepgHn3d29QEgqeX0GxiorIljjkmbfzv2KUNkFEBTz
        a58AfrMGZ0j1TOXW75tpJ2OSTcvwOdOe2Dh3SMWcTQ5tiCloO7b2a7efkvbZVLD3+1YonETxzFPMq
        18GFD+l9H8geV+tl+iZtHQXMX4iqXsQIFUu8mGKEp+YjC1hYI1LJRI98fitBXz8U8cm/FQ+Md8I05
        T733NP2NJbTUhMTz+M8lrmJNf120ajYsrf3qpQqX8SyWGV0COTCq8of22OE4tK2ErzfW+m1cmb5o6
        Si3Cn7xnQSXHcqX8iDK7LVP5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
        by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
        (Exim)
        id 1lNA5A-0000Qj-UX; Fri, 19 Mar 2021 08:02:09 +0000
To:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210319101654.638e8e95@canb.auug.org.au>
 <7ced6739-4458-2b5b-af5a-d3aa9d37656d@kernel.dk>
From:   Stefan Metzmacher <metze@samba.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <14e60889-156e-7682-71c1-7b86c9b019a5@samba.org>
Date:   Fri, 19 Mar 2021 09:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7ced6739-4458-2b5b-af5a-d3aa9d37656d@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Am 19.03.21 um 00:25 schrieb Jens Axboe:
> On 3/18/21 5:16 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>   c2c6c067c050 ("io_uring: remove structures from include/linux/io_uring.h")
>>
>> is missing a Signed-off-by from its author.
> 
> Stefan, let me know if you're OK with me adding that, not sure how I missed
> that.

Yes, sure :-)
I guess you removed it while adding 'Link:'

You may want to remove cc: stable from 3aab52c9a708f7183460d368700181ef0c2a09e6
("io_uring: imply MSG_NOSIGNAL for send[msg]()/recv[msg]() calls")
for now.

I'll want to do some more test with it on 5.12,
I guess we'd then have to backport it to stable as part of the
io_thread worker backport. I'll post some more details later
to the io-uring list.

Thanks!
metze
