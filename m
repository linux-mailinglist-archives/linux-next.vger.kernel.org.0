Return-Path: <linux-next+bounces-5640-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BD9A4EE89
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 21:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031091893CF4
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 20:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0882120C039;
	Tue,  4 Mar 2025 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ged/Jtxq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7F1C84D7;
	Tue,  4 Mar 2025 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741120805; cv=none; b=c5cNoe+ernPnQ2ls6gVOrjyeo6zUB3R7aW0lpH7B9ZfP2c8lUiS9HlkR0/ie1MD++rs0bTGP4HlgVyQ4tJV9yHqFYSSsFFotEX0QWP3KeP+tnGZIi8nLozN3+97d5CgCQxjxc3oqOsyOtO/qAxbPUTd9f4riybiz0QeRa/n9xJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741120805; c=relaxed/simple;
	bh=UBzT5vbnzTr9wuFcrK3XSfwEyfhH+aiSS3VFffB0oOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s6jZYBP51iaK0AW8PDosDsrnQ47jDyuT9XATbJ2HU9wrLwd4HKaTwbDahEbFuHh86LF0hGk4T7B+b/NCiApzvJdM1zfxpAmTdnCxW0EDM7MhQLWatAfrcXzb2PpDHWL0/JPDIxHOvYboOsUW27UADouhRZEKPSLsYUR+Vi6DvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ged/Jtxq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741120799;
	bh=A+AB1Q8lO6ySGbNJuvgVMRHXSucR1trOru44sQW2+xI=;
	h=Date:From:To:Cc:Subject:From;
	b=Ged/Jtxq24Fz3bHUBnFTikQ7DtGajNqh281Qty/sTGmh/rfz24gRFXHa+Jk89ofAm
	 ZVo83siWPkT4sUN544ZXty6pe5WctVft3egy2WPzFRbP3H/KIKRl5rVmOKeZ6CXaIh
	 93jTGwJykUfwlpsQF/i1HeITZ/5KxxZIb9t6n45QF4GFvcgELutwngkznD5X015oLF
	 /TBLJjah8UPD9kPQnYTRV86j+AVDeSLncp6LAhvUF1rfktI8S02AB/lD3Da9iGMCJT
	 dNsonOY1l62CVG1oZPREJlFm/IkiqW/ZJ5WE5Y7IrD6q73r6eYud0ENCRYnOgrzXbh
	 yB3DBup8lmYsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6ncH1Gnkz4wj2;
	Wed,  5 Mar 2025 07:39:59 +1100 (AEDT)
Date: Wed, 5 Mar 2025 07:39:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild-current
 tree
Message-ID: <20250305073957.344b0561@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8ZP3Wc0C2CR2NMbWeVMb2DJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8ZP3Wc0C2CR2NMbWeVMb2DJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  02e9a22ceef0 ("kbuild: hdrcheck: fix cross build with clang")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/8ZP3Wc0C2CR2NMbWeVMb2DJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfHZR4ACgkQAVBC80lX
0GzzKgf/Z9IhKkbPdTnRgUaK9ZCqpurzRoa5f0RsilYsLawF8SEaptPRL4GK66na
uiGVGkJU1mgSdOjVdSsQ+6ZUl9yjXwWPzbKP/XBmY7unA6xWcUG6ZiEKgnMGQRIg
2UwmBbbP3lbuhC1oFQ6Kc6GYnGBFRgJ5fYOGiksBo2Cveub94WJpsyg/EudsATXb
3wsQSVmubmrVgD1sPWM1azWpXLffue29lsKyUOiUUUDAHxUbX4XnVpFtcrmsqnTs
qCwES+nzNgdZ01oQULtchvp9n9qXkXm9xYRyU3uJmENSsMj4rConxxKDQQvDia6o
1Tkiw0lIGzVyCDKfc+GWxIPQfU0Reg==
=2hHt
-----END PGP SIGNATURE-----

--Sig_/8ZP3Wc0C2CR2NMbWeVMb2DJ--

