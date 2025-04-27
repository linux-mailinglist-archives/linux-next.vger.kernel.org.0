Return-Path: <linux-next+bounces-6394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F057A9E4BE
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 23:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2DF8178657
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 21:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7881DED70;
	Sun, 27 Apr 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GKm2sfCk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA118DB01;
	Sun, 27 Apr 2025 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745791177; cv=none; b=JBfYkbZE7grtNGouv8+hM1XkvfcT64U6Hd/E0voUHOkqlMMWGVbih23M9iQR7LIZGObPw2UFUTdEPYGpefLsyU12lC2oH0wBxleHDDhTmyTbwVNEYwZAW98704fwVIwV/7hPpqBabuOt/snGMqZepTnV6RmtN1PnL9Pfnr2KJlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745791177; c=relaxed/simple;
	bh=tOCzVrVwRUiae/+vvcTDjau6EHA7iXxxfQF4v5iQEQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VdRfueZKi1a4avaZOicMS0egcG0A8873uO6nkSBdi8cxkz/g6VwJmodWEV6cuo8Fq6ZFDVL858RXsQo0mMpOyyOf3sF+tQDdyG+HOr7vHBCj1Yt6MWmEI8pDCIWXb6CCJCQnWAgJpPrWdxRxwKzsII/uLLnZabiJXB/GZ00q6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GKm2sfCk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745791162;
	bh=tOCzVrVwRUiae/+vvcTDjau6EHA7iXxxfQF4v5iQEQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GKm2sfCkE3OFxLPgxYFZOiZla7HjKxB91aQGj63GdXr1j/0uGtVmI9Xia58Mv38c2
	 7Yhl+ASj/GxQP1ATa2XfloubPolHmscBPS3z9dYZrQty4qeQU6sGGBWEiPMeB+hQLA
	 CG24colB++UrZac8QVMq+Iu/rIytPhPGqGJvO6eNde5Drnz3q1IikQiW6b3f2FpSVL
	 XLRGfl6VUQoUpTDVUV1yX5xNSCus537EUi8DFRe8x8Ht/bIFW+YqXFkRGlY+qPcimI
	 6qUkJka4jIilr5j8cZ0+KUG4GdtbNj6g0cUeDVe7A3ch1jn42zGji8j9UHVKL49/jp
	 +Zjb85r2sb6aA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm0py5TnGz4wyl;
	Mon, 28 Apr 2025 07:59:22 +1000 (AEST)
Date: Mon, 28 Apr 2025 07:59:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the tee tree
Message-ID: <20250428075922.165aaa54@canb.auug.org.au>
In-Reply-To: <CAHUa44GxOGGO_CQp=HGGT-gbX76aDNbzfvU2ZWgg5fRbdzP2aQ@mail.gmail.com>
References: <20250417090436.1c58cd18@canb.auug.org.au>
	<CAHUa44GxOGGO_CQp=HGGT-gbX76aDNbzfvU2ZWgg5fRbdzP2aQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0lPLee.piIlwm=21eqJ79lf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0lPLee.piIlwm=21eqJ79lf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Fri, 25 Apr 2025 10:58:58 +0200 Jens Wiklander <jens.wiklander@linaro.or=
g> wrote:
>
> Thanks for the nudge. I've meant to move my tree to kernel.org for
> some time. My new tree is now at
> git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git,
> please pull the "next" branch into linux-next and retire my old tree
> https://git.linaro.org/people/jens.wiklander/linux-tee.git.

Done from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0lPLee.piIlwm=21eqJ79lf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOqLoACgkQAVBC80lX
0GzvxAf/asC9zMeZunP07LJZBKyhNl/s4LU/Ebb6O0KXquaeDmO7VSB59QqYJif8
NyelbZlV8sKphmy5NS9/OGfQ0TUxi0eR/LNvEjP9sC2JXRT9hpf0Mx5W0oOv99us
IaCRORWSDB+j9epZJRJXbTPjXc/M7ImZ73cGZQwEosah1nUjyuRyrWlpsvg/2Z6z
EVr12XfJm13M/r9AqN+hx5/Q78yqPmDRGytMZAf9EngOraa0Pqfr9TJP7kwMewZI
8Oh8PnFPsJFDXRm6t1uls7VyfN934mOLgoatDH0SiDUoHwMZiLSoIDggKjz5UNLS
OAVv5VCrk7soah/h23rLG1L3lAN9Jg==
=tosD
-----END PGP SIGNATURE-----

--Sig_/0lPLee.piIlwm=21eqJ79lf--

