Return-Path: <linux-next+bounces-8189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED6FB432A9
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F098F188BD51
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 06:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEABB27702D;
	Thu,  4 Sep 2025 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SkTao/ti"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26AB275B0A;
	Thu,  4 Sep 2025 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968041; cv=none; b=qfZY1e3bOZrJ8huvOhoGZW3l9YoaKvDexG3g0JaZKbIrirLLsWM2sIgseuSUO2/aF7F1/tfFfRbBDmV3HDFbWO9j5VYFjX4XPkOGM1FhfCq+O7zr5Ts/ALAXqiczTt9rnIF+XSnBAgLxtRfoNznKfjnbmBaH5m2/osULh7kQ1Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968041; c=relaxed/simple;
	bh=wjML3rLUMwDf/UURtvF9qJv/sPvKxmCgLFcoPZD4WqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N9Yzpt/MqqZ0Fas671y41HIskPpMm5TSFGr8crhSOEaNpWytM8bmXmo6jEwSnIp4jrnpp02tIGPp0CS5UFearOhh3HHWQfmCNbeOXnlvoWtlHxbZS3BOiT5sAHH3ukf3Lr6ztxzare+lGqvTjqVgkfR5gL7fGbxVRMY24CFR93U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SkTao/ti; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756968036;
	bh=W7aifaZb3tH1xScDg2DHXYElZXWWTbT2gv/ttOD28xI=;
	h=Date:From:To:Cc:Subject:From;
	b=SkTao/tiWiN9PPac6rJYnRZywvhi2jP+hRp4hiKc8WBZ8dAdNsns/LDm5fmnnSthU
	 SdUZg6OHTqZ/piA35CoaxXgMqAZk6C8pGmJORJXluQnfuQbr9rl/R5L69jk6TOdwfu
	 mLGe/M9CGLviFvSnfoswHBzWG8mhmI98+ndLYSKQw8HpvPn5zwTfXVUb/qncurTaAd
	 zNs13uBkgCf0/GCE5JuB1wqJ1ZARndRz/YULkcZGQpEpeOWrC7DHesNpkCq6PaGkUD
	 AVtYS5iEVfIKx/BVCW6oW9HCrTxTz9SAwgFjK4XHsZxOriGMO5YZ34M2Nx4l1Hm038
	 US8BCRSPAYpUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHVGr2lJ1z4w2J;
	Thu,  4 Sep 2025 16:40:36 +1000 (AEST)
Date: Thu, 4 Sep 2025 16:40:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs tree
Message-ID: <20250904164035.2a12f3c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B+jmqCyqA+7_NA_WinjHHzC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B+jmqCyqA+7_NA_WinjHHzC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/filesystems/porting.rst:1296: ERROR: Unexpected indentation. =
[docutils]
Documentation/filesystems/porting.rst:1297: WARNING: Block quote ends witho=
ut a blank line; unexpected unindent. [docutils]

Introduced by commit

  8be3d7ffafe4 ("change the calling conventions for vfs_parse_fs_string()")

--=20
Cheers,
Stephen Rothwell

--Sig_/B+jmqCyqA+7_NA_WinjHHzC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi5NGMACgkQAVBC80lX
0GxjgAgAnfjf4c6+dvBju71hJ35kTQmhZ2UhpwaF7UN5pPsGY5Anf8gdJmEJVC8r
rNW4L8UmOaofd8OoOCa5Gl3raxkW6heZhcA1jWEb9J1YXkWtw/UZkL7cafW+kyeu
F2V1h114n9AMY3coDeS0nBkFfFLkktkMwlg2uDNASbEkiqaBIJemVj5V8J7shHfU
hHZZH8pLZDtL7oI+cBOQY3Q5Sgx6Po91hKuO1WbgGZQ7d9sq2bMszWnFwBNWIXN6
IdZObV2vF5k7DPaWKSotQQ83+L2LaGy4vesGD03hBBuRUCKfhu0QJAM73HBXfImy
2osOEn5fiXr1nIA90bhQuQwqJr7UdQ==
=bhZN
-----END PGP SIGNATURE-----

--Sig_/B+jmqCyqA+7_NA_WinjHHzC--

