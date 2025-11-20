Return-Path: <linux-next+bounces-9101-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3E3C72373
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 05:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5C1A4E1059
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 04:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB6C24A066;
	Thu, 20 Nov 2025 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SpceywO0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8561FAC42;
	Thu, 20 Nov 2025 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763614331; cv=none; b=DNqkeE5Am9L6CDwHUItNsaw9/xYCXFTWBghsR4gDB1PX02v+oHVRvWQVDO6hvqptgIc3w6tBuvVIgsyOUThu6sG9DUWB4yIWd9AHtHrKbYNFtI3/wpGxLhjLM1Gle4Vm/wktTxmffFNk45Ga6HaxmnbDClgoVC3LaQw+LKXIxVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763614331; c=relaxed/simple;
	bh=KrLbS5NTXm/24bsXBV5X4mg+DWuaiwJD3o/4Wi/aGoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EFSIBW6FoUQUwpwAl0dVTCIBNrR1BOpWKzweUCKjjLtuCJxgOSTtGhLZu/CSdOTG3K/+/Vrpb1fOnps7DCUhyLQzNNqa065klTKNqfzpca+XHNdCp19+uqAP3mJ0tx5P3sHUS+by9rMjE29d94DaUovDMQCHGWDy6Ig/LksHxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SpceywO0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763614326;
	bh=QiN8bvBxvKEP6RzGJ5440/ml0IB8vSOxTXyG2QAo03E=;
	h=Date:From:To:Cc:Subject:From;
	b=SpceywO0eg/xGrhmpWYE8A7+ulI1en8huNe8e2oF2d+sEyCPSCGRvPbMSwYB3xo8r
	 HFpfORFqeKl/oGmJ2ibaHFbfddOEYWJE4QJQ+XT54DVIIc5TTb+Gi47QZlRerQmhZJ
	 3HQ1X2xJt3n0rne1ct7g96DL/hBuH5eDHxkzLQHi8qiz8HAp+j47CnzpBMLNZ2yxJE
	 Q0F2ELLKk9r0mqWlRPrNyrFYfTHn+5NBYlZ4/qkhW9RR8U9yUW1mw2ZonUaURb9b5X
	 lWSNAL4kUt/Jawx4w1eyeulccFTUGptitwTnApxjfD21cdpUQXw3LN7kBTCiBInS4K
	 xiTVZPevs0RnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dBmD61YZQz4wGy;
	Thu, 20 Nov 2025 15:52:06 +1100 (AEDT)
Date: Thu, 20 Nov 2025 15:52:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Elena Reshetova
 <elena.reshetova@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Naveen N Rao <naveen@kernel.org>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <20251120155205.0d145852@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ISRNmWdcgwG.5=T.FtIcejB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ISRNmWdcgwG.5=T.FtIcejB
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

--Sig_/ISRNmWdcgwG.5=T.FtIcejB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkennUACgkQAVBC80lX
0Gy9Xgf+MzKz0/Cd09+ym5GgRcuO0v7xU1IBJC6TyKDcyRyrkbPgMftwn7GjPfjb
pRGKIRoefFLENqU++t6TlN1YmavNBhIKF34u57Fjb9ZUaJMAkk31teIzmAFIBUqy
wvyOeB8JefXxQReP5Eufp2Osd4/yiaBYcoS7u/tvkiz6vQYzAdaJC2v+vx6d6yTU
mSf6pRcR1lF0xtZOlXW971UmdIuJIE66WNdDhdzwnGnEk9StNoa1tHrGn0BxyNIV
Nl71Gh84KrL2QDkjWwX9xIu7Pyj39UjNXjfUaWidGh51/7WAIhYuM/miKqbH2gqi
hnbPYg5CutlAAeZo9K5gNoTP+gyIpg==
=B4Sr
-----END PGP SIGNATURE-----

--Sig_/ISRNmWdcgwG.5=T.FtIcejB--

