Return-Path: <linux-next+bounces-5717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F67A5B738
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 04:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DA147A7869
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 03:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2BC211C;
	Tue, 11 Mar 2025 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aC3s4kOz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB7029A5;
	Tue, 11 Mar 2025 03:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741663831; cv=none; b=UArKa9ODE73S9lLNbMkev0S+A1Lk/mTfxEArQGGsUQb413+M9U+ThNsQDMsat2yoGDQnvxZ3OWBA/FVr7/V5ZOLSoalVNqxuDeIJA1Wad7MU+VjRkf3+W+jQXjaQ4dP6R8Fen2cBKEsEj1g8nFU99/BCIVrl4X+5tqjsycb+nBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741663831; c=relaxed/simple;
	bh=ZwlHK79J9MRZ8GAjNji2yf54K0qSzD0Bnew96CWQ67Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BZ3gENW1UFjhDCPDGAj+O/oannQlfKtOJWOw2OnP8ct4dE9H1EfhsNt5nrCU7a6gZR6njNg5LLvMDpMmBlcma5JFLzRCUBti7PrsiQNo0vV809qa2KKeNe8pX8Osz5JmSzCHqwMTNCO1lBHM5yk8i6zujMqL7j1F6eOh2VrdQV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aC3s4kOz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741663823;
	bh=VrA8PNa9ZyfbBtfKogV1XjtYw0Uaew9jDpjWMnVpYbA=;
	h=Date:From:To:Cc:Subject:From;
	b=aC3s4kOzgejSodTWOo4/7suz2CmWJ7n5agPKJlU2exKsyq2RB2y/cgNO/T8PKCJlc
	 uK9NFkYDl3WU/QMzywR20aaadV3U96uaN3GJrsKD5TadP+1F1aEIjHe9i1lt7taevz
	 1PQOwZNQS3DQleIeofmpG264OwJ/mPFm/13kqZBSgia0iCxvsnJmboqymc9u057Ihq
	 gwQLwzp1IIS9ny8FYt7aa/aeadhrloCQm88K9605dtZS2ai75+N1Sel/1CFK6K7Try
	 xQA0UTl2QFVcrUD9ir787z7fIG4S/AE7FxHMfwxwlMMkNOrcci27ZbDNmCnVt7sLKZ
	 hn2YgQ77Kn/9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBfR32XNPz4x2g;
	Tue, 11 Mar 2025 14:30:22 +1100 (AEDT)
Date: Tue, 11 Mar 2025 14:30:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>, Wei Liu <wei.liu@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fbdev tree
Message-ID: <20250311143021.0cc40c0e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sFifZ.i3FC_wKdJpDqQqC7m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sFifZ.i3FC_wKdJpDqQqC7m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the hyperv-fixes tree as a different
commit (but the same patch):

  f2b558988c7d ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V=
 Gen 2 VMs")

This is comment

  304386373007 ("fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V=
 Gen 2 VMs")

in the hyperv-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/sFifZ.i3FC_wKdJpDqQqC7m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPrk0ACgkQAVBC80lX
0GyVDAgApglYHJihrS6svQEk6Oopn1hn0njljUjcgLZmbB1xuGJsJP/Jpd/Ygwz+
voGgvls3x0TnGLbff2stUpbo/cskXnKreweKB8usNFxmsYvxKD8cnYQY8bIY7VW0
qCZFen96wuPT1bCAP2OrGjqDF6yBNJQov+okzpa9PPPyIJW62LysgJi05APRMed1
uVuJIaueyxWfYX3OW6kbftHhvUx6NgmbW3zJFzXOtkZPLPaJ5ZCovkRrCTV0Hlhu
WEbCg2R4fNX5Mf5zdJKXaE3BA6k7+ginqfFbUirHvD1bmwLeq6iHbSRKlHf8UH7K
j1hewWN5vAUpVFeipaXSRyhMLrHGZQ==
=VzzT
-----END PGP SIGNATURE-----

--Sig_/sFifZ.i3FC_wKdJpDqQqC7m--

