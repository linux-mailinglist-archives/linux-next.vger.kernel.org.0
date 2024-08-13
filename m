Return-Path: <linux-next+bounces-3299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570694FC94
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 06:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7180282286
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 04:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98851C68C;
	Tue, 13 Aug 2024 04:17:11 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB686370;
	Tue, 13 Aug 2024 04:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723522631; cv=none; b=pFLs+EvwWwAU2YrfdOHGZXgWVa56q7xX2vyhpmvKvp3CZcMwGblOVsB/W1o9LhODNxOm9VaNE2elvOhDf1pP+sjuXkoxI+dCpCK5sgHKly0nFEiGhMGGj3J7eBE/uVdCT8+b70OQV2xR6zDQTQxXVxk4PNnbzHi1w8Yl6ZAM5qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723522631; c=relaxed/simple;
	bh=Kwi/wowfy65XAoQY0vzEd/1FDyseFntnuZIeBQPtpvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvdwOY0Ep0HmwxaCpyyM4V45d2RcIRFeMiNko/93tsPUGs+IQ1WqOQu9Gh0U64+YJJj9FuRSFTnNzqrf/TcmM4djpMhSPqw6wSWHZzKWgTprN+lRvOelyEWnfm7ZQGPBlqpSEfDMQWGfRu9q5WfNZryKpfptfsMmJusCVWegncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sdipO-004FRm-0C;
	Tue, 13 Aug 2024 12:16:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 13 Aug 2024 12:16:55 +0800
Date: Tue, 13 Aug 2024 12:16:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Bhoomika K <bhoomikak@vayavyalabs.com>,
	Pavitrakumar M <pavitrakumarm@vayavyalabs.com>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <ZrreN8P-WO-DsM5B@gondor.apana.org.au>
References: <20240812104235.6eefb365@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812104235.6eefb365@canb.auug.org.au>

On Mon, Aug 12, 2024 at 10:42:35AM +1000, Stephen Rothwell wrote:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 12 Aug 2024 10:36:30 +1000
> Subject: [PATCH] fixup for "crypto: spacc - Add SPAcc Skcipher support"
> 
> interacting with commit
> 
>   1a251f52cfdc ("minmax: make generic MIN() and MAX() macros available everywhere")
> 
> from Linus' tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/crypto/dwc-spacc/spacc_manager.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Thanks Stephen.  I've applied your patch but I kept the macro but
added an ifndef MIN around it.  This way it should work either with
or without Linus's patch.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

