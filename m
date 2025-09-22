Return-Path: <linux-next+bounces-8415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F84B8FD83
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 11:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FCA418A0726
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 09:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E0E277C9A;
	Mon, 22 Sep 2025 09:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUADyRWy"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCA2C187;
	Mon, 22 Sep 2025 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534643; cv=none; b=DZIcR+mxPB0jT2dO8FT77gRpE2mxEhkakWFFxaO4V4X5CjbxjdIQumsHGkoUv04N8ryTP75gJJOAC6acMFcHr7b6R0zsyk8llseTXmK0y3pQQwrTFFR8axUkA90hAIfaPgIGgk6fWNAcYHfIif+SoHeROPKT9ZU8ZVt8lCYrcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534643; c=relaxed/simple;
	bh=GEm+Szk8tzx4sPR6HaHuWKnegmQxHaCctzin/o/6Vks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ng+vieDdDmtyDxky09pRuIeP45kuienbNSEMdi4tm8+0toqxIQk0BKBemfc0IWVlvgiNPcFHq9gK4yOnd42MxJFjVwAtEI97JIzVTG7TA+rjSrNK5O3eGwqztDaNaPKNzyKVuXSqkMNbXoa4XLv/dAWVXAbub4ySTLNwqNJMLZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUADyRWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D78C116B1;
	Mon, 22 Sep 2025 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758534643;
	bh=GEm+Szk8tzx4sPR6HaHuWKnegmQxHaCctzin/o/6Vks=;
	h=Date:From:To:Cc:Subject:From;
	b=bUADyRWyQH2K4yeEj0ebzs7UQj98UmhSwR05kA0xofuL6OibSVvm8DVuD4YUb53OX
	 BkSClUVXPmd6CYIztdpe+3Q6ehzzq3X2yRtOp7dF6yJD7QN+2LaVNh0p3So4rMT9Oy
	 j7t+yQT4xIzkoCozp+fzcwJ4s2iHrrwhBgRvKtO680ADuJuP36h0jKQqnbxH3+lXb5
	 JJ40wz4cwTi48HAFjgmENKSpS1wItG8cNzan+kg5tVsDg/iracPJtsmwFKS0eRyW8z
	 KsRSXX2ZS7XoaK0F6Ao2nRCMFzaWyVh+zHTwYmXBFeiDxYhxKU2GlCvY8OoNw/5Beo
	 mwX/NABoIUZwQ==
Date: Mon, 22 Sep 2025 10:50:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QF1hbZkcZPlWF2mW"
Content-Disposition: inline


--QF1hbZkcZPlWF2mW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/kvm/emulate.c

between commit:

  6204aea36b74c ("KVM: x86: Introduce EM_ASM_1")

=66rom the tip tree and commit:

  f8457615b71c6 ("KVM: x86: Don't emulate instructions affected by CET feat=
ures")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/kvm/emulate.c
index 796d0c64f9baf,5c5fb6a6f7f92..0000000000000
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@@ -4001,11 -4153,11 +4088,11 @@@ static const struct opcode group4[] =3D=
=20
  };
 =20
  static const struct opcode group5[] =3D {
 -	F(DstMem | SrcNone | Lock,		em_inc),
 -	F(DstMem | SrcNone | Lock,		em_dec),
 +	I(DstMem | SrcNone | Lock,		em_inc),
 +	I(DstMem | SrcNone | Lock,		em_dec),
- 	I(SrcMem | NearBranch | IsBranch,       em_call_near_abs),
- 	I(SrcMemFAddr | ImplicitOps | IsBranch, em_call_far),
+ 	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
+ 	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
 -	I(SrcMem | NearBranch | IsBranch, em_jmp_abs),
 +	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
  	I(SrcMemFAddr | ImplicitOps | IsBranch, em_jmp_far),
  	I(SrcMem | Stack | TwoMemOp,		em_push), D(Undefined),
  };
diff --cc arch/x86/include/asm/cpufeatures.h
index b2a562217d3ff,8738bd783de22..0000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -495,8 -496,7 +496,9 @@@
  #define X86_FEATURE_TSA_SQ_NO		(21*32+11) /* AMD CPU not vulnerable to TS=
