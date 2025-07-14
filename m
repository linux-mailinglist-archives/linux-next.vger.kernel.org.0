Return-Path: <linux-next+bounces-7515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 129BDB038D5
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 10:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AC44162AE9
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 08:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A98238C24;
	Mon, 14 Jul 2025 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R/y9CA6w"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A8233723;
	Mon, 14 Jul 2025 08:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752480830; cv=none; b=OvHlE40LVRwUlmykrs4pjqgY9MMjd9KYXsE+YDIKDH7HPrmNQgq6Q7ZjMkqZixcrAilohCkZe2ns3aXSe7Q4eSYl4ObYAmFkseGVF61TCfVvQn6/+6yl2fmv9HpFvkL24zGRE56pz92rIcI1WJaOBGIXWi3K9GhK+yesivZnt90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752480830; c=relaxed/simple;
	bh=ijSj0nNnOFhkaX33zP3006/BjY2IiWqgc6kU4O7j/Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lIrKwVVUFKrulcnWN1f2zcCDecKpz9dsJ5R5ySH4B7oeGLpyJKQ8hLFgGHTyxqJnnoHfh/mQl18Qn6W5cBCKvI+o+RA78bAco+M+aI4myQ7upsLxzrcDbJYcoThEb6pn2pUmQV9hxsk4KZhjKr9faicBFbkokxNTlIXl54M5iQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R/y9CA6w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752480722;
	bh=ghdz5xFRnF5nNmP0kKsRi9Xq+05OrdZ47rDiRodm4W8=;
	h=Date:From:To:Cc:Subject:From;
	b=R/y9CA6wsaADf1X7O5W+/PjI2zFSba3iLj7Oibz8nUVx6wR8Jvba9dpQQHE9nqRUJ
	 K5QRzVou5DzpmjCEnn7lpAySnS4YYWbk5SUcfMv6clYAcJGeLQZrcSchdt3FBq+lQ+
	 9Y0usaePlz/dV7fgCZnUWzqqGlXe54Zg20tnJDNEB/p8NTH+rFE1VjH6n4Iwt11Oua
	 P46hIaWTTKeKpGn6xMpaEVysL9KvEzuvVJOTrJm0I6WpRObVkwwSEq6KpafHzzC6el
	 Z/BhqBVcGYhMuBwMvof5frwCm5sZVXcLh1FxlMU29pwOur3x9MiVg+eFRCrCYt2YqN
	 +aj8Jvpx1RTgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgZmL04j5z4w2Q;
	Mon, 14 Jul 2025 18:12:01 +1000 (AEST)
Date: Mon, 14 Jul 2025 18:13:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Lothar Rubusch <l.rubusch@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the iio tree
Message-ID: <20250714181341.1d10df2a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KrIQ73r/pFlo+SWKSmUtZzx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KrIQ73r/pFlo+SWKSmUtZzx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/iio/adxl313.rst:230: ERROR: Error in "code-block" directive:
maximum 1 argument(s) allowed, 11 supplied.

.. code-block:: bash
        root:/sys/bus/iio/devices/iio:device0> echo 1.28125 > ./events/in_a=
ccel_mag_rising_value
        root:/sys/bus/iio/devices/iio:device0> echo 1 > ./events/in_accel_x=
\|y\|z_mag_rising_en

        root:/sys/bus/iio/devices/iio:device0> iio_event_monitor adxl313
        Found IIO device with name adxl313 with device number 0
        <only while moving the sensor>
        Event: time: 1748795762298351281, type: accel(x|y|z), channel: 0, e=
vtype: mag, direction: rising
        Event: time: 1748795762302653704, type: accel(x|y|z), channel: 0, e=
vtype: mag, direction: rising
        Event: time: 1748795762304340726, type: accel(x|y|z), channel: 0, e=
vtype: mag, direction: rising
        ... [docutils]
Documentation/iio/adxl313.rst:244: ERROR: Error in "code-block" directive:
maximum 1 argument(s) allowed, 10 supplied.

