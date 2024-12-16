Return-Path: <linux-next+bounces-4975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD69F3AA4
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 21:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE8A1881667
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 20:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DE71CF5DF;
	Mon, 16 Dec 2024 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gmrtvZJB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D6B1CDA2F;
	Mon, 16 Dec 2024 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734380278; cv=none; b=N+GcmO89+jJ4YItynQjKYbtvBx7PFcZfrbjcPbhwbzIPAR+mpO6a57bYPjAv89E1VmbOG4JZW3yb80UtjVbi0kzIzLbiXEuTSbffQGPMnCNohgVrCRauqLE6krhIVZ07T1d9wxh+bM19HkLvBF0UufAT/hdaPR7xZostLRtKz6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734380278; c=relaxed/simple;
	bh=GR24x3OHhFrQCbnPPhYwcdgZSvEOttf/pQCe0lifb+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Oatj0gG1x9/SKiDFwXjTNGAwsfFtWoSV8EWRLj+2QS8koGm422ySxWXxx2uMkKEXFS318301B15PWNjsna6AhwPUUASJHEWCrvMJs//BGIX84TLl1fvj9PwrZOqeajLXSFvjfKbntkrwPW3v6Tue7PkX0t/SCZh9Uo/6uTwC0Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gmrtvZJB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734380264;
	bh=uqVEUTyP/P+4CoJlzwfdzOtj524ZyUHntEEuwbnNauE=;
	h=Date:From:To:Cc:Subject:From;
	b=gmrtvZJB2k/OJudlalDjM7AmxTg9s4vAjXqageECaH1J3kl6UbAWv6Ang67eWl2Tu
	 YJ1unHs4CRRCRg7jnL/jA1hIZQmDtj0pyBlPQDYoSdcYO0+oXSQPp31vaBc1gSpPIo
	 mRQkrZmD39ASH4/ENLK2Qp3KrcaX+ANW9xvoVe2Zd35nXZ83Wte2Q7lZqNIyyKgVRq
	 zXzGx44H2c44pzkeC2q4lNVKFsqkksfUddzIlQUigZrnwFS1xHjccWaXpYtfIX6A5K
	 9pNZUkOCW38fHM15buaeVjpd6w1FpFCBXUmEZuk9JAoTgc9ZlpStuiRD9VX6otz+c3
	 a50iMASA0R5cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBrpc4SW0z4wbx;
	Tue, 17 Dec 2024 07:17:44 +1100 (AEDT)
Date: Tue, 17 Dec 2024 07:17:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Message-ID: <20241217071748.5a05af89@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R+a/I.6LcDKGSVxhyzOXaBB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R+a/I.6LcDKGSVxhyzOXaBB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  f05a99b0d5f1 ("platform/x86: dell: dcdbas: Constify 'struct bin_attribute=
'")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/R+a/I.6LcDKGSVxhyzOXaBB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdgiuwACgkQAVBC80lX
0Gzoqwf/drUpgcO+PoRcYCBPOoEgUbRs7COS/bF/bTa4eaArBi2na/J653JnjTHC
BSexpuLGbNlWiW5moSA71DUaQCS0IoVkA15q3bAD2+7uRtU5av4YeLnZzy83GDTs
wguHObMx3f8Enrd9iF8+Tmw7zkkCsanZg+JheWa9XCq2/jnnXMJwaNxs5kjKDcpg
8iywNQ/Stow4l2mGi/+f90MqJURqtuwIrCpAyD9Azvk6kEPGy3GmLmMSuQCqHbm6
1bp7MTURutR4mpV/hLqCYgW728r5B4YWtYsHMKNGs2NGQjd/W85D0tgHvGdh334j
SrJcOAemvmRG7PNaeryztpj0wdSQFQ==
=OZ0E
-----END PGP SIGNATURE-----

--Sig_/R+a/I.6LcDKGSVxhyzOXaBB--

