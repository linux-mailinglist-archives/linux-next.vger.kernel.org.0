Return-Path: <linux-next+bounces-9613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E00E1D15B8A
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 00:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF187301D5D1
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 23:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A707327FB34;
	Mon, 12 Jan 2026 23:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IyKx+lFv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DA27B34C;
	Mon, 12 Jan 2026 23:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768259052; cv=none; b=WfyqXaoargHKdLyC1+zN4gA80T3l+pE76lC5Qg4Pcdv7sXoJE6hILL9fdZPkg4w0dUNJNC/TtFsrui4TVvfr4ACSI49DzzstnFXhFydyqI1eOzQk40WgGDgiUdqidNSKaRziPrdz8OrrZkkzmkSf0/ItCJ8qw4P3oxvKeHE24yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768259052; c=relaxed/simple;
	bh=iuBaMwXtbQNLE1NUNMB0Pxsn+MMM2BIdqgauyFaNGVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kVEK/VQfBZqqy6rOiZ86DiRl0azjQHAFRF2d/Gn+3+v2SMzpHgFPqmOK6Csl/IueNCmQVdFWTpHOCRLNDcc+1+6bhLD5m+i9xYfNy1sfwUKI28n8oOGMY+UpY3becUUVrDW/gwoiAuQcA6AdPgzKnnzC4D2j6Mr9oTKHqzB9Wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IyKx+lFv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768259046;
	bh=6SOJNEZMjNwZyHQA1AL9/X/cA+xvaY8NySmdak7helM=;
	h=Date:From:To:Cc:Subject:From;
	b=IyKx+lFv8wbzBZv311nrPf3CcSLm/02v9S4H7LzIlibaN0v+HxZbIEJbkz/LFBe0x
	 HoeHtKNQ+oVhBk4KQfVpx8HZ2eP55EAnRO7VUAmO163YwnNe1KS/ts/GBe6kjdzfgs
	 MxEzNRIXv7fuxOVDtDrvwdPYDaNODNdr8ynUVsFEpJzlZdLQ/lwfMomv5P5fTrzbrF
	 bgLuZW+0TxrPmiTCUPMeTuEMvbk+iKEOyFp9dTtoXYLAlGkC6IglFUucTpswM8J3A1
	 4E/4DIn7PNcQoS0t3TDHf7TXA5aXch27CaUPubPNVhkleCzkAX7xoioQUd4e3/wlWA
	 lgNqFMNYH6W1Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqnxf2rjFz4w26;
	Tue, 13 Jan 2026 10:04:06 +1100 (AEDT)
Date: Tue, 13 Jan 2026 10:04:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ntfs3
 tree
Message-ID: <20260113100405.117fca9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k7ljS+iFnPR.=RVK7Xw3KDA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k7ljS+iFnPR.=RVK7Xw3KDA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/ntfs3/file.c

between commit:

  099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")

from the ntfs3 tree and commit:

  6aaa1d6337b5 ("ntfs3: add setlease file operation")

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

diff --cc fs/ntfs3/file.c
index 58fa4da114bb,6cb4479072a6..000000000000
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@@ -14,7 -14,7 +14,8 @@@
  #include <linux/falloc.h>
  #include <linux/fiemap.h>
  #include <linux/fileattr.h>
+ #include <linux/filelock.h>
 +#include <linux/iomap.h>
 =20
  #include "debug.h"
  #include "ntfs.h"

--Sig_/k7ljS+iFnPR.=RVK7Xw3KDA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllfeUACgkQAVBC80lX
0Gyjlgf/TU/b+Mw7yzYMQSuBGxPzRCOPGwCFIvuYszl29MMVvE6p06b64xsewVY9
/BMrNaWxUipH1maROnPo+2j4pQiBfpMQG2B/yh380RYb+w9VTyY3m7CAJuOjU0eb
it/28zBQjBWjlOkX9UKq9mXJlcu4jzGx6Lwy9/32T8EeFmCIueCQpjWlD3wLlAKh
TsTJ9cOzVgRZmuiFo+U8mGCWy7JBhbqdWPuy0AlCXEo1Qo1OOYZWRAM3VKARBgtS
v6U8dqAdM6JoGbOOzCzvchAE4qUol8kkofY0DJLOpKL0ADq1GvgnZwd1iEuk/JPH
UxRP8hNnpauD4JYjgA4UmTfhfQKLgw==
=KMOm
-----END PGP SIGNATURE-----

--Sig_/k7ljS+iFnPR.=RVK7Xw3KDA--

