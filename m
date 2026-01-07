Return-Path: <linux-next+bounces-9564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6177CFB9C8
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 02:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB0F43014BEE
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 01:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846AE1FF1B4;
	Wed,  7 Jan 2026 01:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fyROGfjw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E41310FD;
	Wed,  7 Jan 2026 01:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767750043; cv=none; b=l+Z8yVdEPObKj8qTvTVISaP2cDqoPRh+KfpVNA4ZyFxBig1aiY2Kgpcg3ya3xIj4Q7o6hYpwhJWtFiIvIWjgaeK582WtXInDciVnDuNn4qbpMYKy3/djRnNPpnfogU5uCwxy2OolaMwU+sEvIqH6yVXQV2HTkM6jHFsPTelk07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767750043; c=relaxed/simple;
	bh=h8w3qCkRk3kYgI2r9TjWQ48+06jWW85uPm5Wl9GFGpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I2W71CAuyH3QSUF64vkRmBrNZZLOsjpocEfiKmPJJ8wEeYlXM/z9SSkE7gBVagSqveLuasAtzv5VkfX6wqOp6RASCAVVFkANbg6tAkHstEAm15Ua6StyhNmzyacIAaRMPAb8MGHTh9lhjLZuk7DkLjIhsVfTXGW1XaCMY+vfW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fyROGfjw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767750038;
	bh=higjFAzZDaJKqVbWTgO3vpXntMjLfIVg7AUinmsIPIc=;
	h=Date:From:To:Cc:Subject:From;
	b=fyROGfjw/82mRDG7tOGK7A2838pxD1C75vktjnwD5f8QaLm3/wmkRShv42cSGXmU+
	 LX+dgsLaixGh9YcrUJ+QQGdYrpd9kgnd3zyrd86enzcBXoBFrGjtU1Q99cveC72qW7
	 dEFmle8NXCAkyD9FNF5vhIJO2+C5om5sneTs9bdTGXvBza+T2CgKwzOfV1n0LwU3sr
	 oDD1MQzBOoCAApzkhQpUYyXJOECHWWN4m4DFTC5HfSR2HKiLObYVabRCEHzUWPal0b
	 KDd52XUtlS4goEiUaselJzkYhYuZ4wB9Iq/LBxlbW5aH2lbFP1ZLanQtC/2AdvtwmB
	 fSgrbzOiywz4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dm9j23Kghz4wQc;
	Wed, 07 Jan 2026 12:40:38 +1100 (AEDT)
Date: Wed, 7 Jan 2026 12:40:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the arm64 tree
Message-ID: <20260107124037.1f78c38c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WSUJrmpRf76ujoLnfERNhTi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WSUJrmpRf76ujoLnfERNhTi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm-nonmm-unstable tree as different
commits (but the same patches):

  98cc091262ef ("arm64: Avoid memcpy() for syscall_get_arguments()")
  35c3dcb1ac2c ("syscall.h: Remove unused SYSCALL_MAX_ARGS")

These are commits

  f43c18b3062b ("arm64: avoid memcpy() for syscall_get_arguments()")
  99630b951468 ("syscall.h: remove unused SYSCALL_MAX_ARGS")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WSUJrmpRf76ujoLnfERNhTi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlduZUACgkQAVBC80lX
0GwGegf/ViXD84aeVahWsPQLwT2e+mTd82RzjxrGjJ7DXmTt5g+4BMgUGyrMMiVD
p0Vl4xZbz3G3Q+X8g1pE3/o0z92OY+/jhtnHXJ045ECX7VW9/rwoK/NLwz83uZ14
G+YzzAuWUJ2egYjQpPS7jEKL0OTBxvTQurB799nKHRZuNUCxgTFtgqKCLFTjQWF6
hbpSZhFwUfkZs7BmcUke8BT/ii8GfbEqk+aELf3zGNDgDSt7wDKrSRs2hgehZT20
bwLlWnNvQ4NnioJkMicjy3xrJPsajhVVaZkoaoFueLRbpW+GHKTVGLa3cuoQ9C1v
p9NNIKp5ERYdunaIFZ7L/5rXzsuhsQ==
=CHog
-----END PGP SIGNATURE-----

--Sig_/WSUJrmpRf76ujoLnfERNhTi--

