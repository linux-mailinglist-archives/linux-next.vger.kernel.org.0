Return-Path: <linux-next+bounces-6799-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046EBAB8B50
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 17:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB2E67A5792
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 15:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3F820F077;
	Thu, 15 May 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIqY3l+E"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A0F17A58F;
	Thu, 15 May 2025 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324160; cv=none; b=bwVHkj1YF0d16+zuicbVumc1BTwU5OQ8AUIcsn06r0i36XQU6LkkfXlXfOpH3koKPIxfY7tan4/QHQ24awXfceNjTDHazz6+RCMUYXPxLwHfu+gaHruSKPoNmrvgFiLxYoldc2TU8/EeI6IST9a3cmke9wEBrJtoOnowU2oKBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324160; c=relaxed/simple;
	bh=Vx9qUQIItg/S4+4nYCEad05056XH48R2umxYRa5UWEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhKKaF/Z0LGP2LKNgN/H4jslmxH0FCI8c7iqsET9ot/NfurUOoDHx5jHYJCrsnpE+pSDX81p4huojJpiWxvK5Dxgs1hFK7/Bb6Y2ZuHAHfoEp2TSMoyo1TMrxKi1oXtW+dS8Pz8N23B1wfw4IkCuC0WXjoRfi7ixAVLU2NCdTCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIqY3l+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D10AC4CEE7;
	Thu, 15 May 2025 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324156;
	bh=Vx9qUQIItg/S4+4nYCEad05056XH48R2umxYRa5UWEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cIqY3l+EIEaPk0oi267TmfcfdOOjqarZaMdC/otccwOnBnO0Jbma/54wtU7Ke04bt
	 qbhSW2GUS/nH3wxO4OSZexPDjk1DVTf1pr92Yt4+BOYjJlLLxrKbTzoz/xZ2YX+VuD
	 yTrCZ6QguW30ek+mZrIrpe640Y+6VVX3UOnh6grIYpcLvJbY6ujrZE/1iIkKuOTAa/
	 J8Qh61fF8QTKVZmtQXFF2ULaJmZZ7xKbizg/JOY5t1lGRTY4q91lH7KHygNm3eFWRv
	 L8uDQcb/9wiKaPfDT9X3z7h6f75gaZp0uRxEJYn1Cr91rHIe28xdLlbQiIb+TjM35z
	 ONi+0WP8yn3Ig==
Date: Thu, 15 May 2025 17:49:12 +0200
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
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <aCYM-A_PYHK2kjSd@gmail.com>
References: <20250512145517.6e0666e3@canb.auug.org.au>
 <20250512152326.3f2f0226@canb.auug.org.au>
 <8c4ab851-1853-442e-90a9-225be16c804c@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4ab851-1853-442e-90a9-225be16c804c@amd.com>


* Mario Limonciello <mario.limonciello@amd.com> wrote:

> On 5/12/2025 12:23 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 12 May 2025 14:55:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Today's linux-next merge of the tip tree got a conflict in:
> > > 
> > >    drivers/cpufreq/amd-pstate.c
> > > 
> > > between commit:
> > > 
> > >    608a76b65288 ("cpufreq/amd-pstate: Add support for the "Requested CPU Min frequency" BIOS option")
> > > 
> > > from the pm tree and commit:
> > > 
> > >    d7484babd2c4 ("x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'")
> > > 
> > > from the tip tree.
> > > 
> > > I fixed it up (the former removed a line updated by the latter) and can
> > > carry the fix as necessary. This is now fixed as far as linux-next is
> > > concerned, but any non trivial conflicts should be mentioned to your
> > > upstream maintainer when your tree is submitted for merging.  You may
> > > also want to consider cooperating with the maintainer of the conflicting
> > > tree to minimise any particularly complex conflicts.
> > 
> > Actually it needed the fix up below.
> > 
> 
> Ingo,
> 
> Can you guys make an immutable branch for Rafael to merge into linux-pm for
> this change?
> 
> I can redo the amd-pstate merge based on that immutable branch.
> 
> Rafael,
> 
> If you want to just carry the fixup that's fine too.  Just LMK what you
> need.

If it's only about rdmsrl_on_cpu(), how about the simple compatibility 
wrapper below instead, applied to the x86 tree?

Can merge it into -tip and tomorrow's -next would resolve this without 
any changes or merges done to the PM tree.

Thanks,

	Ingo

===============>
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

