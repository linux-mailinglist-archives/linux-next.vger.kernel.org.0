Return-Path: <linux-next+bounces-2517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF02904804
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 02:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9645D1F23FFF
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 00:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97F9EA4;
	Wed, 12 Jun 2024 00:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yu0vIoZP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650410E6;
	Wed, 12 Jun 2024 00:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718152364; cv=none; b=Y/T76avz4xh4KTR4tKJ7fsEpZYZb1QjmPVOIxe/dbz5zDTkKHYd73rph1LkobCOTCxSnDNdo0t2DR/4FWgOlzplyDd+UIYecgoiqa678fNDbIjQuBzEbC7H7YlYV2/CsjG9TGZUoK0u6BtNgSMgOfcU0MTAAsX6DdmRF+wzxYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718152364; c=relaxed/simple;
	bh=MoH80WlrFAHZByTcAWL/u/INqD8RkTh2bZh9mYey8mU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSQsXsaWJwuU0rbGNDfy/h6aXT9A1ii5wdK9Iwpr0gPYYj6rEdNO4CrFbEfZ8WdLYMImKQlLxT3iVlItyJPBaWAAy94RM9GqICMrHMtLQoyltoIpeFpDr+xYQWGvu8c3o5R+JpI0hEhLp87LTZbo/jSMzi9bJdllmUYeAKuUPeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yu0vIoZP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718152356;
	bh=nj1Mthg6rruGhQJaBBVGhPf9Us9s3+jOUZ2IRownJLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yu0vIoZP0lucLiz2kHgxOwHd1L41KcCWgcuq+kvZjoT+C3NQQ3MIjAtBqqaQ4yKYQ
	 /w8h5vkFKZinaXzjylgRF9DNMvPKTA9DC8ClBStIfCgFSV94kRSrJx+Vhl+7LlgPua
	 Nzr9VTUZQeMZebrWbRc7zmgnNGZx5PCD3Pkk5/Hs8G2Vjsn7gNTtkqZxXToLFKAJrr
	 Jk2i05BHF+dePhTfvxDWmABBLgWbkadLo6S3uNBLYa65lXukesn6Z+DA/aUawJD6pp
	 GzhHt0ehXWcfA/i7SSV2O8SEU2p049Ky+lD3aro2+nM/NFMWosf0lpHPzA4QVAg2hR
	 XJkEe8T/k/8gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzRMS3b4Qz4wbp;
	Wed, 12 Jun 2024 10:32:36 +1000 (AEST)
Date: Wed, 12 Jun 2024 10:32:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with the mm tree
Message-ID: <20240612103235.5ef64950@canb.auug.org.au>
In-Reply-To: <8734po1mel.ffs@tglx>
References: <20240607102417.2cc20b04@canb.auug.org.au>
	<8734po1mel.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/82LLhKze6Bg.FPkMCHT8=r0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/82LLhKze6Bg.FPkMCHT8=r0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 07 Jun 2024 23:19:14 +0200 Thomas Gleixner <tglx@linutronix.de> wro=
te:
>
> On Fri, Jun 07 2024 at 10:24, Stephen Rothwell wrote:
>=20
> > Today's linux-next merge of the input tree got a conflict in:
> >
> >   include/linux/interrupt.h
> >
> > between commit:
> >
> >   2156d61a07d9 ("cpumask: make core headers including cpumask_types.h w=
here possible")
> >
> > from the mm-noonmm-unstable branch of the mm tree and commit:
> >
> >   c76494768761 ("linux/interrupt.h: allow "guard" notation to disable a=
nd reenable IRQ")
> >
> > from the input tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts. =20
>=20
> Dmitry has this commit tagged for tip tree consumption. I take care of
> that tomorrow.

The resolution is now as below.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/interrupt.h
index 136a55455529,3a36e64119c8..000000000000
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@@ -5,6 -5,8 +5,7 @@@
 =20
  #include <linux/kernel.h>
  #include <linux/bitops.h>
+ #include <linux/cleanup.h>
 -#include <linux/cpumask.h>
  #include <linux/irqreturn.h>
  #include <linux/irqnr.h>
  #include <linux/hardirq.h>

--Sig_/82LLhKze6Bg.FPkMCHT8=r0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZo7KMACgkQAVBC80lX
0Gw7Qwf/XEF4qYZRPzKU3IhkZgmyTwof57C8DWohbaQ0HwrLESQDEmJHgaMA01DB
aRa+THmoDOmphlGpLI88frUKlDeTHcRiq1T69XzM3w9P5ifhuSFcHgx7PrIXhLds
LUKWHnWZixhJd1RTDIqX4oHuNTFkawpkopqq5uOHvb45n4L/wTcQ6k0/hauo+FRj
niT5Getm8niEU66ThouSyNa6G93XfVnBaUN++3u0T6cwVBa8vUyuaBo+d6wymbsF
zezTyyY6dp14L/LpujkkuRx90VKYpFOcCkKskon6bKNxWirnJ8SkZsUxDcg3Jtj+
+vTbBHui2gc0qlvSKFqRDxNFLcWzoA==
=yz8b
-----END PGP SIGNATURE-----

--Sig_/82LLhKze6Bg.FPkMCHT8=r0--

