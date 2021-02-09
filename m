Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F2F31535A
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 17:06:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhBIQEk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 11:04:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232637AbhBIQEj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 11:04:39 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E72C061756;
        Tue,  9 Feb 2021 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3vg2hby0dj6+BRvVqR0OMPVYFkIYjsxsSS+LgYqs90U=; b=liONZxEbDHQx4VbT1HxO7SGJOF
        iHr4n1HmIt0wmnc1EYTCn25izOhhM8QyUxE+okTprwSlTXl4Up92owtLGXTLR9+nhInJyWAiKSbUm
        XqOkZ6RIo+vPKRlHXDk3a5XZvDHvwHo5hoMWkJZvyikqeEeXhUI2Fxx6mEElPMAFXZH5wrLIvZ/cB
        CdiAOPkywPZZBAP0SzTT4Newt20YEKTHU1VmBNAD0fagHnf0A03UoOc6QAzc0LJHFnmoLVhPp5vjU
        A9mviX58OVIl+uaKR9v772MfHBf0mGDqYe3HKlBFVCzKrJEmZ7CpeLeoJN2UFuEpkpylO8mUlIkV9
        O6TQ14Gg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9VUR-007eTp-BU; Tue, 09 Feb 2021 16:03:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 864D8301324;
        Tue,  9 Feb 2021 17:03:46 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4D2DD2B73FE88; Tue,  9 Feb 2021 17:03:46 +0100 (CET)
Date:   Tue, 9 Feb 2021 17:03:46 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] lockdep: Noinstr annotate warn_bogus_irq_restore()
Message-ID: <YCKyYg53mMp4E7YI@hirez.programming.kicks-ass.net>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <YCJJAoC+r414zO+2@hirez.programming.kicks-ass.net>
 <20210209132430.GB71297@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209132430.GB71297@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 01:24:30PM +0000, Mark Rutland wrote:
> On Tue, Feb 09, 2021 at 09:34:10AM +0100, Peter Zijlstra wrote:
> > 
> > Subject: lockdep: Noinstr annotate warn_bogus_irq_restore()
> > From: Peter Zijlstra <peterz@infradead.org>
> > Date: Tue Feb 9 09:30:03 CET 2021
> > 
> >   vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section
> > 
> > As per the general rule that WARNs are allowed to violate noinstr to
> > get out, annotate it away.
> > 
> > Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Whoops; sorry for missing that!
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>

This runs into sodding header hell on mips (and possibly others)

How's this then?

---
Subject: lockdep: Noinstr annotate warn_bogus_irq_restore()
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue Feb 9 09:30:03 CET 2021

  vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section

As per the general rule that WARNs are allowed to violate noinstr to
get out, annotate it away.

Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 include/linux/irqflags.h       |    5 ++++-
 kernel/locking/irqflag-debug.c |    4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

--- a/kernel/locking/irqflag-debug.c
+++ b/kernel/locking/irqflag-debug.c
@@ -4,8 +4,10 @@
 #include <linux/export.h>
 #include <linux/irqflags.h>
 
-void warn_bogus_irq_restore(void)
+noinstr void warn_bogus_irq_restore(void)
 {
+	instrumentation_begin();
 	WARN_ONCE(1, "raw_local_irq_restore() called with IRQs enabled\n");
+	instrumentation_end();
 }
 EXPORT_SYMBOL(warn_bogus_irq_restore);
