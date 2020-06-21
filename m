Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8B5202A28
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 12:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729819AbgFUKyD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 06:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729732AbgFUKyD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 06:54:03 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4A4C061794;
        Sun, 21 Jun 2020 03:54:02 -0700 (PDT)
Received: from zn.tnic (p200300ec2f310b00859d3e21c21ab34f.dip0.t-ipconnect.de [IPv6:2003:ec:2f31:b00:859d:3e21:c21a:b34f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F2951EC031B;
        Sun, 21 Jun 2020 12:54:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1592736840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=vv+IfG9aH1AU0X0L2j56vDE+dQoFKlAmWLzo93fGcYM=;
        b=BXwgouOzeqfF/5TDxkIQkEO0FeiiCQOWQAD1DX3yM7fPXmkrevufcCv6sYahBYZ1f2+jZV
        HdjsUyKxt+iTUJdqQy6f+XaTMSaMtyVdl7dTKIjJUOc73IH+gNGYF2Wo+s1kiPG5nn+Wrn
        e9UFyoh44vj+H2qozU/CSczd1Hjdn88=
Date:   Sun, 21 Jun 2020 12:53:50 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200621105350.GA28206@zn.tnic>
References: <20200621163323.14e8533f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200621163323.14e8533f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ acme for an FYI.

On Sun, Jun 21, 2020 at 04:33:23PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (perf) failed
> like this:
> 
> In file included from trace/beauty/tracepoints/x86_msr.c:10:
> perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: error: initialized field overwritten [-Werror=override-init]
>   292 |  [0xc0010280 - x86_AMD_V_KVM_MSRs_offset] = "F15H_PTSC",
>       |                                             ^~~~~~~~~~~
> perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: note: (near initialization for 'x86_AMD_V_KVM_MSRs[640]')
> 
> Caused by commit
> 
>   1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
> 
> I have used the tip tree from next-20200618 for tooday.

Thanks, I saw that once but then got distracted to something of higher
prio. :-\

I'll apply this after testing it a bit:

---
From: Borislav Petkov <bp@suse.de>
Date: Sun, 21 Jun 2020 12:41:53 +0200
Subject: [PATCH] x86/msr: Move the F15h MSRs where they belong

1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")

moved the three F15h power MSRs to the architectural list but that was
wrong as they belong in the family 0x15 list. That also caused:

  In file included from trace/beauty/tracepoints/x86_msr.c:10:
  perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: error: initialized field overwritten [-Werror=override-init]
    292 |  [0xc0010280 - x86_AMD_V_KVM_MSRs_offset] = "F15H_PTSC",
        |                                             ^~~~~~~~~~~
  perf/trace/beauty/generated/x86_arch_MSRs_array.c:292:45: note: (near initialization for 'x86_AMD_V_KVM_MSRs[640]')

due to MSR_F15H_PTSC ending up being defined twice. Move them where they
belong and drop the duplicate.

While at it, update the msr-index.h copy to pick up the changes from

  7e5b3c267d25 ("x86/speculation: Add Special Register Buffer Data Sampling (SRBDS) mitigation")

Fixes: 1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/include/asm/msr-index.h       | 5 ++---
 tools/arch/x86/include/asm/msr-index.h | 9 ++++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index eb9537254920..63ed8fe35738 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -422,11 +422,8 @@
 #define MSR_AMD_PERF_CTL		0xc0010062
 #define MSR_AMD_PERF_STATUS		0xc0010063
 #define MSR_AMD_PSTATE_DEF_BASE		0xc0010064
-#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
-#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
 #define MSR_AMD64_OSVW_ID_LENGTH	0xc0010140
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
-#define MSR_F15H_PTSC			0xc0010280
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
@@ -469,6 +466,8 @@
 #define MSR_F16H_DR0_ADDR_MASK		0xc0011027
 
 /* Fam 15h MSRs */
+#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
+#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
 #define MSR_F15H_PERF_CTL		0xc0010200
 #define MSR_F15H_PERF_CTL0		MSR_F15H_PERF_CTL
 #define MSR_F15H_PERF_CTL1		(MSR_F15H_PERF_CTL + 2)
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index 7dfd45bb6cdb..63ed8fe35738 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -128,6 +128,10 @@
 #define TSX_CTRL_RTM_DISABLE		BIT(0)	/* Disable RTM feature */
 #define TSX_CTRL_CPUID_CLEAR		BIT(1)	/* Disable TSX enumeration */
 
+/* SRBDS support */
+#define MSR_IA32_MCU_OPT_CTRL		0x00000123
+#define RNGDS_MITG_DIS			BIT(0)
+
 #define MSR_IA32_SYSENTER_CS		0x00000174
 #define MSR_IA32_SYSENTER_ESP		0x00000175
 #define MSR_IA32_SYSENTER_EIP		0x00000176
@@ -418,11 +422,8 @@
 #define MSR_AMD_PERF_CTL		0xc0010062
 #define MSR_AMD_PERF_STATUS		0xc0010063
 #define MSR_AMD_PSTATE_DEF_BASE		0xc0010064
-#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
-#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
 #define MSR_AMD64_OSVW_ID_LENGTH	0xc0010140
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
-#define MSR_F15H_PTSC			0xc0010280
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
@@ -465,6 +466,8 @@
 #define MSR_F16H_DR0_ADDR_MASK		0xc0011027
 
 /* Fam 15h MSRs */
+#define MSR_F15H_CU_PWR_ACCUMULATOR     0xc001007a
+#define MSR_F15H_CU_MAX_PWR_ACCUMULATOR 0xc001007b
 #define MSR_F15H_PERF_CTL		0xc0010200
 #define MSR_F15H_PERF_CTL0		MSR_F15H_PERF_CTL
 #define MSR_F15H_PERF_CTL1		(MSR_F15H_PERF_CTL + 2)
-- 
2.21.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
