Return-Path: <linux-next+bounces-4800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D369D0B0C
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 09:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43662B214B7
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2330154BF0;
	Mon, 18 Nov 2024 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bp8VGoSJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF042A8F;
	Mon, 18 Nov 2024 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731919215; cv=none; b=rux1+ETP+9tYUQkizc6zAQ1adLvTNFzl1wDAKFFdzvj7UNpZfxqhr3oiFkCLRM3HdzQBx+JTOOblpQM3iFHdH4x28lmvtNoVrFZkVuvm08t2RVHckB0BIfXzMTJLYr7InIiGedg2F+sH5jusNSDpEup/493NcKUd9Q0jZJTy7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731919215; c=relaxed/simple;
	bh=9rhsOy1npArVRZxrM1QqowCPEAatyskkCkgVm55/upY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hkE+q3oN+H67JVYsiWv4wgVZwZ6653AnXa5Xde47EUo+RkJwBXkBqQFoCyTEaal3ML0WJ16oaV8eMgUxdX3cSfIOWMDz8VqoF+DEvBX/cUPvOP6Gd1UO/WzPAantcqClgsoEniRi6s41rlvZLGHm3qAKC6BEFYN/0mfWfHgwfFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bp8VGoSJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731919205;
	bh=oXzbC6jXxrWn16SQh2lFZBZLcRv91D6UOV0DV7aRiVQ=;
	h=Date:From:To:Cc:Subject:From;
	b=bp8VGoSJClY5xGuXVlEXEJY1thkvQ9+LjaBjs/li4aIHebKomTpOh8n4CK5SafOV4
	 6ssTZ4ibO45BP6F9r/PjxYZ6WyFqSOUDqoAW63YCodxGiCx8JZTdZU1AkSwWunXdhw
	 J09pj8Goy9GVZ4HswuM5g3v1GZoXhkgDh+5pRSFMner5F4q2+Gzzbp9VfeHXq2S8VN
	 +4eg9yxff0jWbuGvdrUh5zIEXuLQ/4Z28fHC+NhKzDJ4/V3HGAmAssKgufTS9HklxU
	 +aJBo24VHCDLSObChvBooC699B5PYVzK2RwFeltjbfHZ6CX6tTTGU52E2JgYgm6N8m
	 EJTmIENI97tdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsLfX2w11z4xfp;
	Mon, 18 Nov 2024 19:40:04 +1100 (AEDT)
Date: Mon, 18 Nov 2024 19:40:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the usb tree
Message-ID: <20241118194006.77c7b126@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2/dWTyU2eXJhLfsHGlSSx+f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2/dWTyU2eXJhLfsHGlSSx+f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (htmldocs) produced
this warning:

drivers/usb/dwc3/core.h:982: warning: Function parameter or struct member '=
sg' not described in 'dwc3_request'

Introduced by commit

  61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/2/dWTyU2eXJhLfsHGlSSx+f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc6/WYACgkQAVBC80lX
0Gyt3wgAnomssfmvgSLvP6Tf3Zxhzxuud/6idWaiTE8XYEMooO3zEmm+qH3nGNks
olgvKE6M5r7p11RYVK99ZRAQtWHDSuy7RnR+iAViCeCJmJlLGceMR+M57OFQeRZr
oFRCl9ddmYnyBL+qs8bVra3a2GTdC67DfmTjYl3C404yBeaHkDGM+/0WR3NPY1If
n0GyEQQbK1y1t2S8G/wEDjk0wCU/6ca6slBvNHT81usM/QkIRtqAU7i8tFvY3MNQ
Rn4S5m6YnOOk0OHq3+wtrZUkH25I59arU0W6mPZLkq/J8j2o31+v4ByVAv8GCgo3
i4fAqTvD5qzjjoEb914sWZdp0LDzyw==
=boDz
-----END PGP SIGNATURE-----

--Sig_/2/dWTyU2eXJhLfsHGlSSx+f--

