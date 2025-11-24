Return-Path: <linux-next+bounces-9191-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D181C8248A
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 20:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A89934A0A5
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 19:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FD62DEA94;
	Mon, 24 Nov 2025 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a6mvdVM9"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814C72D63F6;
	Mon, 24 Nov 2025 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011956; cv=none; b=dIba8dQJVGKXV1OkircM6RbTNwcSKt8FZeLWPp1wo556RuJFeMlbWzDXNKbVW0Ql8132RRxYrb0AcR9JQzxcEUwMhOX1vIqEbO1npcE1vtNoYOq1tk70G/I45j4Ski77CEp4m9q68mdA4HpuPAY7OaTJ7mS/vdBEY8Ex5Vh38JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011956; c=relaxed/simple;
	bh=U3BZ7eT5FQCD+gT8TPoxtkCdop+tmEAqyWplI/mco0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U51PCiagBeNgiP2kpZ9ztlkWkKgOlVtVnQVuknclLYSZzKpW+UMuOCw4/zLvDlWQz7D1bvWZycsGyI9oEDihacU7dV/bfDyCGDky63XDVNUP0S6lp0nZI47IrDlJOYTsFhnaoqYfpsATl/44mVAFHCd80Mf4Z02ECSRBEy1CInA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a6mvdVM9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CNa9srSIcY5r3Il/+ILNAkNK75nUaMyNXbkFg6SLZHU=; b=a6mvdVM94zjrf6m8bEJPcIVfMs
	Q82C/zpTrLz7lQF9TN3qSMOCalQ2o6Dx16C7G+X9VR48fhrRICWD1HxKQYqdTGeT59WE0ZIXxbO5k
	HWrOpoU4JSU9REtUFC5R/YFCKzXDwN7SQ1zoxKi0h+2qJpxtDp9gsdEIKeNc6yegEXtxX2N7gll1L
	Rovt/QXgsPG5npKsNh3qyEj+YqR5LncE73qDK9xSknNZ4kSxYMrJGHsjrGq2zKZwkCR+y0rwgIFrc
	SlkfEAhounLJ1xC/MCTbyLuB0goh6/9uMyhrxDB+KDP0ub6X+RrXC3918tKgOGt5ZDQdaWCOHvsEo
	BqFFSR/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5Y-00000007Pk8-1vHo;
	Mon, 24 Nov 2025 19:19:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5E2A53002A6; Mon, 24 Nov 2025 20:19:03 +0100 (CET)
Date: Mon, 24 Nov 2025 20:19:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	ojeda@kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251124191903.GM4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
 <20251124144923.GK4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124144923.GK4068168@noisy.programming.kicks-ass.net>

On Mon, Nov 24, 2025 at 03:49:23PM +0100, Peter Zijlstra wrote:

> This... ok now lets see wtf the actual problem is.

This cures it. I'll go rebase that tree.

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3dd6805b574..d0a96ff5c02c 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -104,7 +104,7 @@ do {									\
 
 #define ARCH_WARN_ASM(file, line, flags, size)				\
 	"1:\t " ASM_UD2 "\n"						\
-	_BUG_FLAGS_ASM("NULL", file, line, flags, size, "")
+	_BUG_FLAGS_ASM("0", file, line, flags, size, "")
 
 #else
 

