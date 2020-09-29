Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC54127BBCF
	for <lists+linux-next@lfdr.de>; Tue, 29 Sep 2020 06:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgI2ELM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 00:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34085 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbgI2ELL (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 00:11:11 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601352670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dyx38wIked7j7LE32TY+lTP/Kvmn3DXgSAx3Y20CudE=;
        b=eonJM+q83Qh7kFO76jRACSgMHtKF5v+wY7IP2a0FMTqJKk0kgIE0E7nnL4jAE9Dot6bbsM
        xJ4w3pVVh0LPaalNw0LrRo6IOtb0OpuUpwheR4F2kGwPYS4aaeZYQLGfpfQUcfJS2wouK2
        bfZZzN1quEinYwEPhVBnOnN21cNXZnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-GwNLlKHaP0ONTNhf19ePkQ-1; Tue, 29 Sep 2020 00:11:05 -0400
X-MC-Unique: GwNLlKHaP0ONTNhf19ePkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59EBD1084C84;
        Tue, 29 Sep 2020 04:11:03 +0000 (UTC)
Received: from treble (ovpn-112-110.rdu2.redhat.com [10.10.112.110])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 035A67BE42;
        Tue, 29 Sep 2020 04:10:59 +0000 (UTC)
Date:   Mon, 28 Sep 2020 23:10:56 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@suse.de>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200929041056.uj6gedgm6hfjaxrx@treble>
References: <20200924183038.3c6da86e@canb.auug.org.au>
 <20200924200807.GU3421308@ZenIV.linux.org.uk>
 <20200925220128.1604f09b@canb.auug.org.au>
 <20200925133820.GW3421308@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200925133820.GW3421308@ZenIV.linux.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 25, 2020 at 02:38:20PM +0100, Al Viro wrote:
> On Fri, Sep 25, 2020 at 10:01:28PM +1000, Stephen Rothwell wrote:
> > $ x86_64-linux-gnu-gcc --version
> > x86_64-linux-gnu-gcc (Debian 10.2.0-9) 10.2.0
> > $ x86_64-linux-gnu-ld --version
> > GNU ld (GNU Binutils for Debian) 2.35
> > 
> > and the gcc plugins don't get built for the allnoconfig builds.
> 
> > I reverted my Revert commit after I finished linux-next today and built
> > the x86_64 allnoconfig verion of lib/iov_iter.s:
> > 
> > $ grep -A 1 '41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h"' lib/iov_iter.s
> > # 41 "/home/sfr/next/next/arch/x86/include/asm/barrier.h" 1
> > 	cmp $140737488351232,%rdx; sbb %rcx,%rcx;	#, uaddr, mask
> 
> Wait a sec...
> static inline unsigned long array_index_mask_nospec(unsigned long index,
>                 unsigned long size)
> {
>         unsigned long mask;
> 
>         asm volatile ("cmp %1,%2; sbb %0,%0;"
>                         :"=r" (mask)
>                         :"g"(size),"r" (index)
>                         :"cc");
>         return mask;
> }  
> 
> used with large constant size will blow up - "g" is wrong, since cmp allows
> 64bit arguments to be register or memory ones; immediates can't go past
> 32bit.
> 
> Looks like on the configs where it builds we end up with not seeing it's
> a constant...
> 
> Josh, any ideas?  We could, of course, make it "r"(size), but that would
> be unpleasant in all existing callers...

Sorry, I've been traveling.  I'd just vote for making it "r".

array_index_nospec() is always called after a usercopy.  I don't think
anyone will notice the extra mov, for the cases where it would be
propagated as an immediate.  And the argument *is* an unsigned long
after all.

Stephen, can you confirm this fixes it?

diff --git a/arch/x86/include/asm/barrier.h b/arch/x86/include/asm/barrier.h
index d158ea1fa250..69045ac62f58 100644
--- a/arch/x86/include/asm/barrier.h
+++ b/arch/x86/include/asm/barrier.h
@@ -40,7 +40,7 @@ static inline unsigned long array_index_mask_nospec(unsigned long index,
 
 	asm volatile ("cmp %1,%2; sbb %0,%0;"
 			:"=r" (mask)
-			:"g"(size),"r" (index)
+			:"r"(size), "r"(index)
 			:"cc");
 	return mask;
 }