A-SQ */
  #define X86_FEATURE_TSA_L1_NO		(21*32+12) /* AMD CPU not vulnerable to TS=
A-L1 */
  #define X86_FEATURE_CLEAR_CPU_BUF_VM	(21*32+13) /* Clear CPU buffers usin=
g VERW before VMRUN */
 -#define X86_FEATURE_MSR_IMM		(21*32+14) /* MSR immediate form instruction=
s */
 +#define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-u=
serspace, see VMSCAPE bug */
 +#define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring C=
ounters */
++#define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instruction=
s */
 =20
  /*
   * BUG word(s)
diff --cc arch/x86/include/asm/msr-index.h
index 718a55d82fe45,717baeba6db3c..0000000000000
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@@ -315,14 -315,15 +315,16 @@@
  #define PERF_CAP_PT_IDX			16
 =20
  #define MSR_PEBS_LD_LAT_THRESHOLD	0x000003f6
 -
+ #define PERF_CAP_LBR_FMT		0x3f
  #define PERF_CAP_PEBS_TRAP		BIT_ULL(6)
  #define PERF_CAP_ARCH_REG		BIT_ULL(7)
  #define PERF_CAP_PEBS_FORMAT		0xf00
+ #define PERF_CAP_FW_WRITES		BIT_ULL(13)
  #define PERF_CAP_PEBS_BASELINE		BIT_ULL(14)
 +#define PERF_CAP_PEBS_TIMING_INFO	BIT_ULL(17)
  #define PERF_CAP_PEBS_MASK		(PERF_CAP_PEBS_TRAP | PERF_CAP_ARCH_REG | \
 -					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE)
 +					 PERF_CAP_PEBS_FORMAT | PERF_CAP_PEBS_BASELINE | \
 +					 PERF_CAP_PEBS_TIMING_INFO)
 =20
  #define MSR_IA32_RTIT_CTL		0x00000570
  #define RTIT_CTL_TRACEEN		BIT(0)
diff --cc arch/x86/kvm/emulate.c
index 796d0c64f9baf,5c5fb6a6f7f92..0000000000000
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@@ -4001,11 -4153,11 +4088,11 @@@ static const struct opcode group4[] =3D=
=20
  };
 =20
  static const struct opcode group5[] =3D {
  	F(DstMem | SrcNone | Lock,		em_inc),
  	F(DstMem | SrcNone | Lock,		em_dec),
- 	I(SrcMem | NearBranch | IsBranch,       em_call_near_abs),
- 	I(SrcMemFAddr | ImplicitOps | IsBranch, em_call_far),
+ 	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
+ 	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
 -	I(SrcMem | NearBranch | IsBranch, em_jmp_abs),
 +	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
  	I(SrcMemFAddr | ImplicitOps | IsBranch, em_jmp_far),
  	I(SrcMem | Stack | TwoMemOp,		em_push), D(Undefined),
  };

--QF1hbZkcZPlWF2mW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRG+0ACgkQJNaLcl1U
h9Bb0wf+NYH0rfunVOk7T+n8Uyjh5kfNgwyull2F1D2i1z7zizDbD/I3O8eXSq+1
apkikkjw/ydBRpX+7KhvVNeJ+NtBF0c1t5MyFnepgsWwl59o74KPqtiLGJwzulmg
CwiOwW3yrqFwuE2Psm8fQL9GFknx0+SwGrSz0g46+tEG98AiNZDx7QpUYwxynMPh
tWh4aPeXAgZnvDMdMecYt4Trsj/lezapDjgOlSgnHgg1Pi0U/gxA90Ij4CksGDBL
lmF2KM3o5O4obfNfQLoL2bDAWl1RdJ2qMLw4fz/Gcx57EG/UadtVSsIjq+wITL83
gxpWgkFrlAKI4vzSBls2CdGwJJz2Sg==
=5k2Q
-----END PGP SIGNATURE-----

--QF1hbZkcZPlWF2mW--

