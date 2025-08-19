Return-Path: <linux-next+bounces-7991-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FAB2B5BD
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 03:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F4F3B379A
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 01:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE9F1A9F9D;
	Tue, 19 Aug 2025 01:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EVpA55jS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA291AA1D2;
	Tue, 19 Aug 2025 01:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755565960; cv=none; b=cRt8ryVUvb48n1ns/HGrSBRTpwxy8+RcPRs5biP/L4DER7GcL9sqXwHIf22LCY40W3mPETcguCMK10qe3rA8VwxKJvYEbXDvTnTnr1QxOyUdU8ur1mOEYPADRH2ZfBNa+riAR+wgtB1HJhnFMbBMVnWHlg5VZm603HD+i24VjJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755565960; c=relaxed/simple;
	bh=d3v9TsmLdQ+jVhhD/RW/baS4VZB9BVuZVjAq/GMrRL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k0GCcwPbmyZCt2JbYYWR/ael/OF7GayBbxxY1GlwRdZPLnF7wbK+hVUmvBw2d/7yuJULROM3kcI2aJpPzNwb3BOXyNj5F//I/XDDZL+gYMNXsbozBJHpu5zhpFhAWseaVGyIDbUCFogAit1O/xGKJhll8FxRjVpgslQ1dBGAsuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EVpA55jS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755565951;
	bh=lGjJp/TilXOUoZSkZcL228ElAr8Ti8wz4dqLhvvlrPc=;
	h=Date:From:To:Cc:Subject:From;
	b=EVpA55jS/qa/nCvWRU8G1K/Kj0K9IcyqZNd4mrK9w2e1oTVo1AidIXOyc5Y2/0fy7
	 hY1oKHBsX+mKwyVA9J1mtTjl44ytrVvgfbcAWJl0CCN3kx2jJ4Xvakj+Xms/ZtN7Y7
	 06qLu/gL6FWbMBI5+Y69iRvt2PI3v/B/MSpRerAMlA1sEgPbLHJH72kB7+HG1Uzs/5
	 Uxopbmpwi/NijOKKJtVv2sKBAE78rkSH7WDd+5HdwYcIWUsvFSPbt05w1mbhkOLqKI
	 ZmoyRoHKQHEs+Eisw1eBwUarDsvUarpO/nQ3uOCou8jltLVoFxHqHKQGukQZfyLpik
	 75wxjGYmeoS2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c5Wlf13Ydz4w2K;
	Tue, 19 Aug 2025 11:12:30 +1000 (AEST)
Date: Tue, 19 Aug 2025 11:12:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Vitaly Wool
 <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the bcachefs tree with the mm-unstable
 tree
Message-ID: <20250819111228.6c6209eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3r9PcC0MkMSaish+TRKVf77";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3r9PcC0MkMSaish+TRKVf77
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/darray.c

between commit:

  97b75b7e275a ("mm/slub: allow to set node and align in k[v]realloc")

from the mm-unstable tree and commit:

  808708fe9da0 ("bcachefs: darray_make_room_rcu()")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/darray.c
index 928e83a1ce42,6940037bd19e..000000000000
--- a/fs/bcachefs/darray.c
+++ b/fs/bcachefs/darray.c
@@@ -20,10 -22,11 +22,11 @@@ int __bch2_darray_resize_noprof(darray_
  		if (unlikely(check_mul_overflow(new_size, element_size, &bytes)))
  			return -ENOMEM;
 =20
- 		void *data =3D likely(bytes < INT_MAX)
+ 		void *old =3D d->data;
+ 		void *new =3D likely(bytes < INT_MAX)
 -			? kvmalloc_noprof(bytes, gfp)
 +			? kvmalloc_node_align_noprof(bytes, 1, gfp, NUMA_NO_NODE)
  			: vmalloc_noprof(bytes);
- 		if (!data)
+ 		if (!new)
  			return -ENOMEM;
 =20
  		if (d->size)

--Sig_/3r9PcC0MkMSaish+TRKVf77
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmijz3wACgkQAVBC80lX
0GyCcAf+P/oRrE8tb5RVsmddID/2cNTHhVSQYdZSANIxarHtU9NA6v5V3kcU9yGT
syBA3Fmoy3yiZPSIMg+MDHhp2I3+vxVjWOV2fqbX7auYFht5rYiI9wlQx/b7q2n0
QvP1zcEHjaW2Gxk8PTlHMPJgaC95VoGz+Tvgto0gIkpxA34ChchtEHtpIYrqK8EB
/ojUtfghuDWoN9oEm6+k5jiViEBVfAkp2ayAxG1GxFIjQ5viqxuMjFHGs6TJGo10
JrBmxnqLlNWr3BNBz/wRpRXIskGop4owOvMJIQWQTKl81gK6o/1TuGc6KCIvd3lZ
ySMgg5oDrZUBPy3IJOsY4FT4DuTo9w==
=cJLy
-----END PGP SIGNATURE-----

--Sig_/3r9PcC0MkMSaish+TRKVf77--

