Return-Path: <linux-next+bounces-2912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFCF92C88F
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 04:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F3B281F83
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 02:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198928F5D;
	Wed, 10 Jul 2024 02:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="edf1ek2+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F563A5;
	Wed, 10 Jul 2024 02:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720578815; cv=none; b=Nw2ocsn7osncHnJhLdzfV4IfaecMEJsHtiYXZ4/8vWYP9QjRh6YbHsYvPlscIBcRFvBWPS5gH0rGysdhvZMXCiFw/umXnlTa4Qm819TEQVvUg/Xj+AoIKTwp1cbLle98AKd83Djfr2SKu+XmBYJk7d6rIxtcVx/xtWAzLaIasJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720578815; c=relaxed/simple;
	bh=+7MUKF/JKH0d3pk5Upm78kVcAnq3dcC05kPexlHcGwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I8XZpsXJhyLWpvkCTGONj9TmHc+zqV/vOSI6e0DfAizDtG6cjknTppy/OaGzEbENVCIVo6jpN90yk1UM3bkf2CyTVRRATI/4beAl+S8PyaLpG2rzmaDlW4eTY9ToU1W+Rrb9QN23CNSY91hdro0ws+q7MLTvlQcV43+wuzcq97g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=edf1ek2+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720578809;
	bh=ao7eLkOXtnUOvs+1CR3pX6GfAuis3NPWViNRk4VjKMI=;
	h=Date:From:To:Cc:Subject:From;
	b=edf1ek2+LAXmjx0ruYOUslFnBsaRUnLtyGrie8T7/fzze2QbcyTv3y4NZu3H3pSB9
	 gCAbt1RIGc60Xlit3cWcR45k4t6CD7uDXw00KvMipKnJsYiiJtWhP88Dl8WztBDyOo
	 MzLKF333rtZ7XbScP6nm7Sr0oLydGWd0p5OKNXFacvZYy0DyO/CQ9sGaVIuxhaawZV
	 kL58HIqI6oriXd7zCPIi6A0Elh0r9utPd1xRROg42OSBaoNGJKavYzMEdGS6ylHNdQ
	 cRCVpNiDfFt4LwkW3Khx+75WGRhZNgC9TgRI5v2aQcsgnPblA1N0kntaLn6SMU0kLV
	 34w4I7D1XMoqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJhk04Hl1z4wZx;
	Wed, 10 Jul 2024 12:33:28 +1000 (AEST)
Date: Wed, 10 Jul 2024 12:33:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the samsung-krzk tree
Message-ID: <20240710123327.632f7400@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u0o/J.4qq3D.Yc2+5oo=v.j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u0o/J.4qq3D.Yc2+5oo=v.j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  85863cee8ce0 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non at=
omic registers")

This is commit

  97c4264f62a7 ("soc: samsung: exynos-pmu: add support for PMU_ALIVE non at=
omic registers")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/u0o/J.4qq3D.Yc2+5oo=v.j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaN8vcACgkQAVBC80lX
0Gxkpgf+JFEIgY8nZkyyET4rhp1yvJ0yjPHE85PjRQmPGILYBxdZhGNKZnU/0JxK
hAJnl+q+9fsu5OLaBkx8FnTUb/H6YUCKG5WcwOyiIud1pxUC7TbTF6aBdgmbFKT3
HEay21LCrXv8j8MnJ2JUTMCVRBz1hL/PJxMPEOUU6n3Dv/ldu1Zs+5qeiO4ZYere
3PXLKX+e49UCYRmF/Pydh43Un0o0R3tKzr2IoQmResefdFGo69pvGR3C7/1PjyA7
tlnGaKsCrNONEJKt494ALu9dO6ceVTNr4DqcHCsCsfHF7YjzY9dxEQDHGlKwh2br
R7Pu1CMZC0/G5zMGlHWM33Vu+G0s8A==
=YYDo
-----END PGP SIGNATURE-----

--Sig_/u0o/J.4qq3D.Yc2+5oo=v.j--

