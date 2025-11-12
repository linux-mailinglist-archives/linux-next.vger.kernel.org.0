Return-Path: <linux-next+bounces-8930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 940FAC50A6A
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 06:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60CFD4E4AA0
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 05:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C58B2D0C7D;
	Wed, 12 Nov 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DFXfB0E7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BF0296BB6;
	Wed, 12 Nov 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762926930; cv=none; b=su8IU2SHx8v5NdOioLu7iswoWh7RwSR5ucKBu8+gUw7ij+o8YQc43hSgtOMwalIe+NgeIPs0NTXp8wdmuu9bLCFoYjFUnS3WkJri++QCQX1AbihUbyicR3lpjAtlAUQmHckKc5uMb0PhIiX9TmXI0Etqbv8SpL/0FUuoCjLRHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762926930; c=relaxed/simple;
	bh=7DcP8sWQfe31vL/JqvhEU21aY+Qfg1FjgPdW0J0YGyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z3M6VbNTjxWJ1d3d9KHb/NRFkxJ0GkRDxBIITm+jH6dcjDlI8K/E1/ivYiSybq3w/ng/DbyYvyzMMizd1qcqh4n2kgUqaSzUjaqGI4h9LVyI3ODoxXv8gWjZGqb+iurWK0YzMSPytNCE3qP0+3jgRpbWzwtwXOLJbyUdDBPg/mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DFXfB0E7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762926922;
	bh=fD8kl6Rom0+kN+01uCxpX6xuVYGG6ufeeb1V/3/IO38=;
	h=Date:From:To:Cc:Subject:From;
	b=DFXfB0E7u1PedrkhW62t/4t9RJMu5cXY7jrVfE/SxYjqSD5pPM2B/u4Lqw4X16eZk
	 u3aHmuvQly5OzvqDUvuh2w8ctX287Q+y4UFRljWKhPmFxBF6etv6IMmsMJU8TTaKpw
	 06TUi0fZFvL+wPRxyU8FbsZB+gGWqwU8B8xYnL6FL9+OhBJymn8K4BNN5QFgkmclSl
	 onvX0sXuqK7upg8lGX+H9/yQ088Omr+gejMZsYpCQ1xB9/KkZaqRKz6+w2c+1ImNnZ
	 WcGfqnPilgGUKAdJRl7eWt+z+vOZb7thElOCDtbGU/ciLUTXPX/bF3Yx91VMd0yu4Q
	 ThXngs9e+2xXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5t0p2lWBz4wD0;
	Wed, 12 Nov 2025 16:55:22 +1100 (AEDT)
Date: Wed, 12 Nov 2025 16:55:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm-unstable
 tree
Message-ID: <20251112165521.75c74ae7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZIdR1jDCkN8APtNGn8hywCH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZIdR1jDCkN8APtNGn8hywCH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  13eb4056c469 ("mm-vmscan-remove-folio_test_private-check-in-pageout-fix-2=
")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZIdR1jDCkN8APtNGn8hywCH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkUIUkACgkQAVBC80lX
0GyM1gf+MTFGQ6fhQl/vhFJtbgVBpuelYrlWY9XRaVFho0nMXfEKp6S3ZLBgc0OY
I90yrEfY3L5MjNRg4tfsufYiyvsr1ThvvwNJix5o8kdWb+Cj1PuWGggwak8hWyPT
61PXL8ULWswlkBUHJup9LBKudDBApZZWHTfoVmhAIHOQsMAwKdcEwF43YEnon5lU
plxp978YGU3dGwgKiQ4PEoKoUhmpK1PfLgOK2d08JeqW0FEL2HbdHHm+gKsA/OBK
75vHlvcIklSqRq6qv/o7Ri2J+u/5Xg7kuVmdP4gSs1hjkTIMto9oF/3n996ZZwA3
mVTPd+v3GvLVmJ8MABV8d5jpXmeZQA==
=fwQK
-----END PGP SIGNATURE-----

--Sig_/ZIdR1jDCkN8APtNGn8hywCH--

