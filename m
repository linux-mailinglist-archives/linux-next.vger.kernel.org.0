Return-Path: <linux-next+bounces-6723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C218DAB4B8F
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AED23A5FE7
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB9C74059;
	Tue, 13 May 2025 06:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lSFvcTf6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28E5258;
	Tue, 13 May 2025 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116067; cv=none; b=PiWY+IjkAN1R1H9SLRSXW6+4W9Lo4/vOt+XpO4HY4vdzJTWUsNgspLPwvazQaua2bIJFf4jy822fCMyP3/V8J9kIpjZzdl9d1GfwK7A1csTPzBj0EEseminx8RSOpnW9I3VxCzUBtAl+Ey38nRj5Q0acHZNUmnBnlkMTnewATVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116067; c=relaxed/simple;
	bh=UCnVTP8b0GbCH+A4mLwA4jpvdPMrfvICzKLjXKFhrDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LN3Cd9jA2YOE4JH3zX35XH0U6aSFpqVGdisjUt1qUyE0p6qYIqHSf5vvqSxv0Jg7CNirTq8keXfZKtQv2Yo0dsDtiIaj+CKPaC+hd6xUaIczN/plWN4Wre41iHQZwkzNL+pp9vSBh60feC5bEKJmsfLMLvWAYucZOc9eAasFZg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lSFvcTf6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747116062;
	bh=kazBkKmhccufg4SfJSOT+BgpZWroJUHI/gV1WBLuK9I=;
	h=Date:From:To:Cc:Subject:From;
	b=lSFvcTf6FJRDNuIsVWT5oGZuay3YtUfz/slzq940JqY7il3eSuK2MnKBDMUGq1nSm
	 KA8I2GKPcS4UO4hwPFYk1lk50noj7JSeaA8D6Dr5MuIW6q7xh+JplOp6Bp/vVmM1hQ
	 7z4QukQ1KnKdfpLIgndAE435qOafR36HX2dbsvlC7ezzJ8rm0RiylLPpzcJn9dRRgb
	 DJ8kfFYjZD/ZOtMZAivYOKybMlsPz1OODZCbEAMSwHCpeKkfwdMCN/NbJVwPz5gRoe
	 Zpoyn6XkRufAW2orAGyooBgogtX21RWis3w2cn2prcqny7xZnqd8V3j2aln3V0MWeJ
	 otr+nsvVbcbcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxQnm2ykNz4wb0;
	Tue, 13 May 2025 16:01:00 +1000 (AEST)
