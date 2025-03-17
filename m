Return-Path: <linux-next+bounces-5844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDF7A6627D
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 00:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F98189D6E5
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089871F5825;
	Mon, 17 Mar 2025 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kugGxdG2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2D19C552;
	Mon, 17 Mar 2025 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742253183; cv=none; b=dZl5kviCl8iz8AaIg2YhjEeFL7CI9E0CWMWACai5cPU5e17XP2OEsiuRdBEc0UnBdAt9KVSry1bBImy/f11Gn7t3MuCXvKcpWPsQ+M29BhdY1vkJ9E3Su/lL532iJUZK88NvY6Il6LmNS8rlDy2GnDeW10VmruQxlmwKKmPY0iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742253183; c=relaxed/simple;
	bh=mjlo0s9uKqeN+AyutGb8sbFEHXsg9/EyNHDZmcaEgRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ug+KSWewCyCzdDYNevZojA846xybYnWrOGGMTujC5k94xo6oaL/CuraI09P7ox+fnfrxpXg9Bp3LQsodaGm9M1PGAqr2LKLC3pm7sO8qOkAMFK3+VigMRuieEEFazXAp8D7F4/3ScJZ9654Fl/2x0GwemSdpj1A2wcLOmmNs0hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kugGxdG2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742253178;
	bh=Uckx7R/fU+ylEA47K7W0MSDuIT5YzmBXe9rE/SUjzQ4=;
	h=Date:From:To:Cc:Subject:From;
	b=kugGxdG2D4h1rCk2T2VkYIR0bWEOl+M2q3ac3QzFOpSVyv6ZX3pSC/C3gShRwm/Tj
	 YMUk+R3UYveJTf/q81s3vSCFEoPTZR6OPCSGM9thiH6OlyGmfQ+yZdniP6fcgOh9BK
	 B0vEh5l1JE9NxR/xCiLh2sYwhH3JJFFqoZDDQGAE5SWZfC8GO69Yz6jzYLc0/UZAVM
	 WqsOm32ee1077WQYXF9wEyqNaFTq8Eyal775A/nGjLs7RMOBMbp5HHZC3V3zTBADZl
	 kjourYZpDciCC8PeJ6DtOrEoG3u3R5sOVjsmz8E72MsFYMTDyu55fvbDU6LhpJM50N
	 yEZ+toHqOt+mQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGrNn3WWWz4wnp;
	Tue, 18 Mar 2025 10:12:57 +1100 (AEDT)
Date: Tue, 18 Mar 2025 10:12:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Mike Marshall
 <hubcap@omnibond.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250318101256.01afbb47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/epXjtVmT63.yM.OeyKbuJtE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/epXjtVmT63.yM.OeyKbuJtE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/orangefs/orangefs-debugfs.c:101:8: error: redefinition of 'struct __keyw=
