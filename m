Return-Path: <linux-next+bounces-5586-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D54A474D8
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 05:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B430017199D
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 04:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B271E8334;
	Thu, 27 Feb 2025 04:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zXPtsdVB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4C17A5A4;
	Thu, 27 Feb 2025 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631250; cv=none; b=YJe9aMldsli0lhnb6qPKYtgjo01vWZqJpmjto72AgH3P5WnjIljth0ZNaUhR80Beq3daTmSMhEuBOd9YCrg7aPUd7vI8d21sqzSlnnuGLmk/HbPC0f6lWNsSLhNfGrbGdPPwhJMxkL2nVm02vNiFmu7p4vkF3KmxUUJFhCjwQiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631250; c=relaxed/simple;
	bh=XfwYYQX+8G+pGI538mDmjEX/Fuhmo2/QgXw/zHLlLWA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sTU5L5TvjloBHw/NF5KYe2o9LwHy0kiA6GTmpYmFyhIPIQjRuaywp9v7HDHfUTjbEqBYLsXxFiunmxj30RRHY6r+MnRoZzJbxsys7eOnfnFAC4zScLhBtxaYRhCN7p7gW5BCQUyXSUaeqPGOl+9NXdjG9N6y3rLHOfiWC0pHBMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zXPtsdVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C87C4CEDD;
	Thu, 27 Feb 2025 04:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1740631249;
	bh=XfwYYQX+8G+pGI538mDmjEX/Fuhmo2/QgXw/zHLlLWA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zXPtsdVBC+YTwcup7GPGH+hlrIuyBx5LLXHiBHJH3FEDcgpA2JWMTA6bpDre3+yrC
	 iIn0fjhi5+/5AyJfS5cij8wFg4okax7xxhdz2DHd5f0r7EPa7z40+eBuZM1q4p7NbR
	 cLnLKrNlgDhv4bF4IN8jIzqqiiA4kzE2yj1Ifr9c=
Date: Wed, 26 Feb 2025 20:40:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Rik van Riel <riel@surriel.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-Id: <20250226204048.9fd955ed7f965bf0df03adb6@linux-foundation.org>
In-Reply-To: <20250227144817.50618ab7@canb.auug.org.au>
References: <20250227144410.275469fc@canb.auug.org.au>
	<20250227144817.50618ab7@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Feb 2025 14:48:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Thu, 27 Feb 2025 14:44:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The following commit is also in the mm tree as a different commit (but
> > the same patch):
> > 
> >   a37259732a7d ("x86/mm: Make MMU_GATHER_RCU_TABLE_FREE unconditional")
> > 
> > This is commit
> > 
> >   a30104ede395 ("x86/mm: make MMU_GATHER_RCU_TABLE_FREE unconditional")
> > 
> > in the mm-unstable branch of the mm tree.
> > 
> > This is already causing a conflct in arch/x86/kernel/paravirt.c due commit
> > 
> >   f2c5c2105827 ("x86/mm: Remove pv_ops.mmu.tlb_remove_table call")
> > 
> > in the tip tree (where I just used the tip tree version).

yes, I duplicated that match in mm.git so it can carry the series
"remove tlb_remove_page_ptdesc()".

> And another in arch/x86/mm/pgtable.c due to commit
> 
>   530c12f84d2c ("x86: pgtable: convert to use tlb_remove_ptdesc()")
> 
> in the tip tree (where I again just used the tip tree version).

Really, I'd mildly prefer that subsystem maintainers not cherrypick
patches from the middle of a series.  An acked-by would be preferred.

I can understand the desire to test a patch within the subsystem's
tree, but that can (should?) be done by testing linux-next overall.

Whatever.  I'll retain "x86: pgtable: convert to use
tlb_remove_ptdesc()" and shall figure it out within the merge window.


