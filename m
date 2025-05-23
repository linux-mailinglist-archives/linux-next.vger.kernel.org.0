Return-Path: <linux-next+bounces-6907-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D574EAC1BB6
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 07:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D09F67AA51F
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 05:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2C81FF1CF;
	Fri, 23 May 2025 05:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IqixMYof"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B972DCBF1;
	Fri, 23 May 2025 05:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747976986; cv=none; b=rnSxfJzB1acg938twIP8LwIePa1BVMflRBb3m7QcO6RHD3Mu7qYfQIEa0MhHic2/imP493GOQFAMF/Xa3ZC5p0ISr7umBd96EA7horz30vuhtNbYU1mDBlufiaxf2TZynGDeoKgRzbnhw8jN1+FGfWqviMQHm/b1e75tPNE+Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747976986; c=relaxed/simple;
	bh=t8Xxqb6z90YYXyS+cHFulr/vfwa3AIKS58fKAxFXd8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uQM9Xc9HILrkMZ/OVukIYQZI55cuQToH7q78ksUC+wx1D8vbR7fyHDrBinbqV+KB5eeafvhwa1gKz37apOFQ/Q6A7PGtDql0n/Wvsjfu54dQRmoKA6PJFMO5cNQF951nGjpr7dp8hrVU2E1I3eig6SseVzv4s8RPAzrWApFiTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IqixMYof; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747976976;
	bh=Bfwf5z6D9+5wHxXU98/cUFiCdPo7+P8YoQIQB/jYMUg=;
	h=Date:From:To:Cc:Subject:From;
	b=IqixMYof1TE4ux2brFE+xnESwf9QvoM9oAwis7IVUD8z48dFvuBGwKcIe7LWlYP4n
	 /jB9h5qmLLQsYjB+mAefoFY8rJe7gpwataDdYlFMGDd+DPXxkbVMLym8eZKjWEk8jb
	 8GuRRtrkeEc12BFA4FLtWSZp0MZDdy+MMxn7HLdmWb3aYWg61RdhoPNm4fYKgFO9IX
	 zriuC99y+dgzfPZ1KhTa7AiMqMzQZjfTHU0p9T5zOf11VlAzoZLITIpjJazmI+eVQP
	 hvGVbbo+lzpuH9p5eV0aMjfzScUfswbWxIkd8WhZ1mr+hn0knSrH04Ug5Aevm8n8fp
	 oVb8gaB9PFOhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3Y9q62sgz4x0s;
	Fri, 23 May 2025 15:09:35 +1000 (AEST)
Date: Fri, 23 May 2025 15:09:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Stroud
 <jonathan.stroud@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20250523150934.09d99b2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HV71sOVIjTYe9D1Axnl58D0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HV71sOVIjTYe9D1Axnl58D0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/usb/misc/onboard_usb_dev.c:358:12: warning: 'onboard_dev_5744_i2c_w=
rite_byte' defined but not used [-Wunused-function]
  358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client *clien=
t, u16 addr, u8 data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/misc/onboard_usb_dev.c:313:12: warning: 'onboard_dev_5744_i2c_r=
ead_byte' defined but not used [-Wunused-function]
  313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client=
, u16 addr, u8 *data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initialization seq=
uence")

--=20
Cheers,
Stephen Rothwell

--Sig_/HV71sOVIjTYe9D1Axnl58D0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgwAw4ACgkQAVBC80lX
0GxizQf/Sly5BYEws3DnleP9ayfbN6mqHgbyjBwrkd1/renzjQfv40jkthnrk6tc
K7da23V00feaYX3sNVcpP5nqcZmCFWP3WIsK7GfJKPv4YS6Xy3RYMdBcI5R6KUwN
ZfGjBsU5Rxe7FeVVX7Kk8CUDWWiN5B+S2kqx6H19Z86G86vWMaplk+ZpQDcWzPZr
B39dlJy8qyGvzp+BQBxjG2yOgNfeLPbV4glvHgAjH6891lWM1w5o3F/3gNavZkJD
RPKgXy33FIjYyCjJdIbprQy13R+ZX13B4K3xV1k8kOw+AYz8GUGCR0O+R6RNJI9K
XktIPNp6CEbd9RS9MXFtZAxuCIspgA==
=zEG5
-----END PGP SIGNATURE-----

--Sig_/HV71sOVIjTYe9D1Axnl58D0--

