Return-Path: <linux-next+bounces-6625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBBEAB0758
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 02:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06F2F9873A7
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 00:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBBF208AD;
	Fri,  9 May 2025 00:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FMQO2vcd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8F6D53C;
	Fri,  9 May 2025 00:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746752280; cv=none; b=p0T1hHV8rxNiWiDbrDC79vwCbV+kQq4m71SoTW+oMXkbV+jIDe0mx37mLsb1Lbw+U6eM0crMroMtzaxPvrl7eoBuviw8EGvkUujas1enOjA+SBoub2ox+n+aM127PRMH6nRoRp+9ogTLy5rvdS6GBYjw/22j7OH5U0/WXufkkus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746752280; c=relaxed/simple;
	bh=mWFdlRRM4jRGfBmwqi9EQaNKTtJrxnW6x1dKYH3EknY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lUsh7ebgCwmgPd1pOXPnaFLaY7pyuBvnQHoe1M1xzhy4CWsv2ePm14mPUqglTKmcCQJt2h9bLSJb7DdNmIXKRbP+Cpig8N/SR2brJD0CqvTHHCRldX83fVHx+J8FQ4vvCvtRqKjaiv1o7Eteaq8Oc42qr/Y24/vIcF9APjNev8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FMQO2vcd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746752273;
	bh=jcFHEwyxgrD8Utocm/9XgWW3rJ70ly1l4RrMUJqOXLo=;
	h=Date:From:To:Cc:Subject:From;
	b=FMQO2vcdyvlKogxUquGNnueNSwzB6l7MnBxGoNC0nV1G3dn824BR1i2LM4Zuq3d0J
	 PwyYUMexeeTi/KUo5LU68A/glJTqvdU+CAQZ3aAG4vuQE25IVJl1t4WM5jdiliMOBY
	 Y9QsVzxhbqIidmFzzfUDXnzkIM3zhkdXKibiURwfVwySAZuxXyAdQ/BD+ILgU27a7E
	 mmb5qt9U0OLjBjUNLT2OeHDLjonY1MMFxc0iT+1p4HJQlJHJKTGr9+5XAIWZ9BV+63
	 2lsBcSZcGJ5EnQyVBNup5vKbW7lgIYJQqrQs40qVTos8lvbuSOS4wDn8FVy4bRFLpS
	 OrlgjdsCStRPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtrFr2Gwxz4x2g;
	Fri,  9 May 2025 10:57:51 +1000 (AEST)
Date: Fri, 9 May 2025 10:57:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Kairui Song <kasong@tencent.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miklos Szeredi
 <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the mm-unstable tree
Message-ID: <20250509105750.6281e2ab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EVKl1/5oNbTuYyFyT+S90D6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EVKl1/5oNbTuYyFyT+S90D6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/file.c

between commit:

  47fa73bbc9d5 ("fuse: drop usage of folio_index")

from the mm-unstable tree and commit:

  0c58a97f919c ("fuse: remove tmp folio for writebacks and internal rb tree=
")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/file.c
index 6f19a4daa559,e203dd4fcc0f..000000000000
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@@ -2349,7 -2091,7 +2091,7 @@@ static bool fuse_writepage_need_send(st
  		return true;
 =20
  	/* Discontinuity */
- 	if (data->orig_folios[ap->num_folios - 1]->index + 1 !=3D folio->index)
 -	if (ap->folios[ap->num_folios - 1]->index + 1 !=3D folio_index(folio))
++	if (ap->folios[ap->num_folios - 1]->index + 1 !=3D folio->index)
  		return true;
 =20
  	/* Need to grow the pages array?  If so, did the expansion fail? */

--Sig_/EVKl1/5oNbTuYyFyT+S90D6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdUw4ACgkQAVBC80lX
0Gw11Qf9F7OmKMjbUqWfNQ6cBOXfVvWiOfi4ov4uGNCowWS4yXw71yMWGVmUGlb9
Ms7XGSPOHFidPRQarmu3jnxIXx8cgCNBnQiCsB78iKSZBlgHx0qKeuSSm3sk8oPa
AuklpF6AF4uy5l432IdfkJQXY9Vk7sy93xAb5m9/lSAiX4ad8HqGxFvoM462F+MM
aDNTw1MLiEaH65v5rIjyqifGr3kY5/GnsVTPXVeV7sLIOIDA2GeuUMQxPMB945A+
JS9tVofVmjntFYap+d1wRWGKAK1/tko+s8jfGXK7vNrfcR804SxLvs0jTpkE9lAq
/hfbzijSzwnHvoLKhaMafWtPTLMuWA==
=FEKW
-----END PGP SIGNATURE-----

--Sig_/EVKl1/5oNbTuYyFyT+S90D6--