.. code-block:: bash
        root:/sys/bus/iio/devices/iio:device0> echo 0 > ./events/in_accel_x=
\|y\|z_mag_rising_en
        root:/sys/bus/iio/devices/iio:device0> iio_event_monitor adxl313
        <nothing> [docutils]
Documentation/iio/adxl313.rst:251: ERROR: Error in "code-block" directive:
maximum 1 argument(s) allowed, 16 supplied.

.. code-block:: bash
        root:/sys/bus/iio/devices/iio:device0> echo 1.234375 > ./events/in_=
accel_mag_falling_value
        root:/sys/bus/iio/devices/iio:device0> echo 5 > ./events/in_accel_m=
ag_falling_period
        root:/sys/bus/iio/devices/iio:device0> echo 1 > ./events/in_accel_x=
\&y\&z_mag_falling_en

        root:/sys/bus/iio/devices/iio:device0> iio_event_monitor adxl313
        Found IIO device with name adxl313 with device number 0
        Event: time: 1748796324115962975, type: accel(x&y&z), channel: 0, e=
vtype: mag, direction: falling
        Event: time: 1748796329329981772, type: accel(x&y&z), channel: 0, e=
vtype: mag, direction: falling
        Event: time: 1748796334543399706, type: accel(x&y&z), channel: 0, e=
vtype: mag, direction: falling
        ...
        <every 5s now indicates inactivity> [docutils]
Documentation/iio/adxl313.rst:266: ERROR: Error in "code-block" directive:
maximum 1 argument(s) allowed, 11 supplied.

.. code-block:: bash
        root:/sys/bus/iio/devices/iio:device0> echo 1.28125 > ./events/in_a=
ccel_mag_rising_value
        root:/sys/bus/iio/devices/iio:device0> echo 1 > ./events/in_accel_x=
\|y\|z_mag_rising_en

        root:/sys/bus/iio/devices/iio:device0> iio_event_monitor adxl313
        Found IIO device with name adxl313 with device number 0
        <some activity with the sensor>
        Event: time: 1748796880354686777, type: accel(x|y|z), channel: 0, e=
vtype: mag_adaptive, direction: rising
        <5s of inactivity, then>
        Event: time: 1748796885543252017, type: accel(x&y&z), channel: 0, e=
vtype: mag, direction: falling
        <some other activity detected by accelerating the sensor>
        Event: time: 1748796887756634678, type: accel(x|y|z), channel: 0, e=
vtype: mag_adaptive, direction: rising
        <again, 5s of inactivity>
        Event: time: 1748796892964368352, type: accel(x&y&z), channel: 0, e=
vtype: mag, direction: falling
        <stays like this until next activity in auto-sleep> [docutils]

Introduced by commit

  6508debb4af1 ("docs: iio: add ADXL313 accelerometer")

--=20
Cheers,
Stephen Rothwell

--Sig_/KrIQ73r/pFlo+SWKSmUtZzx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0vDUACgkQAVBC80lX
0GzfXgf/dvE+rCNkAONnI4d47j9rd3065Ip0NnhShpbZmnK2xR4wChsUavehkVTy
5o9VJrAtgVAy5ATevj9z513rIxMj/2tQCfLjHup6twG7dblHIZJyCrIHAAzt7+Nm
lox4GzWBLJ/XUyETPvTZB4Wd/6g+MFKWWar0E0Ow+cfGPRXmE1V4jFcEOTEze5VA
Yzpb+P35hbuJQEtXEqd2LRotiPP8cc6LQ2SESvX+1djyfpC+E8730poHyY3vhOeN
AeYVTITycAE56r+nTo7UUFaniAR3ajtiXk5gda8Jh4qzmTm/h55Iiul8Wj4/05Z1
fbK0HBF6Ch+r+rhhyuZnbcHcmCm+Qg==
=1pSv
-----END PGP SIGNATURE-----

--Sig_/KrIQ73r/pFlo+SWKSmUtZzx--

