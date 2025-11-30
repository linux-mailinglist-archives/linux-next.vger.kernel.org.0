Return-Path: <linux-next+bounces-9278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0FAC95617
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 00:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B6DF3A1E21
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 23:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4A42F12D4;
	Sun, 30 Nov 2025 23:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qMklCAIB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635442F0C6B;
	Sun, 30 Nov 2025 23:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764544555; cv=none; b=PUkyqWJ9MRgRnH3UrFvKXM6uIxj3U1/ouccTNI/ZIQVze5IUqDA0fB3II4k5feo26GzNi1xhu6SFHnpK7uNvaEppKZw2gCwicYkPCQ0cUFxFu6jptA7aAvEBp6cVA8hNRG6Fk9NR5BH1/q7Vwi8zXk4zupYc4ntK6p/nCh/nLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764544555; c=relaxed/simple;
	bh=b6mJA3zPs/P0+l0FIdRnKmfk83R2aCBBaZrAGZEEdUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rY+MenIZRv5Ld0Lle3+oEaE7A6LGO1tGTAAqWUutqFLFWxY5TaGmJERw10Vl7xSBhkMNh8khBXmuOAX2l1DaZHZmWMwE3m4/dErORLKo7WMK89sWeXgD3tBahOlGUx0yjI8B+FpnLAqifC1/xMoFtE3yQJ7w2BbMXMdrGa32MeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qMklCAIB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764544550;
	bh=QWfuKeCTKvqfUJtpgGiZh+NEzQGvmZmWooIZTCmiE0k=;
	h=Date:From:To:Cc:Subject:From;
	b=qMklCAIBS6Worph6Eu3ij+GmQmCsLExhV1csNecF7vTmy/88fbqh+8TXrnIoo+/ZG
	 r5c9hozYJK2/zGz+JZXsel6GxQ2hmSA9M0FJ/wqWYid+h3av2BK+i1amdIH0FFwHRW
	 bHSsa3LDAdAsE8sEI4jrNa3dxSdzIUJVYJLtIlNvZF8XcmlQ1Fux8s7nbTft8ixp1a
	 7qkdvmLjL92QjTtw509ck9j+vt/YXq4Q4AaAPzeseyO7IBiy8Ph0IvXc7pw5jdv+Gv
	 MOJ/LEjg/DG7RkCvHCOMGpGr+lRB2zVktaE8zsSgyb2aA7UMdeLIRxF3Ozzmne+scl
	 SURSfkgM0UZZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKNF21ZcXz4wCm;
	Mon, 01 Dec 2025 10:15:50 +1100 (AEDT)
Date: Mon, 1 Dec 2025 10:15:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, David Matlack
 <dmatlack@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the mm-nonmm-stable
 tree
Message-ID: <20251201101549.5792d6df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S+lR_EZ1h=R3hyB8.SPv4wX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/S+lR_EZ1h=R3hyB8.SPv4wX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  tools/testing/selftests/vfio/vfio_iommufd_setup_test.c

between commit:

  e6fbd1759c9e ("selftests: complete kselftest include centralization")

from the mm-nonmm-stable tree and commit:

  657d241e695f ("vfio: selftests: Rename vfio_util.h to libvfio.h")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
index 6854a9dedff3,caf1c6291f3d..000000000000
--- a/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
+++ b/tools/testing/selftests/vfio/vfio_iommufd_setup_test.c
@@@ -10,8 -10,8 +10,8 @@@
  #include <sys/ioctl.h>
  #include <unistd.h>
 =20
- #include <vfio_util.h>
+ #include <libvfio.h>
 -#include "../kselftest_harness.h"
 +#include "kselftest_harness.h"
 =20
  static const char iommu_dev_path[] =3D "/dev/iommu";
  static const char *cdev_path;

--Sig_/S+lR_EZ1h=R3hyB8.SPv4wX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks0CUACgkQAVBC80lX
0Gw8BQgAlV/wqcI6Mdp4bYF1m2erd6XgQLXcaTlmjlHSV0mB/FV6ZfmAThdyKuy+
fD1kKf+stsuK+6aZ5U4Dr5XBs2+5dNfprE+VyYQ/lbqQiN+aIuFsbASSgjqYUQCY
oeXTQlbgW1h8V8LyQ7S3KBDdLLH+jMMmqHVk3wvyNu8QMQX4nmJLXn1amHplSVQh
6NOCZDqDg4nx8iSjqNhyQjO/vX4VvW+aCt6oRDGooFu2fA3hQo0WcpCpHZ68oOur
C6QvB/YSBc3RxNdOmINflru7p+wetbkQp+Q2tYhpW4AGDE9ku8ZCWciZjIVWUBRP
uPnqMVFbh9M1ctx3uyrLgN0yDbujpw==
=hx7K
-----END PGP SIGNATURE-----

--Sig_/S+lR_EZ1h=R3hyB8.SPv4wX--

