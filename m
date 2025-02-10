Return-Path: <linux-next+bounces-5399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B5A2E1EF
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 02:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88902188784A
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 01:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A65F9D9;
	Mon, 10 Feb 2025 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f719+Kkl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746619BBC;
	Mon, 10 Feb 2025 01:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150303; cv=none; b=GIO7E6utYkS8MSucTXUSLayaexibWdgqOYsa9mK/u3sdMOd3fleMfqOpxeecIOL0aEnEUW3jiRo/ElReyGhpiNZoYJi6izMg1CKsoVAPVrYUhia3wmlNjAwU2sfd7qL41X41oXCG35gq7eKYKYO/dUO9kLyiCTWNJwo1pbIaFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150303; c=relaxed/simple;
	bh=cIRf0LOlovzOH2gPHudBM2UDl5by4bppCeGovNhM8WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PetcZOY2qFgxl2T6VHL158IE68z5H3duYyl6IRK62mSFsdtSwdKGSX782aoI2EnOkuHxSDrIp4YM107ciLIn1gDvEvmkIWjSSzZ2uHvZYeLzUlyrsRH3JbQYY5lvt3pXPkKmXnPF4p6/4yrR43b1UjRsicht4Ois7MRC0zRG2zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f719+Kkl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739150294;
	bh=VOs20nCV8RtszMWIyCq6/be2j8oJKv8ofzzRpmqMVC4=;
	h=Date:From:To:Cc:Subject:From;
	b=f719+KklFX/7e62mRACjSRlFlIdf967AguNdJxnCYeIRIRUaBZejVjGdjmZd1OrS8
	 pu23yr/oqclzOTrZnt7tHM+7ow5jy2ltg1L29rOiT+M35Ceqtd2oljXza8YVlKXrML
	 NRTGQAVzaH5m97Rv1QN+VZSowfsnfU0KGPLitLMCLmXE1tWnRy/b9D4YtoarDCqvhf
	 nHaq8wXuEZQyCexQJzWYHDFO6sPtQaEl7+xLf6BX7np3zifL+M0ZQcCpm/gSLXxBDS
	 4gkQAhcX6tGzJJxBQ057B2eXVLI3f+JtM0+lDZw2dBZmeCF9qHyJwYs7uNvBiaMExM
	 rRVTBIAcjY/VA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yrmsy4Hm0z4wby;
	Mon, 10 Feb 2025 12:18:14 +1100 (AEDT)
Date: Mon, 10 Feb 2025 12:18:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the security tree
Message-ID: <20250210121813.3e24cdaa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IXFrnqvNTJXE1st=d/lR4UV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IXFrnqvNTJXE1st=d/lR4UV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the security tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/perf_event.h:62,
                 from arch/arm/vfp/vfpmodule.c:21:
include/linux/security.h:2379:12: warning: no previous prototype for 'secur=
ity_uring_allowed' [-Wmissing-prototypes]
 2379 | extern int security_uring_allowed(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~

(and many more)

Caused by commit

  c6ad9fdbd44b ("io_uring,lsm,selinux: add LSM hooks for io_uring_setup()")

I have used the security tree from next-20250207 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IXFrnqvNTJXE1st=d/lR4UV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepU9UACgkQAVBC80lX
0GyHsgf+LO9mZEaNl3EE6SIEM0k/Ik74jLz1kkzgfIRRIWHV9udVo/QlcZ8QlbVx
GqsyUt6L/2gS+hcCoLGxlInYMzaSipTrv7zULCQGOnjsnbYxaSwgEWM/AcErvDG6
nipkMBznxU5VfLACF4Kl5Vm9aF4rhfGtQOG4TQiEXZKo+jPp+94DUxtOIdKX08hJ
5h4jpblCicZpk9V0Qs8Z3C+7SNW5p20tS9D7e1W9P4QOJzV6DrFlmEnw5W6sklmh
O/MGxYXbq9cIG3LKiKAeZUcyUYSER4BoIyecQ/Dnsao8vMHH4mrB0GgJApVINsP+
spfow/11bI61vq1fksE1Xo6LiaLFxw==
=ICwa
-----END PGP SIGNATURE-----

--Sig_/IXFrnqvNTJXE1st=d/lR4UV--

