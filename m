Return-Path: <linux-next+bounces-6946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 868FEAC5E5D
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 02:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42F7F162CC1
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 00:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C688227453;
	Wed, 28 May 2025 00:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PP0t7Rt/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952E7FD;
	Wed, 28 May 2025 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748392468; cv=none; b=IhM0MfIYDT9oU/BtxeO+hGqtvKi7LwAzUGBBKWHRFr5hV7YLwgGyrQiyaYMm0+UJpfIAnHlF2pZf68wF0Pbq/TRNNjyrtB2nDIoPAfdSCR1YgwlXCwOJxkncogkPLeFARSNbptf88oi3r0emqt3YhvIJspoPdR72iNjQGHpK5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748392468; c=relaxed/simple;
	bh=5GFXSpEpeLWoYhHZ+j305dRuuPCeQzQJoy+Dw/dgqFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cz7v4gAfUBoPgmpML8xQaqOsGbz3kQfp9TxBGTJGQvjlkwapNr+yyAzqsHC6XScJfrsIaZnYjeStfFrNTatkcefswFzgB7vKNkOb0/GtOUdhSY77dor9dd27T/+P3joIZ/BgFICR92cWrN1qXtK7vxMBGXP/PjWxEA0CVfuMcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PP0t7Rt/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748392461;
	bh=s4UQYV+JONCHyeFoPV4H4ondPwl2BoLxFk9H8Jsm8Ls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PP0t7Rt/rXrOtYPN+7/12ni6DAQbZ0weq3A+kXvD7fcUE6Kr3FK78wblwt+4AK8wX
	 Y7ApxBXE3xW4U+EdaPtFco80NFhYhqwjmFXdEznvKCEaPkRKoUn+t7JTdoLTc++15b
	 PBGD6d41F5bIXxq7fC0BjGlRnshjKCyGGoFBl0kYu3MOcg0jdLaid1PG0y4f77/cq9
	 Oq9dOhmA2dEM7WZao7SPNfOE+fyiRiF1yyqr3D/yolQTKJmwVEQJe89RI9UEbzJkDa
	 WKpd8gYhWsvljmbFml5IYUdP26+bl5SB5IsSp16MS4YHsmDzncLgOWUVPgq639Mq2g
	 Rr8PULQeA9RBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6Vqv5C7yz4wbR;
	Wed, 28 May 2025 10:34:19 +1000 (AEST)
Date: Wed, 28 May 2025 10:34:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, "Borislav Petkov (AMD)"
 <bp@alien8.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, "Xin Li (Intel)"
 <xin@zytor.com>
