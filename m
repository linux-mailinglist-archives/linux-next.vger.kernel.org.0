Return-Path: <linux-next+bounces-9183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E3C81270
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 15:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA0D33A9A44
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 14:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A9A28C862;
	Mon, 24 Nov 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TzKctMUe"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E1228726A;
	Mon, 24 Nov 2025 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995770; cv=none; b=bgZgQ1J7JxAkD2mpAmsOGXMVqmjSy6njZPFPV+GObOq5pkSho6ABeynv+V80KTLgDbs9ttLxidPEfo3wxYHrfd9sFPv83MwJ66gGpVbr6AAyJd7mIVpxK0NkSadHiqIIZ9Qw+0n89fkYvBYaZTYzTjhlpEbss6l+ZRsG4klNs1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995770; c=relaxed/simple;
	bh=eYVozzDJl+VlYa+0Xgx12ibrXMDoIH+H55EfKIIHcFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUiugDvXoyqE3UKOO2cFyFptliCXZMgrIXt8ZVxnOZTtxlyjnGF7Vz5hvDRmaVMM8oV4TZXJUBbNaL0Dss/Vo5DOHym3WdE+ctUmBojs3EqnD8fkWwBJw8niC1SGVcGz4vcCqEiQlUxdVM6GAsGBsQQTe+4usnhiWb0AuRo8WdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TzKctMUe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T6qo3JM9edKF9yotTrqC4KSWMlApaFYSQyRMCU7A0QQ=; b=TzKctMUePuak9AjKx6VCue/cUf
	NGK3H/RvKt7isPtkb8XB163+z/iiJ28CRVy1LxLAqSONdk0XyC4/2jadqhXmJ8ExM6Y10IcKePMDb
	nDi9cMY3LdUjnPrc32RaCOaMOeBkXrjGCWkzywRBpqhLnRJkscEWbZUqwGL7MkUUlNB/Cz6TJCtGL
	4ZwbXiKaAhZOMbrr3xoo2UPDUVfQZxSNtJN/Zg8la2nnYw/SjWQpRFehAc/g+owRbIiQemlCwlRTW
	FUftrTTwZPlLFZHRRYC+dS1wBy7VmZOdtOJojQB+vi/fw3+IVJYvfE7XwL3amum/RzF4lZuJxSuJk
	dp/f/e/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNX0y-00000003u95-2jhQ;
	Mon, 24 Nov 2025 13:54:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 84766300230; Mon, 24 Nov 2025 15:49:23 +0100 (CET)
Date: Mon, 24 Nov 2025 15:49:23 +0100
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
Message-ID: <20251124144923.GK4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <aSRlFB9PoOcZVmvt@tardis.local>
 <20251124144714.GT3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124144714.GT3245006@noisy.programming.kicks-ass.net>

On Mon, Nov 24, 2025 at 03:47:14PM +0100, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 06:00:52AM -0800, Boqun Feng wrote:
> > On Mon, Nov 24, 2025 at 01:32:49PM +0100, Peter Zijlstra wrote:
> > > On Mon, Nov 24, 2025 at 11:16:44PM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> > > > failed like this:
> > > > 
> > > > ERROR: modpost: "NULL" [drivers/gpu/nova-core/nova_core.ko] undefined!
> > > > 
> > > 
> > > Rust :/
> > > 
> > > So I have:
> > > 
> > > $ make O=tmp-build LLVM=-22 allmodconfig
> > > $ make O=tmp-build LLVM=-22 rustavailable
> > > Rust is available!
> > > $ grep -e CONFIG_RUST= -e CONFIG_NOVA= tmp-build/.config
> > > $
> > > 
> > > Help ?!?
> > > 
> > 
> > [CC nova]
> > 
> > On my system it seems that RANDSTRUCT=y prevents the enabling of RUST,
> > but I'm sure Danilo and Alexandre have better ideas about how to enable
> > nova-core.
> 
> Ah, indeed, RANDSTRUCT seems to be messing things up. I tried disabling
> that, but then I need to manually enable random crap to get Nova happy
> and menuconfig isn't very nice.
> 
> I really don't think rustavailable is doing a good job here. Strictly
> speaking yes, its available, but figuring out why things don't work is a
> giant pain in the arse.
> 
> Now, lets see if frobbing Kconfig to disqualify RANDSTRUCT will let
> allmodconfig work better.

This... ok now lets see wtf the actual problem is.

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 86f8768c63d4..4a5890796ac2 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -282,6 +282,7 @@ config CC_HAS_RANDSTRUCT
 	# Randstruct was first added in Clang 15, but it isn't safe to use until
 	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
 	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
+	depends on BROKEN
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"

