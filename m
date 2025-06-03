Return-Path: <linux-next+bounces-7008-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974FBACBE00
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 02:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CAE616E5A5
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 00:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C90918E1F;
	Tue,  3 Jun 2025 00:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nW4f7Mky"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822653D69;
	Tue,  3 Jun 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748911579; cv=none; b=fGhF8s3frWI0/L17KznxC5N2tebGulOVJ++fqO/LWvmyzW3YYwarH82cxO5As+WWbWOBwo2TWFDLJMVLGUQ4aE9nf5V3U+YOfVHkBYFgZ8c7/y4etvP32dQ+Vk8xtEfFMphmBFKfZaFknaeqrCbxMHqugJE7rlnit/D+osxR3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748911579; c=relaxed/simple;
	bh=1tR8/wB1zKboTJWd2RDzMsGRNx+Cphe6eUAfMGQVnV4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUpq5muh6CQrqSpuj2NfsV77e/uVDOks2vbMUiuWPU8TafIq9XhwVnAXMeSk0GGEl34GD3FkqI33UWqsy3plzo1d2MlIi2VCWK6PL0I/V6OX9hlPW0FQCTzVdcjiilv7kErOcMRwNhwy/JfAYlYw/0M/cFMZMVZyhSh+2rjf5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nW4f7Mky; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748911572;
	bh=cv2VpyTzKzyu1TBNw4wtq5j4reqO5VDeYWqjYf6jIYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nW4f7MkyeaTTqMbArZcNtO2U7p/PGc+cXUDDkRdPeGQMc1lNg2uNj/LtqY9Jd6/5R
	 2Xxh2LrcSWefzVK4d3P1M+yrms9nR/IoZImJDFORzdhdlNTs/nftldoyW11AElc7Ua
	 yoIctoroYT8Py6GBHGCSiqJr2elxm7lSj6WJj0AhOwg5gGJz942b76vhFl91HklCc/
	 KZ4N+NslqVMmplX3jzMExEu7uCw9wM3HhD3GtWNIxPCOzV53Ec2Y7qEhamc565k3Xe
	 1+beMI/s7ON4d0sQiMKawzczAnanpDCQ2i06XgBwYy+eLavhIv50wNShtUXUifKJFG
	 0pWIfzPpVqPxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBBpp4tp9z4xMy;
	Tue,  3 Jun 2025 10:46:10 +1000 (AEST)