Date: Tue, 13 May 2025 16:00:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, "Chang S. Bae"
 <chang.seok.bae@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, "Xin Li (Intel)" <xin@zytor.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513160059.49ead604@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ee/mU4Ii7nJXsZ+8O4dOnX.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ee/mU4Ii7nJXsZ+8O4dOnX.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commits:

  159013a7ca18 ("x86/its: Enumerate Indirect Target Selection (ITS) bug")
  8754e67ad4ac ("x86/its: Add support for ITS-safe indirect thunk")
  2665281a07e1 ("x86/its: Add "vmexit" option to skip mitigation on some CP=
Us")

from Linus' tree and commits:

  282cc5b67623 ("x86/cpufeatures: Clean up formatting")
  13327fada7ff ("x86/cpufeatures: Shorten X86_FEATURE_CLEAR_BHB_LOOP_ON_VME=
XIT")
  3aba0b40cacd ("x86/cpufeatures: Shorten X86_FEATURE_AMD_HETEROGENEOUS_COR=
ES")
  b02dc185ee86 ("x86/cpufeatures: Add X86_FEATURE_APX")
  4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcod=
e")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/include/asm/cpufeatures.h
index 39e61212ac9a,7642310276a8..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -476,12 -476,12 +476,13 @@@
  #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history at =
syscall entry using SW loop */
  #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control availabl=
e */
  #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabl=
ed */
- #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch h=
istory at vmexit using SW loop */
- #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
- #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous =
Core Topology */
- #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classifica=
tion */
- #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to=
 downclocking */
- #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32 + 9) /* Use thunk for indir=
ect branches in lower half of cacheline */
+ #define X86_FEATURE_CLEAR_BHB_VMEXIT	(21*32+ 4) /* Clear branch history a=
t vmexit using SW loop */
+ #define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
+ #define X86_FEATURE_AMD_HTR_CORES	(21*32+ 6) /* Heterogeneous Core Topolo=
gy */
+ #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classificat=
ion */
+ #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to =
downclocking */
 -#define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
++#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+ 9) /* Use thunk for indire=
ct branches in lower half of cacheline */
++#define X86_FEATURE_APX			(21*32+10) /* Advanced Performance Extensions */
 =20
  /*
   * BUG word(s)
@@@ -528,12 -528,12 +529,14 @@@
  #define X86_BUG_TDX_PW_MCE		X86_BUG(31) /* "tdx_pw_mce" CPU may incur #MC=
 if non-TD software does partial write to TDX private memory */
 =20
  /* BUG word 2 */
- #define X86_BUG_SRSO			X86_BUG(1*32 + 0) /* "srso" AMD SRSO bug */
- #define X86_BUG_DIV0			X86_BUG(1*32 + 1) /* "div0" AMD DIV0 speculation b=
ug */
- #define X86_BUG_RFDS			X86_BUG(1*32 + 2) /* "rfds" CPU is vulnerable to R=
egister File Data Sampling */
- #define X86_BUG_BHI			X86_BUG(1*32 + 3) /* "bhi" CPU is affected by Branc=
h History Injection */
- #define X86_BUG_IBPB_NO_RET	   	X86_BUG(1*32 + 4) /* "ibpb_no_ret" IBPB o=
mits return target predictions */
- #define X86_BUG_SPECTRE_V2_USER		X86_BUG(1*32 + 5) /* "spectre_v2_user" C=
PU is affected by Spectre variant 2 attack between user processes */
- #define X86_BUG_ITS			X86_BUG(1*32 + 6) /* "its" CPU is affected by Indir=
ect Target Selection */
- #define X86_BUG_ITS_NATIVE_ONLY		X86_BUG(1*32 + 7) /* "its_native_only" C=
PU is affected by ITS, VMX is not affected */
+ #define X86_BUG_SRSO			X86_BUG( 1*32+ 0) /* "srso" AMD SRSO bug */
+ #define X86_BUG_DIV0			X86_BUG( 1*32+ 1) /* "div0" AMD DIV0 speculation b=
ug */
+ #define X86_BUG_RFDS			X86_BUG( 1*32+ 2) /* "rfds" CPU is vulnerable to R=
egister File Data Sampling */
+ #define X86_BUG_BHI			X86_BUG( 1*32+ 3) /* "bhi" CPU is affected by Branc=
h History Injection */
+ #define X86_BUG_IBPB_NO_RET		X86_BUG( 1*32+ 4) /* "ibpb_no_ret" IBPB omit=
s return target predictions */
+ #define X86_BUG_SPECTRE_V2_USER		X86_BUG( 1*32+ 5) /* "spectre_v2_user" C=
PU is affected by Spectre variant 2 attack between user processes */
 -#define X86_BUG_OLD_MICROCODE		X86_BUG( 1*32+ 6) /* "old_microcode" CPU h=
as old microcode, it is surely vulnerable to something */
++#define X86_BUG_ITS			X86_BUG( 1*32+ 6) /* "its" CPU is affected by Indir=
ect Target Selection */
++#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 7) /* "its_native_only" C=
PU is affected by ITS, VMX is not affected */
++#define X86_BUG_OLD_MICROCODE		X86_BUG( 1*32+ 8) /* "old_microcode" CPU h=
as old microcode, it is surely vulnerable to something */
+=20
  #endif /* _ASM_X86_CPUFEATURES_H */

--Sig_/Ee/mU4Ii7nJXsZ+8O4dOnX.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi4BsACgkQAVBC80lX
0GwqWggAgluqUoajF6Wv/h8opthdBD4cwrL9j0QokxGrN3NQiXoV2kqS5YsKhJLg
PEHrOz+5YFP0QGTnPw6tUR364sy8zTLoUCH/MRiIU2ez0omDzzm1kvWPMCpTKbj3
ephHjoOsiEUmPGq3PwmJqXD0+ecsKe2UhrKLY0NTzMBJ8UhkzZNLhM14EkAWzmwT
2qpsYIR+KxVxNUs0leObmLi17X29HRJHYuaHy4u2bpBXCNqRaNarNW6QaPcxHFBB
UbR+jRHrcOeSlx1/z/3RHauPXN2zG/ORtewSTOF8deTYXpPayoUaFykBJz+IIDy5
bZDUG54Hn6SYvuw+WvNa/WG8NR/vSw==
=HJPL
-----END PGP SIGNATURE-----

--Sig_/Ee/mU4Ii7nJXsZ+8O4dOnX.--

