Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0361D314A63
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 09:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhBIIfo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 03:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbhBIIfO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 03:35:14 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CA1C061788;
        Tue,  9 Feb 2021 00:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9ZHfFFGk9GfT+ttNfEyDJiSzPt0VvzQ4OaZtts0PdGw=; b=CDIhV+EdK1N2Y15ErZ9ogQFLOB
        SVpiodpnNgRgxWoWwbRVfpk0IfCxxLdPNRURAy6Kf8Kc+OMmFx694vvenc2QC/HDOFSG/Nf9PAZCM
        fmRdTlqlTfmqUxpNKWrF9h2KpU3RzgVsjqOOJdEP+gAWyoNVu918ZhHV5XeN4kI0jMZ6MZH+HmRQG
        D5A120bIfhzTV6M8ZLUS1D2beZGqM9as5UfELIsQLbT5qSZlnMhOZUClscRIQLiKNBVlbzSHZaEbE
        EQlcGEONu/bj4gqshQDZsmFhzAGY+l/2CQyYPWja8UG6swVK/paLObTNbN8Qt/cHHLlvr7h5x4Fvm
        Y3AfEF6A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9OTM-0002ER-7y; Tue, 09 Feb 2021 08:34:12 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C0051300446;
        Tue,  9 Feb 2021 09:34:10 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A3B63213AB5A1; Tue,  9 Feb 2021 09:34:10 +0100 (CET)
Date:   Tue, 9 Feb 2021 09:34:10 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] lockdep: Noinstr annotate warn_bogus_irq_restore()
Message-ID: <YCJJAoC+r414zO+2@hirez.programming.kicks-ass.net>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Subject: lockdep: Noinstr annotate warn_bogus_irq_restore()
From: Peter Zijlstra <peterz@infradead.org>
Date: Tue Feb 9 09:30:03 CET 2021

  vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section

As per the general rule that WARNs are allowed to violate noinstr to
get out, annotate it away.

Fixes: 997acaf6b4b5 ("lockdep: report broken irq restoration")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/irqflags.h |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -153,8 +153,11 @@ do {						\
 extern void warn_bogus_irq_restore(void);
 #define raw_check_bogus_irq_restore()			\
 	do {						\
-		if (unlikely(!arch_irqs_disabled()))	\
+		if (unlikely(!arch_irqs_disabled())) {	\
+			instrumentation_begin();	\
 			warn_bogus_irq_restore();	\
+			instrumentation_end();		\
+		}					\
 	} while (0)
 #else
 #define raw_check_bogus_irq_restore() do { } while (0)
