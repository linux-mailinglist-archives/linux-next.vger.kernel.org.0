Return-Path: <linux-next+bounces-5244-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF8A14939
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 06:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5F7C7A38FD
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2025 05:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462501E200E;
	Fri, 17 Jan 2025 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P9ihfDOT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E5F1F708C;
	Fri, 17 Jan 2025 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737092721; cv=none; b=raZdGrhSHlUf8mZjpEydGHWuNerjn1BY5lRwETIaSJMiNC7rWvAiEh9FlqfjTNAyFwlwPfbTKUugXNYi0sIkGQDLZYUp5iGzVdNyT6tCHpAz77TNCVrpIcePUpLCMCF2tNNv9PkKiZEIfCUCRebsS1lrwln8T0ZjifUzKQ5G4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737092721; c=relaxed/simple;
	bh=dD8CfdKhnTx0zze3K1tF2RPc+nZ3yVJL367aQqWQ6ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=udvVsxzr8Y2OM+AN1JeL5S2CyUxF9NwqpXEVCMmKzoZjwwAeTFN7m6XTySLKD903WU2MscbfyiV0dVLCJ9j7gMi4lzqtqFs5FhF9yPt5UptJnqf4QTuILsNZcJRY2fhaERPD1xcgLeyDmRU8uNT1y53atumoVFJzEOX0ctyNhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P9ihfDOT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737092708;
	bh=9lf9dPqMPoOJlzZae3TMEpasr27IZe0hotSkNBx8Jnw=;
	h=Date:From:To:Cc:Subject:From;
	b=P9ihfDOTpbVzf0CgSeo8f1Ky17UTcf5X+CdVuyeDhCDDWLxuGAy70rGfqoFai8zri
	 c3NnmIRY+cdKNt1WJkQTtT7QBIPjRAH1fE/B0qk2OMoACitdw833n0emyf9px2xLNc
	 T1CuBVfmiA652egZL/aO3qNOt5rxfNIB/yvF7S8DFlWd0OXsv9CbBG4d11SJytroaU
	 epNi6sxCYhyCwZhrG7x1cGYGShVELvxvesxgqIAkeqHYTXwvGi8eX8QEDiguFQCGM/
	 GCMMigwwiaX1u7OrHW47mQIp1TwSPOtrn3nC6F546xvMahKtx69S4WcoLmPMcb4ANS
	 R/q9UBcmcnoaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YZ7x00M4Sz4xR4;
	Fri, 17 Jan 2025 16:45:08 +1100 (AEDT)
Date: Fri, 17 Jan 2025 16:45:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250117164514.78418f37@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/24z3rFmcMEi.svSFH_tUkI=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/24z3rFmcMEi.svSFH_tUkI=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:357: warning: Enum value 'DC_DISAB=
LE_SUBVP' not described in enum 'DC_DEBUG_MASK'

Introduced by commit

  5349658fa4a1 ("drm/amd: Add debug option to disable subvp")

--=20
Cheers,
Stephen Rothwell

--Sig_/24z3rFmcMEi.svSFH_tUkI=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeJ7moACgkQAVBC80lX
0GwraAf/SOvoFpqdT6pfA4mZcBvvXqf/hySKgAie4ZmZz0xopdA6Inn72hjcciAW
3/FEEP4ptyrPNT4a/ebRKWfHC5kQJG/uasfInbSkD6Ofpiu7INYi71/U3o6g97BS
PsZ4Nv5uEMpc3rN1ka39+W/8MMxjGwxdid7f97QE3GzWBFnyGBNxfezHMXVKOMqD
WNr5PfsdpV16TxOq5hWmmAnN4oaG7do0ZHa55PSIxUZ9blBF7CwCFJZnJvD9pCFM
PUhHDhiz/gnai3xBzGM9C87urMk6c1Rr9qoURbTlGiujklUtYfIjoOy7rjTPFagH
CNRGJdgfK0zJmLDwM2Mc0le/YA3gSQ==
=zFXS
-----END PGP SIGNATURE-----

--Sig_/24z3rFmcMEi.svSFH_tUkI=--

