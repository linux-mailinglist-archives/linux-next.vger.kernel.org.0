Return-Path: <linux-next+bounces-6164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7982A7D082
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 22:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C7C818885B4
	for <lists+linux-next@lfdr.de>; Sun,  6 Apr 2025 20:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C428915B0EC;
	Sun,  6 Apr 2025 20:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IgKAVIbO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C472A8C1;
	Sun,  6 Apr 2025 20:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972878; cv=none; b=XFkHRSfDYeRFsRxf2GapO+oP7+ap+LfbH+aGNqX59ycE46UlqtDTHJRra4O/Nu9GGGaVhE3AXJ3PW6pY/p63V09qigcmvqaTAnGIe7Cp18aqLUPgU+ErsJEfBCiHfTs830hihjg1fmP+GTEV+cVGtFB5jPpK98qaWMGoOeqMG70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972878; c=relaxed/simple;
	bh=3u5D7QMdelDpQ5v2tzGaK5MeEw9WB/xTKNmlFuHNTis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K768PpfO2ztMhAm5ARzzBTTpMeByhIbxIhVXxVHCc5HfA1oKLYCUddwEeI9b76StpxzfpwI0JDgN4KpCXvIskgRqJXvi8efsVR3U/dD1Z6UDwHj6jlzbnWhLLaoEXUyuuOrI+TqpLPGxvAkHh/K1CJCAUJGAr0u4R63bDXK4g5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IgKAVIbO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743972874;
	bh=3u5D7QMdelDpQ5v2tzGaK5MeEw9WB/xTKNmlFuHNTis=;
	h=Date:From:To:Cc:Subject:From;
	b=IgKAVIbOY2O3iE64zRTYDjrS+bEU8sURYNsXFaDz2GAXsaGqAgpYZfsTKs/BsURDs
	 /3eNJU0EHSAOt7YqWL/X/t07ckAAbtLGm/p23c0BrXaNLBump/QDfxv26CuMFxfgap
	 aCjAJv9+e1fEqG6hBRiX7nI9y/NxPH7bc3lxSCyPWiwRgrBvE5bdtmfOf7wD0wExk9
	 b05rXJ5qlQVpbEs1MOjOEgKNF7aMaZiemzsd72diFPDsa5y+8A9WU4abJ6Jfo10wOP
	 UkxqrWGT17q9NfbEQLrj+qGqgbTT+gbBnay5FPx2adkQ9JvV2Vekg0G1jFd0fDGKPr
	 6nGoStNXbOunw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZW4Ms4Cffz4wyh;
	Mon,  7 Apr 2025 06:54:33 +1000 (AEST)
Date: Mon, 7 Apr 2025 06:54:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: failure fetchign the the tip tree
Message-ID: <20250407065432.0f5a8c30@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1=gDHofyclz.xA82aVnHFgR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1=gDHofyclz.xA82aVnHFgR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the tip tree
(https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#master)
today produces this error:

remote: fatal: bad tree object 7bbeab06d5538bd4ae6a29ef18c9ccd2499dfaeb
remote: aborting due to possible repository corruption on the remote side.
fatal: protocol error: bad pack header

--=20
Cheers,
Stephen Rothwell

--Sig_/1=gDHofyclz.xA82aVnHFgR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfy6ggACgkQAVBC80lX
0Gw51Qf+Kg1l4JlYgyWD3mViEFvmX1wNQpVHEYdVM7edsK3YQabhclQD4CXcEUrj
3L25yog60ErJ7sLo2fJh+FFxb4XqDno16nplnSkUIBohgLsLI5n6fWmUPhovEG5E
W+f70itkm1Oe729hwiMBYal3atuhoUr7Mgum56GOcmhmkqIByXUh++MkxjsGyrD8
4i9lyIRmlWn5dmm3A6d1euJVYOdFAxholFuTx9enzv1Yx2bxivK/7vuCH1MD1+FJ
bPfMKKVDEDD2hzFGEumykcVmJcz0vw4c+mwSDoIIQK182E7ACKvsXjgAXWnXqBeX
b2kV4T1EZCC4G6w11wOurNzFhidbhA==
=ndCK
-----END PGP SIGNATURE-----

--Sig_/1=gDHofyclz.xA82aVnHFgR--