Subject: Re: linux-next: manual merge of the tip tree with the perf tree
Message-ID: <20250528103418.3da40a9f@canb.auug.org.au>
In-Reply-To: <20250526145015.615882b0@canb.auug.org.au>
References: <20250526145015.615882b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Iz1AJZkvEwYVeSR_NVfxk08";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Iz1AJZkvEwYVeSR_NVfxk08
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 26 May 2025 14:50:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   tools/arch/x86/include/asm/cpufeatures.h
>=20
> between commit:
>=20
>   444f03645f14 ("tools headers x86 cpufeatures: Sync with the kernel sour=
ces to pick ZEN6 and Indirect Target Selection (ITS) bits")
>=20
> from the perf tree and commits:
>=20
>   282cc5b67623 ("x86/cpufeatures: Clean up formatting")
>   13327fada7ff ("x86/cpufeatures: Shorten X86_FEATURE_CLEAR_BHB_LOOP_ON_V=
MEXIT")
>   3aba0b40cacd ("x86/cpufeatures: Shorten X86_FEATURE_AMD_HETEROGENEOUS_C=
ORES")
>=20
> from the tip tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc tools/arch/x86/include/asm/cpufeatures.h
> index 30144ef9ef02,bc81b9d1aeca..000000000000
> --- a/tools/arch/x86/include/asm/cpufeatures.h
> +++ b/tools/arch/x86/include/asm/cpufeatures.h
> @@@ -476,12 -476,11 +476,12 @@@
>   #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history a=
t syscall entry using SW loop */
>   #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control availa=
ble */
>   #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control ena=
bled */
> - #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch=
 history at vmexit using SW loop */
> - #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
> - #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneou=
s Core Topology */
> - #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classifi=
cation */
> - #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due =
to downclocking */
> - #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32 + 9) /* Use thunk for ind=
irect branches in lower half of cacheline */
> + #define X86_FEATURE_CLEAR_BHB_VMEXIT	(21*32+ 4) /* Clear branch history=
 at vmexit using SW loop */
> + #define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
> + #define X86_FEATURE_AMD_HTR_CORES	(21*32+ 6) /* Heterogeneous Core Topo=
logy */
> + #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classific=
ation */
> + #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due t=
o downclocking */
> ++#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+ 9) /* Use thunk for indi=
rect branches in lower half of cacheline */
>  =20
>   /*
>    * BUG word(s)
> @@@ -528,12 -527,10 +528,12 @@@
>   #define X86_BUG_TDX_PW_MCE		X86_BUG(31) /* "tdx_pw_mce" CPU may incur #=
MC if non-TD software does partial write to TDX private memory */
>  =20
>   /* BUG word 2 */
> - #define X86_BUG_SRSO			X86_BUG(1*32 + 0) /* "srso" AMD SRSO bug */
> - #define X86_BUG_DIV0			X86_BUG(1*32 + 1) /* "div0" AMD DIV0 speculation=
 bug */
> - #define X86_BUG_RFDS			X86_BUG(1*32 + 2) /* "rfds" CPU is vulnerable to=
 Register File Data Sampling */
> - #define X86_BUG_BHI			X86_BUG(1*32 + 3) /* "bhi" CPU is affected by Bra=
nch History Injection */
> - #define X86_BUG_IBPB_NO_RET	   	X86_BUG(1*32 + 4) /* "ibpb_no_ret" IBPB=
 omits return target predictions */
> - #define X86_BUG_SPECTRE_V2_USER		X86_BUG(1*32 + 5) /* "spectre_v2_user"=
 CPU is affected by Spectre variant 2 attack between user processes */
> - #define X86_BUG_ITS			X86_BUG(1*32 + 6) /* "its" CPU is affected by Ind=
irect Target Selection */
> - #define X86_BUG_ITS_NATIVE_ONLY		X86_BUG(1*32 + 7) /* "its_native_only"=
 CPU is affected by ITS, VMX is not affected */
> + #define X86_BUG_SRSO			X86_BUG( 1*32+ 0) /* "srso" AMD SRSO bug */
> + #define X86_BUG_DIV0			X86_BUG( 1*32+ 1) /* "div0" AMD DIV0 speculation=
 bug */
> + #define X86_BUG_RFDS			X86_BUG( 1*32+ 2) /* "rfds" CPU is vulnerable to=
 Register File Data Sampling */
> + #define X86_BUG_BHI			X86_BUG( 1*32+ 3) /* "bhi" CPU is affected by Bra=
nch History Injection */
> + #define X86_BUG_IBPB_NO_RET		X86_BUG( 1*32+ 4) /* "ibpb_no_ret" IBPB om=
its return target predictions */
> + #define X86_BUG_SPECTRE_V2_USER		X86_BUG( 1*32+ 5) /* "spectre_v2_user"=
 CPU is affected by Spectre variant 2 attack between user processes */
> ++#define X86_BUG_ITS			X86_BUG( 1*32+ 6) /* "its" CPU is affected by Ind=
irect Target Selection */
> ++#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 7) /* "its_native_only"=
 CPU is affected by ITS, VMX is not affected */
>   #endif /* _ASM_X86_CPUFEATURES_H */

This is now a conflict between the perf tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Iz1AJZkvEwYVeSR_NVfxk08
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2WgoACgkQAVBC80lX
0GzjBAf/SIBivpLtckusWHRUg4dGzoNKRVutPTrpW+EyReZUiGZh+zIBkt2Uoycm
nnmFHR7Bncbodne3sXyexnXiEHJqk5EMNtYldlM4CT/c6ZNWv13Cy8ZrmaV4azNu
nXfz4EOHSLeIf4LCKf8JK0DcItL35Ew5ozVlyNp0nVyk55qdbZnb9gDYuIWfRXVd
97fTbLW1XaQp+SPTHvL3kim6Ro0KDFu/QhzNJg2oMz8BujzxSm8jsoFu2dRn5VsB
nxRVsXK+edxVRxmQdu1YM7XM/g1nrQW1uurcfRBVZ78CbBPyDOlUlcUljFy7rffH
l1yB9gRCE0JoITylk+JuUnv+bIbs0w==
=saWL
-----END PGP SIGNATURE-----

--Sig_/Iz1AJZkvEwYVeSR_NVfxk08--

