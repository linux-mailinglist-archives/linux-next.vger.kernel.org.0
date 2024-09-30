Return-Path: <linux-next+bounces-4005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E4989988
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 05:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EA4B1C21200
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 03:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB21C3A1C9;
	Mon, 30 Sep 2024 03:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vd6mvJ+/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA82364A0;
	Mon, 30 Sep 2024 03:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727667503; cv=none; b=sgeSVibc2NFGZL1+MknCeQ3MEdafdkd0ALGeNruTVZPIKbeZ+Ed+lJtMR6M3zaSCVembDktUZkzqF3qk7QbProcfmelr2kg9bI2UX38hvjYoW+vnUKZ6p+Y4T9b4/gM0YqSprKiXIgD0CXC70f3OxLmMvOAomykIVgy0OuzTc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727667503; c=relaxed/simple;
	bh=fPeGWQARAOKXdCbM8gpQS7g4asDIfLjnhhFf8K475Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CJiyPKlvSM332//eYo/8u9uBCxTMR2sk1wmf8/wYT4uVjNvZOP136UCjjgyWv02AAkj2agavJQ+VxkNGie1RbnNQTC+wL4C+1nb5BlTW2Kcn/91pHblGbsmPaWWIDfT0ECXK4B4L6711Aktdv2FLIiDopk8A1vUXcCxWrHTHTqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vd6mvJ+/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727667495;
	bh=SDrSb8RRbFQDiTMizD2vOsSUw+OBXhZw3UL7iey39h0=;
	h=Date:From:To:Cc:Subject:From;
	b=Vd6mvJ+/7tKylGKf/SYS5J9UdxUUnQzhLxdMioaG9UNUlCuGXGHKhIohAKU10wJiy
	 DvPia08ev5ZyAeHEHRxvCRMZYaURfAh+VjDpy+l16Bk3OU9giF23kJ/TrDj9Em6Ue2
	 5TsilDXWl54pJLk7Kv/eODD1CA8QdWGM4Kk2LKCXEwzh7aacnr27qR0N+hFdvEKHw5
	 ZEZm9kAtYFoFybQ0r3fsyvHX+6c/SyzKLhqVAqKdcQ7bUakWKeQpyuTh2bTvNf5A3q
	 wRlkbRFUGGc3IV7to2CWEyiRy7wUHR5fyemiwTWNAMc27OxPohY1Haj+QSWxBNqXDD
	 daF4n1WNlykRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XH6Gt5sz8z4wb1;
	Mon, 30 Sep 2024 13:38:14 +1000 (AEST)
Date: Mon, 30 Sep 2024 13:38:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the origin tree
Message-ID: <20240930133813.3c8157df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wwULGcqcrml6QoHQ_LbJIkm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wwULGcqcrml6QoHQ_LbJIkm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the origin tree, today's linux-next build (s390 defconfig)
failed like this:

In file included from fs/bcachefs/bset.h:9,
                 from fs/bcachefs/btree_iter.h:5,
                 from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/xattr.h:5,
                 from fs/bcachefs/acl.c:6:
fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)               =
     \
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
In file included from fs/bcachefs/bset.h:10:
fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                  ^~~~~~~~
      |                                  version
fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                               ^~~~~~~~
      |                                               version
In file included from fs/bcachefs/extents.h:6,
                 from fs/bcachefs/buckets.h:12,
                 from fs/bcachefs/alloc_background.h:7,
                 from fs/bcachefs/alloc_foreground.c:15:
fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)               =
     \
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
In file included from fs/bcachefs/btree_cache.h:7,
                 from fs/bcachefs/backpointers.h:5,
                 from fs/bcachefs/alloc_foreground.c:17:
fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                  ^~~~~~~~
      |                                  version
fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                               ^~~~~~~~
      |                                               version
In file included from fs/bcachefs/extents.h:6,
                 from fs/bcachefs/buckets.h:12,
                 from fs/bcachefs/alloc_background.h:7,
                 from fs/bcachefs/alloc_background.c:3:
fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key':
fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  557 |         x(BKEY_FIELD_VERSION_HI,        bversion.hi)               =
     \
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
fs/bcachefs/bkey.h:558:41: error: 'const struct bkey' has no member named '=
bversion'; did you mean 'version'?
  558 |         x(BKEY_FIELD_VERSION_LO,        bversion.lo)
      |                                         ^~~~~~~~
