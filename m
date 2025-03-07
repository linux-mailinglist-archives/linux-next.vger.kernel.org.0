Return-Path: <linux-next+bounces-5694-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181CA563BB
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 10:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C2E318971B0
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 09:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAFD1E5B6C;
	Fri,  7 Mar 2025 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QWcxd8aZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BBA1A314C;
	Fri,  7 Mar 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339689; cv=none; b=dcohvLz6uLc0CflU8MaDXUCUVIGD6qoC+/90BZJuxGOd77SdqJ0n6CxSo90PWeTq2ZF3VDPiT6K6bQGCGYLv4sNymzusfcFOifcqptWJoMsGRaAUiluYgREmeuBXkGYA9GYqVZVFtGJ70aSueDiIXaOhM0X5gT8+Ut4TFMve5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339689; c=relaxed/simple;
	bh=Bf5ErMz/UZvbG7cvgZ0NhWLyjPVSB/DLTNwT1FNP+zE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kfFDJmZlWmns4bHOPegIRIXc7tjujLztg/HgKT7g0XyFC4TNt/cWUDTCsUaZuw4Z8AXBssvdXuSiK4f9HYJiMoei+7jCB7KZTAghUONxGtys9QwevF5K4f3zdkiqYeVM1Q7uzMeu4dpzIp8qKsrPxJssiluFJXkBoSF1WqpmdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QWcxd8aZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741339684;
	bh=8FxxjJjarTfYb8l8YtYY82DZXxU0pyqPxViePPhbbqc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QWcxd8aZCR5Cz9nbBsp7MqCv0P6LuZSFEBLhqjejHXQJXgyrSp93cuUV57sXOqFIY
	 8yiwfH4Y9GN4OwtOgXBcW1e7l4rZpXNDQLeAtUyJk19hHlbQGBBa6ajdCCfwH/7Wwz
	 AMej8sOx+MzYPADRfsXIxuRSjEd/trEUPqurAEDWpmZQ9LtgL4SKw/jh4B4M1qO1lv
	 QCqhA+hWluIz5A1yR68MLN1Svd6inyFmxneyhXgpZcIjtevGnenGIdwoYNkgappOwd
	 1rFpP4/7chfv5YyLMuHl3SCaSqo4HS0LHigpfeY25wez8/QtIi3topxHzNa1L7KOeh
	 okwrojWRJzxRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8LYc3Tlwz4wcj;
	Fri,  7 Mar 2025 20:28:04 +1100 (AEDT)
Date: Fri, 7 Mar 2025 20:28:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hmm tree
Message-ID: <20250307202803.5cc8ce0c@canb.auug.org.au>
In-Reply-To: <20250307195715.0b7abf0f@canb.auug.org.au>
References: <20250307195715.0b7abf0f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zRLcTZpFa_D=69.DHeeexDa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zRLcTZpFa_D=69.DHeeexDa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Mar 2025 19:57:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the hmm tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> Error: Cannot open file /home/sfr/next/next/drivers/cxl/features.c
>=20
> Introduced by commit
>=20
>   da0dd17604d4 ("fwctl/cxl: Add documentation to FWCTL CXL")

Also:

include/uapi/cxl/features.h:1: warning: no structured comments found

--=20
Cheers,
Stephen Rothwell

--Sig_/zRLcTZpFa_D=69.DHeeexDa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKvCMACgkQAVBC80lX
0Gyj7gf/TTgErr6Jmdxg59xI0+axOOCqBgE0Y5qVLsr7xQe69wAYUkSIBQKktlV4
+0mE4ujR0NiPO8jDQzWXePt3Er7WooKl2IqUqGIElfFGiSkME+paFPBsORNZe9e1
jKXalx1j4Ok2wLlW5+MnQTLqNhLQKvcpuvWz4whUIze86p5S30bfC/PKkys5zQ+r
BajaB0G74Ocrlsug81W7lRKXstxWUFVus8fwYiNZH4ejjDKfsgFdIiUHESjBsbOm
G/0EvZIAJHiIDbRxF7BFijehPe81O9G1UH8EAdFi9TQVKelPmRt3Eutfwhd+61fN
Inr9AxBUYp7hJngdDfNsLrYDt8J+YQ==
=1pan
-----END PGP SIGNATURE-----

--Sig_/zRLcTZpFa_D=69.DHeeexDa--

