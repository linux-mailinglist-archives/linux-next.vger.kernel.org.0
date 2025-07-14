Return-Path: <linux-next+bounces-7532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB54B049F7
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 00:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 291AE1A67DAA
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 22:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D418A26C3A4;
	Mon, 14 Jul 2025 22:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ffV2Q9jg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B57464;
	Mon, 14 Jul 2025 22:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752530834; cv=none; b=VSMVt2Brzq/J4dgw92npIpcdHwGryV/imX4j/AxHQJOj6mYlHapj9Yyn0v4x3MDb7u0+8lzLG6juBgfY5v/jYkA+jx7p/dVqsP9X4L0XxKCeZWRkLJHBdSBv/waFXYrBDSA5JJJRgzUB1O+ZLVUuYSVeyUjWAAn6lakfXrRlV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752530834; c=relaxed/simple;
	bh=a28dfkLrLPHjn1dnLwUqzodcFdPz1X/lbgWg1W7+kC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b70Gxzv5TXY3jBvezKIYqCEst2Y4B5lxbXOyLHt98uZA1EGtt7tuUbKsEkS7hhWhN/hGGeiTYI4joP/a56FjWEZnrsEbfBBekkhrErHyNHhjydb71pcr2gwozeH0ybNgUJ4C5i9Fshj615oX4dkIzd3LQY2r6AFj5fXsQrJFrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ffV2Q9jg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E0CB240E01FE;
	Mon, 14 Jul 2025 22:07:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ADXmonTqBNhX; Mon, 14 Jul 2025 22:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752530820; bh=W9DumkznDxVXDxXSPjRsMKgUaICCSBWV3IK48/pyGzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffV2Q9jgn5QyRL0qknffFnbqG/3PoRDpenL8kc8KJkmPw/0DI/xRueLwtEDc/qvZJ
	 8meLyQZDeDahYGI+IpwciNCr5TF9H5xiYbm9GzepAQ/7HPXusQBZPSLG18wjO5hytJ
	 6090NmAWzp5+oKDnKWR/bwl8yvSgEG9MrF/KDxMPg6adZppyyV1iHdzBMO3wC/D/+j
	 osu9RMkxHqK+x0NJVg/EXEr9u7RumFYktZrvFmqN+tta8nuDTcHxwIFGd1sJKM42fg
	 +JNZYCqfI9XQIdzdiS5IcDjBJ4ZeQ8tmABYVnReZIVXqNu09jbCI0pFflxhfTe1ikt
	 d4dk877YgxiibBc6Sr5IZ2zl2P74lJqZ7XHZ8+nPZqfxTynnS9DqJH/dr6gZGo82yF
	 lC0GjrrHz1W0urquZbnWC65mecprvZ0z3+kOBNBOwJSBWgoygbUWKE2G4rM2+zioGI
	 5HWXDe4hz/c3ilP8EeKK85uHM4ygIyyKWi6Rn+ckoBzHM03tQLDEuhqWUe5fJK7GS4
	 9qAfMO2HQXgeMBypMDDj0IUwQV1oAwPUCstbuOoTvc3DZQnPhPmIS5IPv9SVVbYYD5
	 H4d1YBmzk6oApnLJxADI0oT25mA4Sqs6Akg2R2r3u59RJgIHq9YQ7bt8zpWHjE1EiB
	 1P1+Bt39FGzDca4BS4eEi9QM=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B50E040E01FD;
	Mon, 14 Jul 2025 22:06:53 +0000 (UTC)
Date: Tue, 15 Jul 2025 00:06:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250714220647.GUaHV_d3Bg7LPoVrga@fat_crate.local>
References: <20250715074744.5cf446ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715074744.5cf446ec@canb.auug.org.au>

On Tue, Jul 15, 2025 at 07:47:44AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   14056ab8aa1d ("x86/tools: insn_sanity.c: Emit standard build success messages")
>   122b69a53b3f ("x86/tools: insn_decoder_test.c: Emit standard build success messages")
> 
> are missing a Signed-off-by from their committer.

Not anymore. The next tip/master will have them correct.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

