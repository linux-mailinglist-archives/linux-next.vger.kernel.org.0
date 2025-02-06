Return-Path: <linux-next+bounces-5374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F599A29E0B
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 01:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968881663F7
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 00:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1895746E;
	Thu,  6 Feb 2025 00:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cMDaPIxN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811061C683;
	Thu,  6 Feb 2025 00:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803045; cv=none; b=HF8E6IwUYCsxXElsXAMDLwKTMt7Fecofl/msWSR23AyCFe6mgyUUI95kONHr7QvMcSR5oHsVwTWYRcwQgx0Rt0PmLmjqUm55gKZQA3ajgoLm9cFNLxwKvqV45oSpL9VWTcVikPjBI2JD79wjk8OGTZIdkhwa25QCV1d68IArcuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803045; c=relaxed/simple;
	bh=sr51Vgm+nQeGaht5C28wzr0rYZR0dNDhabGn57YISJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k5LXNQVt/1/BJIt5Vfz8SqWM9jgMU4pX0WDSceluIe5puUHnvPdT7wwgglsS0XGJx5SRq7qd00xTiAIsKMExWhhKmKVwJQJKfyab3A33LFix2RQQUcHh9jKQtFjjJ3Lc4v2FQZoTwcX2ArR2/wHn9tADtHjlmvp2JtZHV1U2Puw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cMDaPIxN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738803026;
	bh=6u3JVO9UJT5fwx2hnzk3rwfwY6b9fPSJmjL8WIW+DXY=;
	h=Date:From:To:Cc:Subject:From;
	b=cMDaPIxN7rbKtuq0RGrRVIryhmzChzR2fXM5+ZgBlXNIo0XNisq1TRgo8buZOCLXC
	 H6U1csgrMoEdQ8+ZJA89j0mpa/zoAtm2dusPG3TSrnLCqvgxO12UKnHt6iJiAHBtQj
	 DPJ2xORvCsxJf4tYNc7PQES90o4pCUDZTcljViFN/Twlp4kQnRNkOD27MU69800eBc
	 3beivt0klIomBVFhWLjyh5wnqjGKXG1/SzsAZQsgzV5uDZIxkf5lQCac9++SDJuMl+
	 SfCC5l08VguNHlb1jVq0bZ34rxvUPeIqn4Vqc3Dq1ACTYcCjiUqmTgTTtfTM8/ljV2
	 Kdi0Z4rJxtNZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpJRj5s0Dz4wcD;
	Thu,  6 Feb 2025 11:50:25 +1100 (AEDT)
Date: Thu, 6 Feb 2025 11:50:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Aboorva Devarajan <aboorvad@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>
Subject: linux-next: manual merge of the cpufreq-arm tree with the pm tree
Message-ID: <20250206115034.5d3004c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TOz7FwC_ssdJKnqs+Ncq_DL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TOz7FwC_ssdJKnqs+Ncq_DL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpufreq-arm tree got a conflict in:

  drivers/cpufreq/cpufreq.c

between commit:

  0813fd2e14ca ("cpufreq: prevent NULL dereference in cpufreq_online()")

from the pm tree and commit:

  60208a700f76 ("cpufreq: Restrict enabling boost on policies with no boost=
 frequencies")

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

diff --cc drivers/cpufreq/cpufreq.c
index 30ffbddc7ece,3bb5cef263da..000000000000
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@@ -1571,7 -1590,7 +1590,7 @@@ static int cpufreq_online(unsigned int=20
  		policy->cdev =3D of_cpufreq_cooling_register(policy);
 =20
  	/* Let the per-policy boost flag mirror the cpufreq_driver boost during =
init */
- 	if (cpufreq_driver->set_boost &&
 -	if (policy->boost_supported &&
++	if (cpufreq_driver->set_boost && policy->boost_supported &&
  	    policy->boost_enabled !=3D cpufreq_boost_enabled()) {
  		policy->boost_enabled =3D cpufreq_boost_enabled();
  		ret =3D cpufreq_driver->set_boost(policy, policy->boost_enabled);

--Sig_/TOz7FwC_ssdJKnqs+Ncq_DL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmekB1oACgkQAVBC80lX
0GxXTQf+J2DAyh71NS2hCLJISeRUhRNxkk0Gxvj5VvCElDUFohVAeH8kfWOq1T7K
KXH73NG4+HonE/lDpwiRERNZEDQ3zuaX8qtPtq9At8fCwQM6wXLss43co0L1adMJ
8D1z9H8wXMAI0NhK2K+3F+1BKrmkE3Sb54TvPpLZ4P9IQeK4SJzjc+SFoDIjhTU1
UMU/lBf/m6d2Jw1jxsWvcMHjAW0fhmf5GV6iCXWht89MdxxJUXIzijqus6yUz2PL
O5kQTpNAmTMdWyH3wUGeiH2hrUvOOaLqBNW2idpx7UJlnvs0CKRw2pblNRlWsd4y
TnIcOQmLZ+TnvecJmdl76DLLuhcQ4w==
=vGJn
-----END PGP SIGNATURE-----

--Sig_/TOz7FwC_ssdJKnqs+Ncq_DL--