ord_mask_s'
  101 | struct __keyword_mask_s {
      |        ^~~~~~~~~~~~~~~~
fs/orangefs/orangefs-debugfs.c:48:8: note: originally defined here
   48 | struct __keyword_mask_s {
      |        ^~~~~~~~~~~~~~~~
fs/orangefs/orangefs-debugfs.c:119:32: error: conflicting types for 's_kmod=
_keyword_mask_map'; have 'struct __keyword_mask_s[]'
  119 | static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~
fs/orangefs/orangefs-debugfs.c:66:32: note: previous definition of 's_kmod_=
keyword_mask_map' with type 'struct __keyword_mask_s[18]'
   66 | static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
      |                                ^~~~~~~~~~~~~~~~~~~~~~~
fs/orangefs/orangefs-debugfs.c:140:18: error: redefinition of 'num_kmod_key=
word_mask_map'
  140 | static const int num_kmod_keyword_mask_map =3D (int)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
fs/orangefs/orangefs-debugfs.c:87:18: note: previous definition of 'num_kmo=
d_keyword_mask_map' with type 'int'
   87 | static const int num_kmod_keyword_mask_map =3D (int)
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  50fb0a7f43c0 ("orangefs: Move s_kmod_keyword_mask_map to orangefs-debugfs=
.c")

merging badly with commit

  063f8013373a ("orangefs: move s_kmod_keyword_mask_map[] into debugfs.c")

from the orangefs tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Mar 2025 09:43:37 +1100
Subject: [PATCH] fix up for bad merge of "orangefs: Move
 s_kmod_keyword_mask_map to orangefs-debugfs.c"

with "orangefs: move s_kmod_keyword_mask_map[] into debugfs.c" from the
oragngefs tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/orangefs/orangefs-debugfs.c | 43 ----------------------------------
 1 file changed, 43 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 98b52ceaf011..f7095c91660c 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -97,49 +97,6 @@ static const int num_kmod_keyword_mask_map =3D (int)
 #define ORANGEFS_VERBOSE "verbose"
 #define ORANGEFS_ALL "all"
=20
-/* a private internal type */
-struct __keyword_mask_s {
-	const char *keyword;
-	__u64 mask_val;
-};
-
-/*
- * Map all kmod keywords to kmod debug masks here. Keep this
- * structure "packed":
- *
- *   "all" is always last...
- *
- *   keyword     mask_val     index
- *     foo          1           0
- *     bar          2           1
- *     baz          4           2
- *     qux          8           3
- *      .           .           .
- */
-static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
-	{"super", GOSSIP_SUPER_DEBUG},
-	{"inode", GOSSIP_INODE_DEBUG},
-	{"file", GOSSIP_FILE_DEBUG},
-	{"dir", GOSSIP_DIR_DEBUG},
-	{"utils", GOSSIP_UTILS_DEBUG},
-	{"wait", GOSSIP_WAIT_DEBUG},
-	{"acl", GOSSIP_ACL_DEBUG},
-	{"dcache", GOSSIP_DCACHE_DEBUG},
-	{"dev", GOSSIP_DEV_DEBUG},
-	{"name", GOSSIP_NAME_DEBUG},
-	{"bufmap", GOSSIP_BUFMAP_DEBUG},
-	{"cache", GOSSIP_CACHE_DEBUG},
-	{"debugfs", GOSSIP_DEBUGFS_DEBUG},
-	{"xattr", GOSSIP_XATTR_DEBUG},
-	{"init", GOSSIP_INIT_DEBUG},
-	{"sysfs", GOSSIP_SYSFS_DEBUG},
-	{"none", GOSSIP_NO_DEBUG},
-	{"all", GOSSIP_MAX_DEBUG}
-};
-
-static const int num_kmod_keyword_mask_map =3D (int)
-	(ARRAY_SIZE(s_kmod_keyword_mask_map));
-
 /*
  * An array of client_debug_mask will be built to hold debug keyword/mask
  * values fetched from userspace.
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/epXjtVmT63.yM.OeyKbuJtE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYrHgACgkQAVBC80lX
0GyP4QgAorupdk/+8bmVGzTp1Vf8gWe62CpNh9rd8Nkecn0SUl4pGZTcoJ1CCayx
hFo/YlwWHqR6CDQj7hYA2S0xhyPLyAIoWpi2hJUFmJBQywpE7U0U0W+vj3va/A4y
IPklRI3F/LpGJB9S7RcOD3Bushe3YfMk8H4wccbcYWO9Rc6TSMk2YByLmnp1BGPV
iic+ksmuwJ/3TT4p3WRvvI/TZ9sDZ/kuZKt9pOxoJTK4eqmaiSrvMl/D1X6rObn5
8LgcB9ww/q8P7RfTr/U3ctJ671cs1qaqkmrRapyEZx1DRNqpwXWv4K/R7IkOXBWl
sk0iMxOXCcob3EmBVTJ2PSd57LXGVA==
=aKFm
-----END PGP SIGNATURE-----

--Sig_/epXjtVmT63.yM.OeyKbuJtE--

