Return-Path: <linux-next+bounces-5573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF54A4549D
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 05:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E2ED1893DC9
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 04:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B9C259499;
	Wed, 26 Feb 2025 04:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LWFA3rpO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F397139B;
	Wed, 26 Feb 2025 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740545075; cv=none; b=i+uvh84Im80bwKCe8GubBZYrKdT/AfTbh8j7NGDPxyb/2iDBpqEaFkPhvV3nHcS8M/fg5tDdnfnItiXGFdu13T2ho2CKEDzFOYeoqglhKuUiGTT02oBetREeJL9VmOFukEdzYfTD9uGuGgsD0+qC2O3CPZKSmKiG8UBntUE9XOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740545075; c=relaxed/simple;
	bh=ntYWW64hH+5Qyli+DFAO0CceuQVLVLJi9836nkxdy8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BFb41NsVHSpfkSRXgdpwmJzNjwdXcg5UKq6Wocc8UAo7kiXu6KH49zJNDSr3XGv1r4eE2cRj7nRSlal1QyEigYSjNLqFZaHiOV8/2VbBzfR7xyzSfE+rwolIeT7KaCkRcU/3rjPLjd3HcW6PmqVkkoL+3swfxo5OQUanplYi9G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LWFA3rpO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740545068;
	bh=Z028PwiKvHS5EQ2Fbjp853A2h5isq2cJu82YxQ0Zvq4=;
	h=Date:From:To:Cc:Subject:From;
	b=LWFA3rpOyFVa0a/rF8Tt1oSFl318yaHqTjG7X3zfWnqn9vKw4Vi5sdL6X8YpxFt1C
	 RHiQ5bajPBaBMLbYb9+jVAWLRLRFdFYrilIZYTKb2WVuv2oeo5GkHD56etLIv14sK5
	 lctbsk+dUu5maZ/uWEybRU9hqRa8qpxrpJSw8m/2axPOxBapCfjOs0+pYbm9CJxs4A
	 RY1KuNW9YOhXL9NRj+BqKnQfBV2j6YImLgWD/pvG6zKeU4Xda3d+j3r6lJEP0MWPWP
	 M/8D9wOsXix4B+L3SCqB+NNo6kCVnByRKU+N+nPFGEiWB2w2S75fWL01/mXfpqQo2G
	 CZBkPrbcFaKfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2hhW5B2Bz4x21;
	Wed, 26 Feb 2025 15:44:27 +1100 (AEDT)
Date: Wed, 26 Feb 2025 15:44:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250226154426.451beb4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yKjfXy8ucc3tkcTfIWmtV58";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yKjfXy8ucc3tkcTfIWmtV58
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/amdgpu/display/dc-glossary.rst:169: WARNING: duplicate te=
rm description of MC, other instance in gpu/amdgpu/amdgpu-glossary
Documentation/gpu/amdgpu/display/dc-glossary.rst:235: WARNING: duplicate te=
rm description of UVD, other instance in gpu/amdgpu/amdgpu-glossary

Introduced by commit

  2df30ae0ba0b ("Documentation/gpu: Add acronyms for some firmware componen=
ts")

--=20
Cheers,
Stephen Rothwell

--Sig_/yKjfXy8ucc3tkcTfIWmtV58
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+nCoACgkQAVBC80lX
0Gwwfgf6A9NSQyiPH9RViEMPCXdL7tAkSwSyzE9Z9ZKKHkTnNL6yrPzUDWXIwjak
h5kOusUtRtHqPgtqUTET+SGns4DesnuIgFsJ/GwUNWBdLa6zW5YC1eJFU4urtaGF
YLs8O63tV+sOW0uaP1mhyTZd13GprOMcFSNidL+1bkJLAJ7OqaUmycmovU/hqzCp
bksDSsbHOtMsDHK+A0/uwikk4ksrBj02PTvjAEtnKnk3XfpT6yI+VoXCHutuBtn0
+cA7M5fhVzINaiXzp1NoBs71AzQ0TSWcEPzjpyiVdMtZDP1gKFM67LXxl4/EhrKa
8L7KTXxaQzHHyDjrQw8tOK6OfuqP2w==
=pwxY
-----END PGP SIGNATURE-----

--Sig_/yKjfXy8ucc3tkcTfIWmtV58--

