Return-Path: <linux-next+bounces-4384-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1A9ABD7D
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 06:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9B91F246CD
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 04:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8817C1304AB;
	Wed, 23 Oct 2024 04:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Dq44Hd/c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A34C7C;
	Wed, 23 Oct 2024 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729659182; cv=none; b=cTUkBb8hszKjxdPgzr9VmJynMc1rNYQI4vIV1G4HX6NlYRM6ZgMWSXKeuGpQ6ppB5ZSQdVHUwsSsZMHbVXn7qBr2ia991C9cgQhVLXl4WlltSId4mCT9uAoJfaNBYBKzSH3oB0kapjBF9Efv0IXI9RygAo+rF2dtKcPuByXe4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729659182; c=relaxed/simple;
	bh=yIX9KS2IiNT/8/OY3l6c9quUtzFboJKHHehFA6+igys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EGRtsYz1abCVLIwJqtnkkU1Rb/JfBW6eoeF8UkWtMJAWSEBb2XyGeN/NH7+3Spu9d3r3gIJ94jfqxuvTuxfEVazxOz47iCtE/gs/SJ/NVo9cdWcPYR7cVshU38us7ghXfSFSSlADeEFXRUnw9GaXShmm0FVBWboGLiPekrEqEUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Dq44Hd/c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729659177;
	bh=eJHwr1TfvpbT3+PVArNkrlZc5SvhRuQfLzbcGtnOsjI=;
	h=Date:From:To:Cc:Subject:From;
	b=Dq44Hd/c0+6khJfJhgOxAYC+P3DD8q9go19OZf4VP4q5e4citDldDrGkjZ2kq8WT9
	 iL/aXJkH7TjtgJydf12jbH34NU2YB/1mKGhlnjMZw+QTiy9ELgQ3VAryJ8cH8mv4XX
	 X3/EGADNDf0LqiQX6VoQ9GYi5KQZ5jf1SFZC15n2sX5IdV7FESvcajqmDm23wAi9qI
	 ngRmZCZ/ImkOpKyn0yhasb4JdX4VPThbnZ4Z8T1Uf9KUyfWWdYxYlpDM69hxWAb7YO
	 YSmtHdSbjCIdoL8qn312QS6gwJlo3gj2uke3s/aWlVAr/EZfSmW0yV0JiVtRtGbmSk
	 JC3xhxdA3jqIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYGrT1QB2z4w2R;
	Wed, 23 Oct 2024 15:52:57 +1100 (AEDT)
Date: Wed, 23 Oct 2024 15:52:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the regulator tree
Message-ID: <20241023155257.0fa7211d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ndcAZAt57SoF2IWKkSMR=8_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ndcAZAt57SoF2IWKkSMR=8_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/regulator/machine.h:290: warning: Excess struct member 'regul=
ator_init' description in 'regulator_init_data'

Introduced by commit

  602ff58ae4fe ("regulator: core: remove machine init callback from config")

--=20
Cheers,
Stephen Rothwell

--Sig_/ndcAZAt57SoF2IWKkSMR=8_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcYgSkACgkQAVBC80lX
0GybpQf/TaeTWCei4LkDzZfw46PchYHyXYjfjvctazsdp0sJrAHQhmd3dln1tlgP
t0qN1ghNbv8R/SloJI9o4duZYk7Vn6vvUCK+iEcTrPsx03d+gKJY1V1BMD8Idga3
i9K6+m4EJNaGvqvQzCPJ/Sdf3cnsuVIklsy8dimCGUCaubUYL5bPlAsm5aNPI6hW
GxKgJw9yZK3qbZidOoUlhqkX3jO8tx5yYyj5CiGxst5nG/TxMjF/xOXMfh8ITjWK
AX+bO0r2rUHYU5VdxaiAv8mXTBtkvtqpvEsRM/zp+JZQexaFtet75aFPnEXpZ5Y7
6Bz3XcwGVxmcXkNnGC67G2nh6kHHqw==
=2+EI
-----END PGP SIGNATURE-----

--Sig_/ndcAZAt57SoF2IWKkSMR=8_--