Date: Tue, 3 Jun 2025 10:46:09 +1000
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
Message-ID: <20250603104609.37e00497@canb.auug.org.au>
In-Reply-To: <20250528103418.3da40a9f@canb.auug.org.au>
References: <20250526145015.615882b0@canb.auug.org.au>
	<20250528103418.3da40a9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m6I/Ewqt6nRqaxI4V/=__ha";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m6I/Ewqt6nRqaxI4V/=__ha
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 May 2025 10:34:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 26 May 2025 14:50:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > Today's linux-next merge of the tip tree got a conflict in:
> >=20
> >   tools/arch/x86/include/asm/cpufeatures.h
> >=20
> > between commit:
> >=20
> >   444f03645f14 ("tools headers x86 cpufeatures: Sync with the kernel so=
urces to pick ZEN6 and Indirect Target Selection (ITS) bits")
> >=20
> > from the perf tree and commits:
> >=20
> >   282cc5b67623 ("x86/cpufeatures: Clean up formatting")
> >   13327fada7ff ("x86/cpufeatures: Shorten X86_FEATURE_CLEAR_BHB_LOOP_ON=
_VMEXIT")
> >   3aba0b40cacd ("x86/cpufeatures: Shorten X86_FEATURE_AMD_HETEROGENEOUS=
_CORES")
> >=20
> > from the tip tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> >=20
> > diff --cc tools/arch/x86/include/asm/cpufeatures.h
> > index 30144ef9ef02,bc81b9d1aeca..000000000000
> > --- a/tools/arch/x86/include/asm/cpufeatures.h
> > +++ b/tools/arch/x86/include/asm/cpufeatures.h
> > @@@ -476,12 -476,11 +476,12 @@@
> >   #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history=
 at syscall entry using SW loop */
> >   #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control avai=
lable */
> >   #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control e=
nabled */
> > - #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear bran=
ch history at vmexit using SW loop */
> > - #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
> > - #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogene=
ous Core Topology */
> > - #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classi=
fication */
> > - #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers du=
e to downclocking */
> > - #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32 + 9) /* Use thunk for i=
ndirect branches in lower half of cacheline */
> > + #define X86_FEATURE_CLEAR_BHB_VMEXIT	(21*32+ 4) /* Clear branch histo=
ry at vmexit using SW loop */
> > + #define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
> > + #define X86_FEATURE_AMD_HTR_CORES	(21*32+ 6) /* Heterogeneous Core To=
pology */
> > + #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classif=
ication */
> > + #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due=
 to downclocking */
> > ++#define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+ 9) /* Use thunk for in=
direct branches in lower half of cacheline */
> >  =20
> >   /*
> >    * BUG word(s)
> > @@@ -528,12 -527,10 +528,12 @@@
> >   #define X86_BUG_TDX_PW_MCE		X86_BUG(31) /* "tdx_pw_mce" CPU may incur=
 #MC if non-TD software does partial write to TDX private memory */
> >  =20
> >   /* BUG word 2 */
> > - #define X86_BUG_SRSO			X86_BUG(1*32 + 0) /* "srso" AMD SRSO bug */
> > - #define X86_BUG_DIV0			X86_BUG(1*32 + 1) /* "div0" AMD DIV0 speculati=
on bug */
> > - #define X86_BUG_RFDS			X86_BUG(1*32 + 2) /* "rfds" CPU is vulnerable =
to Register File Data Sampling */
> > - #define X86_BUG_BHI			X86_BUG(1*32 + 3) /* "bhi" CPU is affected by B=
ranch History Injection */
> > - #define X86_BUG_IBPB_NO_RET	   	X86_BUG(1*32 + 4) /* "ibpb_no_ret" IB=
PB omits return target predictions */
> > - #define X86_BUG_SPECTRE_V2_USER		X86_BUG(1*32 + 5) /* "spectre_v2_use=
r" CPU is affected by Spectre variant 2 attack between user processes */
> > - #define X86_BUG_ITS			X86_BUG(1*32 + 6) /* "its" CPU is affected by I=
ndirect Target Selection */
> > - #define X86_BUG_ITS_NATIVE_ONLY		X86_BUG(1*32 + 7) /* "its_native_onl=
y" CPU is affected by ITS, VMX is not affected */
> > + #define X86_BUG_SRSO			X86_BUG( 1*32+ 0) /* "srso" AMD SRSO bug */
> > + #define X86_BUG_DIV0			X86_BUG( 1*32+ 1) /* "div0" AMD DIV0 speculati=
on bug */
> > + #define X86_BUG_RFDS			X86_BUG( 1*32+ 2) /* "rfds" CPU is vulnerable =
to Register File Data Sampling */
> > + #define X86_BUG_BHI			X86_BUG( 1*32+ 3) /* "bhi" CPU is affected by B=
ranch History Injection */
> > + #define X86_BUG_IBPB_NO_RET		X86_BUG( 1*32+ 4) /* "ibpb_no_ret" IBPB =
omits return target predictions */
> > + #define X86_BUG_SPECTRE_V2_USER		X86_BUG( 1*32+ 5) /* "spectre_v2_use=
r" CPU is affected by Spectre variant 2 attack between user processes */
> > ++#define X86_BUG_ITS			X86_BUG( 1*32+ 6) /* "its" CPU is affected by I=
ndirect Target Selection */
> > ++#define X86_BUG_ITS_NATIVE_ONLY		X86_BUG( 1*32+ 7) /* "its_native_onl=
y" CPU is affected by ITS, VMX is not affected */
> >   #endif /* _ASM_X86_CPUFEATURES_H */ =20
>=20
> This is now a conflict between the perf tree and Linus' tree.

This is now a conflict between the perf-current tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/m6I/Ewqt6nRqaxI4V/=__ha
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+RdEACgkQAVBC80lX
0Gyfywf/SNY4KZ8IDAYNj7NXWgyNMu+vnqTFFRPQcjCtzjEMpOi6FhBXNjBRPpB8
6oW8nZaGsSddDeDkh25wFbFSynhUrbDzJx4W1eEHQ2YbxBWX5UvGGj8Cwhs5roYC
AnLuWskZ27XqIR/4nXWqQ/KJJDjMgK0YSAK+2DQ4XcD1gceH/jiBXB2uw6v66Ghv
EOc7PT2gAk9mPbkdKK+DY8FQI0uYHVLKT2g2PgxXK4w9A/0ysBJoQjlc6BLzIuEx
FwARPbEtzvc1dHkxybJhF1jcVEDuiIeBtfJhUGxSJrL1py6jPpzkxCWcsOp1zx8E
u2WC6lYXi5GWHTQve+q3ZLRyoimRjw==
=sFwR
-----END PGP SIGNATURE-----

--Sig_/m6I/Ewqt6nRqaxI4V/=__ha--

