Return-Path: <linux-next+bounces-6716-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A9FAB4882
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 02:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 216571B41F5C
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 00:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E72354763;
	Tue, 13 May 2025 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OqE0Errf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B586D134D4;
	Tue, 13 May 2025 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747096758; cv=none; b=QNcCJyxLR4iSAlL8EyR2SIHpihSqUEWCJSjAVyvl1AtMCVNaySIm6Y0lyg/tkJhZOOKr+OPjstekqP7YxuXywyXgPBGhB/Zp/T8ZCPHf1K92EXEFXlGK2aEPQLjBxLYBt4hfhWsqkPzsR8J3cylcws5PfBX9ZeEGUEwPTIxAdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747096758; c=relaxed/simple;
	bh=ekW3JULhLKljZiTKaS92uYzS61OVTNUlsMRWjOeogek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dNQ0tm7IKQKqqxCFWHUifAMbf2ckOxaZoRjucdeNagofbPbgftSj//oZdou+YRVUVtfkl/giqU+xW2kaJdzCrDKKqytXLmdraALGTkvC3W2MH9RWbdnu2+KvfZ8rkZeDqpStrbV7gBmj8/fjLyvRriUceFgWd3DqSE98twbaYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OqE0Errf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747096748;
	bh=1zD7WhWv9+wqXCSz3Zg9qE3ugmUDw3wIn8usYC6AA4Q=;
	h=Date:From:To:Cc:Subject:From;
	b=OqE0Errf3gJAdr5wBOXCMePbMXKj+mDHdTxHtSt+6gk0ZFkWjv3WqIJNKi+TT1ksP
	 wLyq1490A6EYmDYIzSm0ifi/KpFmoxjDzZ+ibo29RTCR98SusVdSGvBordfY3ZN/A9
	 YAasE2H890Ft6ztkuGugLPgA4Tjjf77aZEZMwT+7bWGu91iQkiuHg/Whb1v+b7p82T
	 V350xBdLFNGwJ9h6xoKr/MZ058fyZB5ZakEKpYBqDmXJ9pnaKg88KRIYKg/Uz4OYSy
	 S1Cpi++yqMa2SzWHECjcBww8D6xhF4Qmf4ls9f+6VaHvj9qqKx+MTis+7NZ8YiCuOV
	 9BHkZqfgkVjSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxHfN4T02z4x3J;
	Tue, 13 May 2025 10:39:08 +1000 (AEST)
Date: Tue, 13 May 2025 10:39:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the kbuild tree
Message-ID: <20250513103907.3aad5afd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Isb599iTHaWarAbepJE+q5j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Isb599iTHaWarAbepJE+q5j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the kbuild-current tree as different
commits (but the same patches):

  188d818d66b7 ("init: remove unused CONFIG_CC_CAN_LINK_STATIC")
  cece6e78ad37 ("um: let 'make clean' properly clean underlying SUBARCH as =
well")
  8d5f08b84e6e ("kbuild: Disable -Wdefault-const-init-unsafe")
  e08558fae8dd ("kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to Bu=
ildRequires")
  3a0a25a4cf18 ("kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arc=
h")
  20511f5e38a5 ("usr/include: openrisc: don't HDRTEST bpf_perf_event.h")
  32562a619812 ("kbuild: Require pahole <v1.28 or >v1.29 with GENDWARFKSYMS=
 on X86")

These are commits

  d1b99cdf22e0 ("init: remove unused CONFIG_CC_CAN_LINK_STATIC")
  ab09da75700e ("um: let 'make clean' properly clean underlying SUBARCH as =
well")
  d0afcfeb9e38 ("kbuild: Disable -Wdefault-const-init-unsafe")
  5bd6bdd0f76e ("kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to Bu=
ildRequires")
  657f96cb7c06 ("kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arc=
h")
  56045757accf ("usr/include: openrisc: don't HDRTEST bpf_perf_event.h")
  9520a2b3f0b5 ("kbuild: Require pahole <v1.28 or >v1.29 with GENDWARFKSYMS=
 on X86")

in the kbuild-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Isb599iTHaWarAbepJE+q5j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgilKsACgkQAVBC80lX
0GyOTQgAgI9dcSmFoXlgNSqNiSwkpUfVqEZM7Ofn8tfzTi1fNT/rIPOkWveVowZe
B1ipagPn/Tv4aIdI4FzayS8xSd6NHloCsy4L+Gi2K34lqkyiVE4i/X2HgZmUgQrX
NGqDm0gpeBVJaIuHOn7RDMmOOpHDUPWNO4JMtx3qSxEztioK/mqxFSDdbDz2xFis
2xAyuUqMyTrYJsIpQAzVIPzsD8P7lPqyDGEVjCvnAzGY03oh4BdC8WJC4wFamd30
ZC97DLNghDGfWv5/vpqHJ6q/O1W92xXOQCyEXKP433l8zK+rHinWMaj9767aXHYW
m494TpCq/Ratk8XubRm3m/SI3hCUZw==
=v3bo
-----END PGP SIGNATURE-----

--Sig_/Isb599iTHaWarAbepJE+q5j--

