Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0B02789C2
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 15:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgIYNi3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 09:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgIYNi2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 09:38:28 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2A1C0613CE;
        Fri, 25 Sep 2020 06:38:28 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kLnvY-0062Aw-Sk; Fri, 25 Sep 2020 13:38:21 +0000
Date:   Fri, 25 Sep 2020 14:38:20 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200925133820.GW3421308@ZenIV.linux.org.uk>
References: <20200924183038.3c6da86e@canb.auug.org.au>
 <20200924200807.GU3421308@ZenIV.linux.org.uk>
 <20200925220128.1604f09b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925220128.1604f09b@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 25, 2020 at 10:01:28PM +1000, Stephen Rothwell wrote:
> $ x86_64-linux-gnu-gcc --version
> x86_64-linux-gnu-gcc (Debian 10.2.0-9) 10.2.0
> $ x86_64-linux-gnu-ld --version
> GNU ld (GNU Binutils for Debian) 2.35
> 
> and the gcc plugins don't get built for the allnoconfig builds.

> I reverted my Revert commit after I finished linux-next today and built
> the x86_64 allnoconfig verion of lib/iov_iter.s:
> 
> $ grep -A 1 '41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h"' lib/iov_iter.s
> # 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
> 	cmp $140737488351232,%rdx; sbb %rcx,%rcx;	#, uaddr, mask

Wait a sec...
static inline unsigned long array_index_mask_nospec(unsigned long index,
                unsigned long size)
{
        unsigned long mask;

        asm volatile ("cmp %1,%2; sbb %0,%0;"
                        :"=r" (mask)
                        :"g"(size),"r" (index)
                        :"cc");
        return mask;
}  

used with large constant size will blow up - "g" is wrong, since cmp allows
64bit arguments to be register or memory ones; immediates can't go past
32bit.

Looks like on the configs where it builds we end up with not seeing it's
a constant...

Josh, any ideas?  We could, of course, make it "r"(size), but that would
be unpleasant in all existing callers...
