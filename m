Return-Path: <linux-next+bounces-6523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B5FAA90DA
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 12:23:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C693B6BD9
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 10:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283481FC104;
	Mon,  5 May 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="rzQe53b+"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C315A8;
	Mon,  5 May 2025 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746440580; cv=none; b=ZbvXvWKtzJHqyQT9+et0lJ5LXQ9edc1wTYHtTH+MUC8vLf50WD3jm1BnUU6Tfm5x348vDqS9lvAceagcvCPJfJrJ8iXw/CKSAKCqI+Np4Ef6GeM1wVoTMGnuqtd361TQI4kv0bNB//XFrLDPvTn6i0coHqBcnOxhtC8Me4rnN5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746440580; c=relaxed/simple;
	bh=Z4hVojmERzfBn9CIInqPpHVWMjZe+I5ax3UbOoKifHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9EXHcJKCq6y2pZa4iZ5BsYmE81nZJEICHThL3gT5m2rVCfH1Kw7Zg2G5FSkhmmRvT4V/wbXWGZ90uUN8iHIVf6NWqy7iGIoebE3oQnKTsck9p01E7OugcXSDSthXgX7wg3z4Prs1UJO8WyRGV6oRymuFVgknMZMvQ8aKMfD0is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=rzQe53b+; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cFCSbdCm8jPrA1W3zt1VcTNVdv52ZNyMF4XWqAzq0wY=; b=rzQe53b+vFyqmXOgd8vLmYCfFR
	oPLqinQCiZPyqtUbOKKIjROKD0T+rXdFLdeh/fsIXvc5Pqd5NS1XMZzMaw0XR0UZS7HkRtdDVIhfG
	lqaCkIApw2wq2fcJ4utFXYW6vLGmWsk6eTo2uZCv/dQ9PoLAE5nU5BBjno+zyZhEyN5IjY0GJ7c/w
	cu9pKxDm7t36k55ub2OGjRLs7PB1jQKnbLQOfeSGjiT7hbtFLqbIZCaj65y4xlQ3KYzciJqvA4foA
	jhYFuNW9qQiVIveEXN4lWmPqFD8YhT+x4C/IUkJ3uW7pXFv0JK8gO2B6ojJZ1BHSMEKB3Bv8frXqM
	f1zER6nA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uBsyD-003Wh8-1P;
	Mon, 05 May 2025 18:22:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 05 May 2025 18:22:45 +0800
Date: Mon, 5 May 2025 18:22:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the crypto tree
Message-ID: <aBiRdVBtuIz0_Ezz@gondor.apana.org.au>
References: <20250505195527.4c4237c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505195527.4c4237c4@canb.auug.org.au>

On Mon, May 05, 2025 at 07:55:27PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   e4274cd4f727 ("crypto: hisilicon/qm - replace devm_kzalloc with devm_kcalloc")
>   3f9ea3a5618e ("crypto: hisilicon/qm - remove sizeof(char)")
>   7da3b0ff2af8 ("crypto: sun8i-ce-hash - use pm_runtime_resume_and_get()")
>   2c870574fb94 ("crypto: sun8i-ce - undo runtime PM changes during driver removal")
>   24418b58792a ("hwrng: rockchip - add support for RK3576's RNG")
>   e511999438e1 ("dt-bindings: rng: rockchip,rk3588-rng: add rk3576-rng compatible")
>   13917ce458c7 ("crypto: rng - fix documentation for crypto_rng_alg()")
>   c6527b8ca148 ("crypto: qat - add qat_6xxx driver")
>   bed3233d9e4f ("crypto: qat - add firmware headers for GEN6 devices")
>   4903f74450d1 ("crypto: qat - update firmware api")
>   e9833be85348 ("crypto: qat - export adf_init_admin_pm()")
>   a260a62349b0 ("crypto: qat - expose configuration functions")
>   8e84a854176a ("crypto: qat - export adf_get_service_mask()")
>   ff193f6c14e9 ("crypto: qat - add GEN6 firmware loader")
>   c1e216382091 ("crypto: qat - refactor FW signing algorithm")
>   25177bb3f705 ("crypto: qat - use pr_fmt() in qat uclo.c")
>   5fc9923d1554 ("crypto: qat - refactor compression template logic")
>   424b3c3cfbae ("crypto: qat - rename and relocate timer logic")
>   9b6fc5b6e9c0 ("crypto: qat - include qat_common in top Makefile")
>   f230dcfe428b ("crypto: lib/sha256 - improve function prototypes")
>   e42b6c1e17cc ("crypto: sha256 - remove sha256_base.h")
>   91c5c4bf145d ("crypto: x86/sha256 - implement library instead of shash")
>   42802c7f8eff ("crypto: sparc/sha256 - implement library instead of shash")
>   1a92dd688525 ("crypto: sparc - move opcodes.h into asm directory")
>   d31058b2589f ("crypto: s390/sha256 - implement library instead of shash")
>   fe11c8974fdc ("crypto: riscv/sha256 - implement library instead of shash")
>   9d2b1924c137 ("crypto: powerpc/sha256 - implement library instead of shash")
>   19c9460ea05b ("crypto: mips/sha256 - implement library instead of shash")
>   6df537365d25 ("crypto: arm64/sha256 - implement library instead of shash")
>   4fcab0fbfd54 ("crypto: arm64/sha256 - remove obsolete chunking logic")
>   7f4bd270972c ("crypto: arm/sha256 - implement library instead of shash")
> 
> are missing a Signed-off-by from their committer.

Thanks for the heads up Stephen.  I've just fixed this up and
pushed it out again.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

