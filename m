Return-Path: <linux-next+bounces-6670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A51DDAB2BA4
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 23:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A3A174BB8
	for <lists+linux-next@lfdr.de>; Sun, 11 May 2025 21:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76E0822E3E7;
	Sun, 11 May 2025 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CceS4yqO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6245226ADD;
	Sun, 11 May 2025 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746999636; cv=none; b=ppFnH2/fdUMHfBLO1dNqGiPXSQSwMfL2W5lZiJIdwlWbqE+PnPWOdKX4M0FlJ/qJcinE4/RdAd3l9rKtCvdNFExypu4xvymhXjeynQT2MPR69RL+zip1nosC9pFpdDpz4FM9Zg5apCweiY/x5GqCtMBNwuKnljrp6M/woSupsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746999636; c=relaxed/simple;
	bh=gtyOXtImtqqkzDry+wwBR0gLmZUn1kHlOT2CUrbykw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DKqukbjDkIjJohnm1wQFNgCjU2eRF+Ob4wZF0BhdiJIYxeXFGJqWkOUFZtQ147MlfeqZwsqftN38lqor20QSZzrGRQOwvmLFKwFz8+vwpnOHSA3aThN6aRzAEjEfMhc4R5OaMBHRwNW8+HRRgpBwedqfS49Jx1O8S3nLhZju2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CceS4yqO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746999630;
	bh=FqSjn+8A+D3hg1+enmtHTGzh+yIcAo0+AecMUnE8yZE=;
	h=Date:From:To:Cc:Subject:From;
	b=CceS4yqOGorizrL7OZQlMcVx5XWNA2O/d2esUpz0/XIVbXDS/E7hHtwujpx1EqbHZ
	 FTo+Unpt2Ov+5M/IJgi5i0+orjUFw9kwXNW4FgemMlvceJwVMW8Tb4D/tfPGL4nAoW
	 JRbV3al614WFWrhxNUaYgPmf8Y9e/dAwc/ki2AVeulmJhflBCUQEWQMcK2MJ/XXHVj
	 Zngc3LnZtnKFFA1zFE9FPOMjl5uQriKFySw/JvfOOeDuvQRW8VQl2kBFK67ihMxoaF
	 CjsDhvh2r7iPmxCuMKgHKYg0pEtvOkKurhKOVsNgQoP9teD+N+/HeLDULOOgHl1XjU
	 ZaJj3QzqnEJFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zwbkk3ZnQz4wcr;
	Mon, 12 May 2025 07:40:29 +1000 (AEST)
Date: Mon, 12 May 2025 07:40:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the block tree
Message-ID: <20250512074029.5c7c5392@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g3AOIYSbWffzxHb3fJRggOh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g3AOIYSbWffzxHb3fJRggOh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  3bb6e35632fe ("block: only update request sector if needed")

This is commit

  db492e24f9b0 ("block: only update request sector if needed")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/g3AOIYSbWffzxHb3fJRggOh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghGU0ACgkQAVBC80lX
0GzQ4Qf/ZN/hAZyrEUjd3uYzKdiYC+Ua6FNOLS3qa9VRQRmdZg6eIQ3Q5deT2C1T
2KolY0nq9V3DczTJbA5zH2rm+CsM5KI3mC9JyGblv6/wdXAyUdPlvrq1pHjTvmzW
HUzIHzOOI1/NYbrUeX6M5y9MLyfp7cJNUzyRenJOcsezLlKrSIohO9/1b9Bry8RL
AZG67RDVk59UV41gesjqOYZAmxZp6N3L4ZYUdThkZcdMXEcDtmPD0+k96yPIMp65
2r9YHcEl+v5UnXnhm5nwg59Na81o9/J/mGPzFg9B6w839DRnGtf3yLbe/rBMtZqr
1WDJJux5eOPNHgkmE/koKTj/3oj/LQ==
=yQIj
-----END PGP SIGNATURE-----

--Sig_/g3AOIYSbWffzxHb3fJRggOh--

