Return-Path: <linux-next+bounces-5085-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C98FA050D6
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 03:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 772C3188A25E
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 02:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F4F15DBC1;
	Wed,  8 Jan 2025 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uzsF8o+Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78815FD13;
	Wed,  8 Jan 2025 02:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736303537; cv=none; b=dSqQLRALh/ja71BCUvWGiptnkPnNE3qFPo1jfaSVxM0tHXFSGt7szrGq34N7W4Xva2Be7j+cL0q8GvNLi60KJUG5OPb/+D11feaJ8TC2Wa14U6v2O4AE4jEGo+gy7Y6+t+FwjiRzPuUwDGmO6jFXwm6xPszTmbGJboAwuCwtses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736303537; c=relaxed/simple;
	bh=F8ZdfyylUlvD32S3A8PXRlcoRMl6cAhTKdBTG6xGL7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uish+7Q1IGnM5W9hXzZd7CMb/wYMsPTRaGlc9zqnKn1fNokMwoFurOrE54JnD2r6L2X+pHECcmKxD2HWrhFfWzyhBrw0QL92ClpxStyyW4XjigzyD9X/UzgGExkyIVYVLsp+6lfFn3gVUEp7zHGgiuInKgIH6gLBrM055K/kv9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uzsF8o+Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736303522;
	bh=vjef3+YneLoIOMJ8eoWkQ/C+uu/i2Y0p5hGds2QmghY=;
	h=Date:From:To:Cc:Subject:From;
	b=uzsF8o+ZXXN1i6Y1YKLyALNeL4pu49+VUKqBjVRUJmxupE5J4333Aiu8jSx57gUD1
	 WhqqBjBtcIWQm5Pjwif6rhJ3/euV6KlYWiQtkaxqU+R66dNENHQhZ60QkHLUED6d1u
	 DnTLSrq0w8ZSTMNFEeBYw5+Mje3Z4S4XWPVSlB1Ywh8tA2dFRhOcZtcRArttg+uSiN
	 oE6l0GRMxmLkKLUaxcflZxV1vb/QWuQi7BYE+2FZBRJoOett/Q73YA4FP1vvsk3vGp
	 3gr1ojA+dpxf1Z1kJxIQNzUBe8S2QVWmUKW4rQZDDrSl/Mxmrn1MgrrwC4R35wRsF1
	 FLPiWaM95gwlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YSX4L3Jnfz4wbr;
	Wed,  8 Jan 2025 13:32:01 +1100 (AEDT)
Date: Wed, 8 Jan 2025 13:32:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu
 <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20250108133207.265a6f47@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yeb26swHmGcoVLDNzfyyBSF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Yeb26swHmGcoVLDNzfyyBSF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  scripts/sorttable.h

between commit:

  0210d251162f ("scripts/sorttable: fix orc_sort_cmp() to maintain symmetry=
 and transitivity")

from Linus' tree and commit:

  4f1d0c914628 ("scripts/sorttable: Move code from sorttable.h into sorttab=
le.c")

from the ftrace tree.

I fixed it up (I deleted the file and applied the following merge fix
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Jan 2025 13:23:17 +1100
Subject: [PATCH] fix up for "scripts/sorttable: Move code from sorttable.h
 into sorttable.c"

interacting with commit

  0210d251162f ("scripts/sorttable: fix orc_sort_cmp() to maintain symmetry=
 and transitivity")

from Linus' tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/sorttable.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index cd3b2145a827..656c1e9b5ad9 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -368,7 +368,7 @@ static inline unsigned long orc_ip(const int *ip)
=20
 static int orc_sort_cmp(const void *_a, const void *_b)
 {
-	struct orc_entry *orc_a;
+	struct orc_entry *orc_a, *orc_b;
 	const int *a =3D g_orc_ip_table + *(int *)_a;
 	const int *b =3D g_orc_ip_table + *(int *)_b;
 	unsigned long a_val =3D orc_ip(a);
@@ -386,6 +386,9 @@ static int orc_sort_cmp(const void *_a, const void *_b)
 	 * whitelisted .o files which didn't get objtool generation.
 	 */
 	orc_a =3D g_orc_table + (a - g_orc_ip_table);
+	orc_b =3D g_orc_table + (b - g_orc_ip_table);
+	if (orc_a->type =3D=3D ORC_TYPE_UNDEFINED && orc_b->type =3D=3D ORC_TYPE_=
UNDEFINED)
+		return 0;
 	return orc_a->type =3D=3D ORC_TYPE_UNDEFINED ? -1 : 1;
 }
=20
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Yeb26swHmGcoVLDNzfyyBSF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd946cACgkQAVBC80lX
0GyUywf+JmnUSrWTngY7eErsh+spx4fX5TMFm4KlaB69cxgueG/rWdtkuszEufh5
ezwHILIoiCUqdaq+aN/j0pCcbhCQv8/Y+ksGePBJ7/RMM7SXLj41jJwuUSHjLy1W
DDBxaxem2dlqiiytdWjcczLRhzozUDHHRdVmcMwCwJm04H7/uVy5a6hlob93T8Bu
svX1dsLEOedHd7MzEWXCte/AzKrVDpDIvyVrWduMPTizJpNLIlXvnpLrYq29LzgL
i1cIw111j7FUfB1VvYueTA3fBR8fGB5keJSkqiLXVgED7qcZmJqyW1fI7yGsp+4u
ccvxh/TUapdaQKrBg6eAQxMHGKjk4A==
=VbjI
-----END PGP SIGNATURE-----

--Sig_/Yeb26swHmGcoVLDNzfyyBSF--

