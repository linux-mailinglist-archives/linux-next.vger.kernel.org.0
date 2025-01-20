Return-Path: <linux-next+bounces-5257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F19A16742
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:22:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE2E3A86F8
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 07:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCA4189520;
	Mon, 20 Jan 2025 07:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jcFS+yF+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE360188012;
	Mon, 20 Jan 2025 07:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357745; cv=none; b=XpQNn4PSSNzFOH5Zs1GhcfN6DH9nUrDu+Ny4npCN7WQ4bNSJdtFMObtzcv3K2WU8OBgvtbXl6kPQxxehVgpSrUKoc2VDli3sD+ghgSzOOR8kAh/Sa+TpKtJNESg/k80Ag8x0EwJxCnJJFwiJvyfyzO6t3jtOK2mlspn3mvvejFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357745; c=relaxed/simple;
	bh=4/ziDYHctLoXRkRfqbhmTivAcQk5tEfCLcPOo5b7CY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D6+DL8AoVWaO47aLByKBnCtlwrllfAW1GwaQQfQWWvna+g3E8laynwiGiUfUxZqLGgToH3ELUpjPG87tmM7SW2HOGj/HzRGBVWc16mOPcFZTIuiTuQ1X8QYl4/NiDBVRypVOQS5B1sPO2gY92uwDWjv4VFqyFdvq6ygWvlSXego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jcFS+yF+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737357733;
	bh=y8tHaIJbXo+XuY1M33C+W8yiZgsI2C2JNtwSTShpc5M=;
	h=Date:From:To:Cc:Subject:From;
	b=jcFS+yF+X8D8ucm55p5nbTyw6z9PfIgUxrf4a9DXpHz06aHd0jiURv63ogHQdSzjb
	 RN4aREJWmj5cF4KZQ1u3wjNBD1LBRZeuIbNEDStTGEpGdHdCNx2GoJPUw4VnMH83Hv
	 u1kRShdGW/9tLrWj/Rds/dnGq/JeaeELob4ZDB/tYYoISHHqkDDE5aO/DqZE5rP9so
	 dKjSQUvxcGLq+YCSiS+ZVq/lU4EIpKJIAtypDmH95qRGtSB53n+mnD3Cs30AmZqW2z
	 /FbbM6Psq5AmXQ1Z4/AHecfECPV+5MniDSraMuWqm6j8ZBfvpY59jpE/uvW5Wa2HsO
	 j565YJ/1G3bjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yc1xc3kxKz4x8X;
	Mon, 20 Jan 2025 18:22:12 +1100 (AEDT)
Date: Mon, 20 Jan 2025 18:22:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20250120182219.30dcb3c6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P6XeOBfiSEBjh=rI93qugpY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P6XeOBfiSEBjh=rI93qugpY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/dwc3/core.h:804: warning: Function parameter or struct member '=
nostream_work' not described in 'dwc3_ep'

Introduced by commit

  dcfe437492e2 ("usb: dwc3: gadget: Reinitiate stream for all host NoStream=
 behavior")

--=20
Cheers,
Stephen Rothwell

--Sig_/P6XeOBfiSEBjh=rI93qugpY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeN+asACgkQAVBC80lX
0GxXJQf/SV195NyYmf4CNSMPcz4pciSFHVLc3+tzxet4SFLI7evt8FKIiU2rKSvD
xQlo66lc4BGzDVuxN1O4NFKt4yDi819G2xtKk6nKaPgSfLxNJTtugG44hGiWTsPU
XyRl9yrJGbNhiBYjTt5h+jy7/iO/HDqXYOeWi+FM4QbOLQBhSUJQeY4dkiJFUe9+
CZyNUMK2+E1cwwc9yzQDsu9KZIj7C88xE8wQ/Ui0hJYcmyw3Vf5toIV1/GnObtto
gZM90e5lO0mQQ1xnpFGSoubhYsCEf3J1cNmWfRELvfKPqfWLFRDm+n7r8VzDBtgW
xGhlmIDMwOgQ6+ZvBJ8q/j0pz3jf5A==
=k0lT
-----END PGP SIGNATURE-----

--Sig_/P6XeOBfiSEBjh=rI93qugpY--

