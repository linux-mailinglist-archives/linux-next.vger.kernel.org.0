Return-Path: <linux-next+bounces-9195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B738C83013
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 02:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D7F84E2648
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 01:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1413626FDAC;
	Tue, 25 Nov 2025 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KSNsMWte"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2381DB54C;
	Tue, 25 Nov 2025 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764034183; cv=none; b=jW9g66ExHgsqKdf7M20fHfbYcXEmqkIWMCqkm4mGrvjNV6EF+ocMesn+6LHWgp+t5IVQS4WawxlSXKSX5DoeV7GSy9yAJPg0Epan4B8TM9xsA11ZvUa2KtLxHdXo1ZZRkJvFhEL5hil7hqt6PqsqnkitdbihIMvxUF7XbAw+zfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764034183; c=relaxed/simple;
	bh=k8WZygF/lSMwmhzRMdfsz7SdjJig1Khb9ndmIZO+4Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ILYFiaTleiLOQHjQWyjETWYt8xybE98XHF8z6jd45AUz2JUMpkKXK5ZjzhWNa2SMDpe495hUIHx8tl3+1zVBdub3O68BkTVbgXMAssDVVTBhT3UwyTgT78lOrVANOwRPkDoD9dyoE1RUvqDzl2lJdhcVWCD7AoHFzL4yXVFIb5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KSNsMWte; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764034175;
	bh=T46NZuiswN95/ZW7i5A3UrBUFZE61VJQgLNsduptmqY=;
	h=Date:From:To:Cc:Subject:From;
	b=KSNsMWteJFXmxzxg1GC9s7gBaaN2AYwGAGiS3/G7E+avjmunrwZ6KTCwkg6LczMhw
	 DRzNxeSq4IldbRLcJ089P8t1XPNEPJYnQxZVlIeWH/OYqHtI4+FEc6cJZu4QYshHWO
	 emX6K9LEp5M/co57TkrqwXZ+RuXhghsVQD03EBFyBneTepsUgIrb+LntmprF3e6C5W
	 IW2AfdscTP/nZuf8Kq1k1M7FJnFOhwbDyDW8yy/DQgpjUe8tr+DHtVHCPQfyhZZo6l
	 0oRAfW9g6BCX0e8a1ttbN7xc6lD+HKCZtLgEbHZ2gvcd7oq8XXl0Y+XqynTJ2g6Dh/
	 L9PQuqAaMi4xg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFlV722k5z4w0p;
	Tue, 25 Nov 2025 12:29:35 +1100 (AEDT)
Date: Tue, 25 Nov 2025 12:29:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "jianyun.gao"
 <jianyungao89@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the mm-stable
 tree
Message-ID: <20251125122934.36f75838@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HTLUN9j8YS6Rav6vm6Ewkff";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HTLUN9j8YS6Rav6vm6Ewkff
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  mm/secretmem.c

between commit:

  b6c46600bfb2 ("mm: fix some typos in mm module")

from the mm-stable tree and commit:

  1011f385f492 ("secretmem: convert memfd_secret() to FD_ADD()")

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

diff --cc mm/secretmem.c
index 37f6d1097853,f0ef4e198884..000000000000
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@@ -224,10 -224,7 +224,7 @@@ err_free_inode
 =20
  SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
  {
- 	struct file *file;
- 	int fd, err;
-=20
 -	/* make sure local flags do not confict with global fcntl.h */
 +	/* make sure local flags do not conflict with global fcntl.h */
  	BUILD_BUG_ON(SECRETMEM_FLAGS_MASK & O_CLOEXEC);
 =20
  	if (!secretmem_enable || !can_set_direct_map())

--Sig_/HTLUN9j8YS6Rav6vm6Ewkff
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklBn4ACgkQAVBC80lX
0Gxewwf/Wmc9NkMWYTBTY7+S9mB7mHF4kzPhG6c8CsaBTxVLrsX5iOFZnjEKucXk
zVWtpsxdgt4mkc1p6BRntqd+SVKx9m+zpu0SCkjNSNZh544VMZNOT/bG8CwDwJ4t
Ke3uushfOaGCpJe5docEZR9I1zBfYcuKX+4QRax9rE02sy9uHMJQVHdYUzBu99cJ
AuvbcYDtbCCQ40JsgCIo38li8TGohz0wMvC14RDG9S0fbl5/TYJ3SzMAarQ3xHDS
8maLGTcoRX7bEM1hvtoeN3gFA9LeSekQ7mmPmI3Jp4f829M4nbvCHQu7YL0wMPys
+fp22nKnhknTaviHuhuJpil5mKNvuA==
=Bjx0
-----END PGP SIGNATURE-----

--Sig_/HTLUN9j8YS6Rav6vm6Ewkff--

