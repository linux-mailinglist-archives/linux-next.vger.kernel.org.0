Return-Path: <linux-next+bounces-3905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB8A97B769
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 07:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01EE28678E
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 05:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C0113B58B;
	Wed, 18 Sep 2024 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NlF2hxSx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEDA13792B;
	Wed, 18 Sep 2024 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726637073; cv=none; b=aO3VVrFfCyYyJlsLdZoRxQ1NP51zXyAGR45iQDrRfr7IwlMSXhiVxeUQ0nKlXHyaD98jcuqG3LYXGuswjaPTmPvbR0Y/PePcHekeFlyko2im4vjQAzWPRtHyy1iahyAIwg11RScYSBVafVKK+eDA0LdEL/PB/Voj6sC2kQS/aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726637073; c=relaxed/simple;
	bh=VKtOTZ5lZAeheWyDbrmkp1q1kp9qNBmhyHIxOhHbE4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TStrN6FIucCaYLkts9q0EZb2vHkYtODrvJ3/I5kLbV1K+ayNOA+tOksgzQ4F4CzUe2cnkW7yGuXBZXfOZKpX0xZLKfD4jwMuEE3KhlmK6Qg3Pdl/+UVzAQIdZJwm4QVvdmgzggIDwoZiisDX3qXMOVBhFZ4ivOUZccjNr6y47Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NlF2hxSx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726637066;
	bh=2Uor/CLd+qjYaZGS5fdgWJuPAiaLK61kIXSp7zhsC68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NlF2hxSxufpFD9JZYQQ4CFk8iGvWAdEZOyO1ydxGKjUeAEakMHyOZzE2gU/5Z0bBR
	 0g1tWprxDbcW1Y4B2yre0I+BUR85G+UAepDFMCsNfHo+23gqv9Sz36ZTUtIhFNHaPa
	 F8qaYVTrf9qpgrL6iZ5fVoc7/Vo+EBMASkkmObCIYityyHDJco5xWjLSf63CkgoalT
	 Cne9tn7DxM69EpidXABL4MONU53RD6PnTLGvFY7wSzGxw+iFVvPsvOBUKb6pI1gYH+
	 3mnwA5rvkBrZ51O5tpYPl6wG+XnmFVchRsa2wZZqdeTe6r3IIymAkA4HrXalvyelaR
	 BPpXOgBLx7WeQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7nBy1rgVz4xPc;
	Wed, 18 Sep 2024 15:24:26 +1000 (AEST)
Date: Wed, 18 Sep 2024 15:24:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240918152425.3105d1d1@canb.auug.org.au>
In-Reply-To: <20240906182906.54527fbf@canb.auug.org.au>
References: <20240906182906.54527fbf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C6Tdt.6.TyMAeT.EgzXJkr+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C6Tdt.6.TyMAeT.EgzXJkr+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 6 Sep 2024 18:29:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Error: Cannot open file /home/sfr/next/next/fs/netfs/io.c
>=20
> Introduced by commit
>=20
>   550bc501ff91 ("netfs: Remove fs/netfs/io.c")
>=20
> $ git grep -w fs/netfs/io.c
> Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io.c

That commit is now in Linus' tree, but I am still getting this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/C6Tdt.6.TyMAeT.EgzXJkr+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqZAkACgkQAVBC80lX
0GwoAQf+NXtv6w0ED0ovgecd/PnKYforTz5W2krbe/wgH6qdqi6lJAidaIbpe0jY
LR7B0hmo74Sxj90lZEe2flJF4FmmBji0fnGzzJ7h67L4xf/Ccr1tdx2Cv0Ec6zB4
RIWYcha6+oLr0nrIdlZfuayPeEnVOEmqiNsg19DSKL9XKqgmBLFs9AXKIM3kjnis
WLQwztLjN5CzgSNEqECPgY1+muFC1iBusV5G+xcP87lmlFdU6z1ntscPd4UiCgFR
Wcq4PukOgxNoQNfsVEJ5TTlkMiulMuWvzSMKTSJdjR/5cyhvYVl8XvWD6OwzY5JO
QegKVe2oY8GOXA9ybIzqHSnoFjurwA==
=koFl
-----END PGP SIGNATURE-----

--Sig_/C6Tdt.6.TyMAeT.EgzXJkr+--

