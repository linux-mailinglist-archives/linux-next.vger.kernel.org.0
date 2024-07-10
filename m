Return-Path: <linux-next+bounces-2919-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4892CAE4
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 08:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B4841C22377
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 06:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2110C5EE8D;
	Wed, 10 Jul 2024 06:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Brwc913e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2C5BAF0
	for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592516; cv=none; b=Depa5Ykpes0ndbh0hDadqvDggw/UH4mvrpCEwiVL7wW3K2G4IOTAb1YdciyK+W0Yzm6gJMoj6/CvNJV/KY1aDjlJx5hRy55teHzXhlkliyMVefJcddZN9zB6y/SGT1B0A4TM2lwgItzfrACIR+RlgebzQxbz5FXtwwg33e5bkHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592516; c=relaxed/simple;
	bh=DjRfHsq2OwCmyWbMuyL8sU1oh74XsFkOydwtU3E+bvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQ97T/cuFxBmG4TJOERdaa+FZiyaM23tvnhixtwjh/QFSA6XSUOZZtqZ/AW5e8IXmlo8yIihATxQoaBP6mzFl4W8kdaLtd8f0ASW8ryGULF/hmFJSoX1hF8g+1yG8Zj+G3W+RXYvAkU0s8wFalFbPaKyeIkVwXz60nk/x+Dxc1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Brwc913e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hsis
	lCWVw+VYGXePRMPXTjTZABHOco1LrXMIPTs+dV4=; b=Brwc913ejyOxvPscFA+v
	K6Lci7ruCt0Se064R8bF16I3tizAfKA24DOcdYG5rRCD6erZ5/SQppnPB0FLksPc
	QL/8guQUxo89wlpUk3mP6VHzjWuB++LoeezPWIMXzQ7+6bWVDRCe8xkbS6T05UQB
	FQgQY16hXtxcTBMIseSSMvLlqJKEVRCVhfvtz/tPUW+kDUATHmqAlEWDBG2zwV7Q
	GZDFtID6MKZjZMDo2x//YrboPoTflErMPqLkovRCfZvXq0GunrWqQXyCdcLZFxKq
	J1OVwxhUKFkB3g9dW79WpxWP5AP6qf2KTIr1gPjfDE7RKSCrQ/bHfpMcka458Iaz
	Bw==
Received: (qmail 428081 invoked from network); 10 Jul 2024 08:21:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 08:21:48 +0200
X-UD-Smtp-Session: l3s3148p1@qUM7qd4cPMYujnsa
Date: Wed, 10 Jul 2024 08:21:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mfd tree with the mmc tree
Message-ID: <Zo4oe536Yo14SlBT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240710141010.4fbd65a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9cxp5WarzjLTxvue"
Content-Disposition: inline
In-Reply-To: <20240710141010.4fbd65a0@canb.auug.org.au>


--9cxp5WarzjLTxvue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 02:10:10PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the mfd tree got a conflict in:
>=20
>   include/linux/mfd/tmio.h
>=20
> between commits:
>=20
>   89f415b99050 ("mfd: tmio: Remove obsolete .set_clk_div() callback")
>   f86937afb446 ("mmc: tmio: Remove obsolete .set_pwr() callback()")
>=20
> from the mmc tree and commit:
>=20
>   70b46487b155 ("mfd: tmio: Move header to platform_data")
>=20
> from the mfd tree.
>=20
> I fixed it up (I removed the file and applied the following patch) and

The fix looks good to me. Thank you!


--9cxp5WarzjLTxvue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaOKHsACgkQFA3kzBSg
KbYNuhAAiV7yl4g0HVVc3mrLR2UfgTk9z46YIjJ4vs413DWJ38KfSWCjB/gchepx
60YvSzFwNf7fSeJ9qFq9ovp5UfA+LPeN/gHY1Ik47jKU+0shR277vYVtslFKcMC8
jX2NKs3+AWiJHKWS4vQRKQOET2FjmipjVR/oKqCRJTrP6fzguVVs4UnVts9Z5pzs
Pt8uV7M8Na7Z18fNXeFh4bH+xEYwG2sfmjvqYkmsmVwr8O/O5meRDQPdvXnBsWah
2d4VUOkytrLwlf6Dobv3UrqywcOXzIOuhG/LJIss84xqo0yTfV5p7FHs2nYSxPMg
eeqsx3TtAWi/Nspngg7P/5QOPuAMV3Mu2b5WqvLLJZJnE0HyUbcoYC19bZ9W/6KG
ehX2yFuXSJEaVKKUT2g575nmE5n/wEj4WfW0nZO7j5vE4bR0UD11RPYrXJQ9OTX/
qmrcKTgnql95GCcuPVNASgwQMRzJakBCDFgRAoBWnUIZ5dJNpHkd0/jkVBq3rZRV
7RECkWUdjmWV2MP5fciSpLO3mduvVoPkG11+yeQCfplrtHP73aBu9CCdZlia3n94
cuOXc69HMCALWOs3AJsOVHZ0BhxLmniuGI+aLEPhLOsgFVKwYglrjAf6+8MEOIHZ
gsJGPiWGEtM0suL7Lu/UhzddQQNATnAiAOjTBwqOHj857R8gxsE=
=r2KP
-----END PGP SIGNATURE-----

--9cxp5WarzjLTxvue--

