Return-Path: <linux-next+bounces-6554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D6AACF3E
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 23:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8711712D1
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 21:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAA812153DA;
	Tue,  6 May 2025 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TPXbw+zx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A919006B;
	Tue,  6 May 2025 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565552; cv=none; b=qmru2oKRz/prEe04i6M0CijA6vhv7m7T+S1KyxmkP8ILzme3QB8mgKouU5n596m4URvGb+0QBylHAdsYbw5jyGeVo/abpX/wiJ4wrnFBl0Sloc6Hd2ns6ElkUBr4L6zn91meyLUhysogh9qa+KUIzu5CdMkwHzqvHq/R9D9O9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565552; c=relaxed/simple;
	bh=uYyRyGg32QeOw0Jh1Rsd22KiQsvjvtggnvchXhgiG5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=omONxZytejmFgBbXzYAy9FM4FLBpTSWQ3G9pJiSOG5uaJTBXavqCGTIt9PHP2u8Qiho2BQLjoYmaWrfR5qOhBYBiwZ7XEKyZjzOUreyJGigpzjWvdzz1Ff+rdr8IX2ejS88XMsGZJkdqWKxCU1hkc6PLq6rZwDwYhWYwHAOkE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TPXbw+zx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746565548;
	bh=hSSzYNxo04xeganpynnfAj4XwLPco+rF6fU0q96gbGA=;
	h=Date:From:To:Cc:Subject:From;
	b=TPXbw+zxueBDdEqcVFYw+C1Tf7S3AZAXddpBndP99suZZLMjeOFhVu2TcmvVBYk/R
	 yEbLJ/uzWO9U7JmVLjKMvIVbH6iaGxqYSvvhj/+SYC8YCVCgeX8oPCxe4hJodQ00rv
	 h1KeFFCcmk6xs8wfVYI9XqZ/4N2o+UqCPP0cV6v+mZTh3hTm2ZS7RRnw+DWrTihNRK
	 u1Uv4XmKrqTsp1BomPZ/E0dEd3tItCchsJ41lI456X/R5wSpe+XrPPgHpw1zE5CVGV
	 hlNmKlQMcsZ0o5UO/qrlFubP++G3rRQeNOWxLLtTyfz4xd8XdUhRwWjpV/tsO1sdQk
	 2lMIAqp2qNJhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsWC02dZGz4wyV;
	Wed,  7 May 2025 07:05:48 +1000 (AEST)
Date: Wed, 7 May 2025 07:05:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the coresight tree
Message-ID: <20250507070547.4249c806@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6OUyN_gKbihFolNBWFA5D1a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6OUyN_gKbihFolNBWFA5D1a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f42df204b53d ("coresight: replicator: Fix panic for clearing claim tag")

Fixes tag

  Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7cd6368657f1 ("coresight: Clear self hosted claim tag on probe")

--=20
Cheers,
Stephen Rothwell

--Sig_/6OUyN_gKbihFolNBWFA5D1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgaeasACgkQAVBC80lX
0GzW8Qf9GeRpiqIx0qEI2DKyYImAoL2WujjdzMsX5QVO2eyRTurcoj/841nXz5Fh
HclI+1TBGnlQLxEckPAcmEbjgAweoZ8mWJza983iDDTUZcQ05SVsLEJIamGb7ZYI
X22VFuBxcC9OYq4od/m5CXurdBUNCIUriImJ/3GRzEWA8iKR2idR+GNTYGs/YPbk
WGivLejtXN9uPSFi6vvEhUP6wiuTuIUbKY+hYMfUcijmSi2Y0v6+7DogWjt3jPQH
QONysXZlcfkTqmpoDhnIDr/dCYeCbEd2GIXiGi+7lahNP4Jg4KmJdgLet6/u/aB7
xhWRVyUTlNb3+xV+E4cPJ1olfxJGwg==
=FrNE
-----END PGP SIGNATURE-----

--Sig_/6OUyN_gKbihFolNBWFA5D1a--

