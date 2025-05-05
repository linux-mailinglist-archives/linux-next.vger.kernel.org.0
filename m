Return-Path: <linux-next+bounces-6514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF65AA8C14
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 08:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827BF3AA7C6
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 06:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9508A15574E;
	Mon,  5 May 2025 06:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VIPq3GuR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D509C7D3F4;
	Mon,  5 May 2025 06:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425322; cv=none; b=UZJB4uuag7EuluxHgRS6f0O0iZBSnKOQvIyqBeSw58Rjoo9nlKrNJ5quOOWpgKTVeyJe3TS4qSgVDAwmxN0ZH6Ffd2Gvsc4CfyWjJsomkd3fT+bpseqiXVjZHYBZeXJmCDPSX1uRA3WhSPt+LcRJIuZo6Pmm6n0XJkheWCi6ixc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425322; c=relaxed/simple;
	bh=dxadrVdNhP19del1n4qzWfOieZZNfrkSoNMHSbs79L0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XoNH80xKSCo6gxHNPGNN+AaMA/RiZswqAkwx6RmZLsDyzpv2rSD/Q0DHJDJcptA5yiix1O6aqyte9gwDdDvIRDH08aGBtiA0c6JAyyVcslKIQQVtDaKdsNj/PyNAHJZCsAoPbd7JfnwIqHdhpK3Amt34zJ+yd6p4HUn/Y0PWTMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VIPq3GuR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746425315;
	bh=UHSmpTlpcxFizkGJ884sLienNu54x81UBaqYBVI2tw4=;
	h=Date:From:To:Cc:Subject:From;
	b=VIPq3GuRGKH9eeUnUYuE1XQNrgk7ozwdrG8VDPx8daOtK2wuleJra1jiUjBIeSP9Y
	 dT2DWLR/wy9lQ4I8kPSp8xf7l6sTnYm67hmVepAvInIQYMzbaCn4/PWa1whrgMXDLS
	 ux5PUe4v6PDReO+HAETCsfzkABoGcX51YEb0Mv36KNX1bhdaSHPni57+nG16xlPa51
	 x8sLa1MLNB8x3SOlIr+hQzAKLaFdGhr5khsuVF90C0xyigDQaMSdVQjY0CQ0WnrWW9
	 8e/lpMM6dYyVQ4TLng8lxLX8Mi5KP679rPQNLIFi2mxqxK4npSua7j/MvZKIElsZBv
	 Lp+tsJt3Nqr8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZrWL95xYVz4x0t;
	Mon,  5 May 2025 16:08:33 +1000 (AEST)
Date: Mon, 5 May 2025 16:08:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naman Jain
 <namjain@linux.microsoft.com>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the char-misc tree
Message-ID: <20250505160831.73e797b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1TCQhpT7V4rWPOeBOIk1Ui7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1TCQhpT7V4rWPOeBOIk1Ui7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/hv/vmbus_drv.c:1893:22: error: initialization of 'const struct bin_=
attribute * const*' from incompatible pointer type 'struct bin_attribute **=
' [-Wincompatible-pointer-types]
 1893 |         .bin_attrs =3D vmbus_chan_bin_attrs,
      |                      ^~~~~~~~~~~~~~~~~~~~
drivers/hv/vmbus_drv.c:1893:22: note: (near initialization for 'vmbus_chan_=
group.<anonymous>.bin_attrs')

Caused by commit

  f31fe8165d36 ("uio_hv_generic: Fix sysfs creation path for ring buffer")

interacting with commit

  9bec944506fa ("sysfs: constify attribute_group::bin_attrs")

from the driver-core tree.

I have applied the following merge fixup for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/1TCQhpT7V4rWPOeBOIk1Ui7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgYVd8ACgkQAVBC80lX
0GyzZQf5AdQ1g2zO2a3za56Zv++dmurRBGQ9xTszAVWbZ8t2bhVRJ9ehgsrP27kD
AhfVgqPNkE5qNowelaPH98GH+nLrxf1yrWCTnb0R0e89esGvwbqv08VmkeoH/lNv
eJJWZ3pC3J/buiFj9uoXXWS2HPFl723rJ4MUKeqLMO8fbOG8SaCVgHYtR3zgsc67
dgmWwqMM2ifL3wJMK5pKHW3Wu8PvnJ9aMMlR8G1VZhoJd4+erbPbUF+WR7fT6Nxi
b33KHuAcu294ateHbmxFGvwyy47KRhsLw8ls4ViNqH+6ZjHemgVQDuxk8qDfWjk8
4bv09r2EzEQ8kNsQzoOo+iqMvbkUZw==
=g8TH
-----END PGP SIGNATURE-----

--Sig_/1TCQhpT7V4rWPOeBOIk1Ui7--

