Return-Path: <linux-next+bounces-9619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3AAD16986
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 05:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D46A23019B90
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 04:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAF63093C8;
	Tue, 13 Jan 2026 04:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ECsYcJj4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10182E92BA;
	Tue, 13 Jan 2026 04:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768277282; cv=none; b=heYjweZaucMo7Gf0OyQ5T28QaHZXIWJfwBpyAOycGczPjENfyxoaXKD/ItlEanapjOvmv24MGF0qOvsIYEJxPnIvpz5DfCmXTcy16mCrrUi71xQECI5hTamdGnXfFui2aLSGfb+i4jEqdtbs/0PJbGusuTXhN6eOBhLhgh1MDFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768277282; c=relaxed/simple;
	bh=2n/h/H0BCVF4O3YyBkzWm+5zyPEU1nRX6uLocqo1Lks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OmsVmYYCTw7aifk3yIoRLHq9v3iTuPHHQ/E7HBtQBbsvCJzKLh04rpw1jHJJkaHtqUNLdKz24TNC87IvwMqfHYQfY7weowDKp5n/IBQpgxB2R0/wf7nx7RUqK/i4AX2ctj4djXp8FxXTqBAwnfoJV452w0PES+/pfxeeMOan0iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ECsYcJj4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768277275;
	bh=W7vd9OLZcMoZ1A4sN8aUbHFGiXh2mtHRDkQH4XX4fCc=;
	h=Date:From:To:Cc:Subject:From;
	b=ECsYcJj4AoXMZPKj5T9njhVXlm+qqvPKDIQMBTdUB86io0RBNECR8d00LMSSmj6lF
	 v84IRTR+R0DAy4U1LIpmuk2Lpict5ILoGKsW8CHTm4S6PQ2/TZppw0WmJxouaWM9li
	 KHBOQ34PKMw+wljsQNCl2WjyWdb8wVXL/0eLlj0KWLWRmhNnYKCq3oJDyF3PepmHAM
	 58K9CCPlmWYwsssNXWtVuHqFxX1WZfblho+4bqrWuScvDVXPoR6iFr5o59dXyQ5mlB
	 B2lScrYeD5qgF7ksMsckbylARO/y1VPbuKDV7hv/pqH8S4fLnw4o30vV0Iw6OUKKog
	 k5JgZ/fW9wWPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqwh956fjz4w1g;
	Tue, 13 Jan 2026 15:07:53 +1100 (AEDT)
Date: Tue, 13 Jan 2026 15:07:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kuen-Han Tsai
 <khtsai@google.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the usb tree with the nn-nonmm-unstable
 tree
Message-ID: <20260113150752.2e2238f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OnPn8PRMGzB2x./ffiRU62L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OnPn8PRMGzB2x./ffiRU62L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from drivers/usb/gadget/function/f_ncm.c:27:
drivers/usb/gadget/function/f_ncm.c: In function 'ncm_opts_dev_addr_store':
drivers/usb/gadget/function/u_ether_configfs.h:243:31: error: implicit decl=
aration of function 'hex_to_bin' [-Wimplicit-function-declaration]
  243 |                         num =3D hex_to_bin(*p++) << 4;             =
               \
      |                               ^~~~~~~~~~
drivers/usb/gadget/function/f_ncm.c:1600:1: note: in expansion of macro 'US=
B_ETHER_OPTS_ATTR_DEV_ADDR'
 1600 | USB_ETHER_OPTS_ATTR_DEV_ADDR(ncm);
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")

from the mm-nonmm-unstable tree interacting with commits

  e065c6a7e46c ("usb: gadget: u_ether: add gether_opts for config caching")
  56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle with bind/u=
nbind")

from the USB tree.

I have applied the following merge resolution patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jan 2026 14:36:59 +1100
Subject: [PATCH] fix up for "usb: gadget: u_ether: add gether_opts for conf=
ig
 caching"

interacting with commit

 30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")

from the mm-nonmm-unstable tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/gadget/function/u_ether_configfs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/u_ether_configfs.h b/drivers/usb/g=
adget/function/u_ether_configfs.h
index 39d3a261496d..c2f8903d1400 100644
--- a/drivers/usb/gadget/function/u_ether_configfs.h
+++ b/drivers/usb/gadget/function/u_ether_configfs.h
@@ -18,6 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
+#include <linux/hex.h>
=20
 #define USB_ETHERNET_CONFIGFS_ITEM(_f_)					\
 	static void _f_##_attr_release(struct config_item *item)	\
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/OnPn8PRMGzB2x./ffiRU62L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllxRgACgkQAVBC80lX
0GwGBgf9FzFA/rSXk29Z1TQ+Pq40qxycG5qmGhb+dq/PxIKhaekwptSHMCXnq4kl
LndfCfM3iYSyr6S/dYcGV6ZXec22CJKZc4ppRsai+tV4TRic+GQfSY1fxpckVmGL
Wz2MlCcgfJjCTpyCz2qFSbvPiOtjaSmjwzgzWGQTzZjAhG4OYmu0LQ1YqNNwhND3
5gNliwtmEGQcEgbyusZ+gWZYQ41eQjdueUPXbvktGaV7ThmMVwYYLApJ2DsSRcHq
/hNlkHbTkupL+v2qZzd4/btYpM7M3Mr4WigfWTBIbi7q4FTTGSvaFPE87vvLlZEZ
qMcb/Y/ZS2HSKbbSqwld+i+ajlbjgQ==
=aC37
-----END PGP SIGNATURE-----

--Sig_/OnPn8PRMGzB2x./ffiRU62L--

