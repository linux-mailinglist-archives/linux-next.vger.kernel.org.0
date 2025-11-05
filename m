Return-Path: <linux-next+bounces-8823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E802BC33712
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 01:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C16218C5DDF
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 00:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC42621C9E1;
	Wed,  5 Nov 2025 00:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BODv1wQ/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3128218592;
	Wed,  5 Nov 2025 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762301459; cv=none; b=V32EIeaBX4Lg7zAkB7uKvNLewrUuTCNWAP0k0DH2FQ2rjc3EVIotOFccudaF+Ys2a0L/U3nYli32N1Lyg8omH2xBgnaxKGai4Ufqbw+a1rpt7kgpF8v24x95IMWGZSkaVTyJvghG93xXThABLvVAN93+yVLmlDvuGbsZk+5xah0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762301459; c=relaxed/simple;
	bh=S02hYBml1iDpQh+WfVVbwWOB8gM7bQ8VdseyNtRTrM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l2SbOBEV4lpHXSmF9hRSez4PzcukKvgbPlgNmctMjBkDAMTbdX5PqVM2Mp7S/Z9PmYey/6pH4CuSglGKqpdsLGOz1MB4clrncDkd+Fj//2OsGuQ1sksmiizC4KYdw2wB5KCWS6J8J/CiLEsi6jwJ7HY+m9tWgSKBPbeZamPelkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BODv1wQ/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762301446;
	bh=XJXJwzNDXjJcLY+uLPpULxy4f1iCFqB3zpdrUZHJdC0=;
	h=Date:From:To:Cc:Subject:From;
	b=BODv1wQ/sa3hDVxmV/RjsgZ+MlKEJOhj7E96MP+ScIYI+51b2bLbXJJcF5zgl0m4R
	 3xwFEqLnVTkNEWEUH5StTcETul3DFiVU/KRZWlY8Yv6W1dJ63S5YI6YWiMxc1wnHol
	 iTFpxLdP/TfYzUrkAg2ZnoTZBsu+gdve/tzgWmdRnRJtAHDwaVZKRE4kgc4OZRGpoH
	 I3gJ0QNC0kLY+YPnY3rM9g6l23SJacRlJKJYXN25W4M4cuYZko5xBUKq5qM6ryUWp5
	 C4iwIWhEhmCCDpkY+EfCFgW9gqY8whC5qdtuVyt/JWYWs7I1o1XTYro4fJE4OBqlVh
	 BGt6Y2gwD5A0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1QhQ5GhWz4w0p;
	Wed, 05 Nov 2025 11:10:46 +1100 (AEDT)
Date: Wed, 5 Nov 2025 11:10:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251105111045.2a5f0713@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cBwdGFpc5BwcqULumwajoeg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cBwdGFpc5BwcqULumwajoeg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/crypto/ccp/sev-dev.c: In function 'open_file_as_root':
drivers/crypto/ccp/sev-dev.c:263:28: error: unused variable 'old_cred' [-We=
rror=3Dunused-variable]
  263 |         const struct cred *old_cred;
      |                            ^~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  a5f40c848a5a ("sev-dev: use override credential guards")

I have applied this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 5 Nov 2025 10:35:52 +1100
Subject: [PATCH] fix up for "sev-dev: use override credential guards"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/ccp/sev-dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 03e08ed8da8f..b28a6f50daaa 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -260,7 +260,6 @@ static int sev_cmd_buffer_len(int cmd)
 static struct file *open_file_as_root(const char *filename, int flags, umo=
de_t mode)
 {
 	struct path root __free(path_put) =3D {};
-	const struct cred *old_cred;
=20
 	task_lock(&init_task);
 	get_fs_root(init_task.fs, &root);
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/cBwdGFpc5BwcqULumwajoeg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKlgUACgkQAVBC80lX
0GyxKggAhI3qrS9EQoEC9WvoxJileKolOzMuWcpihysQ+jlJULBP1aAMbijHhLUG
NJUj9dkJ38OuiFnFAjE2fXTa7VlI6SocvkCmmKbjYUYjrlzHLK/sJwE1EZDMPJA7
+Qn1Su/tK5Xe3aynnBOwaLeYZUexyFQoxj3rF5s+Ua1uXjtibNVfIinQxAr8Qr01
DFll2oKHA0Hb+2J5mFZ/RgY1hl0PKjZll/Er/+0JraSQkJI0nnY0Q+W8oXIGJoi1
iOD8SYxdLQKZ/3beb9pFEa/mw3o58mEHYk0jHX2ia+0cdWqyMTEzJpltRqoWBIHp
mYNz6BV6uVyiAUBI0Q7zBawlHf6Kfg==
=zeO7
-----END PGP SIGNATURE-----

--Sig_/cBwdGFpc5BwcqULumwajoeg--

