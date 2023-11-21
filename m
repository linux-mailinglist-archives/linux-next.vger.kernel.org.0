Return-Path: <linux-next+bounces-3-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6B7F242C
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 03:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48421C216B3
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 02:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C794746A;
	Tue, 21 Nov 2023 02:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QKwKlDwY"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F15FC4;
	Mon, 20 Nov 2023 18:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700534818;
	bh=1nvesn7qATdvpppJadBYXMr2CjhWaXRsT3/y0gA7GW4=;
	h=Date:From:To:Cc:Subject:From;
	b=QKwKlDwY/qQZilXllfzHMz/bbjkgY54KxWBuHVtBJfwEaNB82kujbifFjy+1Sauds
	 BZH56f3Z6c9lcieHD7Qpp39SuetKVcGKhT8rVmwx6kb2SIj8Jkoppd22XAzVMGGgYn
	 Or5CIfS0CF9WTauQG674PZaK3q7C14aT8lfP/oirzvcCHm06cjSa67rFbx75+8/ew/
	 irKnXowmU4nJCw0elbYR1l+/ceVtalPQMVqHyCBHQb+aC8CsJYXldgYAIlsgIk+eHY
	 xgmFw7Uk1flo+2rpyd8nP7woKuF/KSVsQ4cPVogHZRKmewZSG9LjOyaFmaxFDYzAhh
	 JKjNxxt33pi3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZ80d1GKkz4wd7;
	Tue, 21 Nov 2023 13:46:56 +1100 (AEDT)
Date: Tue, 21 Nov 2023 13:46:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20231121134655.440f8371@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/um/lYvP5AsUxhDqZXbzw9rk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/um/lYvP5AsUxhDqZXbzw9rk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (i386 defconfig)
failed like this:

In file included from drivers/acpi/mipi-disco-img.c:21:
drivers/acpi/mipi-disco-img.c: In function 'init_csi2_port':
drivers/acpi/mipi-disco-img.c:536:42: error: format '%lu' expects argument =
of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Werro=
r=3Dformat=3D]
  536 |                 acpi_handle_info(handle, "Too few lane polarity byt=
es (%lu vs. %d)\n",
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
include/linux/acpi.h:1199:47: note: in definition of macro 'acpi_handle_inf=
o'
 1199 |         acpi_handle_printk(KERN_INFO, handle, fmt, ##__VA_ARGS__)
      |                                               ^~~
drivers/acpi/mipi-disco-img.c:536:74: note: format string is defined here
  536 |                 acpi_handle_info(handle, "Too few lane polarity byt=
es (%lu vs. %d)\n",
      |                                                                    =
    ~~^
      |                                                                    =
      |
      |                                                                    =
      long unsigned int
      |                                                                    =
    %u
cc1: all warnings being treated as errors

Caused by commit

  a6cb0a611273 ("ACPI: scan: Extract MIPI DisCo for Imaging data into swnod=
es")

I have reverted that commit (and the following two) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/um/lYvP5AsUxhDqZXbzw9rk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVcGh8ACgkQAVBC80lX
0Gy9owf8CQLtoaU95HJ7icZR1j7xnMNKi7BdMZEXTprBrjJ+qG8swTUZJh4NGMIa
MXfK4t9mGu5apOq5Mc+Oa5YF6meGwHpyI65mZmmfuirWLrmdIfak83okMj4LqEUf
nYhulhwpXGmyuoZn1eXEVZ9ZOG+fLGx5PwNHYstPREmDK6f5T52wbicgOhVb5LbP
TQmcV84/MrZaaaKLYYF2Qi56NPWNhqeMf684I/80xbAnMDy5iclqzu1HhNePXpy9
Nau+wFy98/1e5nZ95rzylzI4Lafq0Vi4VmkpLQLMGpJ/B3inBM2SVEv2NU/vIvnn
5uykNd54HVqXfRrhUDZUq6J4Vzso9g==
=lBX3
-----END PGP SIGNATURE-----

--Sig_/um/lYvP5AsUxhDqZXbzw9rk--

