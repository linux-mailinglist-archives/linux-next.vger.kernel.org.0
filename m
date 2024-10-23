Return-Path: <linux-next+bounces-4379-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E240C9ABC00
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 05:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 140271C211FA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 03:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E023208CA;
	Wed, 23 Oct 2024 03:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rnr25ga3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B21A48;
	Wed, 23 Oct 2024 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653024; cv=none; b=ilkoDSa+LhIlNmLd7C11CyiIJutzlwN49ZpAYx5hg769+XEyB0W2bsXvbge9/jIjWUBVqXb5xdF/9TIY1xrWIEto/gNDhYrUrZjegFMmoDM/SNAy9CPk9wKsnICWEZp5iRpNBKVOuQk9kdIKB7Di8iDm+CPwSuf6UCYSBTfOnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653024; c=relaxed/simple;
	bh=KVg3DvZVvdJmjXJcg09rINPejUXsUgt0ZOqCjesVDvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WliCjFQ8oiQM6hBm1TjrrsMCHoUwI2HmHLPydqu9h4vr9mZYmdVWVMQfMh+1jw63RuzsxLTb6YvX9IRng6rKo+W1jv5HaHbZ2vYkfKAH4fq/VBtKCQ2WNAsL5Jl4f0FJpXHkGqol6dMfrTSjlXRDpd2cB2gW/LRt0aabkeek9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rnr25ga3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729653016;
	bh=OR8Mp3OGnYqhRWo+VL88cuEKxDIWnGm5rjZBFU+GYoE=;
	h=Date:From:To:Cc:Subject:From;
	b=rnr25ga31rJ8jdeO8Ibm5Rq1Po7R9dJ0wvD4KCcUIKCeIXo/WeaVQYjhLLlvoJNrg
	 xjJg4eHwdeZKvjUCyYRV63FsWxmo9P2qOnAW8WAHeQZhRltXL4XSEn+xyNs9Tq7fwn
	 pNw//T+/pnjZKi2PErB8xpcfY9g1izlezDvvU2pg5fQfMEu4DCUKUA7bghwiVso/Qi
	 5j4MGYLF7xkL76wUTmzWDqcRytn3NaJyeOHkeu0sIJbbmybaYABSQczMHJwv9CI9Dw
	 2D90WlP2eHUfJVjXIa5IeSDa7wr5RnZHdJrgN8C0qNJvCJn7yVtpjsD57HnRWkDpCj
	 RJqDmjfL03RfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYDYz1gtQz4w2K;
	Wed, 23 Oct 2024 14:10:15 +1100 (AEDT)
Date: Wed, 23 Oct 2024 14:10:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan
 Cameron <Jonathan.Cameron@Huawei.com>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the iio-fixes
 tree
Message-ID: <20241023141015.0ec5346d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kc7mdashmOysjFUiCGr+PLK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kc7mdashmOysjFUiCGr+PLK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/iio/light/veml6030.c

between commit:

  de9981636774 ("iio: light: veml6030: fix microlux value calculation")

from the iio-fixes tree and commit:

  ed59fc90f38a ("iio: light: veml6030: drop processed info for white channe=
l")

from the char-misc tree.

I fixed it up (the latter removed the line updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kc7mdashmOysjFUiCGr+PLK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYaRcACgkQAVBC80lX
0GwBHgf/QzWqp9eVdb6k5PIV6gEZUVL7fSBJNtb0USiAsEpWMxaJXcIkEzIklyd/
Gl2EhKzVPSPmHHQU+APY7B0bjcgTmwXQXzeJs4NrVSkWFbPG/+SNYuFdTg/VZvDm
E1YwgTfeGLdfzxuULjPVjE7I9/7DISnjwm/aHV4wk7Fd4i9l4zecAmM668hFhMHt
bj7L5oiGeptgR5Lx6DUurXMX312jW4D/s0y5j3SQpLkdBgPBP/gEZDVrFvas8Mqm
7GD6FPCCo5AiTMhyqY/1AjPF6LwTx/GS5sfqpg+st7w7nd3kASDptkfSDaPjV61K
B55rBENdJ+bJ+rXCJmyEXYj92n4Tlg==
=vy7S
-----END PGP SIGNATURE-----

--Sig_/Kc7mdashmOysjFUiCGr+PLK--

