Return-Path: <linux-next+bounces-2960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FC92F5B0
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 08:51:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2251C21934
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 06:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCAC13D52F;
	Fri, 12 Jul 2024 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rLxGdSvc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE00D39B;
	Fri, 12 Jul 2024 06:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767073; cv=none; b=UAFvVFONfFliwdYtv+QSE8ZwEg+WyGFqvDcMurIVLJSo1+C9DuWh+BS1dpqu9PJ/eFOiM5uZT8kpaNMsAghdlz6P5YFeA2cHO4+JI7j+XdQSuFEJgaKl73RfWmhCGEnFJp+m8x05zNwrvgNwaXirP7jVeMVte3jFuNzaonDAuLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767073; c=relaxed/simple;
	bh=UPanOI9zKGSDL7AzLQdR3hDfJaQcntsKpWvsuBdX0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UyfBIlsQAo6JM+KuVqKwqcpNNHLA7CfxBP0vycYHXqz4kgPn7zjemUSOYzwqQTdCApiaMW9rkaRwrGBqNouz+aH2vYKDAcvznveDiTaPDX8MV61lrSZFth/SJaZKaT4YDbKriBA6kxDUgw21SNGLU7xfSsNwoAxC8Osn/YvNqgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rLxGdSvc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720767068;
	bh=bTZG00kGVPd/R/JT/8M5/xrkYpDXgBqQSDDm07g9Yok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rLxGdSvc93KlG8pcA4oIt0qUyIeWMtRiu195er+23qf/DtGhdR8g0s8GqB3qA3Ga9
	 1YWWmbu249SBl1QD1hrzNK79g8IXZRAZUJra64ojqYFc+3/rT91JFoLandzwDg+cvh
	 p9J9qnN3TPMWeGgkPeXfq3DnMrxoYgpPTLUVCKIvlpPsrRsmtninsv5aNeJaIJwV7Y
	 cVUnaYUEkA55LdVWab5JQiF6FIkiyM8Ro196shK+AEd4gdMhXsZ9Iz6ym+WbYZiCjp
	 cUfAU9R244vIxEL/fyIz9aIjdISeupbMZnWuPhfHMCcaLTWWtjpewB95OlwKM22F2P
	 cV2wrE4T8/Y1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WL2LN5sTyz4wx5;
	Fri, 12 Jul 2024 16:51:08 +1000 (AEST)
Date: Fri, 12 Jul 2024 16:51:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <20240712165107.7b46a640@canb.auug.org.au>
In-Reply-To: <20240712164354.65cb32bc@canb.auug.org.au>
References: <20240712164354.65cb32bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nt75AuTn/SB2PGUgmc7gJWX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nt75AuTn/SB2PGUgmc7gJWX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Jul 2024 16:43:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the cgroup tree, today's linux-next build (htmldocs)
> failed like this:
>=20
> Sphinx parallel build error:
> UnicodeDecodeError: 'utf-8' codec can't decode byte 0xfd in position 558:=
 invalid start byte
>=20
> Caused by commit
>=20
>   704f684e15ad ("cgroup: Add Michal Koutn=C3=BD as a maintainer")
>=20
> I tracked this down using
>=20
>   git diff stable.. | cat -v | grep -F 'M-}'
>=20
> and finding the commit that added the line that was output.
> I tested it by building with the commit temporarily reverted.  I have
> left that commit in today's linux-next.
>=20
> Clearly (I think) there is nothing wrong with the commit, but the Sphinx
> utf-8 decoder also clearly does not think it is valid UTF-8 :-(

Actually my character map app says that it should be the two bytes 0xC3
0xBD in UTF-8 (it is 0x00FD in UTF-16).

--=20
Cheers,
Stephen Rothwell

--Sig_/nt75AuTn/SB2PGUgmc7gJWX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQ0lwACgkQAVBC80lX
0Gwu9AgAoENiwYThdcwHnRS4J7TF/9GSC0qYIur8pNcqhpOAc+CmcQO3dorpNEHx
RQagzDvVHPsDk+8aNrcFqD/sXSU20N2BA2wD6VqHPwTNKeD1W3Rmy0IzmtlmlY3B
m37ib5KqIKJkWTTViqULv3X6NbFQEttb2DarTnqqi7FNNS7fJooBbiU55emJfxmr
RjpDfShrrN4xrWDMIpVUoqFeA4eOOcU7R2zx3GF56IH2Y0KbiJVDxjpTJo7D3YaV
OQ6FCkDQFA7n8fKnhBPgMVdnrXFJGfLthpV1nZ1O5uwUy9IDNsnNJyD0xdP8kbuG
u78FljSCTNM+1l9KSSMgLbQj9iRb7Q==
=DFZj
-----END PGP SIGNATURE-----

--Sig_/nt75AuTn/SB2PGUgmc7gJWX--

