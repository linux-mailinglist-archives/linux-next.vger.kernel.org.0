Return-Path: <linux-next+bounces-6591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5BAAF59D
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 10:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF041BC508E
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 08:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F5253954;
	Thu,  8 May 2025 08:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P5aiKLZZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E57253942;
	Thu,  8 May 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692710; cv=none; b=RyjA7QWsiPVJJz4WtSkMTgIomBlJP1z6KWj8O4Uf0b/d1x2lNSXprntdcNGEt8zoQbXlJpYJNtNs9u0NLxaJQXJ6vAZ3sdrlawLKm6VaDOXcEgJ57FQS/sAZFzsH3mvEpNvTpwzWOU9bjuKgadscZ/UX3AHXKz8NBqH0H5PGSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692710; c=relaxed/simple;
	bh=R/ujftTvDSxZT7SUxvwn8YUEzHNLlJJdNqXWC5s1sic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BJTfu4RiZIJQQ2kBXqPB+qlCiwnfguWpbp70YEePHUEyzCzifGmLesFbcu+SUJnlbYvGm0yIymdTqpYdnFwmzFbio6vobRs8o3gvOD5TeOk1aFhGFeDmAHLG4CcWk+hSQ5lMiZsPZoKUQQRPH10PzMONOwgrdquUnixsFf8nh9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P5aiKLZZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746692705;
	bh=tF2nSw6Rx1Cky8nje4G/+/NggWFUsobLRLaV2doiY9o=;
	h=Date:From:To:Cc:Subject:From;
	b=P5aiKLZZP3eSSGF0b2FgYJep9PrebglpUC6ZW0tMRDzwyH9hHVceoiqLNVUsWDeYy
	 uGWXZz0hw5ZxT6pGW07RPXcNLE721byJwBqN11gB9tBAeqQwNOmMGCtt5hEJKB1xWO
	 xxLE7F1Lx0kgEzN7YgiAyj/EqQVOI1XiN/2PLHyDuVkRqKTRY7UFWRhLdBT/tyTKci
	 20HunbA7xbeuWB8U3rQQMnosFNgTZ/1jylpE2trnx0vhhxdNs8Fd8JF91rSDhuU+/F
	 djjvi/hEM3aQnQXnGLmDrbp2YXMk2AevnHCL1cIUTjZuhFhuSNoiz9gUbASCexk/y4
	 yHpLjA2x0fbsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtQDK0pqLz4xQN;
	Thu,  8 May 2025 18:25:04 +1000 (AEST)
Date: Thu, 8 May 2025 18:25:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge all the trees
Message-ID: <20250508182504.418552ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/urb/JcHdKde0NaKrQd9mbfD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/urb/JcHdKde0NaKrQd9mbfD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In my after merge build tests, today's linux-next build (htmldocs)
failed like this:

make[1]: Entering directory '/home/sfr/next/htmldocs'
  PARSE   include/uapi/linux/dvb/ca.h
  PARSE   include/uapi/linux/dvb/dmx.h
  PARSE   include/uapi/linux/dvb/frontend.h
  PARSE   include/uapi/linux/dvb/net.h
  PARSE   include/uapi/linux/videodev2.h
  PARSE   include/uapi/linux/media.h
  PARSE   include/uapi/linux/cec.h
  PARSE   include/uapi/linux/lirc.h
Using alabaster theme
Using Python kernel-doc
/home/sfr/next/next/Documentation/virt/kvm/x86/intel-tdx.rst:255: WARNING: =
Footnote [1] is not referenced. [ref.footnote]

Sphinx error:
Sphinx is unable to load the master document (/home/sfr/next/next/Documenta=
tion/index.rst). The master document must be within the source directory or=
 a subdirectory of it.
make[3]: *** [/home/sfr/next/next/Documentation/Makefile:123: htmldocs] Err=
or 2
make[2]: *** [/home/sfr/next/next/Makefile:1804: htmldocs] Error 2
make[1]: *** [/home/sfr/next/next/Makefile:248: __sub-make] Error 2
make[1]: Leaving directory '/home/sfr/next/htmldocs'
make: *** [Makefile:248: __sub-make] Error 2

I have no idea what caued this :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/urb/JcHdKde0NaKrQd9mbfD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcamAACgkQAVBC80lX
0Gyzuwf+K1p0AKnitC3m4zxI0SxuMDDqtyes/ddwlPt5iTTq3MaR/0g8m3Vz0Vla
S/m3t7hlLlH3YYCDo2pnzeczfoXoMFD01VV1IDGX9Z4r2znt7TgOghy0FJD2CCvu
0x3I1ZdNm/rb0Ah8TAQqTqyCBL5CIkHHJygjYh60CMuIO/osm0/p/7ymrLoyXqVw
Fg794Blt1ErhiQEYkBphjiT7oYMVyrb88i5sqRH0e+9e1resXIdu/dk1R0QiQR5E
7aFRi6LVP4oQG5I0yx2gmm/kTZhFe/kZw4tXecd1ptRag3Q/gdt1p7yvzJOlGp3n
CLwq6wVHnwI+6QFMU6wgBkG5sbpsDg==
=8BZn
-----END PGP SIGNATURE-----

--Sig_/urb/JcHdKde0NaKrQd9mbfD--

