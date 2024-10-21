Return-Path: <linux-next+bounces-4355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B29A91A8
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 22:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BCF1F23300
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 20:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5BC1FE110;
	Mon, 21 Oct 2024 20:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pdi6sf36"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DA1FE10D;
	Mon, 21 Oct 2024 20:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729544171; cv=none; b=oy7sB0/uNr9aMlkdq1Ivj6/xUjIUyyXSUWT2dDnpfsj+72hHBB+9rOR1v39Rc66dukCa6v46hYb1AnZouHwGmJzR+BRQ30iFgjXoFFHttinnaotyd8iBaUN26HyGSf+FLZpk+YoQVK/9C19eK92O5QIc1p0D37KFomIQ5MlOkw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729544171; c=relaxed/simple;
	bh=FOE10/6qi9JI9jVSRY1TpK5/JPd3Cq1dChXmn8eRlLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cobx7dC1aJWuVG+DR8U2MSNn+8nbAEGScV1QwC5E790qKCCR6zhKNVfyiVW8s975WiYf3dzZmNhHa7d10QpNw10LU5bgeWUK3bD4zA8ZZh0f3pQTNjPnfUd4o/cMrD35Gh2Q18wc17sGIW5MOX+brzMsk9RAuvhG/wEermD23Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pdi6sf36; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729544165;
	bh=mD6pzdVqVKM82ATypJxJMF8reukSMnoVzsvRD+r84vg=;
	h=Date:From:To:Cc:Subject:From;
	b=Pdi6sf36aSJF61I6psMtgElZPDvSAU2c5Vk/ce3EXouXZWryHGshqBX/WT26VwBh6
	 fWMykG3H6tUQRoQPzc2tZlDGl9bEJe3l0/DTkokwRftlS0eXuSYs2RgvWSh0Bv9Qof
	 MexIkaAkCJB+mrqWf/PaNwL4Ee1KGmp4h/ik2rnVTLoPNwjNTVWOj+Y5MKCqbcwauh
	 0Mgeowo45UAtmte3g1amWeJO3zNEc0/JRgVe79ppkveza4jmWB1LZ15EjJKnDpum3t
	 3IgT2jYfsxm9unFWszEB5f6ms8smK+zQOBxFauuHAeqI1UC8yEKPf7tk0lQiywvS3A
	 93uLv5jC2w04Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXSJj14xfz4wb1;
	Tue, 22 Oct 2024 07:56:04 +1100 (AEDT)
Date: Tue, 22 Oct 2024 07:56:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20241022075605.2d123f07@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dwkm=z1fTu8zXKjqz30lZbo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Dwkm=z1fTu8zXKjqz30lZbo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  9303c602557b ("nilfs2: fix kernel bug due to missing clearing of buffer d=
elay flag")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree.  This is
commit

  6ed469df0bfb ("nilfs2: fix kernel bug due to missing clearing of buffer d=
elay flag")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Dwkm=z1fTu8zXKjqz30lZbo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcWv+UACgkQAVBC80lX
0GzkWgf+M+g55D3h90uAlTWLvJfR0pHIMWOadJb/QiSNhK4LxlHNyl0XzxCaFuX7
Rf8YnSWpSbTJ0GKm0u8I7BX6TgachJzyx5flrFuOJjzccyrYDbGVqtvsoUcSo4DB
LrqFjAioQWmm4Pu/04XVNMT/daL8NJ/GwDMtONpNguGB0xa8UeaI2AKrFgqw2cyj
e1qPdoxDaxzdC6hX53KuKCVHEwIQ83r2oG149gB5iVKYtMZNfxQ2h6Y6q5skfPbr
fLLWDjVAli7P3XhkH2Yf+A7F6k9HIenCUa9JQRIKyVoAJWmgawDCNttg+7O4tT8t
kyrT+9j3mSC8pQesqOckaclW6OedaA==
=cfug
-----END PGP SIGNATURE-----

--Sig_/Dwkm=z1fTu8zXKjqz30lZbo--

