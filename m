Return-Path: <linux-next+bounces-6661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE0EAB215B
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 07:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5370FA044A8
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 05:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F6F1D63CD;
	Sat, 10 May 2025 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="O9LEAxNF"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D521C84BC;
	Sat, 10 May 2025 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856213; cv=none; b=DYKYaEhiBFXB9+o/tTqXaM9Yiqpf639GbrGPK6akJGt2PGGPExUQ7QQ6OeWu3DHcQ0Srrx97qlBCJi7T7nLnULTa5riz86WtII4Zy9QV/CBd1UG78cQYt3rtPDZ8ePa/qpqF8IbmDIhQaXlv7jDV2Ipz0nPn0ELH4WlO+qnhW0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856213; c=relaxed/simple;
	bh=Ka+NQXdqRq9pJNTa3vxR4+31hrxgjtRCI3jBY87bbAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dERsGH8M85WiUrNVqvF4W/m4fE0A9l5ZOyWRhOdhNxThhATaw5lPR0FhJbsacmoP3QrnDaLUUqGkpHNA9+uUotcMEZiR2e9o4gMio8/vDtv5ASpBCL+rcpa0blur9Hrr18jVrPShWMGGKYYzUfXk7HTDWsTVewH4mwtHn3IDARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=O9LEAxNF; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=azZatDGZZpa1dscuRnN8VaQxezld54QPSyC77iPnC+o=; b=O9LEAxNFgjfYzF6/4roi700fIf
	Szl/UWmaQ7VB8/ZBy7HcdrCV68zwSC0KIDUKYB3Ot6Ml9UrLhe+tI3IXp9oGEE5XN5C1g35srK7gL
	x1YyWjLP51vi45v6W+uI41lu0wefnKq0o5eb3iZB98OSH7mVGXuCgPSc9PkSXXgbwrupLq+7YBUns
	/q9q0U+YWOF3C9/Y2xNfmEK2EDOjXGzSaaE+pkiacA8q3ipAlym+luF2lUFSwEt1/43GLRwWsaCTT
	Qfat69zKmFbU4AQtJwbfFSoJkobpBv9QB/yRQJessX23KWLSTyIaTG/WKH+uMYcTLYb8OmRzCTxgf
	nYtYvV2A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDd62-00518M-2n;
	Sat, 10 May 2025 13:50:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 13:50:02 +0800
Date: Sat, 10 May 2025 13:50:02 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <aB7pCuT2wfEe_xby@gondor.apana.org.au>
References: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB7o2SiwNLfBTgQk@gondor.apana.org.au>

On Sat, May 10, 2025 at 01:49:13PM +0800, Herbert Xu wrote:
>
> Did I do something wrong?

OK perhaps it's just that the qemu emulation being slow.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

