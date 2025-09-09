Return-Path: <linux-next+bounces-8246-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE1B508EA
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 00:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B85F07A11AE
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 22:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C051D26B75B;
	Tue,  9 Sep 2025 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nLu8zcbT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFA1A0BD0;
	Tue,  9 Sep 2025 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757457464; cv=none; b=u+4/1K+mD0gqCvHDr+t+7ohnabFhhoBurXyMuIjhlXeHCJgOH2dbBrMCiysW5hP0oeetAfjoLjmGaT5VmB/0I6W9Vc9BbQsB4VxougC2QWCw56qOV9s+K/Yw1MVsvfXliXQtwLkIdDGBpOndZinEMRCK42LjN+HaoVKmo9+/S6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757457464; c=relaxed/simple;
	bh=q79c+sPk8Cc6bgwdc5MtCrLXseB+c5Odw3FxhuVRp3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NwuXsatjoyHzl7RXU3PbTZxH4GUxQH0C03T8rmGYNX53bLfHPY2qF+geIvDsIywf6xnioRwclVF8+aY5CCNBtouGAibSfQW8KifFAO4h9me2qmYzgo0XP39OlwQI9ENVj/d9MnmOhTK/JTUtf6ZzEQMi1d1fTXLbTfxDXao6P/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nLu8zcbT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757457452;
	bh=M6AMR9USJ3sJ2q6M8OfbEG80MKk+gllRzriSNnJeTR4=;
	h=Date:From:To:Cc:Subject:From;
	b=nLu8zcbTiB2HACMBqPyre+VghRv6eAmq9slbR2a+mpp46V+89/7PNvEbUfM1HknMX
	 xqNANKuF4Te9au8VQK3UVUuZWaBYFxgYeEMMwUxRU8k9YOzHM5wGggXcWg2kF2g5EB
	 DIPsETdQbrRg11gbw/DhA+tWNQNcffhWOxvJ/+fVIc5y/5rVDoCS473n7Su77YcAyc
	 /CIvKAKoZNENggHfPOlNzQh+ncg99Sc5lcyUvZP+DNCbHoIjrm7VDU8JVq7e/4cJWF
	 Gx2GBhG8bB1xkZuJnifF9uOooa4dYN7Zal6fktAOOtv2airP15nuYLI1zE0KoseZFf
	 +qeZDKwUQU6Gw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cLzGg5kZsz4w9Y;
	Wed, 10 Sep 2025 08:37:31 +1000 (AEST)
Date: Wed, 10 Sep 2025 08:37:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: unexpected files in the broadcom tree
Message-ID: <20250910083713.4c5ef7d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VNtjk_sy=sTrhpEMohhLUtp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VNtjk_sy=sTrhpEMohhLUtp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

While fetching the broadcom tree, I noticed that the following unexpected
files were present:

  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts.orig
  arch/arm64/boot/dts/broadcom/rp1-common.dtsi.orig

They are introduced in commit

  b00f5cbb7abb ("arm64: dts: broadcom: Enable USB devicetree entries for Rp=
i5")

--=20
Cheers,
Stephen Rothwell

--Sig_/VNtjk_sy=sTrhpEMohhLUtp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjArBkACgkQAVBC80lX
0GzdgQf/fflcZLX0bncNN6Ct15vdtFMULy1HCahOBLCGcarjJEpUuZagx0eXHhZM
XLTRCczrTgpH81Ai4ii7IJGrUIxG71zISntQYQC6iO4lwVO1W7uvDjtasv+zrYvk
KkIbDO5p1CiRiPH8AIjgazqV3Y1kIKj+/WXtt2zoB7WWieiEAMbPhPMSS3y9FXDA
H6rC1SolOua7oBqdevMVhvflsMLoHBgNjZny1shpvtglUTjjiaicS56em9rZpFk7
BtRjOlhJyzSeo+w5YsCHIBxINE2cf/L9kQk1LaoM5dLMXqhGJJwBztqLJJD5cA8a
XSRtAGCb5xIpNUyyfJhWczHXzsHuRA==
=xwlY
-----END PGP SIGNATURE-----

--Sig_/VNtjk_sy=sTrhpEMohhLUtp--

