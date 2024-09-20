Return-Path: <linux-next+bounces-3930-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101697CFA8
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 02:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23148282448
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 00:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4955FC148;
	Fri, 20 Sep 2024 00:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mcwrx4IV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83787C13B;
	Fri, 20 Sep 2024 00:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726792016; cv=none; b=lD80uW5N0fLlMfPWWW9ySk70wih+qisTqS50LgjAFM0vZ1/MK7liM4IH65OAQaJeNeXYeZ73Tznj6+dG95I3XPJsaRyuLH2sDnIq53cZapcL8tXt6/z0JEsN65Emv6cj7q99OTkhB2vWfsJ/hBsa/LM46/BiyEI/c1fSP3U0ln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726792016; c=relaxed/simple;
	bh=ZrFj/k/VeTdA7c4a46r0ouHDN9oVRtcM9hOoKIybAgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/s+JQXPla9USgRc8MrD6z+E+ck0pC9EWb4bdrarttdhXRf7RE3GsL8q8EK9/0G0U14TL1tsch7fqRL7SEg5c84LcX0E1PDw6xUU6kTcmftUlKdtcvtAzFC/BT+83Z6ju51D13dqtliQP0Hag7bn8FD3Cd1uLU2sj2QJ1125/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mcwrx4IV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726792005;
	bh=ZrFj/k/VeTdA7c4a46r0ouHDN9oVRtcM9hOoKIybAgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mcwrx4IVGnfBal0qjVv7+VXjXgaNGZX39PPzX4V2w0pA8Z5jnGrNehtkUXDOUTxeK
	 zVA5XhXB8uF4wCajlZVcIrAH2ZE4w54nWQZ3QgwSM3tTz+AHvog8swHSYHWeonMbdl
	 r0HeKbBfCr3yuWmAyE1g6LvDOomksafZ0kXRXG22Q06/HqOc7MoMMKuEjWM8Gafq0t
	 XA48dKJR5pouOCnRXbW7NGPfaCJAxjAsPU6mF212c+8ZYblkhCKisR3yjnNV6iEEQ7
	 rJbQ3/fmdx4vE3oVqQRT+UiQDF57m5KMiMHJ81aOwR225GbfEMauvruoL1ugQVNUOG
	 LWO35yeRb+Tnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8tVX6myFz4x8R;
	Fri, 20 Sep 2024 10:26:44 +1000 (AEST)
Date: Fri, 20 Sep 2024 10:26:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, Theodore Ts'o <tytso@mit.edu>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the random tree with the memblock
 tree
Message-ID: <20240920102643.0c384202@canb.auug.org.au>
In-Reply-To: <20240919234557.hsvajq4qp4u3mhtg@master>
References: <20240827150453.26bff4c3@canb.auug.org.au>
	<20240919145356.2f205696@canb.auug.org.au>
	<20240919234557.hsvajq4qp4u3mhtg@master>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6zCTVGW94=8pgqSQQ5dbVS3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6zCTVGW94=8pgqSQQ5dbVS3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Wei,

On Thu, 19 Sep 2024 23:45:57 +0000 Wei Yang <richard.weiyang@gmail.com> wro=
te:
>
> Do I need to send a new version?=20

No, this was just a reminder to the tree maintainer to tell Linus about
the conflict in their PR.

--=20
Cheers,
Stephen Rothwell

--Sig_/6zCTVGW94=8pgqSQQ5dbVS3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbswUMACgkQAVBC80lX
0GxKGAf/bSjRJdEsDag1lb6dFBLwSOoFkhVxRrSALi+bbiouqoR4EHiGc6ABOR8e
NW7QlwvB4Lp7PI0+fBBBdwYaScI9RAOy9S1Gy09kIUOjASKpWylasn31QjpRo2+o
sPTvnTqQA3bevAMDLJasBrb28+0qwfW2PUMN6F908/eYQqrG7kRlELZtieabFhih
hnnubKmOGXfsy8uq5PvjQ/dIxI4dYMFAYDBxpuT17RaUQrVYew+NetQ7wp7rb6O8
EGaP7TaqHnv7r3+9AcS4pY3Ac2Bt2rjybOv4uEcHFLhkruQLP7sRRLqDGIn33+a+
jELsdfZ675uAkTd4W8e0g5nQcQV1Iw==
=Foc4
-----END PGP SIGNATURE-----

--Sig_/6zCTVGW94=8pgqSQQ5dbVS3--

