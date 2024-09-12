Return-Path: <linux-next+bounces-3770-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2288975E3E
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 02:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CF7283E9E
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 00:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A633E282F1;
	Thu, 12 Sep 2024 00:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NIyCQzOy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5DC8E0;
	Thu, 12 Sep 2024 00:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726102556; cv=none; b=Sj+ti5lRXBAmWJUja5IYCqaUrH+iGKuV14u9TYGEPnlCU/18VC1mGfJ0cbK2az4HyD17+LIXQFLOAywkR2rF2f6WmhJiP2MOUaUSASGjozN5rDJMNJFmye7LxuRen6f4LiqC4AnWa3BGfBUU14unaSU17QKw/S6q6QcrqqaYSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726102556; c=relaxed/simple;
	bh=P08e8mI2LrGmrc4eb3m8M+twBS2brnA6XvWBNT5q3i0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfyKj37l91Yp/0ambrlrM+mMCK4eQXZlFVUlWpVaSZyHKkqfCwKBQUEiY5ETIu4O3+huE7/TAhiEQGo8ek3S9b3myIVmqPzCM3e/iHAYzDx1NRKrpZfxdWmV/53sSONNCjpHuksBTOuAoWfSBZceRGxINNPdeYR/123n9S4qUzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NIyCQzOy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726102552;
	bh=PkRhUIChuoNbwqCc+aV0d6LUyCemNFK7syyd72OVP08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NIyCQzOyVS814NSGtTVL7FNYs/8tRAy8inc2b3LmZHv2nspfP2hV/pQ2UryB7k7eU
	 jmJaCdNXHXTf6UxcNcXx7iIUVmZy/LHcXC86tfGWduYi5CU/epY09Q31+Mn8X4gBFu
	 yv0x9440koufEwhU0r8scKOYcn36gvWj8CIOajC/9fLPyGHlHBP5K08Y+TvtDcF6J7
	 VdJVwSbSpAtJe2qx9PYemfvJD08TnWV8qh8ihgH0SXGQgmJA85qQV+TuSd2PcWxaWA
	 JHNkUPdXdsVt1YXjXqFFLpWA61E1GQ2/fGEL9sIU8DgDPuRqT1bq0XvMz4tzDVF8Tg
	 6NWby77rQXsWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3zWr0VqHz4wd6;
	Thu, 12 Sep 2024 10:55:52 +1000 (AEST)
Date: Thu, 12 Sep 2024 10:55:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: duplicate patch in the clk tree
Message-ID: <20240912105551.6e3a33d2@canb.auug.org.au>
In-Reply-To: <20240912105349.0453d06b@canb.auug.org.au>
References: <20240912105349.0453d06b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1XfsR6a15Qm.uoIrAZPotKF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1XfsR6a15Qm.uoIrAZPotKF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[just cc'ing the arm-soc contacts]

On Thu, 12 Sep 2024 10:53:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>=20
>   706ae6446494 ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_par=
ent_data()")
>=20
> This is commit
>=20
>   f579278d690c ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_par=
ent_data()")
>=20
> in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1XfsR6a15Qm.uoIrAZPotKF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiPBcACgkQAVBC80lX
0GyY5AgAmP12vW24f6A2UwU2DiBJ6QEEZvCysDp2XTACkAaw3Kl3PxvLbe8KqdyR
xOrnVBVYbunL25vI0OfjRFT/0HxoKfBEJCKP4vShc9+xQwtfy3J5npG6qfKjoHaL
sSvnBQs8CMadSEJ8dQ3avCVM4+nOdllUBkNquAP/HtDrXHw+Y1qPdsGzasw43UGg
1IEDCch8GI9TBqR51TeCQSVyi5NHExKOd0DCZaLg560r2OjaIZAXTa5jwjtFeKe2
8GYY07ESdxSbhZhd025EezhGg2j50ab8PKMrTcshGtQ+Xsmlk1HkuEg+M3mmJNlZ
uUoHNW4xM83L451Lcsa8hc2NAskLbQ==
=mkzw
-----END PGP SIGNATURE-----

--Sig_/1XfsR6a15Qm.uoIrAZPotKF--

