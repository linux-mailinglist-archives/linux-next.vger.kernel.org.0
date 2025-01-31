Return-Path: <linux-next+bounces-5348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF4A2384D
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 01:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83FB31886EDB
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 00:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9769BA4B;
	Fri, 31 Jan 2025 00:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="spTEZK6L"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E228467;
	Fri, 31 Jan 2025 00:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738283963; cv=none; b=X0RMB6eeCGff30cO55D3Vf3T/iIgni2dY8gU21NheApx1kc4PoWG/Xdx4PeTaPn2FU99Gpbl4NGKgytWvXt8J3f+Y3Kq9VB0FZk1mnWp+niLV+nlEfPhMHKQNvSom1yRXO4CZHwb5M4rLioeqDBALtZq8MxK2Wu1JSXOyccuN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738283963; c=relaxed/simple;
	bh=MVPPPquIvNGnn0ETfXsi6FbpbwSJ11xfAUl1nO4P6VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ry7gDMDiug4AvFOKSOOYrz8ZKReDlPzaLLWys0RBNFTDgemLFx4WGrVgNVODS7pocATtCRSCpBa/N8cFBZQ/930AbxjjAeccxC0arrGc1eBZMZvLbMGN6hHSE+ukt5DkE5JoyCZNP5pND4Zl7N3H7YFz5VANLAY7PziD2vOqhMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=spTEZK6L; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738283943;
	bh=itVfsdO+sZl/r/Y8sctZpH55gNUASmOb+y6k9lQSzLI=;
	h=Date:From:To:Cc:Subject:From;
	b=spTEZK6L4QLKh9RGwepMfd8FYY3/oPHWZ/sXLbrpIVbhQac7ZxCr5QbBS3oPjc/H4
	 KunwHW0aBuloalBS6mRwR4aY75Bh67Bl2F1ndt8hOjr99iRwXSWKQRI2zIRE0ZBGXv
	 Af6orAndL2TqCC7RvCggecFvSJDBU3ZCrM9eUP9f3EPAEzDLCQddEssT0y364Tjsv5
	 iPL+NtrMxB2qV6ea9PjHQrNAespr+QhZipqeJW3mUc95K9KXRteeGYFWGSvBoyr8MB
	 WR76P1FUT+iHwtIDI0GT+szcdzWi4Mef63Qb//bzR4mH6EBPVQdmRJaxQxbwScLSa9
	 S5/yxH7khQcPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YkcTM3C5tz4wcf;
	Fri, 31 Jan 2025 11:39:03 +1100 (AEDT)
Date: Fri, 31 Jan 2025 11:39:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20250131113911.12653c4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RIlj2muvN21g.KKOVHwtrpu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RIlj2muvN21g.KKOVHwtrpu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  tools/testing/selftests/riscv/vector/vstate_prctl.c

between commit:

  ebdc22c51ace ("tools: selftests: riscv: Add test count for vstate_prctl")

from Linus' tree and commits:

  57d7713af93e ("selftests: riscv: Fix vector tests")
  c384c5d4a2ae ("selftests: riscv: Support xtheadvector in vector tests")

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

diff --cc tools/testing/selftests/riscv/vector/vstate_prctl.c
index 40b3bffcbb40,62fbb17a0556..000000000000
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@@ -67,45 -29,44 +29,46 @@@ int test_and_compare_child(long provide
  	return 0;
  }
 =20
- #define PR_RISCV_V_VSTATE_CTRL_CUR_SHIFT	0
- #define PR_RISCV_V_VSTATE_CTRL_NEXT_SHIFT	2
+ #define PR_RISCV_V_VSTATE_CTRL_CUR_SHIFT 0
+ #define PR_RISCV_V_VSTATE_CTRL_NEXT_SHIFT 2
 =20
