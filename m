Return-Path: <linux-next+bounces-3710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B745971D4D
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 16:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 676E31C23331
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FDC01BBBF0;
	Mon,  9 Sep 2024 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HnKHNogN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA35157A61;
	Mon,  9 Sep 2024 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725893896; cv=none; b=Mg3v/VVujGYCuEciniXkH5nwqFaxbmeFWFEQ8PecrxHo63Qd58wN5PV2JVBlvZJmLAy2vaNmjDaj0DEFb5cjwD97oK99otH10YxczAgirHsf1HCmptefuqHNYbXlqcRh3yNZTWNgkxUtPsbw5l4Z08SUJm165ND8Aakm8+ZEN7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725893896; c=relaxed/simple;
	bh=MwpZPYvbaGPKSAacPPxVxd5tZSkevaSbGSNTqUH0HLc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I2ySYfHtdfITfVYaDZ5z5EHRRIS99AeYzubyoQ6VqYHsclo+zsTFkMdPKFClnsQlCFINmKz6RnPTuQR8SSTshjTPQvZE/nRr1w0mH/LrVcR3FIrre229IDzXvYHc8gvXDNxfqwwI2YqCeRlrW98eq9gBCth9LVkNtqlZxa5ovV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HnKHNogN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725893889;
	bh=PBOVkZww8Y1CyMvmzZcDEQcfauCNuY4CzWakfWzf4dQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HnKHNogNfnZIrT2JtmSWn+LmmIDxSr/Yi0fd9e5iyW06hMgX8SOFkqJPLsrf8d0jD
	 BFCkLEA72KZd/TeMZB5PHgVG+3gfkk/U1W9cWDbXKFWzYmyic5De8MtVcaBjOBFSTi
	 VXuvOLfMAytdxeWSDgEKZstyE3guvuD9arAwnAxWG+xpcn5kJs8yzTVpoKLP5F3xzh
	 LyznG0WT5CsShiZctvMZE8isSaM+79zJsbPzGI/GWz9w8vGF/aPqXOysaqRDtSMxLB
	 k7Za2h18g63kCqUD/thaBJUsX85HadizmBrJlOe2udv5AP0kivBNhx6brCv0Bv4dVM
	 7Jl5K6FDrhnIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2VM53yB7z4wc1;
	Tue, 10 Sep 2024 00:58:09 +1000 (AEST)
Date: Tue, 10 Sep 2024 00:58:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-ID: <20240910005808.2e355995@canb.auug.org.au>
In-Reply-To: <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
References: <20240909200948.70087f49@canb.auug.org.au>
	<afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R2HOHTA/RK=GO7xuxNWT1SO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgrou=
p.eu> wrote:
>
> Le 09/09/2024 =C3=A0 12:09, Stephen Rothwell a =C3=A9crit=C2=A0:
> > Hi all,
> >=20
> > After merging the powerpc tree, today's linux-next build (powerpc
> > ppc44x_defconfig) failed like this:
> >=20
> > make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony'=
, needed by 'arch/powerpc/boot/zImage'.  Stop.
> > make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Er=
ror 2
> > make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >=20
> > It is not obvious to me what change caused this, so I have just left
> > the build  broken for today.
> >  =20
>=20
> Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules i=
nto scripts/Makefile.dtbs")

Thanks for that.

--=20
Cheers,
Stephen Rothwell

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfDQAACgkQAVBC80lX
0GybSwf/Qr7o1BZ6Cx4fElpbFJBc7ndD4mwjh9TYk+a0oY38b6Mu/hYOoQQRRbuF
YOuZ1dlbEchB0snIqXODHhr5Ad3h7KcvIlFqlfFqGgxjRZh7PklffnW63SQ80epk
5oEnQFwwUW9gTsqOq8BB6uSuFzre9X8zMp8l9HnIDLhfY7cZ3TzMc8j8PbFChOR1
NVQQOLhfY+r8ahWC3W9aEomm9/O93Uh8lyr3TU7z1auh6gQROzQb2HtDxLUH2kE7
58zE6TMd41Zss69CyfvM2XM6JWLmCeIUwzHZBCZ1fB/heo52LKVFnoMDBQ9RIp/K
v/xu9xhHS3ITq072SbIdV18xgI1YVQ==
=1oA0
-----END PGP SIGNATURE-----

--Sig_/R2HOHTA/RK=GO7xuxNWT1SO--

