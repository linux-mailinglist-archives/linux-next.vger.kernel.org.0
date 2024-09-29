Return-Path: <linux-next+bounces-4003-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7598987D
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 01:57:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7551928324A
	for <lists+linux-next@lfdr.de>; Sun, 29 Sep 2024 23:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429E83D96D;
	Sun, 29 Sep 2024 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I29qyRQA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363B17E44A;
	Sun, 29 Sep 2024 23:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654217; cv=none; b=e49m1k3aNl0wpdoxVzqqJeZpwh/hyDt/gjASxiJT2ZSVWqQM5ZbktP13sjTIJIN4lKqZe8B/TfSQvK3VvyqVUQ8Lyg2cCmUOJNH1+MDd7f2MRYTXxhKGL8gyrCuzE7ADnXeJlLdu0AS0RnLMv/cN74XDpeKH42aqTBm1Z6CRXis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654217; c=relaxed/simple;
	bh=JWC1P3gfZ9aElZZEwsmrUfrUqoHaaAKqal2t4ujQSDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T4y2dD71UWVj4aj4+wauACHYWMGIRX1yH/fvnLMrXFpsysHIJciQPbS6xjUC7XMgmvVfpx5/WhSAzxC2g2Fq/WlL68/2JAtnjz93hVUUk30MpF5oobh6vr+l+sPZE6GqsfmbTwk4pIO079LdRJqk56AtHq5w8I1Wmqob6r0tRRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I29qyRQA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727654209;
	bh=xFVjZCdtnwyKdVfImA1WNKUrVKM1bKvjTQIq5viPFm0=;
	h=Date:From:To:Cc:Subject:From;
	b=I29qyRQA8V94u1/v6De13yEfwbB5t+qJyD5ebwzCBaUi10Pat7dSwQMapP5hlqkQj
	 YSCRBKo+lHgCb4yeqfkIEQG1iNDxroTiD1/uAFiuzydA/iwEd4tvwd4Z9G6x0Ba+Xj
	 RdfU9sdDHAzl3sWsVrLgDywx5127fERx9uv9xuVdaT8yMvA0TKL0ws1O2HSC2FAPUJ
	 Mkuta46Lrhvhg/FxEb5So8AR5TDVUKb5esK3geUJ2MkUTjndgcOFU1VZY7wi8sW+J7
	 8D1em1eImJpEYznbdZwMc2EjD+iJNXCmfcfO8rdhLu/zGu6iXmnNC8rjj29vhDrVfh
	 p6hlFWBHd3xqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XH1MP1Sx3z4wc4;
	Mon, 30 Sep 2024 09:56:49 +1000 (AEST)
Date: Mon, 30 Sep 2024 09:56:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matthew Maurer
 <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, Sabyrzhan Tasbolatov
 <snovitoll@gmail.com>
Subject: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240930095648.40f7cbaf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E5tBUorDdzYpdNRNLe3JV6j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E5tBUorDdzYpdNRNLe3JV6j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm tree got a conflict in:

  mm/kasan/kasan_test_c.c

between commit:

  a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")

from Linus' tree and commit:

  88ad9dc30bbf ("mm, kasan: instrument copy_from/to_kernel_nofault")

from the mm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/kasan/kasan_test_c.c
index a181e4780d9d,329d815185a5..000000000000
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@@ -1944,16 -1944,36 +1944,46 @@@ static void match_all_mem_tag(struct ku
  	kfree(ptr);
  }
 =20
 +/*
 + * Check that Rust performing a use-after-free using `unsafe` is detected.
 + * This is a smoke test to make sure that Rust is being sanitized properl=
y.
 + */
 +static void rust_uaf(struct kunit *test)
 +{
 +	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_RUST);
 +	KUNIT_EXPECT_KASAN_FAIL(test, kasan_test_rust_uaf());
 +}
 +
+ static void copy_from_to_kernel_nofault_oob(struct kunit *test)
+ {
+ 	char *ptr;
+ 	char buf[128];
+ 	size_t size =3D sizeof(buf);
+=20
+ 	/* Not detecting fails currently with HW_TAGS */
+ 	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_HW_TAGS);
+=20
+ 	ptr =3D kmalloc(size - KASAN_GRANULE_SIZE, GFP_KERNEL);
+ 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
+ 	OPTIMIZER_HIDE_VAR(ptr);
+=20
+ 	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS)) {
+ 		/* Check that the returned pointer is tagged. */
+ 		KUNIT_EXPECT_GE(test, (u8)get_tag(ptr), (u8)KASAN_TAG_MIN);
+ 		KUNIT_EXPECT_LT(test, (u8)get_tag(ptr), (u8)KASAN_TAG_KERNEL);
+ 	}
+=20
+ 	KUNIT_EXPECT_KASAN_FAIL(test,
+ 		copy_from_kernel_nofault(&buf[0], ptr, size));
+ 	KUNIT_EXPECT_KASAN_FAIL(test,
+ 		copy_from_kernel_nofault(ptr, &buf[0], size));
+ 	KUNIT_EXPECT_KASAN_FAIL(test,
+ 		copy_to_kernel_nofault(&buf[0], ptr, size));
+ 	KUNIT_EXPECT_KASAN_FAIL(test,
+ 		copy_to_kernel_nofault(ptr, &buf[0], size));
+ 	kfree(ptr);
+ }
+=20
  static struct kunit_case kasan_kunit_test_cases[] =3D {
  	KUNIT_CASE(kmalloc_oob_right),
  	KUNIT_CASE(kmalloc_oob_left),
@@@ -2027,7 -2047,7 +2057,8 @@@
  	KUNIT_CASE(match_all_not_assigned),
  	KUNIT_CASE(match_all_ptr_tag),
  	KUNIT_CASE(match_all_mem_tag),
 +	KUNIT_CASE(rust_uaf),
+ 	KUNIT_CASE(copy_from_to_kernel_nofault_oob),
  	{}
  };
 =20

--Sig_/E5tBUorDdzYpdNRNLe3JV6j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb56UAACgkQAVBC80lX
0Gy/Ygf+O/ILcQr4wVINz+xpOYI2FxKeyucqjk2XoIUxSw/9HW1MK15dVF5b43J0
nFTwoQircA5UaQoyqrhIM/+egYAtAubnXc6wIaAL0+QqfPr8pVAajDilW/3n62TU
LRuvLK3/naeqR0L3swtaUdjEz7QdqB2jNGDGjkC+VLgMxpP2mK68aohrmtHoQVDx
XperrjCcUVcj0qrRV0MXyWAfWENLlDLy4aexbYtxam/aG3z5XPCdBlb6dxknrFMY
GCIoXwc6yZ5CpuxokUnMCB1ilkIKrHkcWlsSVEQI4lCRzIoes6bT+TObRQBq+W2w
/+f6It9LwGLnyoK6/LhvWfb0i+8CyA==
=wrep
-----END PGP SIGNATURE-----

--Sig_/E5tBUorDdzYpdNRNLe3JV6j--

