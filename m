Return-Path: <linux-next+bounces-7480-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F38B0160C
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 009D43B8E9B
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38BD214A94;
	Fri, 11 Jul 2025 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Rc8BvegM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A941FE470;
	Fri, 11 Jul 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222488; cv=none; b=hprR0M52KR46DvyuWJyCERW+j++q4SHQ5ATWwWyr4GOTBxHq82YELxA0txgHLXCLmct4IxT2xabIZ0EfA7r/QF/e4W0pGRFQ4eOTcjjS5lGMV2HNAivJJpOnQ8RiRyj4U8uZ1ug0dlHkMdq8uXxJgrLjXrHz8XtrDs9Hf1FumDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222488; c=relaxed/simple;
	bh=tmO2GvLN4K+qWGLAJtJSP1Gq7Eoozr+LLpJBPFgOil8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T8teZWSFXtgxvVkNL99JSdATeS/7hXtLAdPHx+bq8pettvelvZ4Pg5URe6LGLcKc2vE8ebKnVHuBkiq7BiNRqY3QZZEevQY+SFDECsIcdhe2ibeYdQvhyAYp0zDOlHWvyJ/jPf6ahnyv/LInSwbobnA9pIUzY+zctZdQISGSry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Rc8BvegM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752222404;
	bh=iz4ZVrlgcFBgnlVxHYlbJssb4O8/3eQGjpHhnIgOIUE=;
	h=Date:From:To:Cc:Subject:From;
	b=Rc8BvegMysKt26umcRDv2QowIlAz1sRKpDvwcx5bzVq/pDCpA6qlFA5TNAoF1WYy9
	 WGYW8Oo6+NpjrGR/gNbarq0UFJqx+n/2myYs/2gddG3NFTyz0RCbpG69eX/VPAgyRJ
	 q2ZPKoy+7le0hNnQCv04svKYW8iQlZDr6SKvTomWi6VI9JVBND5SFiHST/yb6uboLc
	 fFB52v/Sjre6cMGeMIBMixyXbzeBKKfoV2HfvaOYv4k4XfTHfXPFvWyKIZWEZ7sX+b
	 xs2a2to2xUrZ9kLoPixoVKezHXtt+XMzug5GPrUpCaefmzXdklViowOlyE8/nZEeNn
	 Atzt7oorjRHdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdlDh1pZyz4wb0;
	Fri, 11 Jul 2025 18:26:44 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:28:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xu Yang
 <xu.yang_2@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20250711182803.1d548467@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=1Z4MhsZ5B+7SY7VFkw29Xq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=1Z4MhsZ5B+7SY7VFkw29Xq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/usb.h:1640: warning: Function parameter or struct member 'sgt=
' not described in 'urb'

Introduced by commit

  488e6eaab88c ("usb: core: add dma-noncoherent buffer alloc and free API")

--=20
Cheers,
Stephen Rothwell

--Sig_/=1Z4MhsZ5B+7SY7VFkw29Xq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwyxMACgkQAVBC80lX
0GyCOQf/ZaL18dqac/mKYv1vvX9Y8DXFf3HzXA+Sr1A/FeQuPLWtDTDCe9DHFEVS
Q/fVF7oIc5voZ2BROOogV5bvpXJi2g4Mjd9auVY/1/vScHGjKibg+Ylo7bKUiJ8a
qW/ZE6C09dVPNiAx/jMCaUY7Fht4NNqWakiiqEXz/PxK/ojlu7HswQ16ypjMTfd/
o/qG02jiCN2Mt14FlAhi5yT6/lb5yo4s/pHM+lMrwraT5JV5jEKDj8nyMdB8UQ4F
oQt7ZaOCMWege6LNv1h3qJ/4Cc/tg0Snjgmn1VWsDXtPLgno8THJyYp42MPCYauv
cZl1v4SENdi/XiW01DgVXrKc+Fbhfg==
=aVAn
-----END PGP SIGNATURE-----

--Sig_/=1Z4MhsZ5B+7SY7VFkw29Xq--

