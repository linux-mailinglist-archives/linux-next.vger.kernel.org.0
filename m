Return-Path: <linux-next+bounces-2373-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C58CB603
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 00:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E592C1F2243D
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 22:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14A9149C54;
	Tue, 21 May 2024 22:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IZ6opajI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC8A2AE6C;
	Tue, 21 May 2024 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716330881; cv=none; b=WilR6Yvq4UgyOWWcapWRL/9b5bt9kEXXb9t6dZCgTUL1QNCBtISSMGGXwMLWODWno+xIzKFJKkPgXmFKgeaVM/UkaWtKKx175Nw/Tqks/1cFiNcupWpnpzxvGWzVxKNfyZWy3/RJM4yH6pDg8iRPr/lRakC3yYBm2p1VJKgXvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716330881; c=relaxed/simple;
	bh=OBM7O2kKtLY/1QgubILBB/QK9LUevsJ1RA9MVdlyKRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5jMR6NT6GxWfuP/dMNPnOwobv58JvISDVzpKg0QRgE72DY2qoygVgjTN9mHjXxoVKZEG26weC4T1u4G90N1+VugVc+5oX3K8/SQcGpgn+JFtei9McgpBuc1b8wHKYwkPNuqIGUclg+10jVRxt5AEJKBic5iSCxwBJpQd+egYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IZ6opajI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716330875;
	bh=uoPzlo97cnnqqclusONENycg8BoqMoybdfTYv6wPJS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IZ6opajIcsSzSB9DWKyVtb6qU9kOiixWFQRAv2a6e+lug5SwFxWtah9AZXEwNjkV5
	 U9AWiSk+DHujalOPC9R+3b07z94qGOcQtsZU9GG2petRpAXR7qKd/VSXOauqleu4hm
	 UMOZTbPbIJPiQzfqKAmJEzMrU3yg/SFs8T2qY9XsOQcbYMljFrV0uQjEZG6yjdYhHy
	 wZ3JCVPyPEP7cYtK4hTAgSbhUJUYZB1wJyj2aaD5F1aQKBk8vCNmqocEETOaV7SisE
	 uzfE/WvCcSeLrdUkMFiSegoAZw9pjANyjboh+FhLN1p9ji8EI/PxdN3b5tb4cL117m
	 qKCSoy1HAE7mA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkTkz5WPCz4wcg;
	Wed, 22 May 2024 08:34:35 +1000 (AEST)
Date: Wed, 22 May 2024 08:34:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the perf tree
Message-ID: <20240522083432.49da1e35@canb.auug.org.au>
In-Reply-To: <20240520073426.7d8bd11e@canb.auug.org.au>
References: <20240520073426.7d8bd11e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MBL3ub9FZe8jQFgxPxkZ_sX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MBL3ub9FZe8jQFgxPxkZ_sX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 May 2024 07:34:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patch):
>=20
>   cd88c11c6d89 ("tools lib rbtree: Pick some improvements from the kernel=
 rbtree code")
>=20
> This is commit
>=20
>   bbed8b9ffed1 ("tools lib rbtree: pick some improvements from the kernel=
 rbtree code")
>=20
> in Linus' tree.

This duplicate is now in the perf-current tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/MBL3ub9FZe8jQFgxPxkZ_sX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNIXgACgkQAVBC80lX
0GwtLQf8DQTqG6/gGWx6tR/nRlCAiWP4vYrFAjdrbR0fMY1agrdYnVvOW+U1/x54
9Q16Vbgl5vfvlv7eMV7l7u7sMXoq7n44j3s/VU7ihX4QwqNmy2aMJnSsDHL4reKZ
2EdLTKkoxoZbeAyDwp8+BVlSMZOIGhjVRur/fxszX4pF10kMUYDM1uY4FWJFfzcz
lmL42ktfeALjPP+9BRlk8MCotxd0V4lP4mbvTX8dHeSXvRH7mfJ3uJ37zwnWWJqM
TnK9rXE4XuY3fCVSNu1Lk022Y1uD4BaYOKOZbszMWFU7KVqvgsYHG7SFWoh8CdjP
eTyCojalFyl9MCzdY9G6sGv5vKuTrQ==
=Ixr1
-----END PGP SIGNATURE-----

--Sig_/MBL3ub9FZe8jQFgxPxkZ_sX--

