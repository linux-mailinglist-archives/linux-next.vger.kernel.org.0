Return-Path: <linux-next+bounces-6480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07054AA5A19
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 05:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B094C62B7
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 03:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D081EB1A9;
	Thu,  1 May 2025 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fKIgAsS2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A946E1EA7FF;
	Thu,  1 May 2025 03:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746071921; cv=none; b=Dbe4pfcHDkbbWpzMa7zqzForI6t97DUGTh2+bGad3circqPi9qlgRplDRQVlJg05ZIuVEmqR3DCKTJ8UJ8Ch/mEVTJEA8DPa1Xi1HiX3Ne419M/16avZ8uHXyG2ZrpaA4zuUluCK36pUixYldoZolbbmkz7zgOUEAwFGs56wPZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746071921; c=relaxed/simple;
	bh=G2aJ3pAbgLg5NHkEUdxI0e6wMcaBaf0HBWVsr9BnEks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sYCuUQKW/XRoW0sS3B4MbiwVGOjNhwX7dquBDMWVNT7UvazE3vPv2uv/FFBL+tRpXape/CWjSaL4qtIsE2RRF5hZ+d0+Zpmrdi4HNwrgPA59bQN4km+ffIGLNKfVyGuvaqlqqsapx7lsGZe1Q978qKfamtQWIJaEkN34oOkVh18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fKIgAsS2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746071912;
	bh=4n11SxoWN0YILonn/vSdJNJ6QM9m2hutHhrMAwj0avE=;
	h=Date:From:To:Cc:Subject:From;
	b=fKIgAsS2Oxnr7oRq0yLcqDOegGofhFteL0CLFYuHgqzG9ZDVc/qGvlJ2WpcrUuYB/
	 kEZqiNECFVSetGxYCl5GxGYWXh0R37SDtTCPBGxjOx88BT2nu7bOXimloSmOzbeWWf
	 9vmvUr5ivWfzbBOM2gmgxQrYl/ozXQOuz7d5dd9yT6F+8Cdyos+gx2aJ0oTDYlyVFZ
	 gWnSZFSpe1Jt41IYgswA7bZLxR0JCzegXn6k8Q3du177iu88AFafjVFSTFHfc9+Ums
	 LvjSKKuAwGakV1Ngrl+icgWgWVdcejd9dDKjzFvjBVR/x3RAOzZx5IbHU9CE0Lb23R
	 geeFtsB+Uw2zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zp0dy5rpzz4wyR;
	Thu,  1 May 2025 13:58:30 +1000 (AEST)
Date: Thu, 1 May 2025 13:58:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <20250501135827.214fac1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QK4ZxLifvzrnrQVIqsgEjSA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QK4ZxLifvzrnrQVIqsgEjSA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/cpufreq/intel_pstate.c

between commit:

  ac4e04d9e378 ("cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode=
")

from the pm tree and commit:

  c435e608cf59 ("x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'")

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

diff --cc drivers/cpufreq/intel_pstate.c
index 25830e5d76e8,2fc619ba6309..000000000000
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@@ -598,10 -598,7 +598,10 @@@ static bool turbo_is_disabled(void
  {
  	u64 misc_en;
 =20
 +	if (!cpu_feature_enabled(X86_FEATURE_IDA))
 +		return true;
 +
- 	rdmsrl(MSR_IA32_MISC_ENABLE, misc_en);
+ 	rdmsrq(MSR_IA32_MISC_ENABLE, misc_en);
 =20
  	return !!(misc_en & MSR_IA32_MISC_ENABLE_TURBO_DISABLE);
  }

--Sig_/QK4ZxLifvzrnrQVIqsgEjSA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgS8WMACgkQAVBC80lX
0GwqQQgAji7W2d/lW1dfKsKfDPnBPWidJohW3z41s1EIRI9+FudLVKZJXd9pxJWW
mZYIT00s8Xgz0mt2Vlv87MU2tFanXh/e+3v7ojVgeGhrM/NeXcwM0+cfyIpuj/m2
Jvnx8PTlBg4U3/iSiYifAorXERvmbK6gangInEWNJ0xkp0cV9ls7KVRn2zG2/kTo
vLxsdYVgVSA47mcD3RKVVONQJJYqDiIphmY6lFQ7E0kYUCyjYLjegPDObMiHUcwG
rfnRJP5lQOfstULzPNtuG9/9Rsu8wzrh6GCa2cxxo/eFXWSUGyb7sF5hzfGK3V4P
zi5RT7suqEuopCKW6o+eg4PHw3J7Qw==
=sh4e
-----END PGP SIGNATURE-----

--Sig_/QK4ZxLifvzrnrQVIqsgEjSA--

