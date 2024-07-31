Return-Path: <linux-next+bounces-3175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9D494393B
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0DDC1C21C1F
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 23:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8FA16D9DF;
	Wed, 31 Jul 2024 23:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="k2v6Kg3x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0216DEC6;
	Wed, 31 Jul 2024 23:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467553; cv=none; b=tgggmxzG7PlL3axHArRow0b/WWSae7mZiHH5vE8M932JaO1ufqzDArK8IIt0sZYN0nqLfCZe+yBt0MrroHGADhyJnmHSsPj8fLv0WgtypfXARPdpadE9OI9+YljysYF0t7ky2pCW265slJkQEzb97vEYLZsHeywk2o7xfVZ0LOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467553; c=relaxed/simple;
	bh=Jb/zfmrX2MqjnLDAy5dnEm8A41KF10wWlVBtPn8reR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D1JboNw1OYk5awpMZ5lDw3RXGJjjhCUjh7vJfaPmPQLJ+esHq6r4XxxIPFB4rxRD475ZyVxVa+za5tVb6t+7XF7w6eF+6VyWiSFoWGkDgehsQw2Wzq8U9bdXUGEM6AkpSvwlMwmKwV71Xn70u4zKRUWD7PaR4XXBKHo2ycN9Jdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=k2v6Kg3x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722467545;
	bh=sGkfM983o3g+F4N3kvcDfoiHMLxXBQakXL9buNV3XUw=;
	h=Date:From:To:Cc:Subject:From;
	b=k2v6Kg3xUMQ8EJg9XGuVHcYdeYBTzzYZog3QubLWQOHS29kJNX0yUARsL9c7/0hoj
	 iHODcsf3I7U9L7NaCOHlQyKIClCCwK3xGPTZmvTIBdhpZ2QFsqR47/hrajIfFtq7+s
	 OPMavXed6CC+LBSpnBgbjW34EH/Mp97Fpx5Q6KikJqDcvuUy0kQDG9feg3LzLrgKnN
	 /B1Wy4vC145l4ISvY2B+/dHRfZlr7htwqfTj5797zP8Qe0N84NPofSuBzG8LRsUUQo
	 ckX2lI/krnX4nNWNRslmGxBRImEMKkLS72wQ8BJaI3IyCxolNbK78TFepTFmR8hD69
	 RUogBNrnLO5dw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ7Cs1M0zz4x6r;
	Thu,  1 Aug 2024 09:12:25 +1000 (AEST)
Date: Thu, 1 Aug 2024 09:12:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the bcachefs tree
Message-ID: <20240801091224.4a8fe739@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t=QXlkk6qVVlKc1=q3z9RG=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t=QXlkk6qVVlKc1=q3z9RG=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Trying to fetch the bcachefs tree
(https://evilpiepirate.org/git/bcachefs.git#for-next) gives me the
following error:

fatal: unable to access 'https://evilpiepirate.org/git/bcachefs.git/': The =
requested URL returned error: 500

This has been happening for the past few days.  It also affects the
header_cleanup tree
(https://evilpiepirate.org/git/bcachefs.git#header_cleanup).

--=20
Cheers,
Stephen Rothwell

--Sig_/t=QXlkk6qVVlKc1=q3z9RG=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqxNgACgkQAVBC80lX
0GxxMQf/bBTETfVTvaTSrBDdH6UaD+QWqd5CnS9r2OKCbVA+MStxThkPenktZJ+U
wlCPga+Z8/cUt5orfvMDkK/DAAzvHatu5m7NkZvSuWk+Ew1e/JkzaSQcwUlllM0F
DyFfSZsbwtbNjI3/x4Iq8B7Saeu903SiUz0H4alQKoepU29qXlln5fARejMvplTN
1D4Mfrn+/oIsyVH5ZiPPuj+D13mgYLhd6nO8UQiA8jRRJEB7SRfFZ/cCX6tC8Tio
PgRKL5LCDhKdwTbLWxsaFUsLqk5wMmgS+9GXjA4nn61D5b1uWaffoqSTlUsDglV5
YN1xlG+0UPPFGNa2A/lrN+vYoHCrHg==
=g0Z3
-----END PGP SIGNATURE-----

--Sig_/t=QXlkk6qVVlKc1=q3z9RG=--

