Return-Path: <linux-next+bounces-2849-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B692AD71
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 02:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2648F2829D2
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507A73C6A6;
	Tue,  9 Jul 2024 00:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ApxjQz7l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF13BB30;
	Tue,  9 Jul 2024 00:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720486635; cv=none; b=FCNh1toWKjg0/nm3dTz6+SdVQ/fCp84IBKg/EAvB8v2+3+jPqDLshw5NCgfNzAMfOxTYbb3iokms8YFuIvcouOEtsebmTNPBHUctui2gCamSTXl2csxwbSX1WxwkQZfx++PlB4zeZ6haft/11IS6bXjaGAxlxq/RktfCJ9f+dI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720486635; c=relaxed/simple;
	bh=T+OOdxaPDBI9XZFS9qnpujyd0BPpwz9K3AHdoMteTgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rvSm/fOzhV72+S4dioUzCI7EhTYQTQYYTeiYy1COWBymLnQwBQoT+TubFmYEEKfDVmqpXcMnMoLkWGtsqR5mazMI49qxA3qo80L5JyoVFVoT2wDa9TKFjr1mixDP+mHaqoEpEHn5yUn3WBCUZvBu7JagoRT/yyNJFPWBYxXFSzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ApxjQz7l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720486630;
	bh=o5xLGrQT3OotdFoQ8ocjbAoNDviJkUv5oGs1QUBgH1M=;
	h=Date:From:To:Cc:Subject:From;
	b=ApxjQz7lgg+gzHnrdtluGt8M5NsheiUZcXpcf/uVx6ThZMkKFE0wJk7LFe63OOkeU
	 XMZMVajNZA4RTYPRqBHJ8senly7acmZhsuYe14sRVLsJObSZgfyPpoKdG8qj1Yj4DF
	 NZJAUxe4VE+9lpVPwU2rTgC0gdtPVo+HHQ0u7kCSANdEghjM8RfhCYxV+z6kmGNchK
	 SW5JHrTSmPflWuIB1vNFv+L6TBKcIFskT/cTT2VcsI0PsWuXM2DQecG9UOZ1sALk67
	 G9bxgB6LvGxRwLZMsFTYJEo7Q1bvEMlLe3Gy4ZM6GS/W75BrKrENtQSxjXAElIwZ4V
	 uR7edW0fAZgtg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ2dL07HCz4w2S;
	Tue,  9 Jul 2024 10:57:09 +1000 (AEST)
Date: Tue, 9 Jul 2024 10:57:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 asm-generic tree
Message-ID: <20240709105709.18ce785d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u_6tWU9N=/p6=6h78vKxFym";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u_6tWU9N=/p6=6h78vKxFym
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got conflicts in:

  arch/arm64/include/asm/unistd.h
  arch/arm64/include/asm/unistd32.h

between commit:

  ea0130bf3c45 ("arm64: convert unistd_32.h to syscall.tbl format")

from the asm-generic tree and commit:

  e6873349f700 ("fs/xattr: add *at family syscalls")

from the vfs-brauner tree.

I fixed it up (I used the former versions) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/u_6tWU9N=/p6=6h78vKxFym
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMiuUACgkQAVBC80lX
0Gxazgf9GtsVw4zw0bMnVtzUPbNw8+v1fDLVlAShS/iQvKXh7iueCGjfEtK41zwB
loeSGQxU/k03Un0vgdy6Bb2dht247UEo5DZuH+Ao7tAQQDr19teUM1jo2nUENTs1
IU4Adh4oJA6rg7aRsZtz0RUGXsOPRaIrEFjfj/oSDi+5tK+Dv+6Mi9p3s5xsv93T
dp25Pu6HiW2rF6kB+mPGxOR9caOAC0Gpqm4lD/KKPFiVaaEbQZWbFqT3wruUY0z2
pfj5D+n0QW73eOqDRlsKlQ3sfXTEEXr/SaExu2u3tBZ4b8v8LyOLNL6Eus1SxmgY
jkP4C2dnPcTGwpQuKSlnBY0aWIxFkA==
=wYly
-----END PGP SIGNATURE-----

--Sig_/u_6tWU9N=/p6=6h78vKxFym--

