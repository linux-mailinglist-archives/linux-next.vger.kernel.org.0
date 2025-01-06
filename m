Return-Path: <linux-next+bounces-5038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F4A01E6A
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87C067A16A2
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 04:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CDD84D13;
	Mon,  6 Jan 2025 04:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b/0uizUy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B18AD24;
	Mon,  6 Jan 2025 04:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736136316; cv=none; b=BNSq7h5+16Etkay6Q+c0pF2PeWkweylNod/P5FoRaWFNOV4s8anG96dPbxf6a6/M7wnFAqe+LhfzPtv+kilFR7UJR39gy+Ip8zlO2nZO/JvtFlfvhSk7wt27Ng9Wg/VMp1lsecq6KW3YLptTGoKIsXubKa/KRnvofI78VL3kOl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736136316; c=relaxed/simple;
	bh=Zqp8yyHYsC9tz6IOZIEp6VFGvhGokz2eG7+vX807Ouo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WIdsJUl+9SJfk70dmcqmaZ69gjxAqSNcuqB9xtAub3lm7kUhiB7ZZ2sEr2acGUpPVyaD9TYNkbGeEdRNLHq7KaLPRCxW1DVgOTrE2qc9hnTQASwDE5o5sz1NbzXatEkocm0bG7Z1dwGiAaLf1XJqkz9+IyPieFncV9OZ+wSYcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b/0uizUy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736136304;
	bh=4O0w2MHUqSNf6d8uUutNoqnNyrBj6k4u2OMuVsxh5S0=;
	h=Date:From:To:Cc:Subject:From;
	b=b/0uizUyE8/Tbq0VoIQ8PugmOJpjHfhZQSZ4Gi6dLE32d6Ls+2L1kO6dfGXXGgJkB
	 4vh2fcNOBbu41XaHzH22EZqA87ROrU32fwwuVXTN96NUBOH3HG1Q0gVRr7GMr00j5L
	 faIlsCc6e+613SlKXz2ZLobcXhP1vUPMp2ym2L16s7Sj4m6i9YYUxpGQteuablSLmY
	 gLntnwMnsjUQvN3AykX6p61zkV3iWYjogAjzuwxWmDqRsxImLmqQM2CAL0iyLSSDIS
	 6vamy2+5s8KoO64R8luQPhrP9QTbPrQ/bYnd4MI3n1dwnesUPKTjFTsn24wtUadSH0
	 1uS+Ig87AE/yQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRLDb6f4Pz4wyw;
	Mon,  6 Jan 2025 15:05:03 +1100 (AEDT)
Date: Mon, 6 Jan 2025 15:05:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20250106150509.19432acd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/twVQTSvpkyT/t2c9pQ2FxK1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/twVQTSvpkyT/t2c9pQ2FxK1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/kvm/cpuid.c

between commit:

  716f86b523d8 ("KVM: x86: Advertise SRSO_USER_KERNEL_NO to userspace")

