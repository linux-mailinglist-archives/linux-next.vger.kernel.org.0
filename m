Return-Path: <linux-next+bounces-9094-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B0C71967
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 01:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4355B4E2C46
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 00:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6011EBA14;
	Thu, 20 Nov 2025 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SyEFX+qh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171D1E230E;
	Thu, 20 Nov 2025 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599508; cv=none; b=QTWS+Ox2GKnMaWMivTLJI1ynHpx+pYT+x8xR8Yn5Kiiabv4DjG2A9IGjSA9wsP80MHJSMWgHZP2nko9uaVo13Xm6+dLh4NK+FzBE4nLpA0APSFrNns19QiCESJ/jKCXyLl+3Y89jU6BAEQTuoq0Z26gvqmZ10TKVo9MBhM34/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599508; c=relaxed/simple;
	bh=ungBnvxN1DK/S420fld39W7Clm7bdDY8J2SWkPnHRw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oLA19jTG9A3Oa8Zy9xezs39byNmtt141dSlYObw66ECKJEKJkIXX/QurZwYIRLoKdDxIhNV7d1nFuKyX3VVRHwYiIdtHq8MWmccNe77pinKDivg4IyGrOgBSy8Q2pphyE8uTa/4Nw9+A/vIpkCmD9wd+IrW+1pLgpmV/rvxvEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SyEFX+qh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763599496;
	bh=bDm3Hx5FSocqduwy2PP8e2Ns741Vh5fVmcPgXSox6cg=;
	h=Date:From:To:Cc:Subject:From;
	b=SyEFX+qhS+0t1Yc1SBR5YIL89NDtds4R/qfhPIjorhFDZmXheFfg6MJRknOcifbjD
	 GBdB1XjWMzSlklNkOQc+EP0bYmq+BCxleuyscEX0OlZAitZwUH43jx1IeCF7J1B4cp
	 naSxsDCnBGKbTrlwOQkrVvnuTqd7xy8utcCsQtLk8TtzIHMm5kWWjDgwyZEbFmPVZN
	 uDGzcIonxIv6PyOqpWhLM9DygAwo/6IRbM5MbZ1twexEB0piTCOZSjC3QjEy5ra8xZ
	 WHyFF9xn3pLwZWeJrFh0yqTfiUx1B1wyKvCsDmGUx7Zx0hPNplt1/kVrSpNsjqwDSQ
	 iO4zM0+JPdycg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBfkv6kLpz4w0p;
	Thu, 20 Nov 2025 11:44:55 +1100 (AEDT)
Date: Thu, 20 Nov 2025 11:44:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 mm-nonmm-unstable tree
Message-ID: <20251120114455.5e12988f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pvo3kQMlV8mN2EpbKtJFuUF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pvo3kQMlV8mN2EpbKtJFuUF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a semantic
conflict in:

  kernel/fork.c

between commit:

  42d3299e85f8 ("unshare: fix nsproxy leak on set_cred_ucounts() error path=
")

from the mm-nonmm-unstable tree and commit:

  cefd55bd2159 ("nsproxy: fix free_nsproxy() and simplify create_new_namesp=
aces()")

from the vfs-brauner tree.

I fixed it up (I applied the following fix patch) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Nov 2025 11:20:10 +1100
Subject: [PATCH] fix up for "nsproxy: fix free_nsproxy() and simplify creat=
e_new_namespaces()"

from the vfs-brauner tree interacting with "unshare: fix nsproxy leak on
set_cred_ucounts() error path" from the mm-nonmm-unstable tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 829d6518f352..adef2595182b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3136,7 +3136,7 @@ int ksys_unshare(unsigned long unshare_flags)
 		err =3D set_cred_ucounts(new_cred);
 		if (err) {
 			if (new_nsproxy)
-				free_nsproxy(new_nsproxy);
+				deactivate_nsproxy(new_nsproxy);
 			goto bad_unshare_cleanup_cred;
 		}
 	}
--=20
2.51.1

--=20
Cheers,
Stephen Rothwell

--Sig_/pvo3kQMlV8mN2EpbKtJFuUF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkeZIcACgkQAVBC80lX
0GzxfAf8D2Uv9w8C1zI1vCSdI/fNaM68npPBXETpyrMbF9P+Xt6fvuG24OlMvkYy
YOGdis3bdD8ljwcgLyImk3zUOpg1aGcBAAwsFeURoa/rdgJWZxWGlTp00XKuXgEe
JHZuijy6EgGSUUX5H9ZIWiATAb+b0rVIncFBz3tCh0Co9kwv3TZm8Uf7nPuIAVyW
NhAcA/D778dtiYNHyoUxkqZoZvr2WcG5yJJaam12Pd8l1JWrIfN6LF3jsEMr8LGG
4G/w6UFVus76GZNLFz/OVRsW3cSPxrA2hh4nA097jNvy+o33G/h9J+V2wVX+aSnA
4U8StKxKuusOSIt6i+WYQVzbgK4HzQ==
=2coA
-----END PGP SIGNATURE-----

--Sig_/pvo3kQMlV8mN2EpbKtJFuUF--

