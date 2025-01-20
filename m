Return-Path: <linux-next+bounces-5267-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA2A1743F
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 22:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FA81887A83
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 21:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD701EF0A6;
	Mon, 20 Jan 2025 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YAo7g52w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94532199EB7;
	Mon, 20 Jan 2025 21:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737409165; cv=none; b=H0CbZb1ifReJeDFlSVtrIVH+pewTRlmvIbbrY6zilkPrnd4pv7Sr1JgzG+uU5z7zNct/CExzFdIBj/q9wNlNOqP9uIYlaDQ7PW4QPvtE/fICIBjmvBK4WojAROP+tR7rn4Nq+W34jGaZGkNM+KFOSgEtiXgl5+GStolp3WuH9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737409165; c=relaxed/simple;
	bh=cNb6aFMGNrpYezzi8JBRmLXYMz34qhGao1VidjjanYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CMDkzl5T6j6UMyl9BL5kQ0a/aF1kXcEMPJs9b395n7q22tk0UIhJc7ONYlKajSexMvzsFqu2oDKz8wVjKZYScb6pXxi72t54/gjVjUQ1crnUYvRELu1OKOWhBg99LC0vruBffkN27mqpdCAQ7N+Tq5y5KvsRLdHkneFFww0VUQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YAo7g52w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737409146;
	bh=OUBtNPcKHpjUM5JPaGUtzFxwmTGCNoN/sfF63P5D9es=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YAo7g52wTXct2x3ySfyRU7VTL43Z4VXnYZCeCoeMThguukxLcH6JLSA35tLgmf+LF
	 0a2De282pitbFzCUuz660JLa2EbtNJ4+vy/AIgOvijynGnWHh65PD+JVNEA+MiNWiv
	 E3U5nxLDoUJh75iJGdWyxGRKpfN+8LrTF4QzLt5miCjl4sOcjd1kpBh03X9lhc8ZR4
	 eTCJ8/85lNH+deQEUtvynSQOSsLlFrgu1zYyuGXvMadncur6jvtsV1lPBc5yZ4tpQF
	 iK+bw4o4sKU1YEcQy2sIiYlSz74jz5ohSSgUX4J/ThjnUkoVf+aC60SIsgKjqpguhC
	 nj/h04gyl2U1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcNyL20nJz4wxx;
	Tue, 21 Jan 2025 08:39:06 +1100 (AEDT)
Date: Tue, 21 Jan 2025 08:39:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250121083913.62c34db7@canb.auug.org.au>
In-Reply-To: <20250109111812.39f35f9c@canb.auug.org.au>
References: <20250109111812.39f35f9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6HcRKzhtHvH4iqqTvFzdOzH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6HcRKzhtHvH4iqqTvFzdOzH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 9 Jan 2025 11:18:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commit is also in the mm tree as a different commit (but
> the same patch):
>=20
>   af6505e5745b ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operat=
ions flag")

This is now in Linus' tree.

> This is commit
>=20
>   aa1afdf5cfa9 ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operat=
ions flag")

This is now commit

  096a474e8872 ("fs: add RWF_DONTCACHE iocb and FOP_DONTCACHE file_operatio=
ns flag")

in the mm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6HcRKzhtHvH4iqqTvFzdOzH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeOwoEACgkQAVBC80lX
0GweqwgAgL7dPXqGEd4kMeoayCUOxyNnRxaF747ExmJxTEj/1cxfhS3CtDIjXIm3
EsD+7j94jRkTVc9bXvJmElzbiu3LRN3xljEF0RL7FEMS4DRBGqz/UM1F4eFZVoYn
TTf9mH9f/60jF0fR/g9FVqkxjFkYISdDyziAzZHqKxwsNUkMEjElUa2Vclekc3VU
wjDQ92vAB3m4tY5M1b2oJV49PjdvwlPeeeMfwm9q0vzEtKBKD3ScKNohSS5N/tSQ
O2peLlBQbfBQSmmrDRLn+PWGnlIAhE6VniciC69+7L15e0HhW0iNtmQ02+ElRRXy
rNJgvrdrBeP8TWKnIQ1dP0naJyXLNQ==
=d5Zp
-----END PGP SIGNATURE-----

--Sig_/6HcRKzhtHvH4iqqTvFzdOzH--

