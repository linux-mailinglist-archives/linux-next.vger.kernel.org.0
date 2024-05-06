Return-Path: <linux-next+bounces-2179-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D728BC6A1
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 06:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66630B20BDC
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 04:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1235343AD5;
	Mon,  6 May 2024 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bspn16xq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634FD38384;
	Mon,  6 May 2024 04:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714971563; cv=none; b=TEmDaiNEBd9ipEqIq1VbgXmNqFHcqy4gl6q972zK6lBPdFRTqAu0Cfp1rmisZPUinxLEain18CydlPistx4i0CoU68xxEc9uA84pspNM5C9Kp2mequXscyC6/lcPmZCu21IgyfQJN3MtVwx79TKnKKwCUfKqmMqbV5jMPJoTcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714971563; c=relaxed/simple;
	bh=RcpxP+2S9tmXMbb9cuHFhr4b55LylGn+1X4IWjxX4NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jdkED4Ad0fzDIlphuYyYlX5kssyxgIlMbBa3yqvVZkp0UPPCzfHdayLxwGZFMAw785VCSnxmMNiu26pql3GpjjzmvKzvuep1mCheKVyb5dnm8GNr8qupaL4tOZYiDoUeVriTGpZ0EgFBtlpqqhH9m10q9mvhpkTs8+V6eaL0iVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bspn16xq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714971556;
	bh=Pf9uq5awbUnoqcr1iIh+XFUNBtgpK+pxUOtReZflPEM=;
	h=Date:From:To:Cc:Subject:From;
	b=Bspn16xqDCR0oz1MwbA1Ujzxq3om+PG4JWf6uEk+a3u3UHCbrQgcJtC+0yFE8v85x
	 DT+UXLSPSesyhPKCrbDjAvSiU382XFBXYHoEy+jEW4h11ZmEgmwEOL1aGBjM5Bg2Xv
	 Dpx+4UG2pnRlDn343pnvHfRLNFg2lMAgcqVwWPWl2bmDOziH4QHQ7Y/wX/OnG9rExu
	 OpvgJ1O+rMqZWOvOZnOXobddCXK7s2IsBLjjG/mTKG3qCLfGiiXUuGI9K5f4Svgboi
	 bD8aQzU9qSu2ccpJOYgsVbBmdKianlLGtTpmEQcBmXzG+9ojbcG8K0xoQjPYKoMRQy
	 CDoQ6m107nZtQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXq2D3zhVz4wck;
	Mon,  6 May 2024 14:59:16 +1000 (AEST)
Date: Mon, 6 May 2024 14:59:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tpmdd tree
Message-ID: <20240506145913.4e88f270@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/txT4sTQ.6ONqcqgRA8Kahtq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/txT4sTQ.6ONqcqgRA8Kahtq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  71dd2201bdef ("MAINTAINERS: Update URL's for KEYS/KEYRINGS_INTEGRITY and =
TPM DEVICE DRIVER")

This is commit

  ecb42b703f3d ("MAINTAINERS: update URL's for KEYS/KEYRINGS_INTEGRITY and =
TPM DEVICE DRIVER")

in the mm-hotifxes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/txT4sTQ.6ONqcqgRA8Kahtq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4Y6EACgkQAVBC80lX
0GyirQf8Dzktcg9ygIaoNbEHG6hPHraV7hyDipwwXyGxofKu1AGHLMBEiHQeAaNj
s3463qHUkACr7K5ZpZd9jOsOpYIO0hsX9+ohMHT13PEGK5jmuKVVlwrjlabEahAX
DktJVdl/v23Imo0nBZ5CuwTyYbcxmjtHnhTrRdpsYNSRcniWSIKiHxSnAm2qdvL7
wunWXTcKBm4kCYotRDJdKagoIpZ3GinDk3NHQtLX7sCVLbgh+KKbBiozgosQCydC
VR7jA959e4Nr43Wz+TeJmUhG9qpz4hmo//aU1FMG0cvO3TnG6xKJvFxEx6EpY/65
bgoDLuxm85OCHluN4X1y+dOOLpgKHg==
=cbgp
-----END PGP SIGNATURE-----

--Sig_/txT4sTQ.6ONqcqgRA8Kahtq--

