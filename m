Return-Path: <linux-next+bounces-9100-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A46C7235B
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id A7B4F2A866
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 04:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE372F3C22;
	Thu, 20 Nov 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="meH7gzRD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144222F25F6;
	Thu, 20 Nov 2025 04:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763613995; cv=none; b=QTVuwChfuvetEXtU9N9+5k4i5ROHAY5uf2btewTneCl3gmrETUi9SysMFeocRH/mHO5X8D2W8EVBC/Xu0jLkBHSn6g/I8o7mmdglNL/xsFppDSY/lVSeK7sLn4GNJYPoaF/u3OOAG30t33UqeqLGUXNLHwr2S0mrB645WwjovM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763613995; c=relaxed/simple;
	bh=bI7EhZCqV3UGiZjfRqCJT8iIhAP0m7nbN1o2e0d+X8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H9XG9+xQ7G78VgexeeIiPIYubCd9kUtfZXc7orSXVwio6aLzUOvNUjHM26B8gRsBvQrhxT646hCMS1UoKHw1W/TqguHLEdafpJW5lLM5qdiu5e8Yzp5YiDmy5zeG8q2oFT+d2mAUssJ4s58242nQyXflVInt5fcCjgOa3t4eSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=meH7gzRD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763613989;
	bh=n+DbeTkObdUBL9WKzXG+O1Aq68R3htk9vv2Z8InJAAQ=;
	h=Date:From:To:Cc:Subject:From;
	b=meH7gzRDZk+qwkAUq5uc7h3nnVGTPcJLxOdJlOejMaok+7B1LwsX+O3bp2awFcqoH
	 GICCKSIxj9sL6oFsZNU/y9v2EH1GiCUYUuQH7Byct9lZK+OMzCOqpIwIANTYvE3Maa
	 aFajhB80HtiwBJY4LUxfKqw9KUcfbJeHbCdlZQv+887q1iUKBkFiHJ6l4GcU5BHOcf
	 7mbLeeI1ukJ2oML15W4K/cVWljE9gWeaecE9PRyl08hGKq9N/dAP55J5UaIFe3hGGT
	 AjlptgTYqVDUwKhL5Kx329d9jxYHHQ1XJUbWa5HvQa9+y3VG5oj8ZVRAX5Rn8XZRe8
	 2Cwc0xSHU8v5A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBm5d2Plwz4wH7;
	Thu, 20 Nov 2025 15:46:29 +1100 (AEDT)
Date: Thu, 20 Nov 2025 15:46:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Naveen N Rao <naveen@kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20251120154628.4811293d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XVvWHxhTNDN2+xK/xzVSHhP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XVvWHxhTNDN2+xK/xzVSHhP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  6ffdb49101f0 ("x86/cpufeatures: Add X86_FEATURE_SGX_EUPDATESVN feature fl=
ag")

from the tip tree and commits:

  5d0316e25def ("x86/cpufeatures: Add X86_FEATURE_X2AVIC_EXT")
  f6106d41ec84 ("x86/bugs: Use an x86 feature to track the MMIO Stale Data =
mitigation")
  9c6bbdaab7e6 ("Merge branch 'svm'")

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
index b6472e252491,646d2a77a2e2..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -503,7 -500,12 +504,13 @@@
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
++#define X86_FEATURE_X2AVIC_EXT		(21*32+18) /* AMD SVM x2AVIC support for =
4k vCPUs */
++#define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+19) /*
+ 						      * Clear CPU buffers before VM-Enter if the vCPU
+ 						      * can access host MMIO (ignored for all intents
+ 						      * and purposes if CLEAR_CPU_BUF_VM is set).
+ 						      */
 =20
  /*
   * BUG word(s)

--Sig_/XVvWHxhTNDN2+xK/xzVSHhP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkenSQACgkQAVBC80lX
0GwnTgf9HVMIOuCz0ITokRQ2JkArm2To/3krHr+n2vfOcuKObSQ5WEKLLXCj4K+W
yiLNwUQ5aGWr9u8HdFMBLxlPY0JRgui0GlIEApQ4jSilTaE3dAa81Zu8QwxcGDr5
lYM+SGqAbD66vuZCqPc6Wg3FhhroR5i9kkFnLruVXozwnUyRFVtxULyB6nc0zuaX
/CA+PWafbhPmIK6HGRMNTzoNeJ/pxzAOOM8fnE+Q2ma9I9oszB+WmsgtWoAleQyl
T6zDArRrcu+NW6arZoWmmfWiZ2Tn8/n3lgDob/faCwE+4AhSttDzaOC7pBcSVqiF
ada+sMBad84pDW5ENsLiEk12+wPNdg==
=DHp9
-----END PGP SIGNATURE-----

--Sig_/XVvWHxhTNDN2+xK/xzVSHhP--

