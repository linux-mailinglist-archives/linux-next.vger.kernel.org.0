Return-Path: <linux-next+bounces-6801-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB53AB8BC3
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 18:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07687161D2A
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 16:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E47B21CA02;
	Thu, 15 May 2025 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8O7/rwf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7821C9F1;
	Thu, 15 May 2025 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324877; cv=none; b=BGnZQgeNRWaPjIIJ4Ir4JxxxWn0qJ4PF7TsyHGe+GFelcpd8FNzETE2nqG5Evz6KCxq8UkS+EGNXrT+Qnz4dA0EFSnX71m3+d/NwNlHpqYaSxFKPyBwNT6uKwC7a4fnMOZyXl7TwcANl0u6+HzazxTFVt7dfepKXY5fIRv5BxcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324877; c=relaxed/simple;
	bh=ATrywjxspmQpMwG9e61oi4DTZo/y4M+lVUmbwwGtxrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jutnd5Y41iUtoMC9N/39ZUnQK+aew3dPEx/wPnFgFcbFN97VKsdptZq7ocLbjs6sCeVUy0J6PJ12KeZJDWrVY2Vqdu6mGuOb24JXhuVgjN/nyjks0cqnb5ha69BIuMjdbc3I//hMvtPBcrgTqSH6yLPTxaWFcLXmzEgz+panPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8O7/rwf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B919DC4CEEB;
	Thu, 15 May 2025 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324876;
	bh=ATrywjxspmQpMwG9e61oi4DTZo/y4M+lVUmbwwGtxrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8O7/rwfGZSlLBwQUFmu0Mt98qc7VIN9nNH+yhpEIjlsMMFqomqyMw4usn+NHVSY5
	 lbcXGC1aS49c9FCZnMLVK3wXvicXJB+y6KVPkrCdU30jWcNM+3QACPg7Cqqi0Yb1ax
	 Lk0TvBst4Hda3I91XCLee35+MOlWJRyguICPMYoa8MxYMs9KbbKPYm7sLMmugld3+D
	 uXPp6h1tAVmyfOLabExqN1T7zqx1hHrTpk02OJicVpqVh4N8XTJljejRsDT8LV/WwE
	 7kw00hgnC56cFFxN4Ki2T2xhviAzpAIVO1mCroMUCbTbkpHcgyJgB5Bqn/W31ZiH8o
	 /EE2w35RilGqA==
Date: Thu, 15 May 2025 18:01:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] x86/msr: Add rdmsrl_on_cpu() compatibility wrapper
Message-ID: <aCYPyJKLig5pzscp@gmail.com>
References: <20250512145517.6e0666e3@canb.auug.org.au>
 <20250512152326.3f2f0226@canb.auug.org.au>
 <8c4ab851-1853-442e-90a9-225be16c804c@amd.com>
 <aCYM-A_PYHK2kjSd@gmail.com>
 <46e04d1c-dbc8-4a45-95d4-fecfdd943065@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e04d1c-dbc8-4a45-95d4-fecfdd943065@amd.com>


* Mario Limonciello <mario.limonciello@amd.com> wrote:

> > If it's only about rdmsrl_on_cpu(), how about the simple 
> > compatibility wrapper below instead, applied to the x86 tree?
> > 
> > Can merge it into -tip and tomorrow's -next would resolve this 
> > without any changes or merges done to the PM tree.
> 
> Sounds good to me.

Great - I've added the patch below to the x86 tree, tomorrow's -next 
should have this resolved in theory.

Thanks,

	Ingo

=======================>
From: Ingo Molnar <mingo@kernel.org>
Date: Thu, 15 May 2025 17:49:16 +0200
Subject: [PATCH] x86/msr: Add rdmsrl_on_cpu() compatibility wrapper

Add a simple rdmsrl_on_cpu() compatibility wrapper for
rdmsrq_on_cpu(), to make life in -next easier, where
the PM tree recently grew more uses of the old API.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Mario Limonciello <mario.limonciello@amd.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Link: https://lore.kernel.org/r/20250512145517.6e0666e3@canb.auug.org.au
---
 arch/x86/include/asm/msr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index a9ce56fc8785..4096b8af4ba7 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -329,6 +329,7 @@ static inline int wrmsr_safe_regs_on_cpu(unsigned int cpu, u32 regs[8])
 /* Compatibility wrappers: */
 #define rdmsrl(msr, val) rdmsrq(msr, val)
 #define wrmsrl(msr, val) wrmsrq(msr, val)
+#define rdmsrl_on_cpu(cpu, msr, q) rdmsrq_on_cpu(cpu, msr, q)
 
 #endif /* __ASSEMBLER__ */
 #endif /* _ASM_X86_MSR_H */


