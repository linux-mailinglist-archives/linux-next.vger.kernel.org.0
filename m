Return-Path: <linux-next+bounces-8127-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B9B38F93
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 02:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06677208A89
	for <lists+linux-next@lfdr.de>; Thu, 28 Aug 2025 00:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD65849C;
	Thu, 28 Aug 2025 00:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z68l9Ywl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CB779EA;
	Thu, 28 Aug 2025 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756339552; cv=none; b=bKXVRziVNHM1utwf+mkFt/SyaY2qyTw+ZnVb/vW89jmw5Iik0Jot9aRwBNceJvIvyXJb/GvTW5V7HdnQA+jFcaPnMcC12NWRZEh47HCbMIAOMiLqE6ojHzXySehgKQzrekz/5tMbk0Rjkfxdc9DpxOZN82DpAJK0kgHlTYyfWs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756339552; c=relaxed/simple;
	bh=A0T5vpnrwrWTYySqpv1+OzkO5CfDmPgTEx+Q88BI6nc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ieV7WfpvUWEb2YNvHRQeccbxxAXKRWaPy2PCMGNHIwSuI0QjFhBn7mpTp9fbSRpEVFLvlY+nUQUWdh5ocmFUkNmXcnrwIOnI0LxYTEByGPwAMdTWDwzd11l241isUCHPF4RAOy0SvhwGsml7cv4HV7Nqb2HLbSobb9Bm0kidx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z68l9Ywl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756339546;
	bh=V2lp1/i+ZKEtDnIvhKkup1+LvX0vtA9UstFI8fDeX+8=;
	h=Date:From:To:Cc:Subject:From;
	b=Z68l9Ywl7+qSARHDh3u+t9yVaiO0L16/uqpaMqNebpM/UMvsLuk4UZn+SWvgYExx0
	 DgSmkFPc8z+IKrGyNxKb6V2K4fZLPmhvpE47yUMkJRR4e7yMVm5NCAedLQ8lOWgG6M
	 Vz5Y++9G4Jb712kFQzIOQjhxN1rUzf8hqWZomgA6gs00UQlYBv6anJt21R0xLV0jPo
	 9LRxYz/e787ajpSi32Hv9jv+mcdTnNGF0h2oGfn5SuNlySMUvztLJMZIZD8RQ8rsdU
	 8K4ynYQbvCh+mr7LVNXcoORLshvCitbxjbUHi/Dp4QACJ99VlhvmAlxsZCvacIxVws
	 jp32WqTK26NEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cC1rV5QPjz4w2P;
	Thu, 28 Aug 2025 10:05:46 +1000 (AEST)
Date: Thu, 28 Aug 2025 10:05:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-unstable tree
Message-ID: <20250828100546.296ab364@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XI_Gty7jjXYP9mApMpOFD/7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XI_Gty7jjXYP9mApMpOFD/7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the memblock-fixes tree as a different
commit (but the same patch):

  9457e50100f9 ("memblock: fix kernel-doc for MEMBLOCK_RSRV_NOINIT")

This is commit

  b3dcc9d1d806 ("memblock: fix kernel-doc for MEMBLOCK_RSRV_NOINIT")

in the memblock-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XI_Gty7jjXYP9mApMpOFD/7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmivnVoACgkQAVBC80lX
0GyMAQf/VtrJdkxPOj4+Xrw3aA2+6EuZZh7T3eJsX9pnRZ4cISI5/ok+m4w+rtY1
UcGoKbe7wd/KfPN5NZD9l0a0WOhx3sj2UeZrrmTm4rUndurbzxECs+CmRoa0b9DS
HQ5mpaby3n6SlIX2VfMrWFkUwwAWvn51lxHy7NnLSD7AfrgWfxyh7wYJpsaDHaEi
lgdZVil6rphESbAewKwZedUWvoH6mXaYVUWpgHLc554F2nRoYrvo2wHeye+68Tc9
AZzWBoRyjD55AcbaJibSKMrIkgnMplxjoUP0kIhWzxaYya5mQf/muOVg/IbIUj5T
cIEbHJR0kKDrOWNMeaZfheVi783h2g==
=6Kyf
-----END PGP SIGNATURE-----

--Sig_/XI_Gty7jjXYP9mApMpOFD/7--

