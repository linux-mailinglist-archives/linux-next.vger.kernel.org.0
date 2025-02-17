Return-Path: <linux-next+bounces-5474-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C139AA38B26
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 19:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D98223B19E4
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 18:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B96F215F5E;
	Mon, 17 Feb 2025 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQFJOTsw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67D438FB0;
	Mon, 17 Feb 2025 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739816174; cv=none; b=m7y30wON/QMfmYJYfz9aDk4aJ3UYBEtIvLrtfgcrTm8Kr1ItOmN4e8vGGl7627BIK7SBS4BQFmkwK56TV7Go08QXdagHt3vC1Z1iYREliN62cRE6pi4C5Ae7nqg+eAhP23N4jw4KkW4s0j6TpzlJdxJJxcYrXG6P6KSmgjdz2bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739816174; c=relaxed/simple;
	bh=8jJF4h1VZsO4TU1g0ukVbyX19HvGbQr1TXRSd7Fs81U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUrk14pUmXCBt8s1kRosbHjEZQ2caSOPHhpgp8+/fXorHlTh2MvKg7L4aEEZRESFQmZThzsIwK2KU39K+YbA+0uOQ0BMLPn5cQ9t/rKm1YxgGoIiSQB/PzuFlNK2bcWjoETpR6jwoMoyQSku2iUiqQgw0r1Wnmv/y8k2/9yrWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQFJOTsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34398C4CED1;
	Mon, 17 Feb 2025 18:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739816173;
	bh=8jJF4h1VZsO4TU1g0ukVbyX19HvGbQr1TXRSd7Fs81U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQFJOTswQg4CvzX1648lCoxBIOJDaewV/doleqMuQjLolxrcU2YOPrf5jXKJtGkrI
	 Rur5sIsxyBfr0vp0Cb7/Z+Tpc5/l8IMMq+aY5H09SthQQ4CZZRut2QJmjyX4d8ckYo
	 Y1IYVN6Vl4b6snOJH82uuUUfiSPvc77bP/gV6V5yXb24/WoOpJw07oqGSzVCO5uOuB
	 BqDDYcuo6gFz8lUhE96bsMYaTMr0Zyv0KoIpa3zjKz4dQlSB7OhaGkV8layS+hPBfz
	 qnudoqJE0oZFjf7/calN6RB6ubGD4k6/bpL//neUUMW4r/f28VF+BMXjM3+TdnugK5
	 qnxojGPXaY9Jg==
Date: Mon, 17 Feb 2025 10:16:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	x86@kernel.org
Subject: Re: linux-next: build warnings after merge of the crc tree
Message-ID: <20250217181611.GA1258@sol.localdomain>
References: <20250217170555.3d14df62@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217170555.3d14df62@canb.auug.org.au>

On Mon, Feb 17, 2025 at 05:05:55PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crc tree, today's linux-next build (x86_84 allmodconfig)
> produced these warnings:
> 
> vmlinux.o: warning: objtool: crc32_x86_init+0x1c0: relocation to !ENDBR: crc32_lsb_vpclmul_avx10_256+0x0
> vmlinux.o: warning: objtool: crc64_x86_init+0x183: relocation to !ENDBR: crc64_msb_vpclmul_avx10_256+0x0
> vmlinux.o: warning: objtool: crc_t10dif_x86_init+0x183: relocation to !ENDBR: crc16_msb_vpclmul_avx10_256+0x0
> vmlinux.o: warning: objtool: __SCK__crc32_lsb_pclmul+0x0: data relocation to !ENDBR: crc32_lsb_pclmul_sse+0x0
> vmlinux.o: warning: objtool: __SCK__crc64_lsb_pclmul+0x0: data relocation to !ENDBR: crc64_lsb_pclmul_sse+0x0
> vmlinux.o: warning: objtool: __SCK__crc64_msb_pclmul+0x0: data relocation to !ENDBR: crc64_msb_pclmul_sse+0x0
> vmlinux.o: warning: objtool: __SCK__crc16_msb_pclmul+0x0: data relocation to !ENDBR: crc16_msb_pclmul_sse+0x0
> 
> I have no idea what has caused these.  Just sending to the crc tree
> owner (due to the symbol names) and Peter (since he made the only new
> change to objtool - though it doesn't look vrey related).
> 
> -- 
> Cheers,
> Stephen Rothwell

Thanks.  I'm wondering if this means the crc assembly functions need to use
SYM_TYPED_FUNC_START instead of SYM_FUNC_START.  But they are only called via
static_calls, not indirect calls, so previously this didn't seem to be necessary
even with CFI enabled.  I'll look into it.  Peter, any thoughts on this?

- Eric


