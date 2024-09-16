Return-Path: <linux-next+bounces-3867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B86979A86
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 06:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93D781F23629
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 04:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2330322EF0;
	Mon, 16 Sep 2024 04:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nMicJQhp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C4B208CA;
	Mon, 16 Sep 2024 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726462690; cv=none; b=QmRcgQaggv1B0NEMkqF6WJ2J9vzwljF0tw0oMWhX2D4ZP5UnLtMSe/O+GYPwSu+Q4cYN8MLgU+aOoSJOT2SokxCEEV1nVC+1Tuifm/u1FjZ0YKRD1X4YUU3o0iPErcSu0tFahrtjVnA1s8UHOqIWnMaZzpxGTbxKgEZ3qPXWj7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726462690; c=relaxed/simple;
	bh=P/jTmtzlqvETKkHYXqQBskfiSEmsJUNd4ukE5yVznIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E9DLqnCmpLsbWZmqJlkRfgWdkFUFwCEk+I3krqsGrJYsiyZQYYSNCrf1acoJWBufH25tahQqkhrd5bjdwblu1r3gu/sFbU//TtNxaNOfxpvTfHnfcsuqeagJK5dCi0ZITK67HHUXUEzHouETh+MWAxm4moVYX4dwvToX13R1t4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nMicJQhp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726462684;
	bh=SGvh2KrCSkdxgT9cqqyW72ZphrRxJSgV7dWMDYAvspI=;
	h=Date:From:To:Cc:Subject:From;
	b=nMicJQhpuC1K20IyWIyWvhpfHHPk1MXTMX/ZTGGfEoITpJMQ25Kat760Fd5Fj3+bg
	 HICU3/2lIYJpEvRD7A9J36AVGn5LNRF2dIk7ilMw2lKakVZABcNCX4XD6wX1WkRD5d
	 Kd8N+2pfJ1UceAtGGYtrXr+IrQPR1lFPrUUw/zKtU98V2196vfqEHdPZnPTC5UfVsg
	 yBOWWN2jzltJvouu3ZQm9+zNV5OFc8/ETyHMO6QvM2xfCSuoK4QjWg1zR+YLl6oiUz
	 DX6aoyAjt4E2N2pcj1klISM66bgCK1ALIu87u6LH/fNWnldBBsLoiUjEv8qjSrB3Hb
	 +kmFX19p7nXBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6XjP5Zddz4xCV;
	Mon, 16 Sep 2024 14:58:01 +1000 (AEST)
Date: Mon, 16 Sep 2024 14:58:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the sound tree with the arm-soc tree
Message-ID: <20240916145800.743302ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9CVimmwn12Biz5BvpeTDfeD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9CVimmwn12Biz5BvpeTDfeD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/soc/cirrus/edb93xx.c

between commit:

  7a9a9110d765 ("ASoC: cirrus: edb93xx: Delete driver")

from the arm-soc tree and commit:

  130af75b5c05 ("ASoC: Switch back to struct platform_driver::remove()")

from the sound tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9CVimmwn12Biz5BvpeTDfeD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbnutgACgkQAVBC80lX
0GwhNAf+L14dWyGJLxdRhRIHsGZigQ+1g5GW0KgRjOsdSytBn4eV68gVwh9Yy2yZ
WvUrPBjyefc+kF5v5ZIN4LwWkr2ly7RA3HuFn/4Ioi/mpiSAZqC/cuaCrqKukXaM
36eg2MtifWjt7dfVgN2t2YlWPuw6sHRlXzoy2YbmFIkN3pwuySnQhdVZYzdF54+r
Cws8G3zB+U9sofomOFUFAUdrymAvmc9NKy0Ju8Ms1PgtXNhEgI9ex5n3yjkyzhT9
gCmjfB/RLELpnNuTB6ico5Lx0HYhbNYvGemzXBI6rvnkqpBXfHrlAD7EPIbefNvy
Q8Rg/I2Y7tvIXF8t26ukiaTyPo+MzQ==
=dddB
-----END PGP SIGNATURE-----

--Sig_/9CVimmwn12Biz5BvpeTDfeD--

