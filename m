Return-Path: <linux-next+bounces-248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323D80665F
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 05:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94AC281D71
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 04:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A836C1108;
	Wed,  6 Dec 2023 04:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KWF9cQqn"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502C1A5;
	Tue,  5 Dec 2023 20:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701838052;
	bh=vVeXte/GmqKo3BeYMWbX83grmqhoPxHp5v7YTOjDpsA=;
	h=Date:From:To:Cc:Subject:From;
	b=KWF9cQqnSfX/77k/wycjtzFfW+925aby3FKWeEgtj3OkxaFyjT1ax1afFkn2puYTa
	 qe1mT00hYcRq8h/L0xEGine+G/P0Wh2hnztomnNKdW/eVn3yf9NccGpjQ0bnXz7gBc
	 2TA7b39oQAoL42fMY8QmFVF/P98crAa1XdDTcx0zk2vq5FBUsyVdCeeYvUwFfIEPcH
	 oAZH0dctryy0XG/BrasUyHRCV+3r9ynqz8Gg+tTkjMf6sVcRXyjz8sAB+EjXzgyLWk
	 npqSvzhO6h/WJco7mXCypLFo36BlAzv6mXQYsEjNgyEftV70MC8kNP0b4Em7z9s8QI
	 jrceWPhZ8YAAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlPyq1wJyz4wd1;
	Wed,  6 Dec 2023 15:47:31 +1100 (AEDT)
Date: Wed, 6 Dec 2023 15:47:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20231206154730.00346f93@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j7l+mD.zyoT/RVwR2qkuFR2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j7l+mD.zyoT/RVwR2qkuFR2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  50f8906b310e ("arm64: dts: freescale: imx8-ss-lsio: Fix #pwm-cells")

Fixes tag

  Fixes: a05c329644d81 ("arm64: dts: freescale: imx8-ss-lsio: add support f=
or lsio_pwm0-3")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 23fa99b205ea ("arm64: dts: freescale: imx8-ss-lsio: add support for =
lsio_pwm0-3")

--=20
Cheers,
Stephen Rothwell

--Sig_/j7l+mD.zyoT/RVwR2qkuFR2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVv/OIACgkQAVBC80lX
0GytjAf+Ib7Z+SOfFCz37uYYBm5vZqoIRqr+XT1PUGMd3uWqu13NAkhkaVmTd6iL
+SElKoN6PvMnOOK08KT9UXZfDDu7ZltS16lYTZhwCw65FkbYpj4WODS/XLtrFnnk
fQwzbDZR4NUmSg91gT2i4zphLIMranV4/ZRSgdcbFZ5bf427pJ0JMjzZb3mUeloJ
ZsezDQ20GHsBXmN9fE87aDEaDYXIUg/FAanXUeoZOTetbuObN848tt+Adlj8ssOL
/PXC++BZlSxO46Qflclh0PBCPYfApNlJ/DIxGqJffnjZ6zLeFi8NQWsgPozgXAJm
dX0yZ9xV5bmH04dfIglv0Lemm0V3aQ==
=Yfsc
-----END PGP SIGNATURE-----

--Sig_/j7l+mD.zyoT/RVwR2qkuFR2--

