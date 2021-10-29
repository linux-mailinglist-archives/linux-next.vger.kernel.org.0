Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8013343FA45
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 11:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbhJ2Jz3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 05:55:29 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:40970 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhJ2Jz2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 05:55:28 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 92B151FD53;
        Fri, 29 Oct 2021 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635501179;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zbhf9TEdmvSWX6UxAlSctzmaGQ/0yN4dvgXyDQfs1bc=;
        b=kpX0n4D3WjbuWYFaOkwRRUDXDH5aZjxfHh6ItZifGbh/A4WZ13D7CIPHwtYklAF939dLhT
        cyRhzXty2BC/XJO8Vui9n4ispAn1pC8dyxmOsNqIpHl0I+mSxThQ5WRzVlbMox+NpwUJIu
        obc6ZKz1gyk4S/4iAYQIe2M6WqSxv9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635501179;
        h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zbhf9TEdmvSWX6UxAlSctzmaGQ/0yN4dvgXyDQfs1bc=;
        b=1paGujFOqQ2Tath2BOt8dXuTEQ7H3A76HKvftk+ZMUCAkevk7xuZUfFn5wDiaEq7uJ/h8E
        pUZDpXeZBlu5q7Dg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
        by relay2.suse.de (Postfix) with ESMTP id 8674AA3B83;
        Fri, 29 Oct 2021 09:52:59 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
        id 5A20BDA7A9; Fri, 29 Oct 2021 11:52:26 +0200 (CEST)
Date:   Fri, 29 Oct 2021 11:52:26 +0200
From:   David Sterba <dsterba@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211029095226.GV20319@suse.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <20211027210924.22ef5881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027210924.22ef5881@canb.auug.org.au>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 09:09:24PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> [I am not sure why this error only popped up after I merged Andrew's
> patch set ...]
> 
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/string.h:253,
>                  from include/linux/bitmap.h:11,
>                  from include/linux/cpumask.h:12,
>                  from arch/x86/include/asm/cpumask.h:5,
>                  from arch/x86/include/asm/msr.h:11,
>                  from arch/x86/include/asm/processor.h:22,
>                  from arch/x86/include/asm/cpufeature.h:5,
>                  from arch/x86/include/asm/thread_info.h:53,
>                  from include/linux/thread_info.h:60,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:55,
>                  from include/linux/wait.h:9,
>                  from include/linux/mempool.h:8,
>                  from include/linux/bio.h:8,
>                  from fs/btrfs/ioctl.c:7:
> In function 'memcpy',
>     inlined from '_btrfs_ioctl_send' at fs/btrfs/ioctl.c:4846:3:
> include/linux/fortify-string.h:219:4: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object (1st parameter)
>   219 |    __write_overflow();
>       |    ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   c8d9cdfc766d ("btrfs: send: prepare for v2 protocol")
> 
> This changes the "reserved" field of struct btrfs_ioctl_send_args from 4 u64's to 3, but the above memcpy is copying the "reserved" filed from a struct btrfs_ioctl_send_args_32 (4 u64s) into it.

I'll fix it in the next update. There are two structures for the ioctl
that need to be in sync but I forgot to do that.
