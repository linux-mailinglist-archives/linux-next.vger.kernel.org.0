Return-Path: <linux-next+bounces-2212-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A4C8BEEE6
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 23:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B89B1C23B5D
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 21:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5540873539;
	Tue,  7 May 2024 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nPlwt06N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906FA71B3B;
	Tue,  7 May 2024 21:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715117737; cv=none; b=uvc46g+VPcN9LDlkAS1p2Nk1TEJnVXqEJ/bnjVNvmq4K7QvioJs3pgy8jUgLToRyTNHUk8wDeJJ89XaG9ev4FL88m/e1Zz+NBGfyVIvgvZalAbg38JS1PqlO97PTDzw9Gdfx3oOzMTL00tEyff9cjauGwg0/IroxFy879ooTkYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715117737; c=relaxed/simple;
	bh=CyHw+cmaB4qsnEteed8SCnprBZ+3kinqqoR/+5a2P/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SH01X11GRIFW9SzsbjmoDQ5lSX6+qET7Vee7qRSnwBrqHL+CXDCISO4G1gK54aSv/27kG+bTwT4f/GRaoPiwQLwCgGC9XFRRODJdJ+hFUF0AlhMetD2rh5xrfYaFuf8EuY+SQeYYiBXwCsUubKJ7aD1QKzsb7gyEhhFdNSUwfcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nPlwt06N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715117731;
	bh=DZtUHYA+kexgbHK7aZAYgffYQNDumUuaxY/y7THF2Wo=;
	h=Date:From:To:Cc:Subject:From;
	b=nPlwt06NT7cTWxS8W8JwlnVwJZG/L4sHvoGXiw236aJaUVdoJzBX3ayx5s7OyEHM5
	 nljktS6XC/G7qHg0GUEIM7qH96LUTMyByyMLG92eqmccgPHmzqN178jR0IEIGItrMa
	 Ldf7NzeVGsYVvg+6mOXyppvJiiCTvsD8XT29etM86J+qhfsThNxoH7CMJcZEUeTE4D
	 FRRSKa08sQI/CHn64xa+qgePqhPkOtxMkVQdaxamlVjFCuJn8cngFcf3i7LCALQqR7
	 wTbBXx9EylBe47W0q3ydO8LWUxw/Gzg8J6Lwme62Sq0hSGX5K1JvFLspZrWUtcOPnC
	 oCvd2mrNDefWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYs5H0L8sz4wcn;
	Wed,  8 May 2024 07:35:31 +1000 (AEST)
Date: Wed, 8 May 2024 07:35:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Kenny Levinsen <kl@kl.wtf>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20240508073528.402fd13f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2UungqK9KDKC26rIbe8qXZU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2UungqK9KDKC26rIbe8qXZU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d2b34fa81445 ("HID: i2c-hid: Remove unused label in i2c_hid_set_power")

Fixes tag

  Fixes: bb1033c8a3ea ("HID: i2c-hid: Use address probe to wake on resume")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")

--=20
Cheers,
Stephen Rothwell

--Sig_/2UungqK9KDKC26rIbe8qXZU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY6nqAACgkQAVBC80lX
0GzQHAgAl2yJasIOz+xJijTxAfUWodUqRcYw3Qzbl5JcSVbUIetzqcKMO7TqV+NS
4dgUYiRFfOlJ1Z3ALyQyhVMv8askDNSKa0RlkgF2DsyW/mDCQY39Yq0YNjjQL9Zu
+l1dEtVjdmRy3ENCkhhpqCh/0INGoLKVprUWq3vvCF7sadmnyz74aOFW7oSQblRd
/f3yOz4FBNXMT9p1bEbgRxYszYwaQqZvsAGETR9NALxP6jDvyj8ZVc27+cVHPf8J
uaHeay+oxzOt6i9MOIR6Dd0/f4vhejNwylub8O4SyKjHJtZrzjegXNB9wxhPx/Vf
lg2tczGjsPSQigdcjZ9IJ7LZVBHEFA==
=g60Y
-----END PGP SIGNATURE-----

--Sig_/2UungqK9KDKC26rIbe8qXZU--