- int main(void)
+ TEST(get_control_no_v)
  {
- 	struct riscv_hwprobe pair;
- 	long flag, expected;
  	long rc;
 =20
 +	ksft_set_plan(1);
 +
- 	pair.key =3D RISCV_HWPROBE_KEY_IMA_EXT_0;
- 	rc =3D riscv_hwprobe(&pair, 1, 0, NULL, 0);
- 	if (rc < 0) {
- 		ksft_test_result_fail("hwprobe() failed with %ld\n", rc);
- 		return -1;
- 	}
+ 	if (is_vector_supported() || is_xtheadvector_supported())
+ 		SKIP(return, "Test expects vector to be not supported");
 =20
- 	if (pair.key !=3D RISCV_HWPROBE_KEY_IMA_EXT_0) {
- 		ksft_test_result_fail("hwprobe cannot probe RISCV_HWPROBE_KEY_IMA_EXT_0=
\n");
- 		return -2;
- 	}
+ 	rc =3D prctl(PR_RISCV_V_GET_CONTROL);
+ 	EXPECT_EQ(-1, rc)
+ 	TH_LOG("GET_CONTROL should fail on kernel/hw without ZVE32X");
+ 	EXPECT_EQ(EINVAL, errno)
+ 	TH_LOG("GET_CONTROL should fail on kernel/hw without ZVE32X");
+ }
 =20
- 	if (!(pair.value & RISCV_HWPROBE_EXT_ZVE32X)) {
- 		rc =3D prctl(PR_RISCV_V_GET_CONTROL);
- 		if (rc !=3D -1 || errno !=3D EINVAL) {
- 			ksft_test_result_fail("GET_CONTROL should fail on kernel/hw without ZV=
E32X\n");
- 			return -3;
- 		}
+ TEST(set_control_no_v)
+ {
+ 	long rc;
 =20
- 		rc =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
- 		if (rc !=3D -1 || errno !=3D EINVAL) {
- 			ksft_test_result_fail("SET_CONTROL should fail on kernel/hw without ZV=
E32X\n");
- 			return -4;
- 		}
+ 	if (is_vector_supported() || is_xtheadvector_supported())
+ 		SKIP(return, "Test expects vector to be not supported");
 =20
- 		ksft_test_result_skip("Vector not supported\n");
- 		return 0;
- 	}
+ 	rc =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
+ 	EXPECT_EQ(-1, rc)
+ 	TH_LOG("SET_CONTROL should fail on kernel/hw without ZVE32X");
+ 	EXPECT_EQ(EINVAL, errno)
+ 	TH_LOG("SET_CONTROL should fail on kernel/hw without ZVE32X");
+ }
+=20
+ TEST(vstate_on_current)
+ {
+ 	long flag;
+ 	long rc;
+=20
+ 	if (!is_vector_supported() && !is_xtheadvector_supported())
+ 		SKIP(return, "Vector not supported");
 =20
  	flag =3D PR_RISCV_V_VSTATE_CTRL_ON;
  	rc =3D prctl(PR_RISCV_V_SET_CONTROL, flag);

--Sig_/RIlj2muvN21g.KKOVHwtrpu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmecG68ACgkQAVBC80lX
0Gxrjwf/UJ2Ow6rI/+D4yLt1GlSBcAjqG0DFin+rNEvEc5vaJ9kYdC9aPV97eY8+
rtMBjESpWTK3elAxB1pfe6LQNWm3GtcBjLvbXdCYoEXNzP+ZLrpnFbqv4lv1nEDN
uJCSofgV3KA2AMf87HDmMxjACs6PTWQocL+5LIMhsnnkAe6swlmoRrsUtv3Sl8bi
s7eLEwb5IMENSoZt/Yx4DHerAz9b8JE33F2g9Zx3X9ZpbQ3+I/mP+qD1N5+pONy4
HunNHpXuy5Imjkt3LeGmYuVwn2smlkpOnBMREGvLW2zm9PIfUhe5OO6YA+U9MIgs
CItCCzL6lds3uZyCov9HOysuKG1YVQ==
=3cIE
-----END PGP SIGNATURE-----

--Sig_/RIlj2muvN21g.KKOVHwtrpu--

