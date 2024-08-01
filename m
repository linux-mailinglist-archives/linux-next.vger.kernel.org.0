Return-Path: <linux-next+bounces-3195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C738F9444C4
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 08:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8553F282187
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 06:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F799158543;
	Thu,  1 Aug 2024 06:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iTdvurNO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4E8157490;
	Thu,  1 Aug 2024 06:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495068; cv=none; b=hpNw/VTxvjTTViTzUiwMU3w/sSDoBHd9mHZ8A7N8EM/fTD7F+0ZSzO3YgUIzVrWpmE/VegYEeFF/BvNmS2dQSopKY8hFAH6/CR6RYfBBo5xXm8qKxQKYJw8HMg9eskSTDcd0AcnAnLUriP6IsUuWSaCGDfLDZJLQzA5Uz2Qw7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495068; c=relaxed/simple;
	bh=bZ4krngspux4CWtoCJO9acknj5222wGURpX0yYIrcpI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JJeUEhg5XBnMSSpMhKBy9dEFH7Otc7KVrnerEezsRpr2I49ur70GOjprQ+yfyhuBIZQIQa/9JJi9Uu7DfYhlIgudCs81jNcgTGg8Bk8BisIeSFkDWs+5oTT8FQd1NpQ7ScI+HKcpyTkP12vemVXB4esxzh7SzdfS14AwTTw4q+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iTdvurNO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722495062;
	bh=PGhfOpY7wefOF5vXMfo2C7ts1dsmRNSjI/E1F8qJHCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iTdvurNOxOcvNwj0J5CZD/ljcUFj8AO/VAHPvJb8Kz9omVNuGBGLKDqGq0aYlArhp
	 6lhoI6HfPt2uj3Y8dyA5jewM8MtwKqGZ3l0wKxYAYHMlXYd3oolcNjyoQWZHRYpfnb
	 u/+5EGHxhfUMwLYV3XzmKKwmrS4Xs+VrCo3lxpXhtPktUnb4GSzGBAQUDpha6BiJmz
	 AYZnKkytRk7vYdnbSn/yKc3UaRwId/6ZLobgU9Ayji40a/FTlo2ziyfeYi96ifk567
	 yuz7AY/E3gmxbTRdmSA5dAuqVclWc76kRM98P8lmK1x7ESKo+vT/kRW2tKGsEFU7iG
	 dxg5Do4FJZzEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZKP20Fc0z4wcK;
	Thu,  1 Aug 2024 16:51:01 +1000 (AEST)
Date: Thu, 1 Aug 2024 16:51:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the bcachefs tree
Message-ID: <20240801165101.3e466cf8@canb.auug.org.au>
In-Reply-To: <ql7vzxew25jr764zoi4qcvgero6txwgd2mhn63uxlwn3dvo3md@zuhy576xhk4f>
References: <20240801091224.4a8fe739@canb.auug.org.au>
	<ql7vzxew25jr764zoi4qcvgero6txwgd2mhn63uxlwn3dvo3md@zuhy576xhk4f>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fF686HKAYWk7i5sBwauKFt6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fF686HKAYWk7i5sBwauKFt6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kent,

On Wed, 31 Jul 2024 20:56:18 -0400 Kent Overstreet <kent.overstreet@linux.d=
ev> wrote:
>
> On Thu, Aug 01, 2024 at 09:12:24AM GMT, Stephen Rothwell wrote:
> >=20
> > Trying to fetch the bcachefs tree
> > (https://evilpiepirate.org/git/bcachefs.git#for-next) gives me the
> > following error:
> >=20
> > fatal: unable to access 'https://evilpiepirate.org/git/bcachefs.git/': =
The requested URL returned error: 500
> >=20
> > This has been happening for the past few days.  It also affects the
> > header_cleanup tree
> > (https://evilpiepirate.org/git/bcachefs.git#header_cleanup). =20
>=20
> A git update broke that and I ended up swearing at apache configuration,
> so I'm switching back to serving over git://
>=20
> git://evilpiepirate.org/bcachefs.git

I have updated my config.

--=20
Cheers,
Stephen Rothwell

--Sig_/fF686HKAYWk7i5sBwauKFt6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarMFUACgkQAVBC80lX
0GyxMwf+PCaXxlD5CQAEYP6Ch7PBDU2ELQtZGiRXu/Z5M6jV1r6MXlseXwz9lViC
+Vev0yC2JtyNv8FKomWADMQFIlt89d3duHFrlamQVkd1vptcSMZnaBDqNtcT1P6N
MFd0WkjqNCezMVnu5iB84DPn4sWi7U9SGley+G/wL7nqlIqIjH/QKan2jFk0jCyC
DbvGt/OA7cn8hhZq8AA+9WD+w6WuNk8wpZ89nziCimt1NbGIEbTRpVgGh9SqurfZ
CnSy7bs5cea94/LRB6sy3n0I+xqtj0avm0y/nrC9y1/jsX1T5tkaakg5Twom5Ec/
lVx5hJVv6WIsUfYehJxlOx7Uik1/2Q==
=FcXG
-----END PGP SIGNATURE-----

--Sig_/fF686HKAYWk7i5sBwauKFt6--

