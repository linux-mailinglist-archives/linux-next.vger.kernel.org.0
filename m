Return-Path: <linux-next+bounces-8394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E57B8BCA9
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 03:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D550C3A7673
	for <lists+linux-next@lfdr.de>; Sat, 20 Sep 2025 01:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822FD450F2;
	Sat, 20 Sep 2025 01:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="FswL6E+2"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935D2D7BF;
	Sat, 20 Sep 2025 01:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758331079; cv=none; b=Ob2P/6ZCun2LEFuUQU5f7m2yVKKzNyvssIIo2zEIQK9Y5mCMXhy5o0zRdSTdfI08F6sBKX2LZEXRlTWFAvpvFxWnNfPfbsmJUYleHkUJTp0bQdtq7YtgDUEIlH+QEvfzqhSRCtSo2+HS01cIJyuhMJ9Q+ucfdk7LRWsZwd2JRn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758331079; c=relaxed/simple;
	bh=gNX0UEtxWFH/4imQdf3DNEHIZpIH4uDGmmcyj1MgVyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjdUycS4dmANC6S5qkijXRd1daQ1DpVE3zTM3expHQmYVr2YCQDkQ+2NfV7pOvB/od301lyPxL94M06NpQFbUYXj/OHTH0MXT8NpmPw4hgkfQEc/CbduXEA3OXLg0hOMnjBUwF+0ngGcG64FaHMsp/5CarbGACcuI2kDU/D1Kj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=FswL6E+2; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3MlPQsyunBW34maCGd1e3dUneaaMq7GjyuvLhuEqxw0=; b=FswL6E+2c5CYBUnoqDD5o2bxMt
	07gQL8LdvpfSZLQUkNObHngRg1pDHnAyrzlBsX8GbF1Px7Ckdvovp3NuKaBTiV6qDvqVrY/rfkNNO
	YmMhHCPoDL2opPOpTMAxePeCWsY0DA2d2FAPYIyTOJ6sRMPlDpY5s4y33XcpTakZ7fibVZ27tVTe5
	KIeB8OtlTI4/ZwEQ87IV1tkADie7aUNtUvvXIfn1HNxKVBNV/A8PykTAsrdX6nKem88E8tL0/WSDe
	li6+Ncm5Qldhy5ft1GnxFQkhXFPdX+qp+oNjrxjJggv7/FLha/tplqbiFxfKZN3XbaBWtFaWp19oF
	6VqShP6Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uzlye-006vYv-0M;
	Sat, 20 Sep 2025 09:17:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 20 Sep 2025 09:17:20 +0800
Date: Sat, 20 Sep 2025 09:17:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Borislav Petkov <bp@alien8.de>
Cc: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
Message-ID: <aM4AoOSxD4SFo_Op@gondor.apana.org.au>
References: <aM1bJqhtojdLhp3c@sirena.org.uk>
 <20250919204355.GHaM3AiwTM25LiOKAb@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204355.GHaM3AiwTM25LiOKAb@fat_crate.local>

On Fri, Sep 19, 2025 at 10:43:55PM +0200, Borislav Petkov wrote:
>
> Pff, in hindsight those should probably all go through the crypto tree so that
> there's no unnecessary conflicts.
> 
> Herbert, lemme know if I should undo them here and you take all three:
> 
> 648dbccc03a0 crypto: ccp - Add AMD Seamless Firmware Servicing (SFS) driver
> e09701dcdd9c crypto: ccp - Add new HV-Fixed page allocation/free API
> e4c00c4ce2aa x86/sev: Add new dump_rmp parameter to snp_leak_pages() API

I think either way we will end up with conflicts.  If I merge
them then we will get conflicts in x86/sev.  If you merge them
then we get the conflicts in drivers/crypto.

As the conflicts seem to be straightforward, how about we just
keep things as it is and mention it to Linus when the merge window
opens?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

