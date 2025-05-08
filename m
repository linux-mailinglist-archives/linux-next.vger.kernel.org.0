Return-Path: <linux-next+bounces-6601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD88AAF705
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE8C11C074FB
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2D81DF24F;
	Thu,  8 May 2025 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="HKg25dbL"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595F4B1E5E;
	Thu,  8 May 2025 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697536; cv=none; b=A6AldDfUCwNvtkJHFmmbmssym/gnFLydOXozy85LhMxwykRp4kOlideBoxb7zIuWBtjgsMD0MGiJnxdeb9fGO63R0/oM/GLcW1c/ZyWOlNsLJQ3/SLMNU0LXU397cbMkFQzBrHEuQqEYHqr5bD3ONNTUZPCZD24i3aJbxldCBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697536; c=relaxed/simple;
	bh=LZ+We6RstvXrTAwLvGur5AxhkGHLHFMGK3WsmzgKcb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTFvDfu0MJZn9HD3TxnNYrsRNnXJBoOjQykoSPkh9rXgWTnzRztwlyAdLFGDgN0ZzFtWAobEMXzSNvCd026u7904u/XDGH5AczzskP0PhGQRyLnzMqcYXwlLZ5OXjAioyf5UcijS0XIrDbBeO8SLQvKiJuZNhP8YXZOQZRh+M8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=HKg25dbL; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=g/ccLz5dJiien7YjF9yF+p8cxGnmQqaozckhtdt2pR4=; b=HKg25dbLB4RO7H+OcPKBlfNEA6
	AdV9Fq+OMVJRE99qHHkvZMQDGv46erC1CI8FA6/e0aQiPJdm+9e1eYvqWlsSATSZRTfFOQW0P6+27
	eR6hOYxOFmio5ZBEmRAV2HwghegtrA0Z7XsuDMAI0vmtpK3Qiz2omfg56LLdYFArHb21B0awR3fv6
	kCIpbReXZuCXhPRLjJbnMW3r6LUyngP8mEKRbO4L1kxB0p4GX5la7h0MXAI/i0uC1M9j9hnByrXG1
	HXMzHJzmHgWODq8YabeNivmKKRDOHN/EYR2whZHT0Q6aKS/itpGmr24fDzYLVU9V1LpmwM7MDklE5
	SerduPcw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCxom-004YI1-33;
	Thu, 08 May 2025 17:45:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 17:45:28 +0800
Date: Thu, 8 May 2025 17:45:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aBx9OAyiDx7MYAVs@gondor.apana.org.au>
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
> I tested this patch by applying on next-20250507, though it fixes the build
> issue, it has introduced a boot warning.

Looking at the history of this code it was never used as lib/crypto
prior to commit 378a337ab40f88d63ba71d68ff578ead7f5ac8f1.  So either
this code simply doesn't work as lib/crypto for some reason, or my
subsequent blockhash change broke it.

Could you please revert back to commit 378a337ab40f and see if the
lib/crypto chacha20poly1305 self-test passes with that?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

