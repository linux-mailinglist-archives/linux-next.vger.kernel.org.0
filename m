Return-Path: <linux-next+bounces-5547-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F1A41591
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 07:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D99D1647C2
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90218207DEF;
	Mon, 24 Feb 2025 06:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OYLuhkW3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065B32C85;
	Mon, 24 Feb 2025 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740379255; cv=none; b=Z26PlD8FWbJdpUIq8vwK/NzDrWzIdUFR8EkHvDhu3iUBb1NmrBs7IOPsgIHe+/uLm+El44Cg9cyYTDwfeMvEbOcarAQhmu0vWZaf7ItQ3rl4M0MXh2f7xJHE8OThr8VM0/nWAonmJt4Wb+V8f2NKCLE9Xt67Fr8F13FYxvSNnh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740379255; c=relaxed/simple;
	bh=dI2rXdwa1aLewP5sET84b/vlAgp2MelpL729FzfWKCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=clrJ1XHBDuoAYgbvLQoy46dOveePGCMfFAYmQzZemASRjsPsrk2yd76mUCQX0PH8tWlruyfMnCALQMPzMeyoetjDrvq/SmlMl8+JtPQXu13IpsIFOgSJ+SrW4orGkiDUJ7QBchZnsvyAbe6DNza37m3tLzVjokt2uGmggjqJE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OYLuhkW3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740379249;
	bh=G4UcVpz4z9IEcH5ibVq1WHPGG6fkGN6RFuLkoZyfg0o=;
	h=Date:From:To:Cc:Subject:From;
	b=OYLuhkW35+zp7hDUsqBMgaFJJczshgYUCfJJU1HoGN8Pi/8AkN6p3OZnGUpbd0tD8
	 QsRzXdedXOwajdwzNQmkzJykL6xpTpxdQVzhE7IOfW/m/F0q2AKepwlPXVZK5YRfmD
	 8MeskW3n+puIsgSez9xhssqOtE2xcANZBD3IQ55m95UG0vzNSCwG0Sdrvr2nxkMvrO
	 7yOq42/VQn2KiHoeLsExWAIY03zQwsPMg6T15KCXvYdAtE9KG91b//BUXVXuqBsPkn
	 ulGowbJAJxKGP+qGarJgxMJoY6Tprsxow+ou3v3vy32kJF6ROYEk6fUfOIGxrfUpeQ
	 gg7I8izR6rw+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1WMj3xMrz4wby;
	Mon, 24 Feb 2025 17:40:48 +1100 (AEDT)
Date: Mon, 24 Feb 2025 17:40:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Brian Mak <makb@juniper.net>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the execve tree
Message-ID: <20250224174047.7d1bd6e4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L35Mzz/flyxhQr5DMosP99l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L35Mzz/flyxhQr5DMosP99l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the execve tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/coredump.c: In function 'dump_vma_snapshot':
fs/coredump.c:1301:45: error: too few arguments to function 'get_dump_page'
 1301 |                         struct page *page =3D get_dump_page(addr);
      |                                             ^~~~~~~~~~~~~
In file included from fs/coredump.c:6:
include/linux/mm.h:2620:14: note: declared here
 2620 | struct page *get_dump_page(unsigned long addr, int *locked);
      |              ^~~~~~~~~~~~~

Caused by commit

  ff41385709f0 ("coredump: Only sort VMAs when truncating or core_sort_vma =
sysctl is set")

interacting with commit

  d6ff4c8f6522 ("fs: avoid mmap sem relocks when coredumping with many miss=
ing pages")

from the vfs-brauner tree.

I did the obvious (but probably wrong fix up below).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Feb 2025 17:27:25 +1100
Subject: [PATCH] fix up for "coredump: Only sort VMAs when truncating or
 core_sort_vma sysctl is set"

interacting with commit

  d6ff4c8f6522 ("fs: avoid mmap sem relocks when coredumping with many miss=
ing pages")

from the vfs-brauner tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/coredump.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index 723c1ae9d2f4..eb75cd30862d 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -1243,6 +1243,7 @@ static bool dump_vma_snapshot(struct coredump_params =
*cprm)
 	VMA_ITERATOR(vmi, mm, 0);
 	int i =3D 0;
 	size_t sparse_vma_dump_size =3D 0;
+	int locked =3D 0;
=20
 	/*
 	 * Once the stack expansion code is fixed to not change VMA bounds
@@ -1298,7 +1299,7 @@ static bool dump_vma_snapshot(struct coredump_params =
*cprm)
=20
 		/* Subtract zero pages from the sparse_vma_dump_size. */
 		for (addr =3D m->start; addr < m->start + m->dump_size; addr +=3D PAGE_S=
IZE) {
-			struct page *page =3D get_dump_page(addr);
+			struct page *page =3D get_dump_page(addr, &locked);
=20
 			if (!page)
 				sparse_vma_dump_size -=3D PAGE_SIZE;
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/L35Mzz/flyxhQr5DMosP99l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8FG8ACgkQAVBC80lX
0GyZeQgAm0PaC71mgxbd+cEwFf+BNbNKp1vH61xOUNHnL6uZz5O44taBpONBwNff
5sHjFIbJAEJ/CwyoL55N5u4ejf8bKppc2QMlOf+Mm51pqjo0eZcnIb9xrK/OQZXT
yhFlf9JP51M8uGZpO5F6uaewxGP8o7l5/ItoVKlh86/Zy+VbMpckPI2l0Ml+5nma
49Yd8G9SxL+uRUouHFz5HGQPunFvoacxWq/B20FJ9UPTOQiYEO1c53JAPtPk6pqr
J6XBF4xmlxSDv7eguU3uW1l/AEuhsmeGQtMmRfgsq0BsLWfFePvL4ClMmoVJ1tJA
aFP7l0hiyGMSxF5qMcbISvSLAL6jwQ==
=oBlw
-----END PGP SIGNATURE-----

--Sig_/L35Mzz/flyxhQr5DMosP99l--

