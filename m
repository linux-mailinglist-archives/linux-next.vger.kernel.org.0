Return-Path: <linux-next+bounces-4727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3E9C3519
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 23:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05174B2129D
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 22:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DB3158868;
	Sun, 10 Nov 2024 22:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rsoxUknS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676315B0EE;
	Sun, 10 Nov 2024 22:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731277981; cv=none; b=Fal/8NthpHicu6JnHt+BDvCnQXEwZ6AT5MeLmow5yLVULHzz1RYlcUl6HpkVIBRmGmagW9Jic1BH/r1ze0mjCIyiYaP9I5p29SxdYNJUMw2DT6TxNkwOUUm3B09IktrB8Ho2G7lurghfcD9hIv6gEcM3M2xiDZ0+g/MYLIIl4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731277981; c=relaxed/simple;
	bh=p63CByUEkUii+F9ONsrjcGlIAax3+XAfqw0UvVtxMB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oeiNP7Opp9QhBsoBif02rufqE0KDYAamRAPnfEYoDgeo3Jgvf3pHEb2Tx2lqo/y6vIL8Zx/NnFFtDGX0g37ky+oAm+VXT8LHrIVt+29MP7+RF0St9tczbURZkUmJnodF3d5Yv5i5wNBE4m43s+BTiVbibTsmaiMCembhlapOkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rsoxUknS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731277970;
	bh=w3zBLOdJ1LxBisw4wHOslp884tXmLgLW9TnQ02I6lwE=;
	h=Date:From:To:Cc:Subject:From;
	b=rsoxUknSqBvd2XUYESEwYfkQOIxWL8+eXxoITRFNTzYVPWAxIl8l5H+5mprg7n78D
	 3hu+9KxogOt7mH5SwtGnWA3Zni4ylAZZ1yZnm3QjjnmfnYnzY/8idpzwocYEhm9Xsk
	 SEXq+5WpxtUoSPDFPYIc0WabC94rCfqNvEW8q+PYK2H1bXvvfg5xIv5HEpksNagM6f
	 6v2p4LAns2o98zX1RLMm3Xup3fi0DdefLnC2buaD+KGYD0ae+BVZu4zWZ9hFroKeNi
	 1CXWjEIO6JRaOM+E/baSHmWITap7A3uBYKZSDLduDgpyBEIJgqm6IDm2Y20tFOTkRA
	 CrScpCAw/eZkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmnW601HMz4wb1;
	Mon, 11 Nov 2024 09:32:49 +1100 (AEDT)
Date: Mon, 11 Nov 2024 09:32:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20241111093251.12fe136c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.O2yq5BaFnG1R.PHC9Iwq9M";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.O2yq5BaFnG1R.PHC9Iwq9M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/bcachefs/btree_update_interior.c:1446:13: error: redefinition of 'key_de=
leted_in_insert'
 1446 | static bool key_deleted_in_insert(struct keylist *insert_keys, stru=
ct bpos pos)
      |             ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_update_interior.c:1437:13: note: previous definition of '=
key_deleted_in_insert' with type 'bool(struct keylist *, struct bpos)' {aka=
 '_Bool(struct keylist *, struct bpos)'}
 1437 | static bool key_deleted_in_insert(struct keylist *insert_keys, stru=
ct bpos pos)
      |             ^~~~~~~~~~~~~~~~~~~~~
fs/bcachefs/btree_update_interior.c:1437:13: error: 'key_deleted_in_insert'=
 defined but not used [-Werror=3Dunused-function]
cc1: all warnings being treated as errors

Caused by commit

  85a62009bd05 ("bcachefs: Fix topology errors on split after merge")

badly merging with

  cec136d348e0 ("bcachefs: Fix topology errors on split after merge")

Just one of the problems with having duplicate patches :-(

I applied the following merge fix patch or today.

=46rom bc58e02f03f7f111092cbef0f7b2137edbb44372 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Nov 2024 08:59:47 +1100
Subject: [PATCH] fix up for "bcachefs: Fix topology errors on split after m=
erge"

being duplicated and causing a bad automatic merge.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/btree_update_interior.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/fs/bcachefs/btree_update_interior.c b/fs/bcachefs/btree_update=
_interior.c
index 5b7def78308a..55bd9e7816e2 100644
--- a/fs/bcachefs/btree_update_interior.c
+++ b/fs/bcachefs/btree_update_interior.c
@@ -1443,15 +1443,6 @@ static bool key_deleted_in_insert(struct keylist *in=
sert_keys, struct bpos pos)
 	return false;
 }
=20
-static bool key_deleted_in_insert(struct keylist *insert_keys, struct bpos=
 pos)
-{
-	if (insert_keys)
-		for_each_keylist_key(insert_keys, k)
-			if (bkey_deleted(&k->k) && bpos_eq(k->k.p, pos))
-				return true;
-	return false;
-}
-
 /*
  * Move keys from n1 (original replacement node, now lower node) to n2 (hi=
gher
  * node)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/.O2yq5BaFnG1R.PHC9Iwq9M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxNJMACgkQAVBC80lX
0GyKKAgAo0lB5pNrG872GRSA5oZlJckz0wZkB3Bky9/yN1StwBUCRXXydM1fFin+
43rqnm8jUS4BOxYsw2rM28PVq3GfNfR7qTEieq2QL+mGOHFk+iqz5gZOoizBYYc0
L41gDgGkDf8LcpFuRzF0QoF+WBUQZLXQd2AVmw9cLf/F4UxIRwTa1vmtYE/J6lzt
BzNBDS25dbiI3VJ+8VrztXl/YMJmzqMiO/Xoq8mk1ILSCxyP0TFQM1yZPbUviWT6
24GmDss3qsjVHdbhcWP9HPwgyB7NXyWLhbVJ8n5pJlWq/XddnuZd9xd1guUj3lZX
ctAITLO+GmtHZunm0NL8xVw42SNBsQ==
=B8+2
-----END PGP SIGNATURE-----

--Sig_/.O2yq5BaFnG1R.PHC9Iwq9M--

