Return-Path: <linux-next+bounces-3733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2AE97465D
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 01:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A3E28884D
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 23:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953531AAE39;
	Tue, 10 Sep 2024 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hmx/xzch"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7917E8EA;
	Tue, 10 Sep 2024 23:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726010952; cv=none; b=EZzM+7yaNQEfVb6yzKnhml3uJ/dO5NVNoASIOKr/BMgA688pP4A91lhZzEbmP2Xzhx7H1z7bT3YnF3vtIhsVY1cUcBHxLfIOhCgZLrv0uA+FbyME9xTMX3gDaS2EE05dvk5OuzyLdW10Yek69OUtYC+j4yDhHVQg+w0AEgyo+YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726010952; c=relaxed/simple;
	bh=FA8d3wDTOXVC1rRCSUGCWQ4z+X7dBeFNfQkYXCMAYFY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k58q0EeIxtT37ZNJTnaEeKXJKlU9FBVKz0aJKKDhYsjYyw8b9WN88Ne21b1LhjOspVkf7qriEFw1cIK1Bq68J5/lBinVc+KE8+9Tq2nHYWkxStF0u2U1VeQRRXCrYljfDhCvdmr7u0frpflOJvrCuvFmYtq+HVdCyNmnZtEKqqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hmx/xzch; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726010625;
	bh=rCrHA4E/KnV4dNIVzmJQikg/RhBZz5vZD/h+f1f19Dc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hmx/xzchBjm6HIuFyo3A2kvoWruji7i1Vu3rSzz7X661ZxRZYCWCB0nV0vicWeX8B
	 KzTpb/GXUkvyTdH3mTOLWvtYF5Y8HDa/zXN2kbjdGS6VA08L+r2sJavjTUi1/3LJn8
	 NIfDOGbOb8Jt8q1C/cy97Np+sAB4ZU0rxNgqTu9n5nqMa8B6qdexttBJgOA41k5Ryf
	 OiVgogYH1ZPqybRpOxOeU3yD03ATvsqvcbrzypryBUD6363W7c5qugxtMeW3cr8UHT
	 BP9wJWTe6PuUceROkvk+sz2mHsVHPHLyoErqlI5stR0tTEsA4W4IlcGn3omIopdVZa
	 Mw2pFDo8iet3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3KWz5jsXz4x42;
	Wed, 11 Sep 2024 09:23:43 +1000 (AEST)
Date: Wed, 11 Sep 2024 09:23:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Sven Schnelle
 <svens@linux.ibm.com>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20240911092342.5e65f91b@canb.auug.org.au>
In-Reply-To: <20240905153557.3b0f8db5@canb.auug.org.au>
References: <20240905153557.3b0f8db5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ei5FXgL8h8jDjJ_qa1yIVuY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ei5FXgL8h8jDjJ_qa1yIVuY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 5 Sep 2024 15:35:57 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   kernel/events/uprobes.c
>=20
> between commit:
>=20
>   c67907222c56 ("uprobes: use vm_special_mapping close() functionality")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   e240b0fde52f ("uprobes: Use kzalloc to allocate xol area")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc kernel/events/uprobes.c
> index 6eddf4352ebb,cac45ea4c284..000000000000
> --- a/kernel/events/uprobes.c
> +++ b/kernel/events/uprobes.c
> @@@ -1518,8 -1480,6 +1499,7 @@@ static struct xol_area *__create_xol_ar
>   		goto free_area;
>  =20
>   	area->xol_mapping.name =3D "[uprobes]";
> - 	area->xol_mapping.fault =3D NULL;
>  +	area->xol_mapping.close =3D uprobe_clear_state;
>   	area->xol_mapping.pages =3D area->pages;
>   	area->pages[0] =3D alloc_page(GFP_HIGHUSER);
>   	if (!area->pages[0])

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ei5FXgL8h8jDjJ_qa1yIVuY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbg1P4ACgkQAVBC80lX
0Gy+HAf8DXqcdw1TVsTNMEYtKrgLzUi48ulEoPkfqaQ+gigMiE3AW+47p/VfhciJ
ztTGKn0zWOB9QYk/uP+5y5r04ICjaFayOrL96aioGOkuJgP7FDI9ejU1u7VvHAqB
X7Ud3pxsJgaHOTOUwB2I5W9qzSAAT+x4c7smVG2hZJSkdEAQIMIA3NynE9bSE2Id
sMwm6MvuEPTaEubOLKOyMVA7ZHFyG38z71Gh1pQ3WEamhfc6WVYt7CMra2B0t8vz
3NNCvGhc5AP2NdIH3orVNE4ZFQ3DGMBxQsM2K/SAcofoD8XfYI3Xm/GAp5gQXdEV
TFRAjn3P+tO1SG8Wz1OQWs6d4Bsdng==
=KL2V
-----END PGP SIGNATURE-----

--Sig_/Ei5FXgL8h8jDjJ_qa1yIVuY--

