Return-Path: <linux-next+bounces-5620-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB8A4AF3F
	for <lists+linux-next@lfdr.de>; Sun,  2 Mar 2025 05:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A4E3AE423
	for <lists+linux-next@lfdr.de>; Sun,  2 Mar 2025 04:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB45154457;
	Sun,  2 Mar 2025 04:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VmYLRYiM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D505963A9;
	Sun,  2 Mar 2025 04:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740889451; cv=none; b=PPW0GvddQRDycF5C5O8QW0YicbO1gvqh4QAlcPtdNhjS8bngRpr3/YqGSCxEI0+w83eppsZEeJ2soWIr+DK7JrIQmR+U10lCxbBaayDLgd3G7MB8wV5qSYAy6QgOZCe4VEwvfou46UhXhSJWl0tHLdCdnPwY9OBQAwV8jR9FzUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740889451; c=relaxed/simple;
	bh=NcyKoXl2sL05KhvEZe2LcgLQsN/+urHo7KAqgYibfxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lORe5IOgPh8l6grEPc5SmJazG1uVZc1DtZk8PvjNyf7fDZze8dUqFsk4VrkIr1fYY+SeBy/H8ehAIcL3mK9pyS5ArrVbpl5gu8UcEKUv/bS8v5BDutoKwbYOJc7/qIwLtHyxLHSdKkdSlQHeMJFpiSSU/KLaaZMJPsp0H57dIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VmYLRYiM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740889446;
	bh=ztAX3NuNeu9KPcsLzAs4Y8ajekixynY59q7NuQetkZw=;
	h=Date:From:To:Cc:Subject:From;
	b=VmYLRYiMCTr+3AGar8lB4J7L3/Brolq18gL+IssSJH5hmIn2a5+6QHw3VDq/g3pKv
	 qG0TI+uFcnBSnyOjTjwlIEdENPfVIqI0pKE26I7dD7K5ABJsUOSsby1Vp/Z/QTOM7x
	 +Bt1l0LhNV+wKwTtAwFB85rIiKSo6PWI0i0gPIdZ3sOUe1UCdy8AM62iCGU1WjWzcP
	 kVvs6zf+PDIrI9Du7ytN8zsITM+aUVrFFVDSiaHHXeIU0Pl4FG7T7hcCl3AV2E6zwc
	 gvChmbjSwlZvP6WuXFotMZOF7yEs0e9JaFY1NT53cuL/Tqib+lw0dtk6OpjVnMrI9s
	 7FGPJwlQMw2rQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z583B4VGTz4wcT;
	Sun,  2 Mar 2025 15:24:06 +1100 (AEDT)
Date: Sun, 2 Mar 2025 15:24:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sean Christopherson <seanjc@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the kvm-x86 tree
Message-ID: <20250302152405.06e8b711@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rPqAGiLvRyI7wmtHOFO47r8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rPqAGiLvRyI7wmtHOFO47r8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  3c20b0953a00 ("kvm: retry nx_huge_page_recovery_thread creation")
  cab17e9868e1 ("vhost: return task creation error instead of NULL")

These are commits

  916b7f42b3b3 ("kvm: retry nx_huge_page_recovery_thread creation")
  cb380909ae3b ("vhost: return task creation error instead of NULL")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rPqAGiLvRyI7wmtHOFO47r8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfD3WYACgkQAVBC80lX
0Gwzgwf/ZvxCbICV10kDF2cqH5yQz0g7KQ0g+15h/LeZ5enOq6C/Hi30sNPUnZv5
D1yy7f4ZSvX2YSOa2t2TjrAw+Ob+6eKY1GWDGar2YOOVIspJ98VPGKxn7X2Uh7La
xvrR13eYze6w7PA59IJolwUZwv8lchkBPlrdjfKgN25cZnaiQRVpAIzu9MYPEOOP
7VjRiJ20EPy25aj6KE/RGlO5ZFrBQmOhKAQQRgQ9gaE4vUa8fn3IP+RmVObT1H9L
VNLRCfnvn90Po/JQnaW6LZFnmiMXCQ/EpvVt5/JZbPlr1HK7REnryXhOMv5neRS5
/mA5GlVGf65kjUq/yvGFXCOpvkGM/w==
=xurA
-----END PGP SIGNATURE-----

--Sig_/rPqAGiLvRyI7wmtHOFO47r8--

