Return-Path: <linux-next+bounces-3776-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E197601D
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 06:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9F41C22E15
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 04:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7B318890E;
	Thu, 12 Sep 2024 04:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="poKFwwib"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E04188907;
	Thu, 12 Sep 2024 04:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726116307; cv=none; b=bCzaSOfXi3WRjW5mNcNz/7qGA6y5bMqJ3z2Pi6KZ5bi67SLrTCCRTXwaH5RN4LSJ7oBafGH32cTFLN95yB0se5a+nKIiMEyZfAVqbicPjhPDtNpSB3OxIXNfk6vxGz6O0uJNDi3A9wTaUTuvN1bvKKWip8f+K/BniBuH1MQH+f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726116307; c=relaxed/simple;
	bh=gtVEsIARHEIiguHv4gLh++VT4qhf9uwonDgcHKUX4ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UFtHY+zHTCHAKyXg3O0z4W66NDFy4S9cxXjAB6mpvK0GJw2aVsS8OVQ870SmwsVGQEGQF8zOMlPGZo3y5iaNgmMYXL5ZruMAmSLpDhN1mdz7Y4EMr5tjzw6Ysz5goPlMGSFT8G8br5pkPWpN9Ebwb/6dAoh7hxhXtUTdSRs8Iy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=poKFwwib; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726116301;
	bh=/flF3ej84KcIchlKhd618cIfXh9oVVq3n1ETpKUYZjI=;
	h=Date:From:To:Cc:Subject:From;
	b=poKFwwib5Lmwrl00cXvkxBBQfuim5zTeU5mWY5hIkE7CzGigKj0d8ecoHjahqUntS
	 KIwCJbGbIpLpOTnJf2WHX+OJm4s33b53zKooDIXxYiTD7mWE5ia6sxz+igbBGFs+To
	 fwFDn377i5/8WXFG8JMddRfDsszJHkgphnFsXlbZ4Guu9+MHLaJEPyiw5NvExpMwll
	 ZNQqiSg2wTPC7gluJDwo9AQy0Csb8YQ9L8yLBwKJrdYRij3FOsRlXHMQ93hUMs96O9
	 2QEYNpr+eDHSCd4bQXKlvu+yDkkyYKo8k3q337SYUP7TbxVrfZDcNpn1GDNC+Ry6p1
	 xfgrj4NXQ8dqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X44cD1CbLz4x0K;
	Thu, 12 Sep 2024 14:45:00 +1000 (AEST)
Date: Thu, 12 Sep 2024 14:44:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the sound-asoc tree
Message-ID: <20240912144459.634e3e09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OrvdbKrwX_7JCjPqqz/BXhf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OrvdbKrwX_7JCjPqqz/BXhf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  7817eb1ad353 ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")

This is commit

  cf700e558e1d ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")

from the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OrvdbKrwX_7JCjPqqz/BXhf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiccsACgkQAVBC80lX
0GzM0Af/Yk51Mhtwg2Cb3rdEFZRT4EO53QgdAKiWAbV4CwynpQYxS9C6IfVqNUxT
NqMAd6yK8IS9gAW6rMmyrpmc1eRfX1HBgowpro2deko/m/c9wgpw9OT3CfrKFNu/
/aWsimTSWB7xIe2OnaH/OR1UEGQgoOcIPcipF3pRkSGDRDiDZUYhxwKIu6377VnC
jL1odRJPn794vZiZIynp1SpIngRm095Wh+DsEnTOF12CRRpi60avbJj3YepQdpFf
FyDcEahcR+3YXjbglOpBzagdrj+iPPYsKSpvggoNQKy+9Ndg5a4wYyz36No3Nn3b
GPJ3ydKCqQSmPE+VLG732JU+1wUt2g==
=w1DB
-----END PGP SIGNATURE-----

--Sig_/OrvdbKrwX_7JCjPqqz/BXhf--

