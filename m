Return-Path: <linux-next+bounces-9604-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2437D0C18B
	for <lists+linux-next@lfdr.de>; Fri, 09 Jan 2026 20:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABE55302350E
	for <lists+linux-next@lfdr.de>; Fri,  9 Jan 2026 19:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7909930F540;
	Fri,  9 Jan 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="04jDZAJf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498FD30EF9A;
	Fri,  9 Jan 2026 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767987563; cv=none; b=Wz5fhDZE1o6Mbx4Yj1oO/FJd7NKfMRDsq8hOCQlTO93BXTSdfdfNXLwnIUE+ECQH9U8n3/jUF3h0EHpHDNmImVr9r39oHloXWOwGdd1GmjACdXa9ztm9IBoO1ASZoCJc3TKOlQ8O//se7+OHflvA3z6EIYs9GFwvII7iePZqkJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767987563; c=relaxed/simple;
	bh=yLaROoOCoGHgo08NibIu0H+2reG7BMiFBrOmrnIhHy0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HGjFso/jXhrIxRdd/e1ULlBD2X7zuY10OwZltS4uBkDJ7Tq9GWBmbmJUM9QzwZuTqGUkHfguy6goxZC2NYBHI07T617L+MbF4DXh/1taWkB8MxD1wRjO8LAoId83CiAswpAyV6Ggn3mBVg9iCvTVh8r0MREZ2Y0Pit5klcVw9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=04jDZAJf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2F0C4CEF1;
	Fri,  9 Jan 2026 19:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767987562;
	bh=yLaROoOCoGHgo08NibIu0H+2reG7BMiFBrOmrnIhHy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=04jDZAJf2Tpv32Nm5Q93lr/XYlx0V2fj6O3fsewfLrbN3i/DdebLf62nBzVQMH3cw
	 Z+jqLytCHK/NFX+p6x9dU/1Lgc78bIHHXLdwRy3+CoszpFk2laRDJYVxQc6grDwHR1
	 qmg3Ees1bwGR8N1br2J1/hoaSBH+3e/X3kGiMjS4=
Date: Fri, 9 Jan 2026 11:39:21 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-Id: <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
In-Reply-To: <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
	<20260107144753.7071f5f2@canb.auug.org.au>
	<20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
	<20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
	<20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
	<20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 9 Jan 2026 20:24:04 +0100 Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Jan 09, 2026 at 11:17:44AM -0800, Andrew Morton wrote:
> > This is utterly impractical without support from the x86 maintainers.
> > 
> > I upstream a *lot* of patchsets which alter x86.
> > 
> > I looked once.  5% of those patches had an Acked-by or Reviewed-by from
> > an x86 maintainer.
> > 
> > I cc you guys until I'm blue in the face and it's always crickets.  I
> > simply cannot permit MM or kexec progress to be blocked by the
> > unresponsiveness of the x86 team.  It's very regrettable but it's
> > almost always the case that I just have to proceed without your
> > assistance.
> 
> Well, cross-tree issues like that aren't fun either. And you know very well
> that we're all overworked and drowning in patches. So it's not like we're
> ignoring stuff or whatnot, on purpose.
> 
> So it sounds like we need to decide upon a scheme where we work together
> better and don't step on each-other's toes like that. Lemme talk to tglx.

Cool thanks.

I'm not particularly concerned about these integration and build issues. 
Shit happens, that's what -next is for and we fix things quickly.

My main concern is to avoid placing too many developers on the critical
path for MM development.

I mean, it's a really common thing.  Because we all love statistics,
mm.git MM development branches presently hold 262 patches, 16 of which
alter arch/86!

mm-page_alloc-prevent-pcp-corruption-with-smp=n.patch
x86-kfence-avoid-writing-l1tf-vulnerable-ptes.patch
x86-xen-simplify-flush_lazy_mmu.patch
mm-introduce-config_arch_has_lazy_mmu_mode.patch
mm-introduce-generic-lazy_mmu-helpers.patch
x86-xen-use-lazy_mmu_state-when-context-switching.patch
treewide-provide-a-generic-clear_user_page-variant.patch
x86-mm-simplify-clear_page_.patch
x86-clear_page-introduce-clear_pages.patch
mm-make-pt_reclaim-depends-on-mmu_gather_rcu_table_free.patch
x86-introduce-arch_zone_limits_init.patch
arch-mm-consolidate-initialization-of-nodes-zones-and-memory-map.patch
arch-mm-consolidate-initialization-of-sparse-memory-model.patch
x86-dont-reserve-hugetlb-memory-in-setup_arch.patch
mm-arch-consolidate-hugetlb-cma-reservation.patch
mm-numa_emu-add-document-for-numa-emulation.patch

> > This particular patchset is a kexec thing so I added it for testing
> > because I look after kexec.  I'll drop it and shall trust you to handle
> > Coiby's contribution in an appropriate fashion.
> 
> Yap, I'm on it.

Thanks.

