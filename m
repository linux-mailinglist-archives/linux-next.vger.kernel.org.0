Return-Path: <linux-next+bounces-3247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475F949C8E
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 02:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AABAC1F22934
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2024 00:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132AF36C;
	Wed,  7 Aug 2024 00:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="crVnqlK5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D544A03;
	Wed,  7 Aug 2024 00:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722989086; cv=none; b=T1jQH1bRrnIm3qX5c9iuLa4wlCecbzqS0mpA9UJoSNV2fkEvecY6n+HEWd/eVTTOTHNBxx8mTcm05gZu7100L2lPCrcMs336UlKIQFWojlnYgOrV20uuybtHSiUbk4gsqZ7LnI0Z6a2sO9JEDn3BVfwFpfTkPCFsYBlbq2hOM8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722989086; c=relaxed/simple;
	bh=4Kkhe+inc4ljsIQXc7G2vZ6On64/i5jOImYxQ1okxmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SY/jfyC5Uqp1Enk5rOylTqYQZoOOod6A2zIb4TtMIlMUbKQbSasIgfDtLPFHPQiAvBgwX5i0p5Sy1EUInx3DrNVzExxcLXdpI3FpP1LytJmXTDNHzp7j0qusb64T1NU5VCohkpMw6RDqFYtDAgofYLD+Tqc93hk/qkvJDML3/90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=crVnqlK5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722989074;
	bh=Jmj0zEwO/2sF8FN834SI9UG12wmU1Vwqshq+i48ODQ8=;
	h=Date:From:To:Cc:Subject:From;
	b=crVnqlK5zCvCUoIMp7hbofcaXEa6LfztBxy/SnpSiJXhKm3LEOgzmGgvT8uWIVuRa
	 a+xgbbh5WGsi3L2AMISeZLT7EcoE/WBSo32un4Gd9JJeDzIvdODuTbBgGo79vuXRMm
	 1V+RlxpwIlrhi57LOnBgFv1pLos57W4WZTtnEdgYAPzK04FApEmdxwuF5Dwe9m9sfc
	 gtgFcJEedQ5rZd4HSlv7xisNEbVOyta4VvmorkSa4f+nzxDaSVgZ5BSpqt8U+Ga8qQ
	 MGGwCHhDdNzdww4LJiHlRl/wIAXmnoySye5A7rMLasesl7h5h82QiL6vcFrZbB1RWM
	 keJqpRhiH0IfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wdr5G0fspz4w2F;
	Wed,  7 Aug 2024 10:04:34 +1000 (AEST)
Date: Wed, 7 Aug 2024 10:04:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the vfs-fixes
 tree
Message-ID: <20240807100433.16e92156@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/atET8ukcMB/s5z9Ex_1g9K=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/atET8ukcMB/s5z9Ex_1g9K=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  tools/testing/selftests/core/close_range_test.c

between commit:

  9a2fa1472083 ("fix bitmap corruption on close_range() with CLOSE_RANGE_UN=
SHARE")

from the vfs-fixes tree and commit:

  b7fcee976159 ("selftests: add F_CREATED_QUERY tests")

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

diff --cc tools/testing/selftests/core/close_range_test.c
index 12b4eb9d0434,3e829666281d..000000000000
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@@ -589,39 -593,39 +593,74 @@@ TEST(close_range_cloexec_unshare_syzbot
  	EXPECT_EQ(close(fd3), 0);
  }
 =20
 +TEST(close_range_bitmap_corruption)
 +{
 +	pid_t pid;
 +	int status;
 +	struct __clone_args args =3D {
 +		.flags =3D CLONE_FILES,
 +		.exit_signal =3D SIGCHLD,
 +	};
 +
 +	/* get the first 128 descriptors open */
 +	for (int i =3D 2; i < 128; i++)
 +		EXPECT_GE(dup2(0, i), 0);
 +
 +	/* get descriptor table shared */
 +	pid =3D sys_clone3(&args, sizeof(args));
 +	ASSERT_GE(pid, 0);
 +
 +	if (pid =3D=3D 0) {
 +		/* unshare and truncate descriptor table down to 64 */
 +		if (sys_close_range(64, ~0U, CLOSE_RANGE_UNSHARE))
 +			exit(EXIT_FAILURE);
 +
 +		ASSERT_EQ(fcntl(64, F_GETFD), -1);
 +		/* ... and verify that the range 64..127 is not
 +		   stuck "fully used" according to secondary bitmap */
 +		EXPECT_EQ(dup(0), 64)
 +			exit(EXIT_FAILURE);
 +		exit(EXIT_SUCCESS);
 +	}
 +
 +	EXPECT_EQ(waitpid(pid, &status, 0), pid);
 +	EXPECT_EQ(true, WIFEXITED(status));
 +	EXPECT_EQ(0, WEXITSTATUS(status));
 +}
 +
+ TEST(fcntl_created)
+ {
+ 	for (int i =3D 0; i < 101; i++) {
+ 		int fd;
+ 		char path[PATH_MAX];
+=20
+ 		fd =3D open("/dev/null", O_RDONLY | O_CLOEXEC);
+ 		ASSERT_GE(fd, 0) {
+ 			if (errno =3D=3D ENOENT)
+ 				SKIP(return,
+ 					   "Skipping test since /dev/null does not exist");
+ 		}
+=20
+ 		/* We didn't create "/dev/null". */
+ 		EXPECT_EQ(fcntl(fd, F_CREATED_QUERY, 0), 0);
+ 		close(fd);
+=20
+ 		sprintf(path, "aaaa_%d", i);
+ 		fd =3D open(path, O_CREAT | O_RDONLY | O_CLOEXEC, 0600);
+ 		ASSERT_GE(fd, 0);
+=20
+ 		/* We created "aaaa_%d". */
+ 		EXPECT_EQ(fcntl(fd, F_CREATED_QUERY, 0), 1);
+ 		close(fd);
+=20
+ 		fd =3D open(path, O_RDONLY | O_CLOEXEC);
+ 		ASSERT_GE(fd, 0);
+=20
+ 		/* We're opening it again, so no positive creation check. */
+ 		EXPECT_EQ(fcntl(fd, F_CREATED_QUERY, 0), 0);
+ 		close(fd);
+ 		unlink(path);
+ 	}
+ }
+=20
  TEST_HARNESS_MAIN

--Sig_/atET8ukcMB/s5z9Ex_1g9K=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmayuhEACgkQAVBC80lX
0Gztfgf+PGxM2G9Kkj/9G/ydQttjCb6IChCLsYWmiNHA44o2TFp1IZsOJQ9OOPF4
koY1X3RbOSllqxYX4ZHpk4qumaIVY3AdKgKLsVyWmFWmmOko4XyD2PsvAIzLRBdb
vuS3CF+G4SejAnxKnH34rde/Emj5SA4o6XS5hIyFUD2f15JsrYgiB0/evGTG2VnX
F5c4/esi+KvlejJSNx9/mX2kGcSjrh5rYjcCOmbke93xx/c2d7Rb6t/IeES6SxBl
jKANr6tlNqbi5tUC/LQ4pQzti9e2sNhVbSrAyDLd3QKlh+PrPTgFHCHdKL7NCpaZ
Uf8yII3FYVePTDy4VgG9Q343FkkZMA==
=IJJW
-----END PGP SIGNATURE-----

--Sig_/atET8ukcMB/s5z9Ex_1g9K=--

