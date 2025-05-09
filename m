Return-Path: <linux-next+bounces-6624-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF6FAB0752
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 02:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33E249C6145
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F3D208AD;
	Fri,  9 May 2025 00:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Rt1Qb/aT"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D6182D7;
	Fri,  9 May 2025 00:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751999; cv=none; b=kLulpU4gJU31o9J+bpEXw4BqG2kzKe5FGK11I0/PcpauAgndEBqyYMnHgLo5EbDRllHreypaAd0PGQAHTSlBGDA3bAp+XFwgkA10bZvts6rOWWjZZJ2L6+TAcGlAesIofv8J2GoEh2YpsZWorgzIVLVtNg+NXHjVdYKrqdyK2tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751999; c=relaxed/simple;
	bh=7tI/QR0WcvB+2PsIli1CD4nwjW4vq1lR0fYJi7u2MyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4cGcb9Zgcid6mXKiWu9XIfkPyk2wV0fWBqsTagE8IBuGel9wUZFA4CicgCmnuFAv/tNYvVVVIFDiWFK4G0Hpy026QxknHe4uDbiVev0N6hvAt32YPupLt1i+sLgx+po15jxBvpzrivcXJKyz6/Xl1mc2YFMiZXmyCftq0PRTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Rt1Qb/aT; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zA9GVEDdxoja+P718OpSN889xJ4reyChIzkHQopHvjk=; b=Rt1Qb/aTe3ekyQswjV0W+4iq0G
	Qoha1i3aG1xkEVffqfd+y8bSkAg46HbGCdr+2LGJlDzYmoamGppNZJ1P2+EQLkzPuawPYbsUMFCbF
	WenC65o5DCGxF7RETTgpzSDS+8qMdAc3Q6Ga/fCbsC8GxQkKb+b+gyogg1NJeeJckGD2AU3vT7wSH
	VKfpGLqPzkSJF60xIUrUKkt/DcQKGd58Og4fdU29UUniBV7FHYvaUeZ8IpOZb0mN2T+BX+UvT/LoZ
	tY6l6f9FdkolK9arSy053oaxIEvZrG3/LN0bTMAWQwebCtRBkl3l1ylBOA7ZdXybQ76eo9mGwVT/5
	OOJY5d9w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDBz7-004jGW-0l;
	Fri, 09 May 2025 08:53:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 09 May 2025 08:53:05 +0800
Date: Fri, 9 May 2025 08:53:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aB1R8eIdc3ZA5rCo@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aBx9OAyiDx7MYAVs@gondor.apana.org.au>
 <20250508162954.GB1218@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508162954.GB1218@sol>

On Thu, May 08, 2025 at 09:29:54AM -0700, Eric Biggers wrote:
>
> My patchsets "Remove per-architecture poly1305 shash glue code" and
> "Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO", which included
> commit 378a337ab40f, passed testing with qemu-system-ppc64 with -M pseries and
> -cpu in [POWER7, POWER8, POWER9, Power10].  These issues, both the build failure
> and test failure, were introduced by your patchset
> "crypto: lib - Add partial block helper".

Thanks.  I'll try to reproduce this.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

