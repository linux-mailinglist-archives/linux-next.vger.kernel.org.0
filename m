Return-Path: <linux-next+bounces-8695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C78C00099
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 10:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF71718951B3
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 08:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA513043C7;
	Thu, 23 Oct 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XjGHGp5i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF37303CB2;
	Thu, 23 Oct 2025 08:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209790; cv=none; b=ExLywP3SDShV7AN2O6ZgbZPygJ5b6QW8poidHiyRNdpRlFihJBS5QYLlYVuNGgyrSa7EwTJI0lEBLtdZQsXeGNe7lCbynsIKAgm6qXzHgntuIq4FAiIBc071c+4HfZzLUsJW8DQeaa4yWQFhIE8IsoahGh/JiFdDbPJoYNBD8Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209790; c=relaxed/simple;
	bh=kvwAJ9t7yD+n/qwxlPvufKORrYAFoTK72RLdBjvpEuA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jpn0Bs0eZFsMHNSbb29RGrAPXc1UeNa2aFxCxnPSQgxvbvEoScHlra4uScX6lppDbrWGJf//VUczLdVxjon5iAdbdhIiQCmX5oYCHKXGlQLjKEiGNjCptyoCeboVhB4ydRM9zovgow3E0nEbD4PYorMTEkW7078SkwA7XFasGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XjGHGp5i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761209784;
	bh=C8NA2ofgpHVUXZCw2ELzDbhZ2xwNS50Tv5r8MtwYOZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XjGHGp5iK/ZL6fiPnLlFzQS60CRyrBdh4RoR4InAUgQ91pkdzW04DRJaB0GnYJyLZ
	 fGzHOk/n/nzQY5NZ26J0NnNemAf3h3cS4fSQ09oUnPcKqV+1IOd69gGOvMuyKRvVBT
	 bd/ka3qBIKKGVi4PlL2PnUaQ74M6bAQXfOmS2aLVqBiqAXPwfMcfv7N+JHMmd1b2uR
	 gK7zoZ8FZXa+p3x4Jt14HAf4LU+oNY2X2iV2ZjY1F8iYhm9e8vWIPcrJgTCagfVQKR
	 xmOQqPatQN0Koo5fwoDj58exnsjaUoYlgXVLuMQhpM0L4Jpin47mA6M1aBqntmil8C
	 aHSNF4o76e3Pw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4csfyw1kXMz4wCV;
	Thu, 23 Oct 2025 19:56:23 +1100 (AEDT)
Date: Thu, 23 Oct 2025 19:56:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, William Breathitt Gray
 <wbg@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: linux-next: duplicate patch in the gpio-brgl tree
Message-ID: <20251023195621.1ab19cd6@canb.auug.org.au>
In-Reply-To: <CAMRc=McuH20BpVTLDaEZnrg+uic2byqnPc5VuuDOh59p6fp=dA@mail.gmail.com>
References: <20251023125206.5555dccf@canb.auug.org.au>
	<CAMRc=McuH20BpVTLDaEZnrg+uic2byqnPc5VuuDOh59p6fp=dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yNH.=9CgetMSCUCnvlOpyaa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yNH.=9CgetMSCUCnvlOpyaa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, 23 Oct 2025 09:48:25 +0200 Bartosz Golaszewski <brgl@bgdev.pl> wrot=
e:
>
> I had applied this as ae495810cffe to my v6.19 queue earlier into the
> cycle. Then it turned out it's needed in v6.18 as part of a regression
> fix. At this point it was too late for an immutable branch and I
> didn't want to rebase my for-next tree. I decided to just cherry pick
> it into for-current, send it upstream and then pull back v6.18-rc3
> into my for-next and resolve the conflict. Does this work for you?

It's fine.  One or 2 duplicated patches don't really matter unless they
cause conflicts.  These notifications are mainly just in case you did
it by accident and want to clean it up.  (Or to try to dissuade people
from cherry picking things regularly).

--=20
Cheers,
Stephen Rothwell

--Sig_/yNH.=9CgetMSCUCnvlOpyaa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj57bUACgkQAVBC80lX
0Gz5YggAkRYoB03qHjqdCKSfXMuchrU+6yz4y61YNU+xagEZWQy1Jy2UNJl+L2yv
bBOQGZXIsdjSOAltWU04BX34f3DPbPGRyKwznK7cdGQ22Ny8NiOwCv4yIWv2N2Qb
6/qloJbBMYUk0/WrzfoAe3Xuhaz3cnyjIosXDN+zaCQXLkTNvmvqUA1eYWC2B1CF
pylrExUkG3WCtexNEnapjeEUzA3Amppenb12+cm8J34ye/PGWjO/Sg5tZuiqXgzL
nZhJqx6cl8TBtNHwy1wgCsRF6RozjSpKjMhmWIcgmzILfJI8MaVBhPgGJrAyBiAP
hdALIQyBDki4Mb7WFd5MQ52oghGUyg==
=VjC2
-----END PGP SIGNATURE-----

--Sig_/yNH.=9CgetMSCUCnvlOpyaa--

