Return-Path: <linux-next+bounces-3902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CBC97B668
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 02:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21911C239B2
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 00:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9BBEC5;
	Wed, 18 Sep 2024 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QNQwSHVd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A3E193;
	Wed, 18 Sep 2024 00:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726617937; cv=none; b=OyP6oWmTv8chGRd7WmZpSuczddXIAlmNeaqSbI3Na2qOmvb87EUQgCfZPCvfiCK0kg9jpx+s2bEUvIn1LG9TpeXq/ey4xsuu7VvjtqmLqzrZIsft0/i7k/Grx3NNHNmJNqfWza5IhAVci83f6tPWcs777eCdIQagBJ1d322r90E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726617937; c=relaxed/simple;
	bh=wmrIcMhPqXNnrDoVzjzBREEEVDdkApX4KGDZIYjNqt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NxVxWq42SoH/p/BCeoFFwPL6pz2ar6+JgJSU6sv83OTaoiXhJ8p3pta8sgyfB5QUX7tHPn8nbGK9EWZ31SNMX7DnNz9148hRh+1Qmexi9OhUQwn+hSBTSt/4jb7XDBfy1BNVxiZ/gajXpxBucBxQSuPCSGHBIEA+9Q9IkldwD6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QNQwSHVd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726617931;
	bh=imUxwiOxmMIF0zXl4Yxar18qskfN+sIEylyXd70v1LI=;
	h=Date:From:To:Cc:Subject:From;
	b=QNQwSHVdGNd8torGXqd2FEGjYkJPG7THqKBNECAW5oU0wETBW9uRIDUK5FKPPqQPK
	 XbjBdPMtRUOOf53rxlvKGqPPsJYI84UHFRtNPzDyqPGE9A+9wF6dA3pOQix8WD7H8b
	 3ipuePfsEC15oWM7xK87pAJeyQjsPSgnb3e5taz8XMmZw8/iwYr5DHerjDJBFxZYOI
	 NBbfGOSbjbjJNySBB2+MarcWIkboJcqMxVJO75YMy5bPnM+ahAYq7qfMgKXnkwKxqX
	 rGflBNHxmjD2uYny3KL9XXZ/gAdywoSEKbt6ttHOFEVUx1cscMMes2KWJEFdV1Fbsl
	 sTkax0oaEDarw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7f6z3BNpz4wx5;
	Wed, 18 Sep 2024 10:05:31 +1000 (AEST)
Date: Wed, 18 Sep 2024 10:05:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20240918100530.5b39891c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0nVHAQiX4R=/fLXi=53dZuA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0nVHAQiX4R=/fLXi=53dZuA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  tools/testing/selftests/riscv/mm/mmap_test.h

between commit:

  83dae72ac038 ("riscv: selftests: Remove mmap hint address checks")

from Linus' tree and commit:

  11c2dbd7f241 ("selftests: riscv: Allow mmap test to compile on 32-bit")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/riscv/mm/mmap_test.h
index 75918d15919f,1c3313c201d5..000000000000
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@@ -13,6 -13,75 +13,8 @@@
  #define PROT (PROT_READ | PROT_WRITE)
  #define FLAGS (MAP_PRIVATE | MAP_ANONYMOUS)
 =20
 -// Only works on 64 bit
 -#if __riscv_xlen =3D=3D 64
 -/* mmap must return a value that doesn't use more bits than the hint addr=
ess. */
 -static inline unsigned long get_max_value(unsigned long input)
 -{
 -	unsigned long max_bit =3D (1UL << (((sizeof(unsigned long) * 8) - 1 -
 -					  __builtin_clzl(input))));
 -
 -	return max_bit + (max_bit - 1);
 -}
 -
 -#define TEST_MMAPS                                                       =
     \
 -	({                                                                    \
 -		void *mmap_addr;                                              \
 -		for (int i =3D 0; i < ARRAY_SIZE(random_addresses); i++) {      \
 -			mmap_addr =3D mmap((void *)random_addresses[i],         \
 -					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
 -			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
 -			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
 -				  mmap_addr);                                 \
 -			mmap_addr =3D mmap((void *)random_addresses[i],         \
 -					 5 * sizeof(int), PROT, FLAGS, 0, 0); \
 -			EXPECT_NE(MAP_FAILED, mmap_addr);                     \
 -			EXPECT_GE((void *)get_max_value(random_addresses[i]), \
 -				  mmap_addr);                                 \
 -		}                                                             \
 -	})
 -#endif /* __riscv_xlen =3D=3D 64 */
 -
+ #define TEST_MMAPS do { } while (0)
+=20
  static inline int memory_layout(void)
  {
  	void *value1 =3D mmap(NULL, sizeof(int), PROT, FLAGS, 0, 0);

--Sig_/0nVHAQiX4R=/fLXi=53dZuA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqGUoACgkQAVBC80lX
0Gx2wgf8DQKeBNtJalM+v7788Q7D4LohFaXKI3BJIWpntTNWt5/4RH3Vg1nlDaOR
gi/Sygt07HWFeaGQs90HXgKQGv35+GAZE2QcW47uSOTazCfZM0oSI2PbUYqiVmdq
5nsOUqlrCmS8SsXBdcirPAHQwOlkEg4U15K1Gh8MuLY7UW+2lIpVMFB8U173udIi
ReHoPl3esNmGKIURiJzR6Zc3izZr/GXaI7s7wmGR1LcUFh58LPojqG4vwJx0CtgW
X7PoF991PO5OMcNevgRSHvzibvHSUp7B4RWQhexSqVAOu4ApCvmvFzkEzCAtYhYT
s1TAfc0odDVc0qCvPQ+ceO14PEdg8w==
=lOCC
-----END PGP SIGNATURE-----

--Sig_/0nVHAQiX4R=/fLXi=53dZuA--

