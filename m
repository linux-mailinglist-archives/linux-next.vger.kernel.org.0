Return-Path: <linux-next+bounces-9617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B172D1627D
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 02:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 199E53009437
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 01:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2559D23EA90;
	Tue, 13 Jan 2026 01:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="djpGMb9H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635B482EB;
	Tue, 13 Jan 2026 01:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267508; cv=none; b=bgdWv//mi2mb7HguDSxlE0EizhngJb30EdG+cBtmfeB3upflSciwFQDcfjh4XlhQpKA18UpSKSAnRLPlHUHIhijprOE9UAOh5zVQnd0pN6atap/5vtpX8IMnv8RMPoooAmOagO/jXvODFsb4gWbUMrKuvrMOggCUyu/OapRehy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267508; c=relaxed/simple;
	bh=k1WNT8e3lC2XcqN9Pk1sYID+uQZWXVW2jzkzc7KC3Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o6vqy4CqRQyeGLnsv/IOZlNVSD4WPGm0gePHwA21FsVoKNbkRoPVgqs/UaSqnwbk+nK38viTZmFHXQl80KzqozLk+MZeo/JvSlyg3yc+oOilC3DPfTn9LUxGthlFY1iP1dtxpoXWeMij0BmxLcSNT3iq013HrjLcpurFfnN5ZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=djpGMb9H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768267503;
	bh=c1dP/izOaHuu7oKP1i8BsIt0X2z108SDmHUb5/p0IGc=;
	h=Date:From:To:Cc:Subject:From;
	b=djpGMb9HInVkUFozBf6oEUd2kbrsbR7ZncgKh/yvc8nxDztIdgQFtti5V5P8B1u1a
	 pliakdakTqDJ/WcJoa0smu4cV0zbrNk418n0OnjzlANfXrXOG1MiUVjFPuMSb6yWhU
	 TRYMCYt36qCDQiOWZVQnNd/+Y+42J44S6zN9ocr7DT34jfScrx1v+31BliPFhADQ3a
	 EfYlbMlV/GhUVFuIHZpJdMRquJa/8Xspmyhh42UBQyFthutTN1V994J/T0GhYSitzr
	 uNMty/7JopOTsDUv+21ZyKJF7XDdn2uQZmChguWbDTcdkQZZMrQ5iHlJ1BfzCBrurF
	 1RgwD95Hwafdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqs4H4k9Nz4wGT;
	Tue, 13 Jan 2026 12:25:03 +1100 (AEDT)
Date: Tue, 13 Jan 2026 12:25:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20260113122502.7cdc6754@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vX/bnszu.HqIoqDetD9zuiZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vX/bnszu.HqIoqDetD9zuiZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  41dc31ad21ea ("CREDITS: add whitespace before opening parentheses")

This is commit

  10986e64ea96 ("CREDITS: add whitespace before opening parentheses")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vX/bnszu.HqIoqDetD9zuiZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllnu4ACgkQAVBC80lX
0GwpfAf/bhiISAAwJ73FRGs3VoQpNWi1kj9ergdubzoBA40O9FXUs39AF8GKv/WW
3rPEhRMhvvvLZruO6LfWCo+j3rszjDAUewbHWRPbHM6HExxcD0p53BZrk3nL1S0m
eZh04/0Xp8n6StPvj7N8MePeD4LUFfLd3YCDonk5CxCMmUCnlvoPKoKegarC5QaN
JjH7mtLmrtpT/NX+hdhsf2/72Uruwm9jBi/R5kpcFarS85VkERtdLKnwOREo9Ror
mFyCtTHrFGEifD6hBgXD7/8Bl8KaBEcZ3PGxcbuEoBiBm2HTy+YbCr10IGF0Vu4A
hO1M5iZ8EEniFy1nR/tCBk5+3zbo0A==
=LmKC
-----END PGP SIGNATURE-----

--Sig_/vX/bnszu.HqIoqDetD9zuiZ--

