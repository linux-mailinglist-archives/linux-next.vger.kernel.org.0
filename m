Return-Path: <linux-next+bounces-7199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD3AE330B
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 02:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6055D7A3549
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 00:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7920F1FC8;
	Mon, 23 Jun 2025 00:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cd4G+Tfs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F2F1853;
	Mon, 23 Jun 2025 00:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750637657; cv=none; b=KEtJpN22lojaJhWOaYs8mQD0/2qmYc6HSejP6RzavaPflnoJ/cAHYZpvx1Wm5zvRJs1NZDLbX5V1Ns4NPckViY/YGNn8w7Kg7VYc7R9w+K98zLLBEYJoD7Dsqf0M9DMr8o8bjoKihVfMmTIINzAhyydLv93OQvi4Ror/FJ6D4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750637657; c=relaxed/simple;
	bh=auQrh4sKT3ktd4MJdeuOHfL+JJir07MH+eYLsNPEjWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lCHg2ZVFT3AaSr5XqA7fuLAfgDQBsm88GfdmlbHfovsn6zeNcJ3oXH9xgdXT9ha4sIul+qNX5G7/Qv0uRBczkEfTPDkSPLgh62AzHj1Xw65ecJuXVspdkyczgZ9oov5m49qvPoYU97puljwESVJnWUxS67RJz0lfor98WwcPOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cd4G+Tfs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750637650;
	bh=g93xWPClsSQDiTUFHn+j/vo5yn/0oiO5TP1Q91W3ovo=;
	h=Date:From:To:Cc:Subject:From;
	b=Cd4G+TfsJQtDXU6QmsZpZsCIbERCTJV7Gis2C1wjFGDBAtzpncawBap0OQqLMocoA
	 0X3qrU9WSgVs3ON3xyJb1ymEQqdhJ5+Hcwmqij9zoQohgjRDTaByUmIbeH1WMWZBJI
	 0lAMAlcy/Hjb1XAk8g/70aHjd9CcdvEqY5zlU276OpJPx72SUbjLFq2e4DImyLr6DC
	 KrDEJgwi5hMQq5p185m059G7mekxJZLcK8gBlOKvcCB3nMBbAjud0SeM1NMoDY9skB
	 BuVeVCUWQ5+oG0nNUb7nommMlnRWvcJaxuiG/Sk+HrCdbXPIO2l8HsxEP3V3e0Cwk/
	 8m1oh61AJp+bg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bQT8c0XrDz4x0t;
	Mon, 23 Jun 2025 10:14:08 +1000 (AEST)
Date: Mon, 23 Jun 2025 10:14:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Drew Fustini <fustini@kernel.org>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje@dujemihanovic.xyz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with the
 risc-v-fixes tree
Message-ID: <20250623101407.4fe17973@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w.bWvhLFu/GuivKZ5WXRQvH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w.bWvhLFu/GuivKZ5WXRQvH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  .mailmap

between commit:

  850f0e2433cd ("MAINTAINERS: Update Drew Fustini's email address")

from the risc-v-fixes tree and commit:

  a5d3f8d805d2 ("mailmap: update Duje Mihanovi=C4=87's email address")

from the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc .mailmap
index 93e94b0b9376,60165a8144bd..000000000000
--- a/.mailmap
+++ b/.mailmap
@@@ -223,7 -222,7 +223,8 @@@ Dmitry Safonov <0x7f454c46@gmail.com> <
  Dmitry Safonov <0x7f454c46@gmail.com> <dsafonov@virtuozzo.com>
  Domen Puncer <domen@coderock.org>
  Douglas Gilbert <dougg@torque.net>
 +Drew Fustini <fustini@kernel.org> <drew@pdp7.com>
+ <duje@dujemihanovic.xyz> <duje.mihanovic@skole.hr>
  Ed L. Cashin <ecashin@coraid.com>
  Elliot Berman <quic_eberman@quicinc.com> <eberman@codeaurora.org>
  Enric Balletbo i Serra <eballetbo@kernel.org> <enric.balletbo@collabora.c=
om>

--Sig_/w.bWvhLFu/GuivKZ5WXRQvH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhYnE8ACgkQAVBC80lX
0GxRbggAk6DTMLsSKnRP5LV38NKeWzCptAXtv+85r9qeMd/SKBF5cgQo5YooHan/
RhMCDBhuMzhJVfFCswbSwSfgSBkGNXUCXjFaxX9dWzn/GfQoUx6hC6CPZ5XkQBXN
0ZY3K4OpY60RV2g+0FaYrNHOyuUIKpHfXjEvwC4beaYcob9N4fLt4t/pgIbN4/9C
awUBfc1L0nHSF+nHVWsN8txccIliCrEdRnaJUdr44bdBuLZHQePkdTw0ItkiZBRR
njnccTCZqCNe9B4CjR2Ll9lkLbfFFlH9GCHstvWitKd4lDnAD+vqDaZVYJo1yPFp
J/zhbi94Pq4EyW6JzShzfx6C5tznkw==
=Nzcm
-----END PGP SIGNATURE-----

--Sig_/w.bWvhLFu/GuivKZ5WXRQvH--

