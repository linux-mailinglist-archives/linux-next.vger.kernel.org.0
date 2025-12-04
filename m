Return-Path: <linux-next+bounces-9318-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594BCA2226
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 02:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6600F3024893
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 01:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD5B23B627;
	Thu,  4 Dec 2025 01:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cuKuoX+1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A711209F43;
	Thu,  4 Dec 2025 01:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764813538; cv=none; b=ZfqFwPAmJl6WpP7HYljbFs6Q4k4ei34oX3EdGEvrccYE7UUzGicOp2yr1ZcvzlM4uxl6ptNgsO2Qk3NhU4XJ3DtXvfg8GOlZpb4i5L+tnC33MPSWLHq7ze4m1m0c6zCrJR1MmNH/eXNwnLEfhnxPajgejQZ5htwGWDPyXUyFnBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764813538; c=relaxed/simple;
	bh=HsnVKZBWLtAxBY0RNXdAfmfMjt0UA9z2z9OR1WrmX/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wf4Rj3sdS1TfJAQ/IRNOJ6LoVnCUz+29uun1q1xxwZHExk5hPGV/J4ZbNqDGs9HU7K7I28y4z+4UXa8CubQMsySxF+hLViWY3jMziiecGvM7TyCSBqic8kI6v1EvVNsOjgP9+BvXHQYgTUYjPvAwTGEcoH74bODEb4dKjefteT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cuKuoX+1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764813526;
	bh=/qVydoGRUzl+QK4k/rZIha6c0TELIT7tlDbO/gVFC9o=;
	h=Date:From:To:Cc:Subject:From;
	b=cuKuoX+1Ux8UBm1v1kEEkejOkSJO4K7WF+26w7TO2j5+r/bAHyi4nhZlcSWToNuYh
	 aq9yjAEqp+/rzVrOOiz3xknKKwC4Bbl283JlCLA4eYDYWQzgvD6X1qCYNaHgVs8D8d
	 9SpXKn13/gIYXKlJxYsPj/F0wlVjOaQQNeBeLJkKEbal7eWKeSaB2iCLVvv0h/DxOa
	 MOBzAm5+SaMqRrlHzO+GwR16D4xZx7RJd0TGnfrRwiwOJRw3UKOjT2Oh5yeP6AD+o/
	 FJOHtVDRhCEAJ8dSAVbkkLr/aWOqHnFHHhNjn8/aMgrO+tSDMH7yPeiJy6Qw+4dhqm
	 q4NHA58m/GjJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMHjc21F8z4w1g;
	Thu, 04 Dec 2025 12:58:43 +1100 (AEDT)
Date: Thu, 4 Dec 2025 12:58:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Berg <johannes.berg@intel.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the uml tree with the tip-fixes tree
Message-ID: <20251204125841.4fd60214@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8w/ZMMmb8aj+yH.f9N//rLO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8w/ZMMmb8aj+yH.f9N//rLO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the uml tree got conflicts in:

  arch/x86/um/shared/sysdep/kernel-offsets.h
  arch/um/include/shared/common-offsets.h

between commits:

  a818f28f017b ("x86/alternative: Remove ANNOTATE_DATA_SPECIAL usage")
  f387d0e1027f ("x86/asm: Remove ANNOTATE_DATA_SPECIAL usage")

from the tip-fixes tree and commit:

  6e3fc802ab86 ("um: move asm-offsets generation into a single file")

from the uml tree.

I fixed it up (I removed the 2 files above and then applied the following
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 4 Dec 2025 12:55:21 +1100
Subject: [PATCH] fix up for "um: move asm-offsets generation into a single =
file"

interacting with commits

  a818f28f017b ("x86/alternative: Remove ANNOTATE_DATA_SPECIAL usage")
  f387d0e1027f ("x86/asm: Remove ANNOTATE_DATA_SPECIAL usage")

from the tip-fixes tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/um/kernel/asm-offsets.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/kernel/asm-offsets.c b/arch/um/kernel/asm-offsets.c
index d38447e39d5e..caf94725e19c 100644
--- a/arch/um/kernel/asm-offsets.c
+++ b/arch/um/kernel/asm-offsets.c
@@ -9,6 +9,7 @@
 #include <linux/fs.h>
 #include <asm/mman.h>
 #include <asm/seccomp.h>
+#include <asm/extable.h>
=20
 /* workaround for a warning with -Wmissing-prototypes */
 void foo(void);
@@ -33,6 +34,9 @@ void foo(void)
=20
 	DEFINE(UM_SECCOMP_ARCH_NATIVE, SECCOMP_ARCH_NATIVE);
=20
+	DEFINE(ALT_INSTR_SIZE, sizeof(struct alt_instr));
+	DEFINE(EXTABLE_SIZE,   sizeof(struct exception_table_entry));
+
 	DEFINE(HOSTFS_ATTR_MODE, ATTR_MODE);
 	DEFINE(HOSTFS_ATTR_UID, ATTR_UID);
 	DEFINE(HOSTFS_ATTR_GID, ATTR_GID);
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/8w/ZMMmb8aj+yH.f9N//rLO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkw6tEACgkQAVBC80lX
0GwLwwf/cHZkye9UR62xSjfuOECI0j9I4/dujkCNJW7W3rqKI5QXj4cUQGgS0nhN
z+MghemPcC2Cvm0yPQTJgOtX6v/PTn8dTdnMVoPkaJJ3U7XqAVLEST4/bDmUfMff
eJFcH/qxwco5qHaYVEC9ItisEWfQgEZ0ENjelV7KYF+yLPvNOUmW/RyRzGf6wW/7
qJ3mY1WzfGxnCb9HHDn+3pwaqwWzWDHy9bRKd8n0l0WpIEPDZy/00Dkhh85sHbNR
897q94erI93v70ouHAKhemOrxmVhy//0k+dmX9JwW5Beuwxxe/HioEB6ft1hFFQf
Y4+RPDdxpGpXWJiOrJYQDabXXkv0Og==
=8wUD
-----END PGP SIGNATURE-----

--Sig_/8w/ZMMmb8aj+yH.f9N//rLO--

