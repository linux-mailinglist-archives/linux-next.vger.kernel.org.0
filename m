Return-Path: <linux-next+bounces-8920-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD7BC4B542
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 04:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B4621890C53
	for <lists+linux-next@lfdr.de>; Tue, 11 Nov 2025 03:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BECB30EF6A;
	Tue, 11 Nov 2025 03:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BOOEy+uj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6687F261B77;
	Tue, 11 Nov 2025 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762831911; cv=none; b=niiYywQh3qCGUSA0HQNEBd88QL2+Es9kcudlu5A/BgZofn1ZeH9SBeTJqM1G2sILJKxyvo6HbyvWfb+ck+NUy2rKLhqjkGpVqulpXt2zt2R6Fx7NH5mMr5UFoiEGuxxMCiCMGhyvMc5P/jQu0Xdc6A1vlSyaC2K9Kk755bt5sE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762831911; c=relaxed/simple;
	bh=LV0sLviJLKJVXnTGRCWEa8Y2q5ZZD2q5CZOE8I6Gjlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WWISG+oFI7yVJdDSi2RtujrdB4NcqZ+qs7CR2Abcy4IlHDLpNU7fyX9Mg+o6ds7C/CdIdyxnXElEuNhavtWFsEVusemnPgCzgwjQMyCwFkMDu/UFHguCdXR8Eycz7LDbCI73lUlJpfYavmcLS2/yRTnKKlU+AaHwDDnvPLVorW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BOOEy+uj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762831903;
	bh=6GysHxPKYbwSHmBd9Zo3JJN0g2wKJHCwGkbkdfhdGGI=;
	h=Date:From:To:Cc:Subject:From;
	b=BOOEy+ujCx+Zm9Oymq8/O50PGua/sEoDRFNlavNwoN7ZqGudxp+sXiJj5iFiQrgqg
	 1U2B7aItoENJDG1Nr9NAkWm4ojvaE6q/HTyVJoSaG5CABRlZxBMWMq61K7G6M89HOa
	 W446MeoFzthZO2QmZoSZKFZRoPFI/lKrdujlO3YJo1xPJwH4Nnf1gIsnjZrh/uYFqI
	 5NzvlC0TT/4alBId4ODwe0IcbnuZkYgaLNZude1m9L6BsOUWtJ75RWYJmdEh/Y0xD7
	 3jfl5eO4OVdz452BoMbTJuAf3qI7LNCtFi/k+Iz/XKH/U2XrKR0RyRPVrKxrKtD4h3
	 UsgIj2MAlg/Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5BsV4lsfz4w0H;
	Tue, 11 Nov 2025 14:31:42 +1100 (AEDT)
Date: Tue, 11 Nov 2025 14:31:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srini@kernel.org>, Greg KH <greg@kroah.com>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the slimbus tree
Message-ID: <20251111143141.57b1d50b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TjdRK6Pl4qMcGSKl0sn8Skr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TjdRK6Pl4qMcGSKl0sn8Skr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  79d84af33209 ("slimbus: ngd: Fix reference count leak in qcom_slim_ngd_no=
tify_slaves")

This is commit

  96cf8500934e ("slimbus: ngd: Fix reference count leak in qcom_slim_ngd_no=
tify_slaves")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TjdRK6Pl4qMcGSKl0sn8Skr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkSrh0ACgkQAVBC80lX
0GwavAgAiefMV8zuXmRsy6oyzRroLjrqraSHWkkkfHOmC85txqdi7OzrGGlcM3Uu
6YJuS8WyE7qjk6HvsUiRS9TNMeGlzQ+Mq0yXrPix3KzWjCM9XG+N2pAUGXnnDZ9u
FQs/bp7MKuGX4jukDBOmi/jpapXae6KRBhG2PUvlfPyRWf4mvwv/aDQq1hDbslhW
yb3aVvuoZqrSuKHegOuhhiAqxoZCy4S+Ov2XD/hYZHLEfo+xLeDRZsHXYwxJLYqA
OGqgI8h5H03ME8zK7fIEqJvAJMmthzVs/431csXcwCC945iEgFsYpCCCBHW+0Pc3
UPshl2nfb/u0HK73ewp9gg1QF4lo0g==
=h2Ig
-----END PGP SIGNATURE-----

--Sig_/TjdRK6Pl4qMcGSKl0sn8Skr--

