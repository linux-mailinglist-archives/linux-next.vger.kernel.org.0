Return-Path: <linux-next+bounces-6276-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C09A90F21
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 01:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9B841900A49
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 23:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3615C23815B;
	Wed, 16 Apr 2025 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d0zZsCXr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCE928E3F;
	Wed, 16 Apr 2025 23:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844682; cv=none; b=LM214pZCbUUShY8ksj1HVX/wrjqzw+46afnXjF/gCVoTOhPkV1C0S7RC+OWoy6X919XiCCWlVVStHltJGbjtQVWiPYaw1cboD8DS4EHae+mvhMgvws4rQBwzhHl1QIBzp6vDDSMRo2VbSyr3QQf3mMON6jT1TzsTdW4ujtAlHxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844682; c=relaxed/simple;
	bh=6KN+Jy5xPSQsd39pkob+GP4zaeA53XvDeOSkk+N+myU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nKPIQVr1tUhYG5dEGYa/fslmO9UKtaVhL13kKDzYakOJY6Kwk3ziM+6wjXcxdN2pxilgwPSjM9/XjLoIhAKCRqfIIejedRS8XQbg4wvsCmHqvdkBafWIvqanUWy5wWz/HxJc7tmul/0Rboizm76MIsJbNMyX1BdOp4qOWD778dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d0zZsCXr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744844677;
	bh=6KN+Jy5xPSQsd39pkob+GP4zaeA53XvDeOSkk+N+myU=;
	h=Date:From:To:Cc:Subject:From;
	b=d0zZsCXrzFEWJp9JtKy0/hjCoPSr8UESva1a3lYU7hiuTed5rLCz15CvAep8x9U0Y
	 chNpoQcJbR8j1lHPxx9SIYNcHRJXbS2acdBnsmXCeyC2nY4K0ASTjqHOlbusmrrxqG
	 VXfnz7CI4eMcn8PjOJ1h/NSy53DYzlhgpc8zuouj368DbvdUbkl/Mlvs81FtppdYfB
	 lg5k3wTVfjHYcWZPVrF/y7P70k8RxhHXpGXrHOhDj8EQ4fqtOrcPXf3I+VltGV2K5m
	 ijxW3KblvkoLGJcxWiW/jKDd305/Nnjk7J30vpJJ5lFdiQmuQcvZ8jVXV+8DYZSRab
	 VEbOW0HsflzwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdGnK3ycMz4x8P;
	Thu, 17 Apr 2025 09:04:37 +1000 (AEST)
Date: Thu, 17 Apr 2025 09:04:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error fetching the tee tree
Message-ID: <20250417090436.1c58cd18@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c/n_Sox+zF_BLgx2eN.G4PW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/c/n_Sox+zF_BLgx2eN.G4PW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the tee tree
(https://git.linaro.org/people/jens.wiklander/linux-tee.git/) fails
like this:

fatal: unable to access 'https://git.linaro.org/people/jens.wiklander/linux=
-tee.git/': The requested URL returned error: 503

--=20
Cheers,
Stephen Rothwell

--Sig_/c/n_Sox+zF_BLgx2eN.G4PW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAN4UACgkQAVBC80lX
0Gzl4wf8Cu742V8N4NieWHA61I8DXvYP0IeF2+TxlIxdNR70tH8yEw06orR1wmgE
IzYPJ5WEoslO4G9ejLXmJamrHUF76KmraYpcblfZCFjINNu0dcSX10nX+8iJOuBp
Em4pTMezYItm4oZgYF+QzpnLpjlZfOCzSOvUN1ovLxIZkoawoG0gCsdpyS2O3rpe
LOZdkRMCRZakWEPi5inAN92EhAhNFV5FIUIfSRv+9Aehzy89VbiRn1eq3ZRjmfl8
ii8N5i9ei50RbDbIGLpW6GXKGP+wnvsaqR0sXWZmdh9F/ujd510dfEBwfqiMOfWT
U5STpzNlaJk5Zg3dvcpZRUcfVMLPuQ==
=RNgK
-----END PGP SIGNATURE-----

--Sig_/c/n_Sox+zF_BLgx2eN.G4PW--

