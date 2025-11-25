Return-Path: <linux-next+bounces-9199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1DC83614
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 06:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D5534E059D
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 05:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D5421ADB7;
	Tue, 25 Nov 2025 05:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ITUWrZ3e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE941DF25C;
	Tue, 25 Nov 2025 05:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764047725; cv=none; b=sUwnepTKdKPR6xO60q0MRNYwshZWW5tGQuwXmfxtprZfRdthBKTwo0IUCwejeoVvMESvIiQ5NmcwUI35SPlUucD7HBQOH0ZQRouFCahm+X6V24nFLSDN5+X+mh1idFKOlLm+Q1UDi1wFcywkgZ6mH9rXfhQnQND6E2jIyesIbJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764047725; c=relaxed/simple;
	bh=7WI9YGAFBiDhBREYK5Ns7bEFDa3hqB0d0sGekj6TdUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pN2gJSLUZxpA5AJVBZN26nIKcRistoEbQY6lgFqtwNQTdRAhN6ZamiioebgYzORAtdj+gaQ6hEluKGv4yK3ITL2fBVtrnBZXmzzpukuIFOMlSkh7mqd8KLMxlmbB2pw2g9C35098/TaFnosW2XI++8T3JjLB1sOUrnlcfxng1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ITUWrZ3e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764047719;
	bh=wHv3igoB3K8m80v9c9JjClPAu+idtsquoiuYMb/OXlQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ITUWrZ3eNCnPI5umq2mqJey7NzS3NR964Dj+hWxBnPhlCu3RHYte7gi19KGcSv/av
	 +5B3fMKeFJgfJKQjEnDAWvTWTrButi5c5QRw8Z01EQprLVEMq4z1QH416sCO2C+LPi
	 0nz85gCnMdkjClK/a7XvurIcWXBIlEWvY8TgDG1qtq2gI70H8Mhp1Rg3m1NrpXMVVg
	 cNm/gEhxRbL7r9gD2gJpNk0qdUf+6+mkTzSfpV3iN7yvhpeT13ZfHJRXedbyRIlrHE
	 zzPFA3/HVwypr1uja8F7fKk6uQx928wF6mA6XOBkrDrcJ5DfnpK/d42JJ3EWHEa03K
	 3EBvNc9+f4WWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFrVb1W26z4w8x;
	Tue, 25 Nov 2025 16:15:19 +1100 (AEDT)
Date: Tue, 25 Nov 2025 16:15:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Waiman Long <longman@redhat.com>
Subject: linux-next: manual merge of the cgroup tree with the tip tree
Message-ID: <20251125161518.3d40b57f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R.h79A7ntew3K2VJj+wRiDn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R.h79A7ntew3K2VJj+wRiDn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cgroup tree got a conflict in:

  kernel/cgroup/cpuset.c

between commit:

  7dec062cfcf2 ("timers/migration: Exclude isolated cpus from hierarchy")

from the tip tree and commit:

  be04e96ba911 ("cgroup/cpuset: Globally track isolated_cpus update")

from the cgroup tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/cgroup/cpuset.c
index 72891976475c,1e3aadc09d3a..000000000000
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@@ -1397,16 -1477,14 +1477,18 @@@ static void update_isolation_cpumasks(v
  {
  	int ret;
 =20
- 	lockdep_assert_cpus_held();
-=20
- 	if (!isolcpus_updated)
+ 	if (!isolated_cpus_updating)
  		return;
 =20
+ 	lockdep_assert_cpus_held();
+=20
  	ret =3D workqueue_unbound_exclude_cpumask(isolated_cpus);
  	WARN_ON_ONCE(ret < 0);
 +
 +	ret =3D tmigr_isolated_exclude_cpumask(isolated_cpus);
 +	WARN_ON_ONCE(ret < 0);
++
+ 	isolated_cpus_updating =3D false;
  }
 =20
  /**

--Sig_/R.h79A7ntew3K2VJj+wRiDn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklO2YACgkQAVBC80lX
0GxjFQf/RUg8cE6DUFXQH513hTC91E5+K4xpYc92M0HRtiATfOKGat5AYQ+MwVyh
hYMKxrc45Z5VKA08m+ULImKJU9xA5t4810zmpbzTKxWGpf/3DA1IEWK+ZZiIKSxZ
Rulz7rJE2gp1vMqHe4JpWbbvOeF6naMfzHZaGWZ63xW0bPoM1oJ4LB9qfaOEgeR4
Bvol3P5IGkD3rf1aXCoYvycI230+2L4SrrUIym89ckGal46hykG96mWmaw+yMvkm
ssGnq5T0lytAo0YsBy08EqYAA7rb9Bh7X8LDgLoUthKscirB4wTHrQlm0AR3+LCV
naq0tXVdGUrW+tf+YsnZ5aC/JAYHwg==
=Dat9
-----END PGP SIGNATURE-----

--Sig_/R.h79A7ntew3K2VJj+wRiDn--

