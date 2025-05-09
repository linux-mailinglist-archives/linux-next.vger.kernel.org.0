Return-Path: <linux-next+bounces-6647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6044AB170A
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 16:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4AC13A5017
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 14:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423EC1E9B31;
	Fri,  9 May 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="MzrwKsN1"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633D189F3F;
	Fri,  9 May 2025 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800191; cv=none; b=NMZyGl1mYQd9VVEVY263CxgJeGJai5OBqA6g+JRDbApXjdtlEhAmJFKVyAckwCOc0Uk1cL+zW+r7+PvojTVVlRfxqqAumVnF/RHjrntqZLY7pqF4bu6vrvAUjUUZ55bYed/dcauxqDletcIKmjfMuaPr5x2s1T/uN6+pq9AqZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800191; c=relaxed/simple;
	bh=l5uOK2NHOVpNyhdKueRawcuEd4RFXsqeuFyPt8+9zW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk4VufasCDwxNAAP4JYT62T6INy0C2oCdY0TLyk4lPW/HwivacYpDOj8b7j4dVGIQ227yu4bpgC0/RInJeCPYjd0MNeISxAKT7Zq8CEAsznIFM50m+a7RhqUij1CinuvJibFGXhLi8HU017sevOfDRU4xXsuQgoy7oFPUJnRzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=MzrwKsN1; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JsL4/uSh//KW4XU+/7cb+Wp/CQFLXpjftCYcnzWSJDY=; b=MzrwKsN1AMh+jchfsXKG2SCRhe
	Mena3Z3jWuQiR2yNFOKM+wfYzkKp7dkTGsqnWWC7FA4PxqVmGV4b3bpx+YImpN31KcNOIXEQxLaS+
	x3SMDhy2I1WAwgq1DzotULCHN9lC/m6VtJ2oj8zw3vEDythcH3leH3LNzeHYvWdyDDfvsCh4oQ4yy
	mblNMuZxp/gDKfBR8TLQ1A9n1gTV02avxWGA49QIUlU3S+/5JFjPScXJVZZdmY6GuGVA/Eyeli2Ex
	PJcnt6zje8Cy9+M4XDdGCXR3BxqxsIw5RJmnQxU23Us6c7JwpogWKTBEJ+Z2AgpLbfSkDYt3EC/g9
	9DTICNcQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDOWT-004sgo-0b;
	Fri, 09 May 2025 22:16:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 09 May 2025 22:16:21 +0800
Date: Fri, 9 May 2025 22:16:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Restore crypto_simd_usable
 test
Message-ID: <aB4ONRiTNjHpCw6U@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aByiNZNxqyTerdYG@gondor.apana.org.au>

On Thu, May 08, 2025 at 08:23:17PM +0800, Herbert Xu wrote:
>
> @@ -51,7 +52,7 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
>  	if (!static_key_enabled(&have_p10))
>  		return poly1305_blocks_generic(state, src, len, padbit);
>  	vsx_begin();
> -	if (len >= POLY1305_BLOCK_SIZE * 4) {
> +	if (crypto_simd_usable() && len >= POLY1305_BLOCK_SIZE * 4) {

This patch is obviously broken.  However, I think this code was
always broken in the SIMD-fallback case.  AFAICS the fallback
uses vector instructions so it can't be used in softirqs either.

A proper fallback would have to convert the state to the format
used by the generic poly1305 implementation, call that, and then
convert it back.

Of course it would be a lot easier if ppc could make VSX usable
in softirq context.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

