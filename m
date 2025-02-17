Return-Path: <linux-next+bounces-5475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AC9A38B80
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 19:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6402F188E3C2
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 18:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C36822A1EC;
	Mon, 17 Feb 2025 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eIGlTgWm"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4D0137C35;
	Mon, 17 Feb 2025 18:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739818272; cv=none; b=qj3NMHb3Nru9dALCMYkWUgptvFzmEgx3ngTw5sUHLQM2q88UBN7AfKBWptQ+er1xrlJ6ZhIavHYu3M5pisg+EpzqXpOVUb2flV2N+GJxn5XV2pQ0v1AxrUG9oshkSdXL9FvfUpUUJg7kxY3xrI8YNbIfxVTGalRECxkrHuvPYas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739818272; c=relaxed/simple;
	bh=vuJB/5h57VQjtw9euybCX9qr9FyTPUe5xNhWm1eDHkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHiSrchYBRdQuCeNc+nDDR0O4Ya7hY3GqqELtP/9p379HshrBR64UUXGeBh0XGJScdS2nX3741YsCm1uoMfuaKvE1WU6iuBEZbWfkWTzvidurk23ygNpia96ugWasjBLWUqqGWHXBKQZXZ25aE+TWOMTu9oLsgSYZmptUx3hRYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eIGlTgWm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H/EzBxepApdNs1y8Fa+hAtp29RvCU6l3IVgsgmjB3qQ=; b=eIGlTgWmPTrbqy1JLcunKKGm9W
	eOmKroTvwL1J50re4PfQk04NWhJXMSVfFm6MLeGF0+UyLs0Wck3nnNbF9Xy3qfqyzQpC41VefgAMg
	pJHHvUbsaS/CASxFpTm8aM0kwV6KgYNCS65AclHN1CZLbs6nwo82r/MHzd2iOBXfLGHdPkjZlJSza
	sCqevNNHfgzDMqAASjzR1dpb36xHUBaLLuK8vgMuqhwMHbC4BpsJgNnHrHvX5zBxSpuiJonZpf7q9
	1qUMTdhYaM0zkZoZbmAwGMSzKflOznzej3ElclPkJa1kEjH8plAu2x2pCs16cGwG9jwQ3TbStqmIG
	Efj2y11w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tk6Cx-00000001ntn-1pzI;
	Mon, 17 Feb 2025 18:51:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73A6E300756; Mon, 17 Feb 2025 19:51:06 +0100 (CET)
Date: Mon, 17 Feb 2025 19:51:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	x86@kernel.org
Subject: Re: linux-next: build warnings after merge of the crc tree
Message-ID: <20250217185106.GA7304@noisy.programming.kicks-ass.net>
References: <20250217170555.3d14df62@canb.auug.org.au>
 <20250217181611.GA1258@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217181611.GA1258@sol.localdomain>

On Mon, Feb 17, 2025 at 10:16:11AM -0800, Eric Biggers wrote:
> On Mon, Feb 17, 2025 at 05:05:55PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the crc tree, today's linux-next build (x86_84 allmodconfig)
> > produced these warnings:
> > 
> > vmlinux.o: warning: objtool: crc32_x86_init+0x1c0: relocation to !ENDBR: crc32_lsb_vpclmul_avx10_256+0x0
> > vmlinux.o: warning: objtool: crc64_x86_init+0x183: relocation to !ENDBR: crc64_msb_vpclmul_avx10_256+0x0
> > vmlinux.o: warning: objtool: crc_t10dif_x86_init+0x183: relocation to !ENDBR: crc16_msb_vpclmul_avx10_256+0x0
> > vmlinux.o: warning: objtool: __SCK__crc32_lsb_pclmul+0x0: data relocation to !ENDBR: crc32_lsb_pclmul_sse+0x0
> > vmlinux.o: warning: objtool: __SCK__crc64_lsb_pclmul+0x0: data relocation to !ENDBR: crc64_lsb_pclmul_sse+0x0
> > vmlinux.o: warning: objtool: __SCK__crc64_msb_pclmul+0x0: data relocation to !ENDBR: crc64_msb_pclmul_sse+0x0
> > vmlinux.o: warning: objtool: __SCK__crc16_msb_pclmul+0x0: data relocation to !ENDBR: crc16_msb_pclmul_sse+0x0
> > 
> > I have no idea what has caused these.  Just sending to the crc tree
> > owner (due to the symbol names) and Peter (since he made the only new
> > change to objtool - though it doesn't look vrey related).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> 
> Thanks.  I'm wondering if this means the crc assembly functions need to use
> SYM_TYPED_FUNC_START instead of SYM_FUNC_START.  But they are only called via
> static_calls, not indirect calls, so previously this didn't seem to be necessary
> even with CFI enabled.  I'll look into it.  Peter, any thoughts on this?

I removed the ENDBR from SYM_FUNC_START() because it is insufficient vs
CFI, so no point in having it there.

If these functions are not indirectly called and only ever used through
static_call() (as you say) you can adorn them with:

	ANNOTATE_NOENDBR

to tell objtool to STFU :-)

