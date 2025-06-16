Return-Path: <linux-next+bounces-7156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39012ADA7AE
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 07:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E9616C051
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 05:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8934118E025;
	Mon, 16 Jun 2025 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VMKmr182"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD5F2629F;
	Mon, 16 Jun 2025 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051905; cv=none; b=Nn5O+wci9bWgEJmIHBek0oNfevOuBPjbgHH6sUVt3bwRukDcIh7ZtvvkLreoxcLfuCzMXhsE3KIeDi6VRQ/X6naIc1Zlc4EE/6SyrRSwD31e5dF9uXWt8L8Mr1GUmeCQgu5XOL6Ae2Aahp60qANPjq05mMSFWwuON+lZMqzh6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051905; c=relaxed/simple;
	bh=qYoVlq8m6Y5sCgW5dD/wQw9vDbOD0UXJ8pdJjbGNU4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hhP7rvW+kkJDRoJ22ZxDZWyudjf5x2xXd/lzGjN8qrBs/CIdjhbeQiB6zvwKRjat2JgCLBOSX5eG8EBGhcC+0xsCkNIHadmXCeJubD63ZPOv2bkqjV0wj8d1+tp/X0vlAIXb5xM8e1QDmKRz8ynufmQGpK5cIgKY0HatIqcAUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VMKmr182; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750051896;
	bh=cLEeRM1CL5/Z5I60v9zuIYp8AFyWIY04ZQ97Zfe/p8Q=;
	h=Date:From:To:Cc:Subject:From;
	b=VMKmr182nFhSBXLAboBIGsXTSVCjZRIXbHbVpQbSy1OxzISvAPsNQZVsabp8g9e8u
	 xc62yeyDPKL07E96wRlZtkV/KQnOkWyezdBIznCvxaaCEUR7FtJYfxFlyg4NrIeQG0
	 JqMaIECG+wcKnEjDqLqpk2oLplUUl2pYMrjJ+f6WtHSzpK6vtfZajfrWaYAdtXN5YQ
	 laYzaI2MkBGvL3sz3o3SCV8HdNwUNia6EIgG2f5lsio6TX8hKz/Pf+7M9EnhtiuN9+
	 H6SUaXnYXi/MW5kB2SrFGFVNEbtAbj0u0TW/z+qJXe0NjpP/0nQ5k8R3erqWI9GufF
	 SrVFNrPd8iE7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLJX806M1z4wbW;
	Mon, 16 Jun 2025 15:31:34 +1000 (AEST)
Date: Mon, 16 Jun 2025 15:31:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the crypto tree
Message-ID: <20250616153134.1583c3bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r+UJ+0s=TH.2LYQ_FwuT=wD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r+UJ+0s=TH.2LYQ_FwuT=wD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crypto tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/padata.h:104: warning: Excess struct member 'reorder_work' de=
scription in 'parallel_data'

Introduced by commit

  71203f68c774 ("padata: Fix pd UAF once and for all")

--=20
Cheers,
Stephen Rothwell

--Sig_/r+UJ+0s=TH.2LYQ_FwuT=wD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhPrDYACgkQAVBC80lX
0GwJaAgAg67JURkrM4ZstGQwrdaMek0eLmL6TTqrUMK9bYOhUWk4q2BVSu0AvMBg
D4fApkU1rnuNdhKGH/MqUVxQT5gXX1WcD4ebbDYOHgfDELsbAFcj3tjnIkNilKZU
8mhEcO2VUGhMAsi7hw5jl+n7InbZG+Vpi6KhjQRm2PQ0r/KGDQTj+IrrnNk21AEn
HaHMttjSzEIzqlPhUkGMAtse8PFJu70qLQ+GC24buoi4A5skay5aRaESQ6s7cMcp
hBZUgo0CSr+E9ns8MKwbj8QtCL9oGC1kCJXiXTBedwOY/emrbPbzwzuPlopQgJ8N
Ju0Tx1S1r+3koLw4uGQ1I4ARXMwyKw==
=Qy/x
-----END PGP SIGNATURE-----

--Sig_/r+UJ+0s=TH.2LYQ_FwuT=wD--