fs/bcachefs/bkey.h:578:50: note: in definition of macro 'x'
  578 | #define x(id, field) __bkey_format_add(s, id, k->field);
      |                                                  ^~~~~
fs/bcachefs/bkey.h:579:9: note: in expansion of macro 'bkey_fields'
  579 |         bkey_fields()
      |         ^~~~~~~~~~~
In file included from fs/bcachefs/btree_cache.h:7,
                 from fs/bcachefs/backpointers.h:5,
                 from fs/bcachefs/alloc_background.c:5:
fs/bcachefs/bkey_methods.h: In function 'bch2_bkey_maybe_mergable':
fs/bcachefs/bkey_methods.h:73:34: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                  ^~~~~~~~
      |                                  version
fs/bcachefs/bkey_methods.h:73:47: error: 'const struct bkey' has no member =
named 'bversion'; did you mean 'version'?
   73 |                 !bversion_cmp(l->bversion, r->bversion) &&
      |                                               ^~~~~~~~
      |                                               version
In file included from fs/bcachefs/btree_write_buffer.h:6,
                 from fs/bcachefs/alloc_background.c:13:
fs/bcachefs/disk_accounting.h: In function 'bch2_accounting_accumulate':
fs/bcachefs/disk_accounting.h:39:33: error: 'struct bkey' has no member nam=
ed 'bversion'; did you mean 'version'?
   39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
      |                                 ^~~~~~~~
      |                                 version
fs/bcachefs/disk_accounting.h:39:50: error: 'const struct bkey' has no memb=
er named 'bversion'; did you mean 'version'?
   39 |         if (bversion_cmp(dst->k.bversion, src.k->bversion) < 0)
      |                                                  ^~~~~~~~
      |                                                  version
fs/bcachefs/disk_accounting.h:40:24: error: 'struct bkey' has no member nam=
ed 'bversion'; did you mean 'version'?
   40 |                 dst->k.bversion =3D src.k->bversion;
      |                        ^~~~~~~~
      |                        version
fs/bcachefs/disk_accounting.h:40:42: error: 'const struct bkey' has no memb=
er named 'bversion'; did you mean 'version'?
   40 |                 dst->k.bversion =3D src.k->bversion;
      |                                          ^~~~~~~~
      |                                          version

Caused by commit

  cf49f8a8c277 ("bcachefs: rename version -> bversion")

I have applied the following fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 30 Sep 2024 13:31:16 +1000
Subject: [PATCH] fix up for "bcachefs: rename version -> bversion"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/bcachefs_format.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/bcachefs_format.h b/fs/bcachefs/bcachefs_format.h
index 203ee627cab5..84832c2d4df9 100644
--- a/fs/bcachefs/bcachefs_format.h
+++ b/fs/bcachefs/bcachefs_format.h
@@ -223,7 +223,7 @@ struct bkey {
 #elif __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
 	struct bpos	p;
 	__u32		size;		/* extent size, in sectors */
-	struct bversion	version;
+	struct bversion	bversion;
=20
 	__u8		pad[1];
 #endif
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/wwULGcqcrml6QoHQ_LbJIkm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb6HSUACgkQAVBC80lX
0GyhSwf/da18c/Y52Ieey+zGPP9PeKAJjxDE+xTvMPlRNY5BHES6QytOfM1BC6B3
KnsDBeQAjLY3VQ7y7zb9beFpEQO7wWsFqJ+rcEhF71kAPPyNBrxvObNRPJYDXknI
sxi3POzCNuiSxB3jc1XuD0JLiIJIy3YNrZVWqqSZBmwcv3aRh+a86VVFzW1buICw
IHvujtXzbpIFKWwc0d0Oxto7498Q63FHpVJnQW1G/aYBHVU+wRK2mXOs5jcbU9d8
9hSj3lpIyFwTP661NglecwAJEXokGf0y8blhYU+gFve8g462hjvxgA5ZPnzWzMq1
C6DuxyzcJvmtdWU6wsMyaqhXtIfoTA==
=a9lK
-----END PGP SIGNATURE-----

--Sig_/wwULGcqcrml6QoHQ_LbJIkm--

