Return-Path: <linux-next+bounces-6926-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE8AC38CE
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 06:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ED5A7A6551
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 04:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1C11A01B9;
	Mon, 26 May 2025 04:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IAuZPcGg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A1C42A87;
	Mon, 26 May 2025 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748235022; cv=none; b=bT3Bt2G7Smkv4Op4TTNxDscModZSFIXPK1h+zw1fv6f/xuw3JUnPlUQnxaJltzSoW6SfxIFgCSiA6QgZnRcNwL5dxLRDhW3Ca0DKkiseXyDGQE0ayT8ZV2FrNRjeO2GthU82QqOO9LwSwzvDD6Sfwwe3SU3J3CvuovhRXDalNRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748235022; c=relaxed/simple;
	bh=35xWmzgiV6a9hZvqdrzmOnx4+bq7Pqypd8xbegsWmdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eOZjFtlMdBDdF++15MNsl+8kmNm0ayvz4cD8XOq2IUJkdBS+YnPWv7pgUYkhaSeIr01kd+oA9N5e+fTSRxzTtAPZOlKJOe3CsEAAOyCgX96ZOL5+cbhKeaRaeSmP1T0yhaMtfDkPXudDxYEyzyWAYqnQStswcA7k7g8QT07yqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IAuZPcGg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748235017;
	bh=QaaZoajFRj1TH4MvoV1VPQggh13J0LDJ7iPrV7mUjkc=;
	h=Date:From:To:Cc:Subject:From;
	b=IAuZPcGgBue4ZMwn1yl/Ayr/3M+Ua2szHE5S9DEOamd28fzxI6h/2pPSjRE1/Rgv8
	 Oyf6WHtR35eHR1PmQvZ9P28tJyHjiRxBc4Pm9Nf345srNfdDc2Z2cazNKY6OdJ7y5U
	 D+4Xodcnw90t1N9R4tu19M015owQSud6b3vyqwUDw3PTjYQy5dTJi8ojI+78Llk5R/
	 ChCLvH83/+f7IcmEN7ZNQRw5I6uuzqWGVhcjMd2WIv0JC+pHRiQnJ1t6lTtyUqGiZ3
	 +rHo+nFCXZ0HNcE3VGEohbLkKVhuJhMm9kbThEDISLyOVRyZZB5Jz48v8R5R0CioBl
	 I5V+tHs5RT7Sw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5Nc82gMVz4wbv;
	Mon, 26 May 2025 14:50:16 +1000 (AEST)
Date: Mon, 26 May 2025 14:50:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, "Xin Li (Intel)"
 <xin@zytor.com>
Subject: linux-next: manual merge of the tip tree with the perf tree
Message-ID: <20250526145015.615882b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cib8ZWXY5nrsoorTL=do+O2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cib8ZWXY5nrsoorTL=do+O2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/arch/x86/include/asm/cpufeatures.h

between commit:

  444f03645f14 ("tools headers x86 cpufeatures: Sync with the kernel source=
s to pick ZEN6 and Indirect Target Selection (ITS) bits")

from the perf tree and commits:

  282cc5b67623 ("x86/cpufeatures: Clean up formatting")
  13327fada7ff ("x86/cpufeatures: Shorten X86_FEATURE_CLEAR_BHB_LOOP_ON_VME=
XIT")
  3aba0b40cacd ("x86/cpufeatures: Shorten X86_FEATURE_AMD_HETEROGENEOUS_COR=
ES")

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

diff --cc tools/arch/x86/include/asm/cpufeatures.h
index 30144ef9ef02,bc81b9d1aeca..000000000000
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@@ -476,12 -476,11 +476,12 @@@
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
++#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+ 9) /* Use thunk for indire=
ct branches in lower half of cacheline */
 =20
  /*
   * BUG word(s)
@@@ -528,12 -527,10 +528,12 @@@
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
++#define X86_BUG_ITS			X86_BUG( 1*32+ 6) /* "its" CPU is affected by Indir=
ect Target Selection */
++#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 7) /* "its_native_only" C=
PU is affected by ITS, VMX is not affected */
  #endif /* _ASM_X86_CPUFEATURES_H */

--Sig_/cib8ZWXY5nrsoorTL=do+O2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgz8wcACgkQAVBC80lX
0Gwkjwf/X6w2K+lAgtQI+TYE2vNpgBUCJHxQSFR1s+2nIuIcq//PuqOeYLSMqJDI
jKeIwRDBwf8ZJQgXvxMZuvuvTzO11GNmlzFBt7a9wDT0RxWSc4MzLMcrL71/wb0u
sMUaHjAvLC1ygTMpzmyMjqehBNMH7M97AS7qE7ytRWzmeZsfwf/X32M1p7akx5BP
AtVGZmhD5BjKHf1NKbb0rcBdJPAWy8xVETS0Sba1MLEON+P2Xmi/k1bJH2Nm1S14
XTFTmrayFEVzY9R9iukNnxw73JVfLmvJSMl63yjesUkLvxklY9NA1jxaqQGkHtEg
E8lIqUGlM8jrCkQtffLFNUBwa8c03Q==
=S+Vm
-----END PGP SIGNATURE-----

--Sig_/cib8ZWXY5nrsoorTL=do+O2--

