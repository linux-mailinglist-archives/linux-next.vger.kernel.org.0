Return-Path: <linux-next+bounces-6535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41352AAB96A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 08:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5ED1C2601A
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 06:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274BF297B7F;
	Tue,  6 May 2025 04:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="h3AzWpOn"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5437F30916E;
	Tue,  6 May 2025 02:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498831; cv=none; b=Cpm62BY5i9rS1YzxhmagJeFlXdFJvBoG7c6BhzpxzFp915ZUjZk7f2q1gePYfA+wm0aaFa+2vdT22K2pllx6ZJAGYwvxyDQkqq1cJr3QznvV4aDzL2cFA88SQYXQkZkg7kOHr7xpKbtq55KBElPCmZVtsqCLbG/wSTepA5xKB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498831; c=relaxed/simple;
	bh=xVlNlU4XQoRh4d4EOhjr3P9ThvWqnSPcN2Gd0m7hlgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R10jx+dfv4RmsypHVJpx/BrxUf4en55O8lBhK4l7MXxPgP+aKDd/IFU0ObV7vT02RpyuIlLFXvh6a+xTyYFfmsep6xR9TJ9PRwWPYJYEE1xY+CtCbMOrmvJsuRNT6jo0cfdVGYtBj2m5e/WtWc+feyv00OO4lgGu4pzBkIvOV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=h3AzWpOn; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nxrM5dMhPcSwrVYbGQa0JbLBq2iuzf/yihTR/MkMTc8=; b=h3AzWpOnnleKePJmJrJtIjaTy0
	QYS/X0mNwevFaZIHMwAuJT81OygmdER+/ycBtOmW/DsT1/Q/TSkF/6h1zfZAIxEMKdTSfxwFnr0mA
	kywQBwyzfYo6jWU/YQWSa7nLRLwlWsCSMa/rhptPVYgoknpYSdIHESn5ggxHSHwpFjmBmQVgQYJv6
	bx4X2gGEoceBMEGc9spZUgehux0sMIZEarmmDxNW05K8RWs53QzqE9fyo5jYgATA+H4sS2JCTKiXG
	SeIVDOPehY+dggYBgTRa7kDh9+uCvOHgCUsOIpKH6b1bYf7ZEz1jQ/ihSfUnrEqcA1MKazOwJ38kQ
	jV+Zyf9w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uC87r-003lkJ-2f;
	Tue, 06 May 2025 10:33:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 06 May 2025 10:33:43 +0800
Date: Tue, 6 May 2025 10:33:43 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <aBl1BwLiK-gzQyoz@gondor.apana.org.au>
References: <20250506122222.2a910820@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506122222.2a910820@canb.auug.org.au>

On Tue, May 06, 2025 at 12:22:22PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmocdonfig) failed like this:
> 
> x86_64-linux-gnu-ld: vmlinux.o: in function `__chacha20poly1305_encrypt':
> chacha20poly1305.c:(.text+0x1a690e1): undefined reference to `poly1305_init'

Thanks Stephen.

I've just pushed out a fix for this:

https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=43d9d3e84ee1bc1ca98a964e0963bab39de36a44

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

