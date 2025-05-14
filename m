Return-Path: <linux-next+bounces-6761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629AAB60F6
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 04:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ACAF19E6C95
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31131E376E;
	Wed, 14 May 2025 02:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kJcApzP6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E91DFE8;
	Wed, 14 May 2025 02:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747191330; cv=none; b=hXStKyF6YVfi7A6BXnh3zu1YzmvwMMMktcgJNy7ajyjiuUYNAe+G8VIIFmF5o5RMBbyRPPXgCQAFj7h8U91Y5H/bz54aISJ540/xlWjCgaIK3RaYQLgxt1I2KGT83+8DpQmzm/Q6mtPJwb23sAkUQ4OOvThBd1z/D1se2lb8XQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747191330; c=relaxed/simple;
	bh=Y2OBcgmNqsuZCUInaekZzHIGFKvt6D5fLLD1H3BLo8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2NZKdyhdnPob8Gt//zKKtLgLAl08i7kJmrStqRUXIrBkSTDPCvhtede0FgyszPqZoLYVD8Kc8eNtbCE2UHl35SqM3xSPYb5bavG1zQdEoJCQXy/yItHzefNuLPTf+3Ga6MU1Jt4Do1sE+ButREs0jkKc4zHlIrp1qtCwbtEy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kJcApzP6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747191325;
	bh=1GyhdxoFcmvQ/1wixeYFDyAiiHlH6cVigCcu/zsmhfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kJcApzP6mYRq7RF9cu6wbbkKIHccxrAVoVDTNO/hnQycdDL6KZ5jxbzusawjEvfmD
	 9ZRVsoN7nLZcCcHfltNhb4swAPE71ipI8oBSvqCH5TNay6osENOaBMvVxpBNmvOwyw
	 F+1I/VbUj/FiJQq1Z/DmNN93hv9Ofk0RnTjVp+nJhXNC+ZlZo1mQNs+7ojpKtJ/6aq
	 rAsUfnwoaxRBTnBwXXgAKdP4l0Z+BKf0/Skl076mzTgd3ZCQrXUj4HrrIMAMje6Ufx
	 Ehhev4LjDcmbaI9FxyPHBIMYJhXAA04TGi8O/0Dw6IZN+5mbivnVcnZZrfU/60qNu3
	 zmd69VYFPzC/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zxyd93Lhnz4x8f;
	Wed, 14 May 2025 12:55:25 +1000 (AEST)
Date: Wed, 14 May 2025 12:55:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
Message-ID: <20250514125524.1528467f@canb.auug.org.au>
In-Reply-To: <20250514124131.15d0117f@canb.auug.org.au>
References: <20250506114402.2f440664@canb.auug.org.au>
	<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
	<20250507111026.4700e392@canb.auug.org.au>
	<3d5761da40d0ddf4109d10d6f3c3d2538c4d89d4.camel@sipsolutions.net>
	<20250508132459.04bd8e70@canb.auug.org.au>
	<20250514124131.15d0117f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AV5O.D4/XVTZReCUckbCfDy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AV5O.D4/XVTZReCUckbCfDy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 May 2025 12:41:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I keep getting more conflicts in the above files (each time one of them
> get modified in the iwlwifi-next tree.  Could you please merge commit
>=20
>  ebedf8b7f05b ("wifi: iwlwifi: add support for Killer on MTL")
>=20
> or the current net tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git#main)
> into the iwlwifi-next tree and fix up the conflicts.  I believe that
> will clean up all the conflicts - that are really just between bug
> fixes for iwlwifi and the new development).

Or, of course, I assume the iwlwifi-next tree will be merged into the
net-next tree at some point soon ...

--=20
Cheers,
Stephen Rothwell

--Sig_/AV5O.D4/XVTZReCUckbCfDy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgkBhwACgkQAVBC80lX
0Gy+dgf+NLBlPRxhE4KhoYVcdBI+7ngelGqJD+/yOvaTpv7xRhmztk+NTg/pw1SR
kD5IdSJ48uQd+U4QjTJqYBNJmXPPoDKJAbXes6oGgoaGsvpY6tb7KX4DrtiaHjeK
1wVg1SshgV3aaorWekhzQoQ8FA2MU349N4zTzpEBGpLoBxjIIxh+8o8G8P4mxUJk
/Y91xsxH66Q1vewZ/eO95jKLuW++QuWmvaXfn0R2uB+3ctsoz/xfAii1uzThn0+t
smLh078y3x63RB6hdAjY0JUWkQRYR3AU1dzPxmIwglW1D3Av+4T5Rorw+zE/M7QI
oPJ2qfrRsd2uqygKsGzAJPM1/L/TEQ==
=lhOm
-----END PGP SIGNATURE-----

--Sig_/AV5O.D4/XVTZReCUckbCfDy--

