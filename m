Return-Path: <linux-next+bounces-9506-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BC4CDED30
	for <lists+linux-next@lfdr.de>; Fri, 26 Dec 2025 17:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D71C030056E7
	for <lists+linux-next@lfdr.de>; Fri, 26 Dec 2025 16:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68BA28642B;
	Fri, 26 Dec 2025 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tD0gO0Az"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDAB335BA;
	Fri, 26 Dec 2025 16:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766767538; cv=none; b=j4/9hmxig9X0yoVNQYYjPU8X2fbszP0bF1wH5F5IQyYJdGgGm6XsOnDMnhYMojdhwA+HFLdKl7faTN3/2vrTJpnWwOneu5yt/rHe2Y2TmciAEj260cBy4YNbN2HIuD068itLtC+q1viFlIwCoIiz3bD5Sow7YctsO1VU3rugRqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766767538; c=relaxed/simple;
	bh=+x7xE01sFDbthitjuhJ5PVMzRZt4sWuu6lI+r6JeZw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNV+a5H9nDtidoYbHICK/NGuAuPN6FGqFDBlEwkmzrZyJJVzFPNgZ9HcaSSyAmawzmHxBuSf0EzLNGJH9jPh/rhdTUJQuWpEh1vTNT901S73mv4t3tAFie4z0L44ts5D8O9a2SkDYcF+XEABUnbJGtj2HN7ERXtMJxuzAx6hkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tD0gO0Az; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E25C4CEF7;
	Fri, 26 Dec 2025 16:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766767538;
	bh=+x7xE01sFDbthitjuhJ5PVMzRZt4sWuu6lI+r6JeZw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tD0gO0AzxZACZBcmquahpIkAVkxqfAy+4Q77/ww5Pkmz+22tcwhYhRKkqQUTzEJ3m
	 /8zEmi1Jjtiv2WhQ4aZyFzentI9+rGj/dhDk1Xk8Im+emMdtKBSt9LI8xC/crSKEQ6
	 rw82sMmj8CY8pxEAxzMmVLCH9qH+Kz6M9/0JtvjIZbdxqL8DAyE39wWRfLMv0D/Qus
	 JL0fmGB8oMqxaiPLRGYFxEvytMbABD91sIPM5jOJ58ytkI7/r1ZEO2ptfFOAuwBVvg
	 MO2VshFr78PwF6izr5EM3nombnhmRbSBW735q6CnUnrJ79elRqEW21o3rEWuBCRE7V
	 dAhX6xrY0U66A==
Date: Fri, 26 Dec 2025 11:45:36 -0500
From: Sasha Levin <sashal@kernel.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <aU67sD1u83Qrpvdu@laps>
References: <20251218153050.44da4a78@canb.auug.org.au>
 <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fcc9ca3e-8c04-43c0-606c-e798bc0cf9ce@linux-m68k.org>

On Sun, Dec 21, 2025 at 01:58:17PM +1100, Finn Thain wrote:
>
>On Thu, 18 Dec 2025, Stephen Rothwell wrote:
>
>> After merging the mm-nonmm-unstable tree, today's linux-next build
>> (x86_64 allmodconfig) failed like this:
>>
>> x86_64-linux-gnu-ld: error: unplaced orphan section `__bug_table' from `arch/x86/boot/compressed/sev-handle-vc.o'
>>
>
>I found that I could reproduce the same build failure after applying
>Peter's patch to v6.19-rc1. So it's not confined to linux-next. I used
>allnoconfig with CONFIG_LD_ORPHAN_WARN_LEVEL=error and
>CONFIG_AMD_MEM_ENCRYPT=y because allmodconfig takes forever to build.
>
>The patch in question is this one:
>https://lore.kernel.org/lkml/0c18fd08ef19497768070783da28086e01d11a00.1765866665.git.fthain@linux-m68k.org/
>
>I may have found a solution for the problem, but I don't understand this
>code, so I've Cc'd Ard et al. I don't know whether the __bug_table section
>is relevant to sev-handle-vc.c. If that section is not desired, I propose
>to make this change to Peter's patch --

I think that the issue here is that we're trying to use WARN in the early boot
context. We should probably add CONFIG_DEBUG_ATOMIC to the list of configs we
disable for that:

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 4f86c5903e03..bb36dcef7d08 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -14,6 +14,7 @@
  #undef CONFIG_ARCH_HAS_LAZY_MMU_MODE
  #undef CONFIG_KASAN
  #undef CONFIG_KASAN_GENERIC
+#undef CONFIG_DEBUG_ATOMIC

-- 
Thanks,
Sasha

