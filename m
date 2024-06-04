Return-Path: <linux-next+bounces-2459-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1F8FA774
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 03:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 915521F24631
	for <lists+linux-next@lfdr.de>; Tue,  4 Jun 2024 01:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90B4136994;
	Tue,  4 Jun 2024 01:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oLCjYGrM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A173F1A28B;
	Tue,  4 Jun 2024 01:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717464019; cv=none; b=Vc6INRkPPCtHPSK3e4igICBCM8eP4277lyaTbZuE+1wiqkNGKaBAxudiPu/4mbTAQcUM/vFmKMVPAUbYorSRUVHqp7kspjvyCwwPY4K9EcwZJrtSbyFOiyLmIbiO8QT2vbCYjYsy8OW1e8qS4I7NV3o7xGLxJWwmD00qN3gYJKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717464019; c=relaxed/simple;
	bh=UUJqDpRj4P4C23hAk/wb3/k8mutmc6OeiJneaKPzMWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d6Vbx/akY3bm3N7Nyv2PoEwEcrJEfVgdtQVU44wC9zx3Kc0inPhV376F1NySft3FU/76Cmn06AflyPshcwrcTijEdGFHZNYcUQo3c946QVxI6KawSsycPaVYOa5nVkYUGKH9foKoR1K6R5+hntkT+ybpiqQMbBkz62qUjNfSwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oLCjYGrM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717464012;
	bh=QywYSDQzzJCBqdmfZO2R9b64PaxhNweFd1QnMPYEZiU=;
	h=Date:From:To:Cc:Subject:From;
	b=oLCjYGrM1R3u74fQG+Cj+dioaLRCDjjvdmZvNhB/zAEXbWkG55v9NMHFknliYHFZp
	 Kq++8eCn8AKsUP1vLeN6hJ4yN0CBq0tYRtZsAgxoCmh27Z6MXBBJM/AH5W9WqFeaYS
	 iTgtGts2JKe4HWGxxcAIQpXxpVHiX3jJEcaU0MwlxDe4EkN7mOP1rRiX1PJH0Vl2iZ
	 BxDLY77ox79gTzjHMd7au8+0eCjRfMH4kha16rjiTkwGzUeanIi79Y8idxj2u9DUql
	 //agfSyU5XWo5LnuJLq1e+vft6K7YrmfpBRqtFXmc9Sw6dquJITADWAiqxSVnYQv3b
	 1h2SPvmTO42hQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VtXp41NRbz4wyl;
	Tue,  4 Jun 2024 11:20:12 +1000 (AEST)
Date: Tue, 4 Jun 2024 11:20:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20240604112010.4b29ffe7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IR._oIounaqgrxGobPXISQP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IR._oIounaqgrxGobPXISQP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the i2c tree as different commits
(but the same patches):

  5fb9780aa910 ("i2c: Remove I2C_CLASS_SPD")
  fe69f7d19df7 ("i2c: synquacer: Remove a clk reference from struct synquac=
er_i2c")

These are commits

  e61bcf42d290 ("i2c: Remove I2C_CLASS_SPD")
  e6722ea6b9ed ("i2c: synquacer: Remove a clk reference from struct synquac=
er_i2c")

in the i2c tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IR._oIounaqgrxGobPXISQP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZea8oACgkQAVBC80lX
0GxVdgf/VduVTmPeMF/6GmvX8svTVezCjdR/Tahy1I7hJhDnFuphjNfRZIKaz95U
rtjJmyI0NM6tqxseA+WGbsiZ9DecKEJj6tqhhidCrZKArIHkhMF27arpUG6L0KIY
mZDDuaSNqOPHcKraS6C4erjCteQR+gP8IEvpd3+zPnAPRmNQh6QNgMuiGLe7Q175
3kkuWRj9/hXEXpERhx7iYt/Ok9YyCbd6NYZcyYpLe4bLSDYAp4Cvg1TQdnJPq7QT
pQZt1IjDOeaj33fAShWltOWTKmeik8D+Jmx6eyYtdgdr4MgJ16c7HDqDZfMNE8wu
UThbK558zzRtnUlDsfs8OTnODgEXEw==
=AOfs
-----END PGP SIGNATURE-----

--Sig_/IR._oIounaqgrxGobPXISQP--

