Return-Path: <linux-next+bounces-9499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF19CD3B04
	for <lists+linux-next@lfdr.de>; Sun, 21 Dec 2025 04:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A90F301B81C
	for <lists+linux-next@lfdr.de>; Sun, 21 Dec 2025 03:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0422868A7;
	Sun, 21 Dec 2025 02:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PYqA+/2E"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF42868A6;
	Sun, 21 Dec 2025 02:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766285837; cv=none; b=YdVuaVcNnrJhjRZAhTOWzHSXhP0GJ5aUYsrNHu5c9il6VurxuPWtrcyrK8hkOSgIHIJG/DEfZfE6cTYzz6dqzaQKhu1wdQyLYsomTxM89Q3YMgFrO29JyW0P3GyjCtYRsjdAJbApfXsOXLivJXoQKvFJyJL3XKgx3i4FJQv41y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766285837; c=relaxed/simple;
	bh=ptoeHyv7Jpz3ze34Pplq10qKsdXctP0ONdi8pwBt8Qc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BGWKeetUF7l4i3Punqw+q9cx3Oa/Kg9D4XKtQWCaoXOYVGJcVnL2yPYsmF+HgZzBdbYsGRQ8CHJa7qATYKnnQ5WATDLocvvh7ZCc/KxsgkvzTi8JCcVI1H8dDR8/U4GbRjz8IQCAqOL3+jY4hG7wfdIHBWQJsKakB5Vx0gtMKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PYqA+/2E; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id D871CEC008A;
	Sat, 20 Dec 2025 21:57:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 20 Dec 2025 21:57:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1766285833; x=1766372233; bh=hoZzZXl6c+WFG9E3TsuAo4kB1M+LPXsnuhf
	ZxmC8Elk=; b=PYqA+/2E+iDbvHKOHKl0GNnLnCHxA5WdnaijpwJu+FXxpok0TiG
	4i/peUtqezH958T8Bc6NdV4tQq9FQysygqcH9rRnEuSObCovBNYdiZU1XUsWE5YM
	CpVXs52OGdy7qvUmF0s1YeJ/IatUAwgI0NaPPur6P0kPkJex31h0RI6/n5dIFm1/
	Oq5AsYPycGYJh0oJWbHgYXKV1GrVzxB/Z8wPxiBmw+OQwcI2cJI/KrGuHJTlfUHF
	TdZSEslhoX8lzBVXdFO+s51xdfEWMrdPhlQ+ZcfCHUx3ojrSkI6vzzdDgSU7q/uN
	DrSMLNz/HpHrGaySOjirSE10ja/gDgmrRuw==
X-ME-Sender: <xms:CGJHaZ2V8q8hxtBMLaRcajPLECIbPbBTr-Wb-AM863Ziu8WwEUE0SA>
    <xme:CGJHacqoPGd5sENQiT5nnQ0Sz5Wh5kxKJGDedmpPlVj5Fx-dN7R-yBgxtCflJKyoG
    8L6jJiWsD8-nUS634k_2AOaQb_tsuUIAKxlyrGB16d_cJSer7qBWHH5>
X-ME-Received: <xmr:CGJHaeWSV67Kdam946ZtZ0Ps8DOTaCWzTw8_c2GT8qR8nDfT-VFAXiMXt_btUsMxgoPWvmMpCKFemnBwCurgGjseM-4K7wz74U4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehvdelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepudehledvudejueetffekledutefhgfeufedtffeljeefgeefleekhffhuefhhfeh
    necuffhomhgrihhnpeduledqrhgtuddrshhopdhkvghrnhgvlhdrohhrghdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtoheple
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggv
    rggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    fihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdrug
    gvpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthht
    ohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgiht
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CGJHadpK1Bp-P35ls6pOr0q930tQBIfe9lySPu7xyTwTNXScYMxF_w>
    <xmx:CGJHadCSuZCSL3BSeUMn_q3x_sovNVNivhihOjFscjhsuSy9XqfuzQ>
    <xmx:CGJHaRjarOm67kJ35INs12rXcLK0EPXJgeby0Bo_elyeZgbyt4VLPQ>
    <xmx:CGJHaTbVajxYoZmHpugV9deI1d54qkOkY_vAofBZKGQkKS7TuC9peA>
    <xmx:CWJHadaT-y4CfYf1_jgGPNDKGCRurPtc4zN3OJPKbkqIKtnZ_42uwV4h>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Dec 2025 21:57:10 -0500 (EST)
Date: Sun, 21 Dec 2025 13:58:17 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
    x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
In-Reply-To: <20251218153050.44da4a78@canb.auug.org.au>
Message-ID: <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org>
References: <20251218153050.44da4a78@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Thu, 18 Dec 2025, Stephen Rothwell wrote:

> After merging the mm-nonmm-unstable tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
> 
> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from `arch/x86/boot/compressed/sev-handle-vc.o'
> 

I found that I could reproduce the same build failure after applying 
Peter's patch to v6.19-rc1. So it's not confined to linux-next. I used 
allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and 
CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.

The patch in question is this one:
https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/

I may have found a solution for the problem, but I don't understand this 
code, so I've Cc'd Ard et al. I don't know whether the __bug_table section 
is relevant to sev-handle-vc.c. If that section is not desired, I propose 
to make this change to Peter's patch --

diff --git a/include/linux/instrumented.h b/include/linux/instrumented.h
index 402a999a0d6b..d39d89206561 100644
--- a/include/linux/instrumented.h
+++ b/include/linux/instrumented.h
@@ -68,7 +68,9 @@ static __always_inline void instrument_atomic_read(const volatile void *v, size_
 {
 	kasan_check_read(v, size);
 	kcsan_check_atomic_read(v, size);
+#ifndef __DISABLE_EXPORTS
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
+#endif
 }
 
 /**
@@ -83,7 +85,9 @@ static __always_inline void instrument_atomic_write(const volatile void *v, size
 {
 	kasan_check_write(v, size);
 	kcsan_check_atomic_write(v, size);
+#ifndef __DISABLE_EXPORTS
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
+#endif
 }
 
 /**
@@ -98,7 +102,9 @@ static __always_inline void instrument_atomic_read_write(const volatile void *v,
 {
 	kasan_check_write(v, size);
 	kcsan_check_atomic_read_write(v, size);
+#ifndef __DISABLE_EXPORTS
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_ATOMIC) && ((unsigned long)v & (size - 1)));
+#endif
 }
 
 /**


The next patch in the series needs a similar change, which I've also 
pushed to my github repo at
https://github.com/fthain/linux/commits/atomic_t

