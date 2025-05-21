Return-Path: <linux-next+bounces-6868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAB0ABEA1F
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 05:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C69637A742B
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 02:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A374221568;
	Wed, 21 May 2025 02:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bzlaJ2oP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D749933993;
	Wed, 21 May 2025 02:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747796394; cv=none; b=DZIVnem0TlpHOo2wCVuKkwkDDNGfil7D2Gd8oke66VUhfzJLAOT4GqA6SOLzOE2x1QlHfVRr2eZrUazQ/WFb78GPwPRXSN8qaMSYOECnVuvx+P4tEjbKZaagBLKgYh1Gpqm/9AaBlEA8AhBAbKZ3EWrROf9axQWb3EC1WmievVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747796394; c=relaxed/simple;
	bh=DWnTpUcVS9gEwUqlWPLX5iGaBOT6uUwgAc58sofILkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l6eFb1TlOzW23KHWBH897qjDrWpmOtnSFK4djLx8yCY5TDs5qBcz6axHibP4SO1o1Wf5LVTuwA+dCzH89Nj26XEKruESwdRAwC+Wi1thwvh8gIqXwm3dIcw2ddcPor/5F5oc0DvXGm8AsiFCCbShFd0ShjCias4/8i61Bsy/Xws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bzlaJ2oP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747796387;
	bh=B77FrxfdcIdIw47gVoeltLsReyoXVDKLk0E1A7BBxrU=;
	h=Date:From:To:Cc:Subject:From;
	b=bzlaJ2oP5BXQ2AfT3b9oXXTRUS/a1OsYPNdJH7mr2TD9YVbxnrn9HFW1uZ0wsrRQw
	 4rfLmsg+YoUpl1yV6CIlqP02In+wAYQvaZtaZXmN0u5KyoxbUpMUipDATTMHD71YIo
	 9Y+1DMsmw8ypw2uDzFC09FqAI5ok+8ZLiDGizuSYtWVFTT/A2aPkDZS1ZslsS9dg1/
	 IUPXrVEKqpuV43SmLhEOCVWa/N/tUga//lB0d6waixmoaHAdE9Gi/EQxNUaTBZ4qWM
	 jGfD2hc5DD+dNcSnRUL7aSqj3BjbnFVeelBro1wS7Dl4wRFJRHraFmrF3suXOVOSS+
	 Zs83Vn2fasnCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2GNz4t99z4xTx;
	Wed, 21 May 2025 12:59:47 +1000 (AEST)
Date: Wed, 21 May 2025 12:59:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, Andreas Hindborg
 <a.hindborg@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the cpufreq-arm tree with the configfs
 tree
Message-ID: <20250521125946.664a79c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H48+ronUthA5v_h_EE3BDT2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H48+ronUthA5v_h_EE3BDT2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpufreq-arm tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  446cafc295bf ("rust: configfs: introduce rust support for configfs")

from the configfs tree and commits:

  8961b8cb3099 ("rust: cpumask: Add initial abstractions")
  d01d70205601 ("rust: clk: Add initial abstractions")
  3accb57d56a9 ("rust: cpu: Add from_cpu()")
  2207856ff0bc ("rust: cpufreq: Add initial abstractions for cpufreq framew=
ork")

from the cpufreq-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/kernel/lib.rs
index 354eb1605194,133ebee4f9d3..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -42,8 -42,11 +42,13 @@@ pub mod alloc
  pub mod block;
  #[doc(hidden)]
  pub mod build_assert;
+ pub mod clk;
 +#[cfg(CONFIG_CONFIGFS_FS)]
 +pub mod configfs;
+ pub mod cpu;
+ #[cfg(CONFIG_CPU_FREQ)]
+ pub mod cpufreq;
+ pub mod cpumask;
  pub mod cred;
  pub mod device;
  pub mod device_id;

--Sig_/H48+ronUthA5v_h_EE3BDT2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtQaIACgkQAVBC80lX
0GzHXwf9HJfIeoKogbwE8fPjcKrbYEx7b1n1T5tmQFAHE2S6lLg5klKYiiDzkmBh
YZJ7/jVFkp66ZjYbJf1LpomoWib/QBbOArD7TAtLx14BfnI9uejKM3p7rKRFpSsp
WdT51GBJYUPNuWD3Sard1T/8qvybvl7MFK2PJ2MfsVFXKk0pw9GRDJChzSySUEQl
NFY3CTUdhYyqYqx3eXSiIFMtY/GbuI+Oap+ojN9aobGAeikD7xFWy0Gd2mSCqDXK
K+M37Bm4T5SX6yPR7nswLeFIUrn0h0YbMvYgwGRAb1mUYR6W5yXbrS4Ogxuk35ll
FcTe2ZdMbw5YaEVjvYKvJ9QVKet5cQ==
=7T/M
-----END PGP SIGNATURE-----

--Sig_/H48+ronUthA5v_h_EE3BDT2--

