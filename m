Return-Path: <linux-next+bounces-9616-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E23D16259
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 02:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18523300D2B8
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 01:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD89267B89;
	Tue, 13 Jan 2026 01:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aOiHCsC6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A312A7081F;
	Tue, 13 Jan 2026 01:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267313; cv=none; b=t61ONWFZt9G7EN6o90W3uh5jkpt8g988loTXb53dmL9Nxh2lqCaDH+7rVZQg18AUoCxokNJ3fLBzHNV1vDiBYGVKsjW8uWXu4FOXTeL/v6+u9PmFpKor9v92zSR8Vns+ezdNvQRwKLFSKoqKodSlIKVWF1DaP8D/pKL0d3yHohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267313; c=relaxed/simple;
	bh=L4nfZYPXa+EgD6sObCPD1HKhpjvaDybvzxALygIYACI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WkjdGKz4QEEhjfFTtkk1/hlfrsC9WDJZyPkXAzXglekCYBx/64pUAgzzxmcB3eXYRxkhBJpSYqUKmhhN+WHYsxc22u+94rPpbJFiviEe1nBMolIP4tNisfkvKvrLMduuYSNcX0QDsEXvosbFqzf/7RJEbLN3L3Ak8rEQY8wDuj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aOiHCsC6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768267304;
	bh=n/CTGZYJwx7rfSDSgeucvO4LjbxiFgGvnKeEFAm7iWg=;
	h=Date:From:To:Cc:Subject:From;
	b=aOiHCsC6YfRxMgj1oTSXp8pIKRZGa+FNk8oV/zhwmDCIjcBiXG0Utt0Kjmo08dt9s
	 XX+XlYQn2SGrnIkDP7FMj4UuMNu+1euJgeIhKKxwAr0ucvxJu9RWSw72JSOrx+Wnwy
	 lcb0Vmt+erSCoa8JrQShydwtFcjCqaRd5UjYTkKXblJWQXNDi7jUmtAbmqiPjjjTbk
	 pAM3FUIrcPaG/zXX1nLxHF2xjMYRB2LyGcr350miKSnlTN//JDKLWW8WcBS1J4pG10
	 ZhglugYn0zSmM7Ut+Mg6JzHONqPk2FD6HbjGiTYKRC3iB9cEm/h4sJ+i+HWyuRAedj
	 rf6xY68ARCdVg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqs0Q6rpQz4wGT;
	Tue, 13 Jan 2026 12:21:42 +1100 (AEDT)
Date: Tue, 13 Jan 2026 12:21:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 mm-nonmm-unstable tree
Message-ID: <20260113122141.1de833ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rUZwqvzdcvVHl92wG=Xsu=y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rUZwqvzdcvVHl92wG=Xsu=y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/fat/dir.c

between commit:

  30034bbf280f ("kernel.h: drop hex.h and update all hex.h users")

from the mm-nonmm-unstable tree and commit:

  a9acc8422ffb ("fat: add setlease file operation")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fat/dir.c
index af7dedf8adcb,07d95f1442c8..000000000000
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@@ -16,7 -16,7 +16,8 @@@
 =20
  #include <linux/slab.h>
  #include <linux/compat.h>
 +#include <linux/hex.h>
+ #include <linux/filelock.h>
  #include <linux/uaccess.h>
  #include <linux/iversion.h>
  #include "fat.h"

--Sig_/rUZwqvzdcvVHl92wG=Xsu=y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllniYACgkQAVBC80lX
0Gxmlwf/Zd7YoPDwyXZO+aUEQ+mlJwMv8RVV2C5FRbFPbO2pnVapHqUzWC5sl/Yk
cImPj2xj6V2oUv9SfK/DXLtUAiCeOh+m0JC/mCXMpV/0U/uWnrcd0iyZ0+oMmtcl
nceFdeJ/702y1nBNpXp6ipm4nvNzbMWxKX7esBLNKjs9z93rXbTN9/yG+ExNjaxg
ltYhtXk6fofuMB0s1oLEDhGp94ZuTS+2r1RMCiBQNAjXd5JcgodKBP1BD/p45i6l
pywcOa0FnLpz3rZgp1mDCxs0syD5YyI1eiOPESoUo7dXvNMk+pTVOYSXwfBsbDQc
kBejXCCEeYBpw0nClSQVAAcWHcVAig==
=HEF7
-----END PGP SIGNATURE-----

--Sig_/rUZwqvzdcvVHl92wG=Xsu=y--

