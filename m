Return-Path: <linux-next+bounces-7599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF180B08452
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 07:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0714A6DE3
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 05:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628DF1EB1A4;
	Thu, 17 Jul 2025 05:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X0B1oaLs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657314689;
	Thu, 17 Jul 2025 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752730669; cv=none; b=dx9FS3QALM96iWcjb/uA5jnW+ecQov4nH/gvFtdR4rnZULIgrU2ZWIMffzTsuWTkMY5tU1KxPyjEy/CWqszLjpwraMfloMzmjFDhxo+5cEDtsuwZXAbgl68Bfdnt9MgLCkAxr6YB6HSqSqUi2KGMuqwT0Hw7pxbQf/5tEOPGlcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752730669; c=relaxed/simple;
	bh=Y02Yq8A50KbSstuEwaGHDrZeOGkOhhujbMG0MWUfSmI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dvusJoxWSyhxdP2vON274j93TL+GWyINH6pjSX8vOcrJ0lsL4VL7fOHfjk06NjdheElKSgwy3IAMo2D+U0jsj6fwC1Y5bI0f4+yLlgDVC4sTG3lpugKox3YCKRPFhSvihh4fFvg8ReEXsTqF/WQgirnN0Dz/ZGYBRGv5Dr2XDVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X0B1oaLs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752730533;
	bh=WMWW7mmLlUo41cQzp0qfs2H388c0LiKcPKeAkVcGtYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=X0B1oaLshnYx4gmEoC7GxA5cZoPgGs7evsmo9kNNVj/Cjj/hj0lfQ1cfafYr6ohls
	 BJKO53+5/pXEw8XaVhFheptLmb1Gg4xZRA4IFXGTfhCXSapoXh2JtOajEQQR+MSduv
	 j6+5BH2IGHLwlwaDU+j9n4WdZIMbOiNUo6kBaqu2rQ8f8kKmMTJ7E0P8Iu0urDGjMG
	 tzuwk9r1XbfCvFN5+iyZJc5TAvdb4/wSozZ4K5w1BvoT9GXlJCodshX5+sZjLEznYa
	 hFTYpCUXoIHidqQLsOaVAF86CIgMWQlPhHRWn5zt+HBRukbM9oFbfp63iNenJvNtmI
	 SHc4bH+JRU25Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjM8P14QGz4x7W;
	Thu, 17 Jul 2025 15:35:32 +1000 (AEST)
Date: Thu, 17 Jul 2025 15:37:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the char-misc tree
Message-ID: <20250717153733.068c3fc3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0yA+q2mtECuF9mq2nl4bW.Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the powerpc tree as a different commit
(but the same patch):

  01c6d1df98cb ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs=
 show functions")

This is commit

  e82fff08327e ("misc: ocxl: Replace scnprintf() with sysfs_emit() in sysfs=
 show functions")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4jB0ACgkQAVBC80lX
0Gwwrwf9FEYtPFKJurgxZ300g6dsUNdEGRP+WqU8+g8CgBCY6mf4PzsgwQ9CcWOe
AX+8bCc+KKx4n+gu7KpbsT1EOQtBgbImugEUm6lUyHOWHxTVMuYwUQYHNVj9+HFR
LVQYOiIHADDYvQCplzxOjO+mz1CPxoBuGgju5THvXBVfJx5isd6e40823PjwSm71
zEhgyXdKwDP0GV695G0VpsPxy1PWbBzO4CeIHiphCW6o/RShmAMiJKOU3h+koZaJ
mK4QC8QYCYH3rXlgdm8AKznrHaz+qd/f0A2s2SetZykKI9xBg2KYWs02ODqAQPaJ
RT6SlczW9GJEWEZqdapn9eRSnNzIzg==
=VXmE
-----END PGP SIGNATURE-----

--Sig_/0yA+q2mtECuF9mq2nl4bW.Y--

