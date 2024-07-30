Return-Path: <linux-next+bounces-3160-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA441940E78
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 11:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB541F2436D
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 09:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A711146A6C;
	Tue, 30 Jul 2024 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R1t8dwsf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D18195B28;
	Tue, 30 Jul 2024 09:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333578; cv=none; b=RuUR7HtQeS2ReN7vGtG1s3tAst/jXGidppXCqb5VRUNu2G3rE79UqBlwqQYyI438ZXVhJ0Qidop7GS4PZd5Fr7xNkZ0yHDS5feb1UoNtIxAkYg5TOQ4y8ygbBehrTRSoy6Sc9VAJmUOjJqYtBC+F7OGXN8XG1hUI5opOAFbr2J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333578; c=relaxed/simple;
	bh=dsX/F4SmtMPrwsC9fayHACC9Xbv6IF+ZDoD4mv7gCXA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKGuKcU2ne+0TRrE0xegJBBC7bYTDA+MXrndj9zBK5hFf3BBNCEd8wjZSxcf5XTx1KY/1Mnzfietc0wDurAj9nGaaln3Nw97cu5+0pSp3PXvzk1jj+yvcUm35bjUunMvHYq4b99r13NNu0UqmXBCNWHIV7pANiATKokYkgf73IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R1t8dwsf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722333570;
	bh=dsX/F4SmtMPrwsC9fayHACC9Xbv6IF+ZDoD4mv7gCXA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R1t8dwsf8kGbbG0FrFW0xcAnjfu/UxiCJYyYMs8+r3gd99LqBlcaasDz8N8FnP+dt
	 gjcBAbG82FTARhS/SYuaxP7nqAzzrlzDRCxcuB/eoyfUkOlXb6+TGAOg6Bd3h2hxSm
	 cPkNYKxKuPBjCWLcXsF4H+1vq9iXxno/dhLmLowmckyC5HOpNqeBQCHBcU3Tnnu2F7
	 4tRzD/+nvzAbLhUCO/3vl/c3ixIG5LPxs109nq8ZQ5T2NAMvUD72BTt1+lQxEWL9ra
	 UZAlQ35LdHwvgC8qECtlcrmOzC7kD2ssnR6TOxQgA0zc2JCoDzDGPWAZWZdrnP3SZL
	 kad0pSXNvUz/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY9gQ45XNz4wx5;
	Tue, 30 Jul 2024 19:59:30 +1000 (AEST)
Date: Tue, 30 Jul 2024 19:59:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 30
Message-ID: <20240730195928.5e7ce25e@canb.auug.org.au>
In-Reply-To: <20240730154709.345ecb08@canb.auug.org.au>
References: <20240730154709.345ecb08@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FNPIABjxx_Nt+uSvAr6BW8G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FNPIABjxx_Nt+uSvAr6BW8G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Jul 2024 15:47:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Changes since 20240729:

There will be no linux-next release tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/FNPIABjxx_Nt+uSvAr6BW8G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaouYEACgkQAVBC80lX
0GwicQf/XEYEJKz/FCo8TmFv0dFpjB9M4ue6XtpbEN1VW3EWeLVN5tH+70hFMgD4
ctH6WtlypDnlgaV91DqS1qi/7tStwkqu7Zt4THpFDz7p2nKA0t8j7VBaR1ZarggW
7br/06WF40CPQvYcOgmHXxfOca3r7g63X9Ooi2sTadRcg5DNvWmwVOfYklIHJ8Hm
gZ6fziViMmhDnQu7fkKLEg8+513eCktuq7nikF/8AS0KicWkVxgnLWpcnSOEdDV9
fKYWz4u98pC414HioYM3Kld3CHjfnjGlzk/49HxEDbA+xAt/n7HaBMCGKFTgM5oI
pAkVwbg1FVdX13go0X2U9K3Sre5DHg==
=yeXH
-----END PGP SIGNATURE-----

--Sig_/FNPIABjxx_Nt+uSvAr6BW8G--

