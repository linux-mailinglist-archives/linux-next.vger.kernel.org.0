Return-Path: <linux-next+bounces-9472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE6CCDAAB
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 22:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543F8300E162
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 21:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CF325DB0D;
	Thu, 18 Dec 2025 21:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oZx7f8ul"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9A92F6922;
	Thu, 18 Dec 2025 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766092871; cv=none; b=Gmeil2T/bgC1SqXHh+X9La7YQ1v2jwMEY9DKww/UOhfYX/GaxcdZvTU5iyLxKdTvWlqGw4mztSSOjnW1e9fwGFdGKESmsEhRUbTrbNMxA7P/qmxBkicE2BxkuYnVtm1TUS3038C1nwDq3fUfkoVES2y8cp/w289hoVwL7/z74bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766092871; c=relaxed/simple;
	bh=YWQhXF+oJiiM6MrCNycdVT3Hgvw8kc378c83+NDT/+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WCyTkR4laHqFD2cRC26MVBCsUCxGBkd2KagRY7p7E0edv1alXpaC050kbINEHQNV3AisKxZEy4tUa0PvuDK6eiP3sqK63o2Q1uW0ibDw5AH1zfmZngzu3meO/YDSjTb/RA0j3zC7YosvK6iXaM+QoWe/vBGFxlgQxFADro63JgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oZx7f8ul; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766092861;
	bh=F0Q2xEkFwwnTFlhVsvOUgP4Dbb3B6kj89szbzFnT5RM=;
	h=Date:From:To:Cc:Subject:From;
	b=oZx7f8ulILlWOe4fGqonT+ucrj+gSIpQpY5N+pPiIgL1CAlv2cKT4a59I7lF67XKR
	 9+HUg8ZapfqM+NMsBPOqaTl7AGVlxSESakg9kg/XBtkDmfG9RyUUQtimtj3wsiE8ac
	 1q0ya4yDjmPVz8HKzXB3sZVgKGKefktbWOttcljAWhfQtwlWyIatOV5gDU6saskiV5
	 9+orfEMLBLBfZ4U0+46R6ZFATB8DdUUj24N+FoRVbBY/+8ZM+StDKTLe7q5f4RXKPo
	 MtFh5Dbc+DXPx/w66p5hx+CrMoliwHwkUAIr59vxaSlB2v1qt0kuhEzaR31XAEAGHA
	 D1N1e3a9ppAeQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dXNrF0gdyz4wCm;
	Fri, 19 Dec 2025 08:21:01 +1100 (AEDT)
Date: Fri, 19 Dec 2025 08:21:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the iommufd tree
Message-ID: <20251219082100.0ebc5263@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G4rc1m6zPrmEZC2rMS_ltMq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G4rc1m6zPrmEZC2rMS_ltMq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the iommufd-fixes tree as a different
commit (but the same patch):

  e171a1f3271b ("iommufd: Check for overflow in IOMMU_TEST_OP_ADD_RESERVED")

This is commit

  e6a973af1113 ("iommufd/selftest: Check for overflow in IOMMU_TEST_OP_ADD_=
RESERVED")

in the iommufd-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/G4rc1m6zPrmEZC2rMS_ltMq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlEcDwACgkQAVBC80lX
0Gyv0gf/XMTBQNvNp2NjD9knYl5J6TqCTPpEZp/P+z5qJ793J961tYKg/pxpdY3z
XVvrli93chSXafxbN174QuuZkoYx5//SyAszeU2zenXDxTha3oHRJ1Z0eJxzsokf
aysStPzY9knWdu440muitI5YUyHKplaXN279gAHyeSzF5WRlJaXJqbiwKnZaQxNB
yj261+vTrB03uzafdJBE43jjNA/C7I8EfbZBsBAV66AW8QTEY9TtLSvRTEiGDoQ1
1b2qlyQT5RZ9RvbsH6jHSQLqx08m/VOCRUeJK9U8VGsTjAEhjvWa5xcuC+h0h7Zi
r8sYAJ0T1VAXRHLFKlXKXv2X6FwsEg==
=FIxR
-----END PGP SIGNATURE-----

--Sig_/G4rc1m6zPrmEZC2rMS_ltMq--

