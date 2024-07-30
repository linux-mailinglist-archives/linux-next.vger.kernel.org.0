Return-Path: <linux-next+bounces-3162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C7940E98
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 12:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1E41F2567F
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 10:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B12194ACA;
	Tue, 30 Jul 2024 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NWqTYNDO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9118A92A;
	Tue, 30 Jul 2024 10:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333982; cv=none; b=X7/RG81E9gigxbKDinf2f4pRPLYkqZidAU/SQS0lTu/L4xw8gBvJqjVv0o/N8cym2dnNz/+FiOquLdX9wlESaUiO5vwLZ1lq7HA7UDpybssFk9DRze8lEzxvUw7+bA7hPDsnahXVgz2wreONNIV1cP9mskZNPdvbASqZ/lNZugU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333982; c=relaxed/simple;
	bh=4LTbI/8uS/7ZRSzi601hQcld2SIFc/P8A/DEnEUq7x8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxNFbj+ZJKsyKFoECuAA4VClXGrHRJIdyWaqU0WQ9jPBFgrRABcZCKa0d6OF2byAF6C2agBriUVuMTfWYK4w2658rjHI1XGGJT5iRyyvoGoYHkXIipG3y72t55Tz8koyEUivYP9qGJOBENU9VEyawpbYOeiKQs0NErxCaTHo5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NWqTYNDO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722333978;
	bh=hJI6HC6beYfGlVDXH/AjazdYb2MiKLVXD1SHP1bCUdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NWqTYNDOyg7pYbDfRpkzj2zmbFB5HSp4KrU6aYSDDr5ZpODISfksLvE3T4mAj3aHh
	 8z/f5FhxNiHa7tTumoWiCvySSaOtfCdLsuZIL6gUzpTpcm3d6/nKF6Mx2ifc3M7LZU
	 lVmCTLeLbK/AS830R1rbyO++LFMJg6yUwFssXAu3fmd/C7+cfmu042wxHG2u9sX9MR
	 UGoPdKpwUaxlvUjWnWehNXZsaru+Ia3mTdg69wyO2gFT1NHpwzousmc5QQ7fP55fvn
	 +76JAu2h96XwoJdoQsqwGOL5xD1nQmhtjrKdpe9U7Y1dHnGh2rfBQ8rsqwT5sA5GlG
	 dPWhuYnSgELlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY9qG1r3nz4w2Q;
	Tue, 30 Jul 2024 20:06:18 +1000 (AEST)
Date: Tue, 30 Jul 2024 20:06:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ext4 tree
Message-ID: <20240730200617.01abe3fe@canb.auug.org.au>
In-Reply-To: <20240710182252.4c281445@canb.auug.org.au>
References: <20240710182252.4c281445@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RratSL8s+kSi6_bSsXCSn9u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RratSL8s+kSi6_bSsXCSn9u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Jul 2024 18:22:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the ext4 tree, today's linux-next build (htmldocs) produced
> this warning:
>=20
> /home/sfr/next/next/include/linux/jbd2.h:1303: warning: Function paramete=
r or struct member 'j_transaction_overhead_buffers' not described in 'journ=
al_s'
> /home/sfr/next/next/include/linux/jbd2.h:1303: warning: Excess struct mem=
ber 'j_transaction_overhead' description in 'journal_s'
>=20
> Introduced by commit
>=20
>   e3a00a23781c ("jbd2: precompute number of transaction descriptor blocks=
")

I am still seeing these warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/RratSL8s+kSi6_bSsXCSn9u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaouxkACgkQAVBC80lX
0Gzx0wf/Q7VWcCNQkOejP+5A4ckv8aOK/sKU/EiaxvlvSCT/uAJtZXUgOemDK/+c
FN1WhPUJ5v3jVIhsx/X3Re+44SCC2LNs9+zfmMLE00ZwM7ZzgVe9UTDJi/4OeKlu
ms4LRv6EimjqdUxe+xbeVT3ctA5B/Ab/7WQBpX/DbsY6klwDMoXpDE2nExnl66JF
rii965ubLrPKzZ4mbUUFH7CIoIyBmkaGgg2sHrQi/tpAKcbKBwBUEd+019JTKTtV
UPvkkBnvzDxUgWpSpbllpWJxDQVUS8zuKDnOXIhPn4vwMNdjxCtxKZabDBAmu/ng
Mur6iut21RIlEcOBVDEAQ0AApfyJrA==
=OJeI
-----END PGP SIGNATURE-----

--Sig_/RratSL8s+kSi6_bSsXCSn9u--

