Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCEC3AEB20
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 16:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFUOZ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 10:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhFUOZ1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 10:25:27 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 337E4C061574;
        Mon, 21 Jun 2021 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=5gq4/yj7l7YPCIVtDV1tWOz+zigyqneiG92mw2A7kRs=; b=lQcEo4h98Jd8TZK/dBavVNavFo
        piibunyG5ZQXLpGQovHRK52RX08uVMf6Lf+uiGZ1gQjud2mT5vOVxyd/ZfEbmiym6OSsV1Cot00Ys
        YZcQmAdKS+j9Om2H++gdzIkLNCzkBUvDcQ/eirhD+lRkLnTq596n7MMZv8UjBmENwrmCpljBjMxqb
        mmep4CEUNAeCBlgIOJHwG9Yu2MzFt1SPun1s5qCvQ3Da+ho5WTIesFIs0Zpj47J56RYS/s4Ogq+UU
        gyCDwHXNkhr73w7pU34/ywfbKaeKZZme3yNdhwSBL2f/lx1O00QafhgBmdK8vwlxzCbv7Q8XaDjRE
        Rzu3cF5w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lvKpG-00AG8e-Fr; Mon, 21 Jun 2021 14:23:05 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EA1ED30021A;
        Mon, 21 Jun 2021 16:23:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8A8D421BD53BC; Mon, 21 Jun 2021 16:23:03 +0200 (CEST)
Date:   Mon, 21 Jun 2021 16:23:03 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: Tree for Apr 16 (objtool: warnings)
Message-ID: <YNCgxwLBiK9wclYJ@hirez.programming.kicks-ass.net>
References: <20210416213625.14542675@canb.auug.org.au>
 <b3778b1a-9494-4724-5066-c000f7fb5e94@infradead.org>
 <YNCVaPtEWlsvQfjw@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNCVaPtEWlsvQfjw@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 21, 2021 at 03:34:32PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 16, 2021 at 10:50:49AM -0700, Randy Dunlap wrote:
> > On 4/16/21 4:36 AM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20210415:
> > 
> > 
> > on x86_64, objtool is not liking retpoline.o:
> > 
> > $ gcc --version
> > gcc (SUSE Linux) 7.5.0
> > 
> > 
> > Is there already a patch for these?
> > 
> > 
> > ===== build-r8840.out =====
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rax()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbx()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rcx()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdx()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rsi()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rdi()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_rbp()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r8()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r9()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r10()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r11()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r12()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r13()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r14()+0x0: call without frame pointer save/setup
> > arch/x86/lib/retpoline.o: warning: objtool: __x86_indirect_alt_call_r15()+0x0: call without frame pointer save/setup
> 
> Damn, sorry I missed this. I know what the problem is, but I've yet to
> find a solution that's not terrible... hold on.

---
Subject: objtool/x86: Ignore __x86_indirect_alt_* symbols
From: Peter Zijlstra <peterz@infradead.org>
Date: Mon Jun 21 16:13:55 CEST 2021

Because the __x86_indirect_alt* symbols are just that, objtool will
try and validate them as regular symbols, instead of the alternative
replacements that they are.

This goes sideways for FRAME_POINTER=y builds; which generate a fair
amount of warnings.

Fixes: 9bc0bb50727c ("objtool/x86: Rewrite retpoline thunk calls")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/lib/retpoline.S |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/x86/lib/retpoline.S
+++ b/arch/x86/lib/retpoline.S
@@ -58,12 +58,16 @@ SYM_FUNC_START_NOALIGN(__x86_indirect_al
 2:	.skip	5-(2b-1b), 0x90
 SYM_FUNC_END(__x86_indirect_alt_call_\reg)
 
+STACK_FRAME_NON_STANDARD(__x86_indirect_alt_call_\reg)
+
 SYM_FUNC_START_NOALIGN(__x86_indirect_alt_jmp_\reg)
 	ANNOTATE_RETPOLINE_SAFE
 1:	jmp	*%\reg
 2:	.skip	5-(2b-1b), 0x90
 SYM_FUNC_END(__x86_indirect_alt_jmp_\reg)
 
+STACK_FRAME_NON_STANDARD(__x86_indirect_alt_jmp_\reg)
+
 .endm
 
 /*
