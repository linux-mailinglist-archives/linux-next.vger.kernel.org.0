Return-Path: <linux-next+bounces-9198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9237FC835E4
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 06:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13B93AEDD3
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 05:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1200021D3EA;
	Tue, 25 Nov 2025 05:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M0KQYGzX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7346D125A9;
	Tue, 25 Nov 2025 04:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764046800; cv=none; b=TzUnFArbwSzFboe5yxck4Cs34wi/pbHyVz5SO4DGCr4DFWZGy/qlHMJVUL3D9yJyeiZ8xTAQmcluGtY2cc0OltG6ncMWZbqCKa1+OG/RqhJxFUT0z6QAAEKkImRmncTQ88bsx//m3Nby0x6FP6HuazKt+8tnzX/19+UzkjQjsz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764046800; c=relaxed/simple;
	bh=OhuxDEoUW6xVt24AbD/cF9OipxHXT+qGAAd4GLuelao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X8EXIkB+0aoucL8ZOVHfXWz2Dg6B9jT2uF+DIS/agcYCGIwpvoW7jbHsl56j3OqJJXkqd51iAemOhLTVXCav7y0Rm2KiSBt0RjVc3iv6fKUVDDEndMPUGOTYmpEyliMMo1DURZLK8c11Wv+TC28CJgoUhOs2mpFhzmKpq/WLlrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M0KQYGzX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764046795;
	bh=AVvDb7lLX/MV5XPcvVDrRuo2BkqDdluBwQgxVFt7ynI=;
	h=Date:From:To:Cc:Subject:From;
	b=M0KQYGzXu+ifJNwKBLVHpMQIqaqJ9m7zW1+b/dE0i1ihEbkCHXo76wi5Ev5oTD7IJ
	 Lmg+/8ccg1uA50SCH1RbjeBrly2mEFsJPRCv2/NddTUu7JxhKvwXVVSd5JdgKCfQk7
	 GhoZcCtFUtaAZvpYb6WLTiO4ZafmGrneY4x0kzkv+rmZUU6a/VcjfEMfaE0jmJushL
	 UGqvJ44NlsCzeaIE1rvYFXCbBQJQaVpiK7IkG+gDNT6bHJ151Iy4HT1UHHyUmQqkY3
	 N0TlpVRZ++gzmJ8I2TvhGVdtGvX2TH8SaIfujSSUwm+IIP8F7Tb7/zABOW9MCeYBJb
	 o/VD6Y5z+sp/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFr8n6lcMz4w1g;
	Tue, 25 Nov 2025 15:59:53 +1100 (AEDT)
Date: Tue, 25 Nov 2025 15:59:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Babu Moger <babu.moger@amd.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Naveen N Rao (AMD)" <naveen@kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20251125155953.01b486f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pr1Q4e/t_c+K8gV/YTJaXZ9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pr1Q4e/t_c+K8gV/YTJaXZ9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commits:

  6ffdb49101f0 ("x86/cpufeatures: Add X86_FEATURE_SGX_EUPDATESVN feature fl=
ag")
  3767def18f4c ("x86/cpufeatures: Add support for L3 Smart Data Cache Injec=
tion Allocation Enforcement")

from the tip tree and commits:

  5d0316e25def ("x86/cpufeatures: Add X86_FEATURE_X2AVIC_EXT")
  f6106d41ec84 ("x86/bugs: Use an x86 feature to track the MMIO Stale Data =
mitigation")

from the kvm-x86 tree.

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
index d90ce601917c,646d2a77a2e2..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -503,9 -500,12 +504,15 @@@
  #define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-u=
serspace, see VMSCAPE bug */
  #define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring C=
ounters */
  #define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instruction=
s */
 -#define X86_FEATURE_X2AVIC_EXT		(21*32+17) /* AMD SVM x2AVIC support for =
4k vCPUs */
 -#define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+18) /*
 +#define X86_FEATURE_SGX_EUPDATESVN	(21*32+17) /* Support for ENCLS[EUPDAT=
ESVN] instruction */
 +
 +#define X86_FEATURE_SDCIAE		(21*32+18) /* L3 Smart Data Cache Injection A=
llocation Enforcement */
++#define X86_FEATURE_X2AVIC_EXT		(21*32+19) /* AMD SVM x2AVIC support for =
4k vCPUs */
++#define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+20) /*
+ 						      * Clear CPU buffers before VM-Enter if the vCPU
+ 						      * can access host MMIO (ignored for all intents
+ 						      * and purposes if CLEAR_CPU_BUF_VM is set).
+ 						      */
 =20
  /*
   * BUG word(s)

--Sig_/Pr1Q4e/t_c+K8gV/YTJaXZ9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklN8kACgkQAVBC80lX
0GwKvQgAgLupKHO+vyDoojl+JTgc1I7nd+MY59m1DpCjJvkHpS4kukRRl8jXarjC
qbiESASDBh6oUVrHtu70CbYCT1Iw5O2mFk7YItNckfTfeGTTcp4GHOMIMPcwNbWf
WZCjZZFHF3F6V60WctB4/gQb8LLq9Yp4gOPFYpOYY1JYz5MPM5HJnSHcPzMFm30a
XIPHts+YozQNw8BE7E1173H96ANcwnHiwbGUvE78r1fBGnhX0xocK2G//kSUR1vJ
x1hY58aL/0ryRmhqDtAgR/BgeMAln0n9vB7OOsayAQrZ0Kz0DAvkxqTN8bgXzbpJ
Dv2cRt+DFYj2dQUyAdSlbMqO9fvRFQ==
=knFf
-----END PGP SIGNATURE-----

--Sig_/Pr1Q4e/t_c+K8gV/YTJaXZ9--

