Return-Path: <linux-next+bounces-6274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52486A90EEE
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 00:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC363B8794
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 22:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB5824503C;
	Wed, 16 Apr 2025 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P3iy2xCM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3BD23E229;
	Wed, 16 Apr 2025 22:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843798; cv=none; b=YLOF9e0utQolfzvCa78/EK1ed7a25D0ihKi4RqNdL4cFox0Sjc9AxL9Tk/+AU37QYZ1tS0Yg+6/a548+0wgzKDeDCJz2vKk8Ex03V8YhaYkFD8RoGMwA81K1pAkVz5RNLps7GBrgMTf6hS0NcNlJ3nAO38srvNP1AxFFT+PJTFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843798; c=relaxed/simple;
	bh=10it2hOPTXLKddj5XrUKTQ1gdjK4Sjw4bibvB7lQM0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cYFblqxSnNxFmGLv9pXoCxvbSmW0UseNO9Fp40xFs6o1ogdSgvDxeGmH2ra+KTf8rUDbttP2/1q8gdkIyU7ewmIyQEPLq9Z0nINMdZMUzTu7+lc9M9gryMo1ApziZl2L409B3NBQbOTXwg6L+cBxYlTiFjVP4Npyzio/KP62240=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P3iy2xCM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744843789;
	bh=dS4fYj308Mw6myLGLHdloM+bgQNtBjg/nr8Yq5j34FM=;
	h=Date:From:To:Cc:Subject:From;
	b=P3iy2xCMtq+I2m76U4huDp0MfwAxTwWNAwdgKP5xVCvTNnMhUT8X4RDVnV4wOvtGK
	 4IEC1U9eHZhIR91n/hN+G4EFXHMtm8qt00Kva+hg0eUb/Wuj4NgwgV3Uc73uxdiTnl
	 2qWcbosFGXQ0YH3/fMOMh5h+QQXGtPb2aBw5z/mLSeoV2jz8dAeDSkHysNG7x/J1zT
	 RHPpHyNCAMrqjQ4nV8sC/e3iAzKrP3JiwVOEc1kHXyXSRobMPKO5mnO2bld4D636Mz
	 zyAXBDwx6XRA0lWelvzsdAcagx2LU9lxqWa3CmZ9uoeVe5XQ+5GJfoud6XcW8rjUUz
	 SX0QKL7GoR+5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdGSF4j6gz4xN1;
	Thu, 17 Apr 2025 08:49:49 +1000 (AEST)
Date: Thu, 17 Apr 2025 08:49:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20250417084949.7f9cfe19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jzeJ=Ir2N.nO9n6yT3m43ly";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jzeJ=Ir2N.nO9n6yT3m43ly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  b1eb86b028e1 ("fs: ensure that *path_locked*() helpers leave passed path =
pristine")

This is commit

  a681b7c17dd2 ("fs: ensure that *path_locked*() helpers leave passed path =
pristine")

in the vfs-brauner tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jzeJ=Ir2N.nO9n6yT3m43ly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgANA0ACgkQAVBC80lX
0GywFAgAhd6rp2eDQwRrqpP2UzlXkxxO4duCIecBP5BoGan1VkpjLdwSa4uyDe4B
wA+/733iSpUs9AreA/2ou0uMohzqIpzNmzqVnPNEg3Y9uLMvBbYO0M/cvDt0Ah1D
D/jOtUC3x6smEZ4VUjhQQzjZOSix1L6PgkxbfyBuYDC/KDE13zLSP7CVr+zz1Lx1
5utOV0DSSi7eFMj4/q3mQ7O46hXG6rJu16MQ0O769a5hel6cZUezAIxAgc8TS+A8
Bslo1GEng4CETJz8wbMVkceIAKUUaT4wpGImtemFJRmgqa0VWX8/3HI+j1C2Dy6I
t5m0YpxpBkJvcZ09coRJfIyts9km6g==
=at0a
-----END PGP SIGNATURE-----

--Sig_/jzeJ=Ir2N.nO9n6yT3m43ly--

