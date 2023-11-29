Return-Path: <linux-next+bounces-111-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A967FCC74
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 02:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FE1283071
	for <lists+linux-next@lfdr.de>; Wed, 29 Nov 2023 01:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC791FB3;
	Wed, 29 Nov 2023 01:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ez2eEtX2"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E33C810E2;
	Tue, 28 Nov 2023 17:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701223107;
	bh=KTkRAxQEjyPl5jlXQA3vSJp+2tyKvgM6H5lB1U5MB1s=;
	h=Date:From:To:Cc:Subject:From;
	b=Ez2eEtX2z0QWAPcG0tIu676o5KeoreIHy+fbWPGfoSFV0T02Byib5Rp+/jBhvlW++
	 +h+8bXlKLJ3edK2NcgeEnr3XKaDVaH7d0mB54fEKLXpQDq9GOzoorUjX9J8AaCs3Y2
	 DvWe8JjZ7aFYgwmg4TatuDG5pcCo1QBUJDPSOtpZqtiCrOMRPz9R/9woRXYMd1LZGD
	 EiNufjivHrVVWk8QlPR372rIcpFs+jFA8nH4ThIMIaomDivKXrOYD9tCt8QxlhS8Ex
	 oomJubsSh2v5uE0mznJtqD27NKU1PFqguyp1vTJxwuIsPFhNSeQlAxI9nciSY4udBn
	 99bdGWZ72xXUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg2Xz1NYnz4wx5;
	Wed, 29 Nov 2023 12:58:27 +1100 (AEDT)
Date: Wed, 29 Nov 2023 12:58:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pwm tree
Message-ID: <20231129125826.08d7d178@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9l/B7hyCt9u=elJ63TYlxsy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9l/B7hyCt9u=elJ63TYlxsy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pwm tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/pwm.h:304: warning: Function parameter or member 'id' not des=
cribed in 'pwm_chip'

Introduced by commit

  c572f3b9c8b7 ("pwm: Replace PWM chip unique base by unique ID")

--=20
Cheers,
Stephen Rothwell

--Sig_/9l/B7hyCt9u=elJ63TYlxsy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVmmsIACgkQAVBC80lX
0GxHIwf/fVBbAvvYCncIufkKbQFacKc6xyIgd05waO3RuEFiKP1p6RkLJIAnA+SX
BHvhd3FQp3akwVxw1pX4uk/e1Q/AmxFADDoJyD1qLiGJoPePKOs0Un8neGwmnbiA
LMLuIcDnQBOfCfXKTNWPUiFMQU4Ys8kQAYNuGUAvJAA3NTlKVTRPULI03lh+RFHG
ZkjgCo3p/EAYEbd2xRmjV5Xazw8BwYmKLx1uVSlzOpZ9TatwSNtkeD9pU6d2qCkz
gcumrLp+U30UkBeYOcsHLyDRj9OfCSlwaUpnJRGKItIygXdbMprokTrV1ARsDJU2
QVrdOXFAf+TxHj2/ksJTKVd+qpn2FQ==
=8f+g
-----END PGP SIGNATURE-----

--Sig_/9l/B7hyCt9u=elJ63TYlxsy--

