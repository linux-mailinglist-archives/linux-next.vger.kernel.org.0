Return-Path: <linux-next+bounces-4913-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA59E8B57
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 07:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD82E28150C
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 06:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654FE2135CD;
	Mon,  9 Dec 2024 06:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lZLm+p9g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAD316DEB5;
	Mon,  9 Dec 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733724521; cv=none; b=TJ2ttYpuS62dx3MZknbQtkpz0xKcGdhvIRBqAd+xtaZuLudPdEOP546O9RDXLwwp3T0JuliPdLUSvlP1LO0qc+NIV08PHXnOmjSalKaEx1YxvOlQzwHl6WVBVjU/8D1GGAmMc4u0FwdeII58OS0Ww5aPF9mx5xujLdSuIUZ0HPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733724521; c=relaxed/simple;
	bh=BerKf0+Bz4UEdSIMFwHT/raPfvGi8QrEc/om39G88SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fb6icuZylrJh4+aR4SGbzsqs17SAOgrxksIUHnMgJnhbgoTtUbkjCvD1mmvac1OlihtCUcAryA7+Z/BPte8ty5tmMbuxbk+JV18m3XdJjWzjk608ZslWeMFJHr3fFHAF8C+m4UqghmPiJfPBcVuXIYT4nqnY0aaSPH7fW6/ASx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lZLm+p9g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733724506;
	bh=iP7+A8OJEvravqrcKXz46bES4mj2u4XsJxSti6jRLRU=;
	h=Date:From:To:Cc:Subject:From;
	b=lZLm+p9glWos/2MptCfTCaLO1CYEa7vGBsdbILlTEZn9h00wEmbSnxq6O15hxUi6D
	 ODjZ18WXtzrOiIomPnu3FurWBrAf86hXTKQyBctIhMM8t3mkwNdDETSOZRXG7SgoUv
	 1JU/2StHJs09yOvkpHLVW/TU+C175hh8vHTqpytDXZqg/Iu3AUr1NJMEDED6K46VQm
	 H0ME6ANpmuEjujjpE2AE9VUzw63DcBYzh4PMt0dhZysgOcWGsZBsVrRK2x5qwd6HAW
	 Wc3BjhCi3RJ2nG+PdZdk2yXTt6G+H5bSPUjC0IwiScqfidwDCUTTNl9PJ+vPEzTF9b
	 qh6W8ZLTm+vnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6BHt4Nkhz4wb0;
	Mon,  9 Dec 2024 17:08:26 +1100 (AEDT)
Date: Mon, 9 Dec 2024 17:08:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20241209170829.11311e70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b1Ofq.+ld.mJCYnc7CS.f2q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b1Ofq.+ld.mJCYnc7CS.f2q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc allyesconfig)
failed like this:

In file included from mm/damon/vaddr.c:736:
mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas=
':
mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is l=
arger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
   92 | }
      | ^

Presumably caused by commit

  062111898568 ("mm: move per-vma lock into vm_area_struct")

I have applied the following hack for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Dec 2024 16:33:16 +1100
Subject: [PATCH] fix up for "mm: move per-vma lock into vm_area_struct"

on PowerPC that change causes a frame size error

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/damon/tests/vaddr-kunit.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/damon/tests/vaddr-kunit.h b/mm/damon/tests/vaddr-kunit.h
index b9fe3bc8472b..564373fadf38 100644
--- a/mm/damon/tests/vaddr-kunit.h
+++ b/mm/damon/tests/vaddr-kunit.h
@@ -14,6 +14,7 @@
=20
 #include <kunit/test.h>
=20
+#ifdef notdef
 static int __link_vmas(struct maple_tree *mt, struct vm_area_struct *vmas,
 			ssize_t nr_vmas)
 {
@@ -90,6 +91,7 @@ static void damon_test_three_regions_in_vmas(struct kunit=
 *test)
 	KUNIT_EXPECT_EQ(test, 300ul, regions[2].start);
 	KUNIT_EXPECT_EQ(test, 330ul, regions[2].end);
 }
+#endif
=20
 static struct damon_region *__nth_region_of(struct damon_target *t, int id=
x)
 {
@@ -306,7 +308,7 @@ static void damon_test_split_evenly(struct kunit *test)
 }
=20
 static struct kunit_case damon_test_cases[] =3D {
-	KUNIT_CASE(damon_test_three_regions_in_vmas),
+	// KUNIT_CASE(damon_test_three_regions_in_vmas),
 	KUNIT_CASE(damon_test_apply_three_regions1),
 	KUNIT_CASE(damon_test_apply_three_regions2),
 	KUNIT_CASE(damon_test_apply_three_regions3),
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/b1Ofq.+ld.mJCYnc7CS.f2q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWiV0ACgkQAVBC80lX
0Gw7GAf+PMW9beV5ewZXDK6cYbATS+Ri+r5AzdKAYy1uLtChM71SyV+YHIzyyY3P
xP1eOuZ7/5Y7wfbJ8ob4MbJ963CtZntXpj6VMrvd4QoUjYhRtLUWTJAC224kxcnL
kn38HPLvt87dd32SJRW0KngH1MZWXmqOj4b01tXZK6lDyHr6XQsIOVQl3YYe5qsq
daLVdDArH6sYrO8sMJKETxs7uTUyl9BdWp0qchxsVqLeWVp6fdzb/uqNvsM+I2vl
mQ1CH6UqZ8U8cvsf01FloY8eAQHOiMh7tk2hxVn7PfISMU2c9A8AH+Hs+NUl73eJ
T/pYLxMJ0194MMoF2+kWXpj6pyu0BA==
=Ghid
-----END PGP SIGNATURE-----

--Sig_/b1Ofq.+ld.mJCYnc7CS.f2q--

