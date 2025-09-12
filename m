Return-Path: <linux-next+bounces-8274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CC129B540C6
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 05:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B491E4E1127
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A033A222582;
	Fri, 12 Sep 2025 03:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="STXnSLLo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2141D90AD;
	Fri, 12 Sep 2025 03:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757646884; cv=none; b=gSKFfKdJC6eG1y4aHNxwt5ABNXoVcK0Zul/Th6rOvidB2RTkn87EIPWNUbqFQI4+Bs/B/4g0wW/ntQcg4Uerwm5vNthguLuDOi3rGA3VY7ywxqbtQ7aPZfeDLLn7R+CGUKajC4Q9M1gljm3HbK0PSTAO5C13lTNFOuBPS+ebiHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757646884; c=relaxed/simple;
	bh=ZVhuHDto+T4dWT0hmE4fGdGhNCAjZmzexsb2xh97PZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qcWkks0eazTU6K+FQZxr040khPJOEFomCVxoQ61VFwEqpw7TwuVKFmf0fc1OBdNnXNSwIi5VtbJYKhYFNHQRbBR0/SpDG6XL21Z7NNV/32OM4n/dkKnNTv2Wd2jVLULz5JWd4cgrqSPDnEh0LY0hS1Mp5YSqyByo3HTlWgAFYWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=STXnSLLo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757646880;
	bh=FvSiXxE5NbCcgF44Jl8yDOptPul0DGVdH3sq7G6UDO8=;
	h=Date:From:To:Cc:Subject:From;
	b=STXnSLLoUEO/B+r5sYQoII2xuo7HNmv7ymRTWtT6DMEfga345N/WOvDU11rp4RZDK
	 8BHRxqtikcm8unVMkbIBQY05WUcAhNJKcDZGfLdu3DxRlBd4o9diZIGnRl83ftKIMe
	 xHT/LaoL2fwxp9ak8NhmfNZD2CgwlRf0LnRPDbnEqAm1xU8OS/25ThGfTbH4vBJrKp
	 qaSg+dYLCme5S5FdzG812G9E4eUZoZjERdcefeftz3Nqzlcr7qIKX8GmplPcNAys8w
	 jn/UIRFP8ytSzZpxNZ0XbGKf8hcJrWJgQqqcJ3/JbecopDyf3Xq/oocR5er3VpWcpl
	 CovsTiX6577Gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNKKW2ZdMz4w9Y;
	Fri, 12 Sep 2025 13:14:39 +1000 (AEST)
Date: Fri, 12 Sep 2025 13:14:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Xin Li <xin@zytor.com>
Subject: linux-next: manual merge of the kvm-x86 tree with Linus' tree
Message-ID: <20250912131438.74900e88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1VU1Fs7mDwwWCM.vqb.f9VD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1VU1Fs7mDwwWCM.vqb.f9VD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  2f8f173413f1 ("x86/vmscape: Add conditional IBPB mitigation")

from Linus' tree and commit:

  3c7cb8414533 ("x86/cpufeatures: Add a CPU feature bit for MSR immediate f=
orm instructions")

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
index 751ca35386b0,8738bd783de2..000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -495,7 -496,7 +496,8 @@@
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
++#define X86_FEATURE_MSR_IMM		(21*32+15) /* MSR immediate form instruction=
s */
 =20
  /*
   * BUG word(s)

--Sig_/1VU1Fs7mDwwWCM.vqb.f9VD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDkB4ACgkQAVBC80lX
0GzQWQgAjI434Cg5k7hi7PjmU3jMWo6UYQ7LGQNiYS/Bz5ZK+Af89zAzgj20OnJv
J5FZwe57yHxIvvlktOAQh3vXgGLx2/5DnRiVIX2xNrVl/MrLZZT8/NW/DZyY1DI5
EGDpaQZI/iU7lineqClKV/fnTHteXDLk6iS2505VOjCkuY+gOgCJ9W656YXygFLG
e66FinUXVnYliXN2dIpDdVtGXvi4qt89kY+bfhPDJMeb9W9HxFg96naJQi8qj6in
uQ4oKRrM9aj+VfWvNhQxyjzdOSteWuC2MSX5Xmmal8Rj+9LjSpp0u6eH/KZf3hk4
aFgIocU277Bu/NAXbtTlhbrSHIOQ1w==
=9c5a
-----END PGP SIGNATURE-----

--Sig_/1VU1Fs7mDwwWCM.vqb.f9VD--

