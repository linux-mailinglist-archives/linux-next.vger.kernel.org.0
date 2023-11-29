Return-Path: <linux-next+bounces-110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C70A47FCC4A
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 02:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A45B214F6
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 01:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C456C1878;
	Wed, 29 Nov 2023 01:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oCG4vxwq"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E5EF5;
	Tue, 28 Nov 2023 17:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701221048;
	bh=QFeXnaUEntX6sP5PG4BuqjYMFylnyscfrlT0xNz8UpM=;
	h=Date:From:To:Cc:Subject:From;
	b=oCG4vxwqncgmdGMjTZONLfbuI5aFzjaMonWMZjwsp3EOZ0VYpdbkl7D/7HDH7V+6W
	 JUU8ERnXEAJYUfgMqsnCIwiHXhmzhfox/OXxZxb5+Js5URZJ2QfdUG62sJdKFtyoGF
	 0YwJooY+jdZk4DfoRqQaGOBLhTLPK8S64jfqYPHEOhJXMvkF/EuVZbV2IllXfXy++W
	 CEjxLbd++OmZkCalBMe9c3uyABTDK+GHtYRZWPb3XAo1xHlXucyFJn9sB2jMwKi6ad
	 SjxnrVQYHe+92VvDkN09Hd1HMRBXqFS3xUDyuwSR8qZtmZp99vN9e6BmNXkY7PR4Gz
	 Fu8/f19T8qyEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg1nM1lbQz4wcX;
	Wed, 29 Nov 2023 12:24:06 +1100 (AEDT)
Date: Wed, 29 Nov 2023 12:24:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the char-misc tree
Message-ID: <20231129122405.27a5e54a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KaQD./.8r_dPiczMNRr44Tg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KaQD./.8r_dPiczMNRr44Tg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the powerpc tree as different commits
(but the same patches):

  bc1183a63057 ("misc: ocxl: main: Remove unnecessary =E2=80=980=E2=80=99 v=
alues from rc")
  29eb0dc7bd1e ("misc: ocxl: link: Remove unnecessary (void*) conversions")
  0e425d703c30 ("misc: ocxl: afu_irq: Remove unnecessary (void*) conversion=
s")
  62df29a542f9 ("misc: ocxl: context: Remove unnecessary (void*) conversion=
s")

These are commits

  29685ea5754f ("misc: ocxl: main: Remove unnecessary =E2=80=980=E2=80=99 v=
alues from rc")
  220f3ced8e42 ("misc: ocxl: link: Remove unnecessary (void*) conversions")
  84ba5d3675e2 ("misc: ocxl: afu_irq: Remove unnecessary (void*) conversion=
s")
  82d30723d58f ("misc: ocxl: context: Remove unnecessary (void*) conversion=
s")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KaQD./.8r_dPiczMNRr44Tg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVmkrUACgkQAVBC80lX
0Gy7rAf+L57K1PG/ZKUrhjtQoptSZBtEuopxNd5wmdeSNpwwjHpzGZaN3+dFezNX
o+ow6HdZ+5LDWM05IKRObZoEsqksqasPTRHuN9rx/+S+tTfICiyulZ/zOIwYjYlr
YR7pJelrlWtQcsq5vuPNbayFWKL4NC+WrtT2o/mHdHB8+A5zyqngcgrZIgMWzJaW
F5OVfP8vwpajmm7q7qdAp8DYYulNvgK9jyhkLGNUqyX18dlANkh1wRkEcYIuO48w
EU7KZDGkJnvhLc3VTSRu6/iX7owSIfmR5irkR6M6gzqtj32eIuCOgQODd0tAlif3
uQDUs7mksdZnkpRnir+de1yeZztGIA==
=awk6
-----END PGP SIGNATURE-----

--Sig_/KaQD./.8r_dPiczMNRr44Tg--

