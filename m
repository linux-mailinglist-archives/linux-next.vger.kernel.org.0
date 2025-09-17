Return-Path: <linux-next+bounces-8359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A7B7F1C8
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 15:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 586554A4715
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 13:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02CB316190;
	Wed, 17 Sep 2025 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU/8gpi7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B67316189;
	Wed, 17 Sep 2025 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114143; cv=none; b=SUxRdGBCKY1yztMhEx1rsScC+7w8FEJ5ZPbUUeWxddanvr9aZmOjQJ++LwfRjZaLFX9ebKGtC3qAiusQCiHs24RjTabDVhReXb53iFWbNCs5BfIw2dTWPFOPAH6Wj1zzPby4WeYV4m5m4Tu4nmOvQgsr1MiUUvTwAgjVtm8BmRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114143; c=relaxed/simple;
	bh=dPiFt84MgSZMJL8F7rVZ3drtPWc+6MIvEOdIXuJLADM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=juGaHgakmsDLjPA+qJzTTeOGX6XQeiFMH2CGoyyymQQBc8J8ZgS67beWs8JGHu3/bbF/UC6guID1KkpUkspon7SYUm8qLPp5CN9JUHQ89oInAoDO7RYPTPpyDIbgIIsf11iux6x+IsGJZibRAx0YjkoE/W0bQbAU5l0S+zPpe4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU/8gpi7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25802C4CEF7;
	Wed, 17 Sep 2025 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758114141;
	bh=dPiFt84MgSZMJL8F7rVZ3drtPWc+6MIvEOdIXuJLADM=;
	h=Date:From:To:Cc:Subject:From;
	b=AU/8gpi7sNmUx/Nf9wIA2FehS4sn47LhGNOVC3O40Xxy5OAutbAunP9dP+7cYaWab
	 HGg5kSNfJGQxLCAuepnRxIMCQBx55x3LFGEd214iJYd7fGVTX0wFhg66ZjvUuO4vHA
	 thIKXio6Nlu/H/MHSU4H49Grf4/Nb2VR/XQs2D031jZ+vfOMIh2jOpM9CmqZ2AIq1V
	 DGtS+Nxnys1ABCiGVyfEbOYcIDyuyRThH/oY+Zkkmz7zBZe4Q9eb/9UflEA5+sf+oJ
	 Ry+/jWzPBvk/EgPjLNVHtbuqhE+mWJ7Je5HQJg1gfPAXzRRo7xPeqyZ/Hz1YTD8iuk
	 SqV0M+8ifZniQ==
Date: Wed, 17 Sep 2025 14:02:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <aMqxWGx0asGTWZ2V@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8pjyQ3tH91vQJag"
Content-Disposition: inline


--w8pjyQ3tH91vQJag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get':
gpio-stmpe.c:(.text+0x213ed29): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_get_direction':
gpio-stmpe.c:(.text+0x213eeb2): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq_sync_unlock':
gpio-stmpe.c:(.text+0x213f266): undefined reference to `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x213f3ef): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x213f472): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_irq':
gpio-stmpe.c:(.text+0x213fd27): undefined reference to `stmpe_block_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140005): undefined reference to=
 `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140089): undefined reference to=
 `stmpe_reg_write'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_disable':
gpio-stmpe.c:(.text+0x21402dc): undefined reference to `stmpe_disable'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_set':
gpio-stmpe.c:(.text+0x21404a4): undefined reference to `stmpe_reg_write'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x214051e): undefined reference to=
 `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_output':
gpio-stmpe.c:(.text+0x21406a4): undefined reference to `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_direction_input':
gpio-stmpe.c:(.text+0x2140805): undefined reference to `stmpe_set_bits'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_request':
gpio-stmpe.c:(.text+0x214093e): undefined reference to `stmpe_set_altfunc'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_dbg_show_one':
gpio-stmpe.c:(.text+0x2140ac0): undefined reference to `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140c8c): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140cb1): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140d61): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x2140f6c): undefined reference to=
 `stmpe_reg_read'
x86_64-linux-gnu-ld: vmlinux.o: in function `stmpe_gpio_probe':
gpio-stmpe.c:(.text+0x21416b2): undefined reference to `stmpe_enable'
x86_64-linux-gnu-ld: gpio-stmpe.c:(.text+0x214193e): undefined reference to=
 `stmpe_disable'
make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:91: vmlinux.unstripp=
ed] Error 1
make[2]: *** [/tmp/next/build/Makefile:1242: vmlinux] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2

Caused by commit

   df6a44003953f ("mfd: stmpe: Allow building as module")

which needs commit

   03db20aaa3ba3 ("gpio: stmpe: Allow to compile as a module")

=66rom the gpio tree.  I have used the version from yesterday instead.

--w8pjyQ3tH91vQJag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKsVgACgkQJNaLcl1U
h9CnHQf/aajt810ODmcanLS2KXawWloDaNsWz3Kqgu4ECFsEqKm5p0R/wjpYRYU9
CpKZdwUoiA0PNKsR3q9lBMWSEPvbrpepb4L3v9wQSyhlQWmPNWniaZeysDWPISQI
UKH7AUEfGBgiNFC6y5yUvIfjepg2SlxAdJnCqaLRowEyJB9fd6/sAEtLTROmjbsK
YBhh7rPDbv4kiiaD6zDkEfGrzGaQwbtq4XKwdi59UN0+SkiYxLKAly34x9KA/2hp
mo3w/M5pGQunl/lY8LlYTTvzQ3/IO3VQYFCwGXov0kvgk2nRPmIeuPg5mu2cqFzF
ccVBGaYT1pQPZqZfipF6/bySxwESJQ==
=duvI
-----END PGP SIGNATURE-----

--w8pjyQ3tH91vQJag--

