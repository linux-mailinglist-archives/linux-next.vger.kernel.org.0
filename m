Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C980B203769
	for <lists+linux-next@lfdr.de>; Mon, 22 Jun 2020 15:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbgFVNET (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Jun 2020 09:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbgFVNET (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Jun 2020 09:04:19 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7D6C061794;
        Mon, 22 Jun 2020 06:04:19 -0700 (PDT)
Received: from zn.tnic (p200300ec2f0a2500329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:2500:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B964A1EC0284;
        Mon, 22 Jun 2020 15:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1592831055;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=QcVcKl5eRiyso39Fqs5a8YC+kZhsZGn3m3dY83vhtaU=;
        b=LtRAVkcbVUEPrCdZSP8QTYhK2kAv9/IN4MvVoc04DkGm7r5CEnQNmtRMYhUjg3Gnd0EiBC
        QZzFIcfdxFg8zSlorke4xo8J2ewgfl5seNUxIjkfiKhP4wHh5SaBKkG6vFQUq68hxIy7De
        hDfK/+/mLTIqJPFJZy5O3YKYEEQm8fk=
Date:   Mon, 22 Jun 2020 15:04:07 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -v2] x86/msr: Move the F15h MSRs where they belong
Message-ID: <20200622130407.GB32200@zn.tnic>
References: <20200621163323.14e8533f@canb.auug.org.au>
 <20200621105350.GA28206@zn.tnic>
 <20200622113824.6a3ab82f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200622113824.6a3ab82f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 22, 2020 at 11:38:24AM +1000, Stephen Rothwell wrote:
> I applied that patch to the tip tree merge today.
> 
> Tested-by: Stephen Rothwell <sfr@canb.auug.org.au> # build tested

Here's v2 instead, addressing acme's request. I didn't rebase the
x86/cleanups branch because I'd like to have this case documented.

acme, ACK?

Thx.

---
From c1c1a26bc631fafb68ed30c5164d0231acc500ee Mon Sep 17 00:00:00 2001
From: Borislav Petkov <bp@suse.de>
Date: Sun, 21 Jun 2020 12:41:53 +0200

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

Also, drop the respective tools/ changes of the msr-index.h copy the
above commit added because perf tool developers prefer to go through
those changes themselves in order to figure out whether changes to the
kernel headers would need additional handling in perf.

Fixes: 1068ed4547ad ("x86/msr: Lift AMD family 0x15 power-specific MSRs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lkml.kernel.org/r/20200621163323.14e8533f@canb.auug.org.au
---
 arch/x86/include/asm/msr-index.h       | 5 ++---
 tools/arch/x86/include/asm/msr-index.h | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)

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
index 7dfd45bb6cdb..ef452b817f44 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -414,18 +414,15 @@
 #define MSR_AMD64_PATCH_LEVEL		0x0000008b
 #define MSR_AMD64_TSC_RATIO		0xc0000104
 #define MSR_AMD64_NB_CFG		0xc001001f
+#define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_PATCH_LOADER		0xc0010020
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
-#define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_LS_CFG		0xc0011020
 #define MSR_AMD64_DC_CFG		0xc0011022
 #define MSR_AMD64_BU_CFG2		0xc001102a
-- 
2.21.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
