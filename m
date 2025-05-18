Return-Path: <linux-next+bounces-6834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28881ABB285
	for <lists+linux-next@lfdr.de>; Mon, 19 May 2025 01:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF9C171C1D
	for <lists+linux-next@lfdr.de>; Sun, 18 May 2025 23:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C93F208961;
	Sun, 18 May 2025 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RvcR7iw0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7545B207DEE;
	Sun, 18 May 2025 23:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747611742; cv=none; b=Aq2T7ewiIHxEtgxWHEmOa08k5PxoorjD1cxbmx+mkIfzj7OqzRhxx1xDAjfVTVs9csgdehcDDYceZxdlKzZLewG+yHV9eKrTa0dMUVXn+xPTEJjJYUNbRG8D+gHyu3sTGoC51PwYbb3GcEOM6ViewXCrfSTvtTWZHtrbTehPAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747611742; c=relaxed/simple;
	bh=TD44CBBi4plRDKt5osF5K+hEeWXIxzE8sMn16mChbAY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=NomLFwYIsUY2uaUjHo0OlGffmVVmw76MB+GNj7tGSF3pA6VgxSJaOPWBqPTQ7fgUVldgvUDPuyEPI/ILeMP8H0NbnF/M2fzPSdH4awhs8BytatexRE2Xee3790H7kqgegLOxJ6wki13qRM3JND4pufrdWf0KbYpLMTZN7XL5fc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RvcR7iw0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747611728;
	bh=b7vzuEFB6b6qll9yZyiR5naWmcTYQ7/afB9o78foObY=;
	h=Date:From:To:Subject:From;
	b=RvcR7iw0RX6pg6IFzlvPoTk9xbhy/jbFPUFTJrXZCPVTrC6r2CEqRmQJB4HnhBUvK
	 Lz+vK5gvLyo2EDivsCfeU+RmEripEw/uDApQToyZfkRCogJUkg8KPfJ+OxeSUNZLnK
	 RQKCyAfRCUiRqQ31ITn8/2snH81z71WKtbCjCBbl6sf5Nf0jL2/JlMnl68LfkeFeWP
	 bNHog7GzUhtGLpVwUNWJYp06NsUo/MYu5/NfjXBasOPZUTTY17BYUdMO/pu1b2NKrv
	 2V2WXDHbfg+v+dmVyPzHnlmvL5DTuAZ5gIgqWAy5hRi4z8T/vBV2MvogMjNAlePivG
	 gareU/GJ/wJoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b0y5q6wKqz4wnp;
	Mon, 19 May 2025 09:42:07 +1000 (AEST)
Date: Mon, 19 May 2025 09:41:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today or tomorrow
Message-ID: <20250519094106.2be10349@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=gr3naOAdir3+_v/9/Q2T1l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=gr3naOAdir3+_v/9/Q2T1l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry for the short notice, but there will be no linux-next release
today or tomorrow.  Hopefully, normality will return on Wednesday.

--=20
Cheers,
Stephen Rothwell

--Sig_/=gr3naOAdir3+_v/9/Q2T1l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgqcBQACgkQAVBC80lX
0Gyk2Qf9HT2APWl6kHU6JAlialIPYrWIxZ4z2D/zX8P1ppJVY3WM+/Ut5RSs/tre
iACGXYGnw3EBEEJFps3KpqjgzuuzqJAhALxlW5rAUJQyvwPS0vqQ8jnNXWuwv2y9
a7JmOcCgtfHRHkW81aDmCPXQLTn0mYFbZ5BurNE3O0xPjyZJbMckbZEy9ZVmnXmM
eRH/Q7e7foBYkJFm+3oYjWhm5zr1B4McPSaN+el2Lf1aHWcrjsiBe7QI1AA0OtTv
zBFvOtKJkyfbM8Zh/KshMAud24qk19eFycwrDTH1GSLBZFq6R0T/w9sKCVFUwoS6
Hz/uPGZXVBrOtmk8WRHufvARfM3hoA==
=5C0u
-----END PGP SIGNATURE-----

--Sig_/=gr3naOAdir3+_v/9/Q2T1l--

