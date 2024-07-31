Return-Path: <linux-next+bounces-3178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7C94399C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F789B21C14
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 23:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF5F16DC0E;
	Wed, 31 Jul 2024 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qVrbybmw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5C514B097;
	Wed, 31 Jul 2024 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722470094; cv=none; b=fsvbSI6vZ1tO5BuR/iEz7om8oQACQWr7xyU7jqyNTN5YW+at7x+hCJf8hIcJc94CsA2n1Tc7eXpNIm5Yg+cxUzRuJsG4Y8Pb0ArDQGp/ZjDtrQYtzs4MR50HiuMvC+fHJsgG+/JfwSw1quyAcTEXZoPO0EL1aYtXoTtMn4IFdTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722470094; c=relaxed/simple;
	bh=D5A4l/z0IJtiXBANE1q/jtCtlvDYZpAPhQhMXmaOKlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iZMLMOFhR41f47uVeC/jHbJHRSu7ELa/TiGoSKRBRZup6tixTJQYIOsYKCOGVLYsgggWdOjYhf/Q2T+g/qRZ8AzVsBuCjW0P+bk2jWerbw1c4hlE7qagmTJEM0lRTlWfnV6SNkq0ltO4RIIgeUPEEt8d5V76BLQtk4HEOTpmNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qVrbybmw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722470090;
	bh=SW9tsrojs50C+SvQiTdSDzv2ncL1nOVYxGTnyvOhkvY=;
	h=Date:From:To:Cc:Subject:From;
	b=qVrbybmwtV+G/0MiLsqMB82muw0cU1GP6/5vslcKWJSnq1CVIu4sn+w02ZxENU4Hs
	 FKZD8zL+laJOpIppsMTCnSpLkk2Jz2p67+JirJpQ1J/yTUhpixuUjc95rOtkTcThJq
	 A+HZ7SfmkKBd5oW4oLLq892ct7cLZa+M1P3p+xUPAIh1C7bQ9QbxlxMwej0Ri+eTrs
	 xRz+m9pnuCCwhDJK2CPt5Rl7vGwGPXl7IR8V33eFMwvt+thfCxB47I1lPpR+dUtU0J
	 CzDRdyytsqVVSnI8d2z9/+3Tw2FTmt5Hrc2ddPnqNnIq1jMDdjPXIBqaCCtpLZkPQX
	 CgoAyOxN9/lhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ88p0sJQz4wc1;
	Thu,  1 Aug 2024 09:54:50 +1000 (AEST)
Date: Thu, 1 Aug 2024 09:54:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20240801095449.6370eead@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wqUM0KziLIFUdsrT4WgM0zs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wqUM0KziLIFUdsrT4WgM0zs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the vfs-brauner-fixes tree as different
commits (but the same patches):

  965a561e4026 ("fs/netfs/fscache_cookie: add missing "n_accesses" check")
  9f337b5daac1 ("netfs: Fault in smaller chunks for non-large folio mapping=
s")
  af1e6ab8c0e5 ("filelock: fix name of file_lease slab cache")

--=20
Cheers,
Stephen Rothwell

--Sig_/wqUM0KziLIFUdsrT4WgM0zs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqzskACgkQAVBC80lX
0Gwr2gf/TweqE0zlKP5KKVhwaUkHEhXfxEyDrmBkTeGUts8ZBJtwkJ6F5IgmD2n+
MLQBHWfzhYSRAWkE/mtty0ZDM4j2cm+9psJr1vdBs4WE6LAUI4ttEMYcLbtr1GPU
zAdwjB6btqEhtv4BDlYUPPr9wR4EWh84l6WCWW8RlRGikeccoqj/0HAl+jurkpBi
liypeF1SqMPsACiLjXeKOXTnsNl/HxslzarTK7g7gBmPZ+OpDuueDddjmfwHCTM8
JRb91A12LrBS9WenkUylNqJP4ONHlFHKxylQTQAQKH0ZQn56Z21JjBNLx/z/jzNO
TmMlP69u1Khn/YpXq5XEJOiNwqsVCQ==
=C3vK
-----END PGP SIGNATURE-----

--Sig_/wqUM0KziLIFUdsrT4WgM0zs--

