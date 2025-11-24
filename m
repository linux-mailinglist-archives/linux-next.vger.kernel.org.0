Return-Path: <linux-next+bounces-9164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A09DC7EBBA
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 02:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B32B53A4782
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 01:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0731E221271;
	Mon, 24 Nov 2025 01:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NeUqav8u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06101804A;
	Mon, 24 Nov 2025 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763946559; cv=none; b=ZQxhy9uzRYw6sdt8aw7IsmE5qKF5o2KQDKPKPGGXxNiElLrVfJvCUG1pTpkiOkEbIk5dfP0ENmrFigG2QlHo6DvzZy0p6RrDjqZhspr67pW3Ork0re9SGsT4jR/MzvRo6/ELfoAPok50wazIOeIRYFRCEt6vNelTMiKQjhuhbWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763946559; c=relaxed/simple;
	bh=pZ0yttAP/kqk/f8ySdzm0wix65k0dZB8SW/FwwuF4GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CRbDGR/Z94kbHJdg1KYkdN+BYlZ8I9LJ7z+Q3j+NKtXXDNcaKuE4PhL+rbgf0I1Gcfd8C+RbSRMcBkSSNcDIzadzPRpXE0w95k1+dZj+2g+RMd8tZF9p52whjQT5C0GxHW8GxxDN5pAAieXvBvlQTdXsVojTFYiI3AJADiXwY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NeUqav8u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763946555;
	bh=X27VJWRTlzjJuNH75gkWtR56bcx7Pze/Hk4wCFeBx4g=;
	h=Date:From:To:Cc:Subject:From;
	b=NeUqav8uVoO42LHbeU8p68axncapjzR+x4gV4Nvf18Rck409cWBBBxyASofBBP7Oj
	 BPjfr1/99gZ8MDS/3zk6Zz4iJSIz3ZhtFhRvfiOgCP+4o7OpFfmWSvMxj07UqKDFZg
	 iTrCkvkPxQYLp4sPme4ZXVI7Dgphz1Cuqsd9yHaB4xJmHamoWWgn92PdDjn+C/BBoi
	 d5GRORRoKB2ZCTGlc8zs39iRfcRS/ULsHiM1vq3Q0mYm3zYz5WD1xh3qpq34afCghJ
	 CTGuDW1CtCPlPVQ7QdqJcLr83PslPe+dzoZT2ho+Zp2zxE4U69WRyrbI+6MADHgCa7
	 QTTn5/PInbwyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dF7556X9Mz4w9q;
	Mon, 24 Nov 2025 12:09:13 +1100 (AEDT)
Date: Mon, 24 Nov 2025 12:09:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the samsung-krzk tree
Message-ID: <20251124120913.76374412@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JUItA5i/RiOmGkuZJ/EMqd4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  2e646b21df4c ("arm64: defconfig: enable Exynos ACPM clocks")

This is commit

  38c8787f1b81 ("arm64: defconfig: enable Exynos ACPM clocks")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkjsDkACgkQAVBC80lX
0Gy+nAf/fH7iMQKD/WP6wbSdS32Huu6UgZPyKoW3G24Hwi76qy3/KW8TNgKAG4lY
Qf4XBu66VTRCIxLKEzCYG3VRI6Ki2L1Ex7NROxyxcKtfleoxSjKrl9kQPs0ZLrwN
SRJqjDF9KNs7jZHNssQBw7aoJ0Bdv53xMRvKU4PZNqyPlW4x/4ORcQ0g4Ag+Llto
fEd5ChBVqdgWJujGG2g/32kbvqY0ExH/aD4KfuH2O+PASOnWUUNioUMW+0MkKti3
4+iRhdjokZJXurOz1lIIImGC5YhBViPB7SadhT89sDEi8KABHo8KiCLwpnK37BGT
ckRDefEyghge5vrm+E5THAZrakP2kA==
=Oshb
-----END PGP SIGNATURE-----

--Sig_/JUItA5i/RiOmGkuZJ/EMqd4--

