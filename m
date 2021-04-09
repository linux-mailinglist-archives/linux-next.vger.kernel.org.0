Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267B935985E
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 10:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhDIIzi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 04:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhDIIzh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 04:55:37 -0400
X-Greylist: delayed 394 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Apr 2021 01:55:25 PDT
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [IPv6:2001:1600:4:17::8fae])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4C6C061761
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 01:55:25 -0700 (PDT)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
        by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4FGsHQ0xDNzMqVFY;
        Fri,  9 Apr 2021 10:48:50 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
        by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4FGsHN47Lwzlh8TL;
        Fri,  9 Apr 2021 10:48:48 +0200 (CEST)
Subject: Re: linux-next: manual merge of the security tree with the ext3 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        James Morris <jmorris@namei.org>, Jan Kara <jack@suse.cz>
Cc:     James Morris <jamorris@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
References: <20210319130551.76ce2b8f@canb.auug.org.au>
 <20210409143954.22329cfa@canb.auug.org.au>
From:   =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <ec4beec7-b68e-55d2-6551-2a910d19ff11@digikod.net>
Date:   Fri, 9 Apr 2021 10:50:41 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20210409143954.22329cfa@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Looks good, thanks Stephen!

On 09/04/2021 06:39, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 19 Mar 2021 13:05:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the security tree got conflicts in:
>>
>>   arch/alpha/kernel/syscalls/syscall.tbl
>>   arch/arm/tools/syscall.tbl
>>   arch/arm64/include/asm/unistd.h
>>   arch/arm64/include/asm/unistd32.h
>>   arch/ia64/kernel/syscalls/syscall.tbl
>>   arch/m68k/kernel/syscalls/syscall.tbl
>>   arch/microblaze/kernel/syscalls/syscall.tbl
>>   arch/mips/kernel/syscalls/syscall_n32.tbl
>>   arch/mips/kernel/syscalls/syscall_n64.tbl
>>   arch/mips/kernel/syscalls/syscall_o32.tbl
>>   arch/parisc/kernel/syscalls/syscall.tbl
>>   arch/powerpc/kernel/syscalls/syscall.tbl
>>   arch/s390/kernel/syscalls/syscall.tbl
>>   arch/sh/kernel/syscalls/syscall.tbl
>>   arch/sparc/kernel/syscalls/syscall.tbl
>>   arch/x86/entry/syscalls/syscall_32.tbl
>>   arch/x86/entry/syscalls/syscall_64.tbl
>>   arch/xtensa/kernel/syscalls/syscall.tbl
>>   include/uapi/asm-generic/unistd.h
>>
>> between commit:
>>
>>   fa8b90070a80 ("quota: wire up quotactl_path")
>>
>> from the ext3 tree and commit:
>>
>>   818946f8b806 ("arch: Wire up Landlock syscalls")
> 
> This is now commit
> 
>   9fbebb70210a ("arch: Wire up Landlock syscalls")
> 
>> from the security tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> The resolution now looks like below (since the lanlock syscall number
> have been updated).
> 
