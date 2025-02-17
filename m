Return-Path: <linux-next+bounces-5471-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A5A37C1A
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 08:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82181188920E
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 07:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC8518E368;
	Mon, 17 Feb 2025 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lk/oOSTZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CC1865FA;
	Mon, 17 Feb 2025 07:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776950; cv=none; b=uC8HISBv4kD8Jzo+IPzvemr6viGMnty6Mq2wNLhRQnrhfv4SS+bUpzV2T4UNxj8/lqda6hiNdFYdP8NcDcTv4Lijbx53kSPLqlgReyFIKgiydEVucHnNu5YFc8Nxo8vJMAd0Xp1xKKHCJC5au1EC0oYKil/NLNTJzA/HFOATV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776950; c=relaxed/simple;
	bh=8apKns6AHep58tj1HyicEaCHSsz0VhdYnfVfqEt9sUo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlCnOLIT5FpyouwtT5gwdzbWXoaypNk7eTybuX1c+Medxs22u0OTNSiHzX24nn7JFrMVNkCUlBxqlLtM009dRzWzFbY9Q2YbPRGY4re5+vcC4TZJsdi6QRd9Ud7JpxBm9ZzVO5OjkgqQ1yvE+U3Zlxf7idQzuGJtGpepLhpag5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lk/oOSTZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739776945;
	bh=ndS/44I9RUkT7b2Fk4SC8l1vjhOliws+oops3ofkip4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lk/oOSTZDMEzsqrtb/KulTMCS6m6jsGvpc788W6LQ0+Pxn/WJyZqU+AB0GnpVzDw1
	 DGv8Ep6uY4IHGbzL92sS1FkK7S9nQe561xLZUMFA6V2vwYGAlLA22pkl3fLpKyakvB
	 tiOSJ3egXAlsYhej70So+Kl6Rh+LvL7hohfXlhM2XgJrM1l16ajOrGNhf4XrETR8P/
	 8IK6Q8i2eiCl+xIGIDMjRnUV54keL8CBfsfGIQF5/DPEFJXQL6jwI+9xazKHbjj7wC
	 bx7UXFDdU8WP4DlsROOpQVsvd5maUhwrO4oAHZYEnAtJarnk1TEfrPXz+YxbQMKkxY
	 Txz8zNim7fliA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YxDcw6qySz4wc4;
	Mon, 17 Feb 2025 18:22:24 +1100 (AEDT)
Date: Mon, 17 Feb 2025 18:22:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the kbuild tree
Message-ID: <20250217182224.51576c2d@canb.auug.org.au>
In-Reply-To: <20250216222606.4be119a3@canb.auug.org.au>
References: <20250216222606.4be119a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L4uKXamtX+eV348yc8I_+Ll";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L4uKXamtX+eV348yc8I_+Ll
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sun, 16 Feb 2025 22:26:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Commit
>=20
>   8d8c6f1e2c58 ("gendwarfksyms: Add a separate pass to resolve FQNs")
>=20
> is missing a Signed-off-by from its committer.

This is now commit a9059f62e384 (after the rebase).

--=20
Cheers,
Stephen Rothwell

--Sig_/L4uKXamtX+eV348yc8I_+Ll
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmey47AACgkQAVBC80lX
0GxocQf+NUCdGUSBAMMF473u+RIJ+Pc8/I9mJIXP9fm1umg/YSOG9VYnOBPR1Ytl
VmXrMEZRhLeLUXhc/P9/3gu800HWXrasPhQw+Bn9RKns26RZ3vwlFDESWu2EtQ5q
L7MTg00Lg0joaofniy64tiWkZGXvHq7E/BkDfhcENTBQoy664Ltn41aqKFhtjF++
crFLey0n5WXJldngzDMI9SSbVN1GvqdCzz1pt1CEc3pcmajI4v+Sasy06DwoPM2R
BcQhPvcNOO9JY1A9DJBApqF5+WLBYAoSPhkjRImg7bOHSrcvPawvvVWzc5ocru09
mRNCgLHhMH5LQ+Jk142rQhZExeYkLA==
=iqr8
-----END PGP SIGNATURE-----

--Sig_/L4uKXamtX+eV348yc8I_+Ll--

