Return-Path: <linux-next+bounces-2223-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8E48BF6AA
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 09:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88E4FB22378
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 07:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D801D208D1;
	Wed,  8 May 2024 06:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HTMO5UkC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F85A182C5;
	Wed,  8 May 2024 06:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151599; cv=none; b=uX1YgH9/pV5fSlrgqqs+RSYssxknPNCC7OtQYWlmi7cKnDFa87Kky5s9Eu0YLO2YQfP/Nbm0QglS8kWUP3Ry/P77Bnn56ZT4w+LAPvzoOScWPveVR9Swj2srZnXo1oBvyZKaSJzF6Pq7ybi3g76d9A4fU5XGGiuHDza5YRuyKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151599; c=relaxed/simple;
	bh=4hJ8/58n7bwGWfjiKjt16yIkQoX1tPUJcV8d/k9Y9so=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObAyTp1kRdLNX08zyx8Tw62FytX6FRHyqia58IQYYyBiyWYNxAYQevLkGXNxEmzSPrONQxW86ajNyanWoolnPJmbVYVd2xdGsSGDUE4inQiro4XIWip8dOoXn3oqjeyb1nJeuXTztHoJ6euGiGwKb1oe2bIE1g6ZNW1Yd4vSN18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HTMO5UkC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715151594;
	bh=OSlVrqcKT8zP14Vd7olNUrRaHtmRL+4pIacZKy4V970=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HTMO5UkC3+dco1SVQJb3dxztTb5l5HUqNQc4AT5b2aI/v+qeeztAmoagqwT/phy0N
	 mZeaPTOeT4T+sigDjCIXColu0+cYRwWAlrSkimallzDOHAT0BxIDZdh8CXwH4oQyOE
	 mi1jf0B0LZHmCvFjRo5UANDYOumNuhHRQShtsZA9aVuWv9SdUCeCon8q/l2jJoXAgf
	 vgh3tpG6+nkXshGoisbfx8susCW/+BnNoGqS/OPkRWBvMkk9U9bSBnh3i1eiPkI/GV
	 E7BVoKTL2wVjzf5CjvHB1NNScLuHUxv/lbogWunvafMDFZn4q721qYGP+ijXdhVWyN
	 c8hOFZ40Lm/EQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZ5cV0WXjz4x1C;
	Wed,  8 May 2024 16:59:54 +1000 (AEST)
Date: Wed, 8 May 2024 16:59:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the ext4
 tree
Message-ID: <20240508165953.67afc064@canb.auug.org.au>
In-Reply-To: <20240508064700.GB10736@lst.de>
References: <20240508103436.589bb440@canb.auug.org.au>
	<20240508064700.GB10736@lst.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SVnt62e3fxePCBAtuy8ALwp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SVnt62e3fxePCBAtuy8ALwp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, 8 May 2024 08:47:00 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 08, 2024 at 10:34:36AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the vfs-brauner tree got a conflict in:
> >=20
> >   fs/ext4/file.c
> >=20
> > between commit:
> >=20
> >   a0c7cce824a5 ("ext4: set FMODE_CAN_ODIRECT instead of a dummy direct_=
IO method")
> >=20
> > from the ext4 tree and commit:
> >=20
> >   210a03c9d51a ("fs: claw back a few FMODE_* bits")
> >=20
> > from the vfs-brauner tree. =20
>=20
> Ted, if you still can maybe just drop the ext4 patch for now?  I can
> redo it for next merge window with the moved flag.

If the resolution I did is fine, I am sure Linus will cope (but worth
mentioning it to him in the pull request).  Its a simple enough conflict.

--=20
Cheers,
Stephen Rothwell

--Sig_/SVnt62e3fxePCBAtuy8ALwp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY7IukACgkQAVBC80lX
0Gwt9QgAnGv4mg4zMe7MDHUTlN7LuxzXBrptZnifj2RDvFwidIoVkaUqFFpDU6Sf
7zfrNfDpyGu6qp0Za2DkzJrI7QwRMquTJuQTZBmVUrzdd3Jo8dCR66iHkwe1pKe5
Uc051btiXPWl7p+76F0ailO9X9J+ERqhgTv+/CJr2L2yZsr2dOV7YnccwuMnDiQN
EDvuxSJ3zNKgtz6zCqqI4KqTmx5UI6cpll/c4bfGM9gjzbmEO4xQ960/2Ol7C+ws
2Av3w18/kb+vjLM4d/CChNG9i3ds51u2wGxhDYgsZ9DFMC3zbCykldA2eR7nrWwg
KPn8YsGPRa4cF6UQofqDTFuix3rhXQ==
=0yuL
-----END PGP SIGNATURE-----

--Sig_/SVnt62e3fxePCBAtuy8ALwp--