from the tip tree and commits:

  ccf93de484a3 ("KVM: x86: Unpack F() CPUID feature flag macros to one flag=
 per line of code")
  3cc359ca29ad ("KVM: x86: Rename kvm_cpu_cap_mask() to kvm_cpu_cap_init()")
  75c489e12d4b ("KVM: x86: Add a macro for features that are synthesized in=
to boot_cpu_data")
  871ac338ef55 ("KVM: x86: Use only local variables (no bitmask) to init kv=
m_cpu_caps")

from the kvm-x86 tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kvm/cpuid.c
index f7e222953cab,edef30359c19..000000000000
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@@ -808,50 -1134,72 +1134,73 @@@ void kvm_set_cpu_caps(void
  	    !boot_cpu_has(X86_FEATURE_AMD_SSBD))
  		kvm_cpu_cap_set(X86_FEATURE_VIRT_SSBD);
 =20
- 	/*
- 	 * Hide all SVM features by default, SVM will set the cap bits for
- 	 * features it emulates and/or exposes for L1.
- 	 */
- 	kvm_cpu_cap_mask(CPUID_8000_000A_EDX, 0);
-=20
- 	kvm_cpu_cap_mask(CPUID_8000_001F_EAX,
- 		0 /* SME */ | 0 /* SEV */ | 0 /* VM_PAGE_FLUSH */ | 0 /* SEV_ES */ |
- 		F(SME_COHERENT));
-=20
- 	kvm_cpu_cap_mask(CPUID_8000_0021_EAX,
- 		F(NO_NESTED_DATA_BP) | F(LFENCE_RDTSC) | 0 /* SmmPgCfgLock */ |
- 		F(NULL_SEL_CLR_BASE) | F(AUTOIBRS) | 0 /* PrefetchCtlMsr */ |
- 		F(WRMSR_XX_BASE_NS) | F(SRSO_USER_KERNEL_NO)
+ 	/* All SVM features required additional vendor module enabling. */
+ 	kvm_cpu_cap_init(CPUID_8000_000A_EDX,
+ 		VENDOR_F(NPT),
+ 		VENDOR_F(VMCBCLEAN),
+ 		VENDOR_F(FLUSHBYASID),
+ 		VENDOR_F(NRIPS),
+ 		VENDOR_F(TSCRATEMSR),
+ 		VENDOR_F(V_VMSAVE_VMLOAD),
+ 		VENDOR_F(LBRV),
+ 		VENDOR_F(PAUSEFILTER),
+ 		VENDOR_F(PFTHRESHOLD),
+ 		VENDOR_F(VGIF),
+ 		VENDOR_F(VNMI),
+ 		VENDOR_F(SVME_ADDR_CHK),
  	);
 =20
- 	kvm_cpu_cap_check_and_set(X86_FEATURE_SBPB);
- 	kvm_cpu_cap_check_and_set(X86_FEATURE_IBPB_BRTYPE);
- 	kvm_cpu_cap_check_and_set(X86_FEATURE_SRSO_NO);
-=20
- 	kvm_cpu_cap_init_kvm_defined(CPUID_8000_0022_EAX,
- 		F(PERFMON_V2)
+ 	kvm_cpu_cap_init(CPUID_8000_001F_EAX,
+ 		VENDOR_F(SME),
+ 		VENDOR_F(SEV),
+ 		/* VM_PAGE_FLUSH */
+ 		VENDOR_F(SEV_ES),
+ 		F(SME_COHERENT),
+ 	);
+=20
+ 	kvm_cpu_cap_init(CPUID_8000_0021_EAX,
+ 		F(NO_NESTED_DATA_BP),
+ 		/*
+ 		 * Synthesize "LFENCE is serializing" into the AMD-defined entry
+ 		 * in KVM's supported CPUID, i.e. if the feature is reported as
+ 		 * supported by the kernel.  LFENCE_RDTSC was a Linux-defined
+ 		 * synthetic feature long before AMD joined the bandwagon, e.g.
+ 		 * LFENCE is serializing on most CPUs that support SSE2.  On
+ 		 * CPUs that don't support AMD's leaf, ANDing with the raw host
+ 		 * CPUID will drop the flags, and reporting support in AMD's
+ 		 * leaf can make it easier for userspace to detect the feature.
+ 		 */
+ 		SYNTHESIZED_F(LFENCE_RDTSC),
+ 		/* SmmPgCfgLock */
+ 		F(NULL_SEL_CLR_BASE),
+ 		F(AUTOIBRS),
+ 		EMULATED_F(NO_SMM_CTL_MSR),
+ 		/* PrefetchCtlMsr */
+ 		F(WRMSR_XX_BASE_NS),
++		F(SRSO_USER_KERNEL_NO),
+ 		SYNTHESIZED_F(SBPB),
+ 		SYNTHESIZED_F(IBPB_BRTYPE),
+ 		SYNTHESIZED_F(SRSO_NO),
+ 	);
+=20
+ 	kvm_cpu_cap_init(CPUID_8000_0022_EAX,
+ 		F(PERFMON_V2),
  	);
 =20
- 	/*
- 	 * Synthesize "LFENCE is serializing" into the AMD-defined entry in
- 	 * KVM's supported CPUID if the feature is reported as supported by the
- 	 * kernel.  LFENCE_RDTSC was a Linux-defined synthetic feature long
- 	 * before AMD joined the bandwagon, e.g. LFENCE is serializing on most
- 	 * CPUs that support SSE2.  On CPUs that don't support AMD's leaf,
- 	 * kvm_cpu_cap_mask() will unfortunately drop the flag due to ANDing
- 	 * the mask with the raw host CPUID, and reporting support in AMD's
- 	 * leaf can make it easier for userspace to detect the feature.
- 	 */
- 	if (cpu_feature_enabled(X86_FEATURE_LFENCE_RDTSC))
- 		kvm_cpu_cap_set(X86_FEATURE_LFENCE_RDTSC);
  	if (!static_cpu_has_bug(X86_BUG_NULL_SEG))
  		kvm_cpu_cap_set(X86_FEATURE_NULL_SEL_CLR_BASE);
- 	kvm_cpu_cap_set(X86_FEATURE_NO_SMM_CTL_MSR);
 =20
- 	kvm_cpu_cap_mask(CPUID_C000_0001_EDX,
- 		F(XSTORE) | F(XSTORE_EN) | F(XCRYPT) | F(XCRYPT_EN) |
- 		F(ACE2) | F(ACE2_EN) | F(PHE) | F(PHE_EN) |
- 		F(PMM) | F(PMM_EN)
+ 	kvm_cpu_cap_init(CPUID_C000_0001_EDX,
+ 		F(XSTORE),
+ 		F(XSTORE_EN),
+ 		F(XCRYPT),
+ 		F(XCRYPT_EN),
+ 		F(ACE2),
+ 		F(ACE2_EN),
+ 		F(PHE),
+ 		F(PHE_EN),
+ 		F(PMM),
+ 		F(PMM_EN),
  	);
 =20
  	/*

--Sig_/twVQTSvpkyT/t2c9pQ2FxK1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7VnUACgkQAVBC80lX
0Gz0dwgApfPvvifylo6y/3S9WZSjM6tl+NU0gSSU8R9AzAvJN2Xcg4fSO+PYerUg
GpdgKrCFPnRdNiDmORcnVT6oRzNgzggQiZm0Y37DWP8yCaHKSkC69iWYm5GnU6Ma
MkPFkhfkQ0R6IsSUMPAyrx2JmaFxOBrlm+Ly9g0DrLbB9Wif/vOI0PmDeB7YTHx9
LJSr1TlV9V2kYugydBLz633WJQ1SbOxYxIFx7ZC1q/sq1E94V1YSe4vSzIKaGsum
AwjWntGRJGMOgmVVUVu+idtznXygtfDV4HkDjsb/JO4puK2e5aY+OLFpWVQSTSNX
YIYFEyh3wNtxB3mGTzfNKqXMP1gdgw==
=sqRe
-----END PGP SIGNATURE-----

--Sig_/twVQTSvpkyT/t2c9pQ2FxK1--

