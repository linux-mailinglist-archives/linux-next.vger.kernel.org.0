Return-Path: <linux-next+bounces-8418-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25732B8FE39
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC5A1623F9
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 10:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586D1221710;
	Mon, 22 Sep 2025 10:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzqaw4EH"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30573182B4;
	Mon, 22 Sep 2025 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758535292; cv=none; b=cNgLHyid/A9m5C8QeJIIUw/eEUKiSHeCbxZCuAkE71ivd/ThLtol5g6bHxAs5YB/wEUeEkcquwadz7S3gAq4rFnFezpPdntImScXvbgoXy6UAJv5vJdvlIPxDDmyfypOuHc1bUy0hL8oms7gAQyNfZN67cqWxaDaSEJFFmZKZD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758535292; c=relaxed/simple;
	bh=ynNgqmo0pQavhVxg0TKEeWjrWUQkGX2HuaTJszuk90o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VtpwtJUqg8DkEVMQWv2Rhut1NaYSqi+pbPcF0NH1RUGvK9JZkNiVXM3UEJq3SN7gEFi0n9lp8lE0NJb+gGSZpZeBlPHof99jcF/GEFFjhtFOo0dqfLAfn74mcnruMpZeGUwwZhG0khaP7fVh7X6OYmbfrVEM9MuTPQ4aH/SjPoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzqaw4EH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AC5C4CEF0;
	Mon, 22 Sep 2025 10:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758535291;
	bh=ynNgqmo0pQavhVxg0TKEeWjrWUQkGX2HuaTJszuk90o=;
	h=Date:From:To:Cc:Subject:From;
	b=pzqaw4EHBtwNYN9MpZpkwQFuI/Comg+Sprg5NrHv7UcbQxlMAB5s6KNpnAjT2ShLD
	 QB9hyl/gB2iL52/1kLT85k0V816yeqszDgldNvyed+TXWmNZ63qw6Amj97peTLPOVS
	 onFb0PMIcGjXwNnNN61JOCpml8vzKf1eS85wslwJcCYqaqXFHA+0fYEZbcWVPnUhcn
	 YGxQS4UN3pWnXnVMrVWgdGIXEb5NU+ecPXC13iQQYjFH8PRg1SCG5BIyEBxq7pTNaI
	 wUs4vX8667Vq44EcVVuj5VVip+lc5NFYVbHPp72UsJ7jkahrRpxEyPqT838cAiGc/0
	 5SxvJYG37iySg==
Date: Mon, 22 Sep 2025 11:01:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Yu <a0282524688@gmail.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the mfd tree
Message-ID: <aNEedsR5CDuVBoyo@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VFlQZp+SDlEtVcDv"
Content-Disposition: inline


--VFlQZp+SDlEtVcDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  MAINTAINERS

between commit:

  8c13787893fde ("mfd: Add core driver for Nuvoton NCT6694")

=66rom the mfd tree and commits:

  51dad33ede636 ("mfd: Add core driver for Nuvoton NCT6694")
  611a995e8ae1a ("gpio: Add Nuvoton NCT6694 GPIO support")
  197e779d29d87 ("hwmon: Add Nuvoton NCT6694 HWMON support")
  c5cf27dbaeb6e ("i2c: Add Nuvoton NCT6694 I2C support")
  8a204684d0ffd ("can: Add Nuvoton NCT6694 CANFD support")
  d463bb1405836 ("rtc: Add Nuvoton NCT6694 RTC support")
  f9d737a7d84ff ("watchdog: Add Nuvoton NCT6694 WDT support")

=66rom the gpio-brgl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc MAINTAINERS
index 55288f2ffb6b3,681fbc8258052..0000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS

--VFlQZp+SDlEtVcDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRHnUACgkQJNaLcl1U
h9B/8gf9EszrzwpAOFIZHVU1dGuPCEWGRTQmP1JcNWjlHM+3CMUmVrqpZBMP8tq0
ezcPUXC8UPsSeGvD2pHLdpjCYxdfPGDHNR+XkN1vdSTOUAV2wjzuijsnzybNjtg0
7NigQgGEuJ+/IfoD0fhDxflTndqb7ig/OXWvGZaH1T7SlKQ7CMJJaEXnQA2yzHye
NjGNoGGp+3hNj2d4hfWbNXVmfS2khROCy/bgI5XWcgG1CvJcjnfeNBwyiuvYRwJy
P8i9+nZNJ0FyMaTY0td44U/v7mibcDqRWcPWVL+PBreWQEarh3JWLjX+j4FObBRk
yZ4bA8GX9nccrGdeNkM3iToQaHpTOA==
=x6ZF
-----END PGP SIGNATURE-----

--VFlQZp+SDlEtVcDv--

