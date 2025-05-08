Return-Path: <linux-next+bounces-6602-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08AAAF721
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6818C17F39B
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15441DF24F;
	Thu,  8 May 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="nck3UzlB"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13981E5B88;
	Thu,  8 May 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697798; cv=none; b=cKI7ffHrGHh5XPY4tHQ1172ZaB+IT6b4wud7e67B3rqyy7WE0rersO3Up4HCp7TyHXh+EJ/n2DOfA2bhGLMOu2zIXLgMFdP+9hhCmKHo/z5+izjc8aM83xJtQONDRQrpDNiX9W5iv8QeVy+N99jlG7cSW3ZNEABO3PWctwjnzfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697798; c=relaxed/simple;
	bh=FAWO0xeK1ciR41NKz574Ms/5eHTTFJcuxbTL4VEl0Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgmmFKnoNnKIVJ+nIa0N0oLjXNaSphFBVemhBorrttuANf75OC92kDV/IfoUqoZD/GKuKWFX2Qal/ig1tYpxqDxQh9lfa9c+Qk6deB3j6i3teac12gsSA5SV6HE+U4DIiARasj1GNqM+5tObZaP+1xV86S1E4bn8rrdP8h0HMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=nck3UzlB; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hcyLLY7yx3DPaHNwQl6cU6b3anMDZlyWXXRlSkTU1bM=; b=nck3UzlBhRY7F4ElwVJRKkeUEt
	IP1Hc5sAszRsR1WYb64SKOZ/TqzqWzc0dcl/FsDecegPkMWbSjJ5fJkKYdIq38PWO5u7SZms2NwA+
	d57mP3Qp1mOxKQ9T887whieB0Cl9dwEqdmWq9Fi2szh9PcYNupU9KmzZjSNLNPxaC/B5uI42tTsvB
	NQz1KmEi3HRq34rB1Xg+0zYQk/xTZY8fmVnhwh6enEhbcMaXXwP/uyv/zsoDr+/koLkn1MFRndwmF
	WeQ2JVEEMV0S5SdkGWZhdbZ1biYJVmMP+HGwHxTKNLk0KL8gxSjcf17dMgSJWtNFamTkiLOeKfC7J
	h0yjVIqA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCxt2-004YLu-0Z;
	Thu, 08 May 2025 17:49:53 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 17:49:52 +0800
Date: Thu, 8 May 2025 17:49:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aBx-QD04RPH03ikC@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>

On Thu, May 08, 2025 at 02:46:06PM +0530, Venkat Rao Bagalkote wrote:
>
> Warning:

Please also run the Crypto API self-tests for chacha20poly1305.
If you have built it as a module, then load it with

modprobe chacha20poly1305

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

