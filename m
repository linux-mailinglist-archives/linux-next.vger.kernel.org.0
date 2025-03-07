Return-Path: <linux-next+bounces-5681-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB1FA55CE8
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B85743A79D9
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABE642A8B;
	Fri,  7 Mar 2025 01:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="okvB4MVO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3310957;
	Fri,  7 Mar 2025 01:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741310119; cv=none; b=rUdwo82WywHggN+dyFGTG9ggiQjozyO93+SJLiMnbX5N5GajTJ9qqTwDM+p8CxX47xMbIf8Lz0EvVqs4GZvxIiU4BoYJtb+SFt2O/tsSfGmPYX3I9pSOJqjZlbHAcPK5KlyAxKmaCpvmJAl6NXyDB5/UhX3v+j5lvnZ4+PqjjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741310119; c=relaxed/simple;
	bh=Tn7EXR5xz/NfP+9nO88zOXSHYTkWmnjMLJqg5x0sSL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o+TGiEULy1OZh3wVJXKKmm9xZ3g74UA2R9DLcJW/ExEcc+wOgE2lLPtoqqRrQF9AF48lwq31+tBSoMnwpJbvEBF8SqlXbPEAD7hFu8anyOjN3yvfI4aM4f+WOIJfJPqUhIpnnIaQLsgBnm5FcHIm8f6LnTzNIjf7JPTbJUgp1I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=okvB4MVO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741310113;
	bh=rxfohd/24q2m0TM0jOBNK8SiI0OJ/yR4konJCniJ330=;
	h=Date:From:To:Cc:Subject:From;
	b=okvB4MVOYZajPcs9G5Oln3/zTkauHrYQkfqRSTZ3/phgJHEEPbKJ0sE0V/9KKylJD
	 TLxxHqZp/S70nrn+ehB2HLUhXsz2HawWOaAtbIfi1nzXYNECMOXXDbpcYQPLvSjcos
	 I26qOBQUguQWyt1T1iloJpisACpXksHbq1VrTsP4+U+CaTqFSyVckOtVfamw/aCDJV
	 d9N2LCvp7J1QKoaLft/cVhHgJnN0KCwCAewiYCMQoj3eAPoM6sGXW1H3cYam6/oEAM
	 jz1LWq59IWyKNCFhMMsWFiTa2yca2DXbBjXjkglyiHAcx+lEbXwlq/OAzFnPkX3lKU
	 e1DpGevmz/S9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87cx0v3Hz4whq;
	Fri,  7 Mar 2025 12:15:12 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:15:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tegra tree
Message-ID: <20250307121512.5735349a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DjRuCVHZy0gCdu/6S+BRLEK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  90a1dc90d08b ("arm64: tegra: Remove unused and undocumented "regulator-ra=
mp-delay-scale" property")

This is commit

  828678a1f638 ("arm64: dts: nvidia: Remove unused and undocumented "regula=
tor-ramp-delay-scale" property")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKSKAACgkQAVBC80lX
0GxRMQf9Fv+jSV2kmmBDisN0YxBC0vJ8s/ufyPNnFsaJcZsq2qKxPhlWH5tveuco
AtG1SF6b18LESJgKY3Gg5L1hv0Ghx6rFSMHxPunTee7wkRBXsJquFt/SWQM9Kwm5
9dZOs+TVd6poHbwyB6Rf1DKx0bh0iMEvDOqXvHNzyZnepyfIWE2S2gSUPnJzNwg0
gibqrKqdcSNQCi2tNDloBA8Bw8NEp4oCABJQwTx9pysqkeIM1cAumy2fNz9JTAUt
X5gpxdvFPCn6B8x5//IKcZNEgC3PPnqe55RWBnTgFuW/WY+78RcTiRN8Q43l4cEx
8m6BP33llGIiSeXaZVKUsr5vHfmFXA==
=tXMm
-----END PGP SIGNATURE-----

--Sig_/DjRuCVHZy0gCdu/6S+BRLEK--

