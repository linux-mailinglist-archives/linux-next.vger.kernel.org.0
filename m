Return-Path: <linux-next+bounces-2861-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDE92B0AC
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73800282431
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D957F12F37C;
	Tue,  9 Jul 2024 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2my5hOVu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368E13C3CC
	for <linux-next@vger.kernel.org>; Tue,  9 Jul 2024 06:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507982; cv=none; b=CeNfpH5ZWOYljkPi3em4oLua/yCFWtGEggVqRcD0MJRCvEYxewqb/53QhbgbO9k/+zak+QStlZ24zLlenYHQW9K/+V0hRDA/iOgXNLu4iKprA9Z/95I8WEKzqxm2lSFnINt0SUO2JFgCyZE+pJ5pIyYI9HP+ob0GPCUswz65Bqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507982; c=relaxed/simple;
	bh=Oo/ifZl9VysOblFKxIKXILDSQRq7huKzpeurEjX/2Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck9L6q6/JoibSczMrR43892BHkJrmXck370H1sSJSyPbSsfDYe7CAH96QqSxK0oVwDrpanMyxNprdd7YZO79TB1AJHa/JYLwqy5CY2FlS/ZKQoHGDsEHguNNUbSkGUgJe6JADTxBmQ5/fNryue/pRUqLybhmHYZIIrMOxrIOpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2my5hOVu; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so287838266b.3
        for <linux-next@vger.kernel.org>; Mon, 08 Jul 2024 23:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720507977; x=1721112777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H+FqXIOW4eq0FTjKoPxaWl8FH4GGF28lavLviPGVW9M=;
        b=2my5hOVu5DalFVbZ0S+XIbiRk5earlEbNZpGE6wYFfjOMRarAhDOCTxeOnan4nfUsD
         EzCwP//sF4riOGoJa/17IaWicfev5fDjoVCwJq3Fj4vJlNR9FhnxxNkRkVWk7aOpI3uL
         qLYcls0+GN7bwiRuIe+P3vixXCmuk+bZDz3BONNV544XnfMC8D8P5czuTR1wboAj9qcq
         TVW4pwjOcIrRrYTJfUva+jfxqB1W7ZEiUl3Vq+rOtEFItQa/T6dM0qMEbMqk6w952fOS
         C03lY3mvXEyfxomkUmmHA+J64Ry4clTVOFYrYzl79vmsHSo5buvEdWkr9Y3HJ4luc5R+
         NsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720507977; x=1721112777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+FqXIOW4eq0FTjKoPxaWl8FH4GGF28lavLviPGVW9M=;
        b=BQb7DW+nfPt7fZSGwjz8QTRi8M8F32Jstz41UDGpXNb0NkGwK+6MHDQSbXG3cRgZ4Z
         KvAdzrhhMx4ezFzsr9OyZMZbU8fyAUoWUtmnkhXJPKD9J4PxsG5bdWMF9+xx5nxMFGcS
         xTz6v3o5NtjYnqgtpWCzvSbs3njgwc3VxgNdpTO/GSaR2VtBV6ve7hqycBwLDPY8w45Y
         wsVI36g/qT4wvJSlmOtKBto0OrbbmiaNbZyqnHk/ZhOvkh1Pc8AdAxI0p+6pku9A0OQR
         rzKh9MlLU4She6dTrpmPSWA/lMcASj2WgBZMM3vgftnGND7ZISqOpn6bPABSQizSeERA
         Jkhg==
X-Forwarded-Encrypted: i=1; AJvYcCWDR9lYvl0xGwl/tAmxAiWzhVqOaGKrg/K5u6TY174O92wit+5vkqzq2puQvyjvj9wIKMB4hmUPTT/tAyEpEM4Yx1L2sTo7HABR2g==
X-Gm-Message-State: AOJu0YyENaVWdCilOgW0elb2PvXhbz3wG6vP44RzV07ksoxUWfOl7Oqu
	SRcX3VWts0xQtaLIIee4tPGxfxWjPtKDs83gx4j2YpzB94o417p0QDDU7mqAqpc=
X-Google-Smtp-Source: AGHT+IFUGecas1XpDKtbncJ0sLgtHSviuD5HJjYVObKWBAsgUfB2PlnVGm+SI54Hx/zkQU4wRv7ywQ==
X-Received: by 2002:a17:906:3710:b0:a72:8a62:65e7 with SMTP id a640c23a62f3a-a780b87f063mr98360166b.57.1720507977107;
        Mon, 08 Jul 2024 23:52:57 -0700 (PDT)
Received: from localhost (p50915e7b.dip0.t-ipconnect.de. [80.145.94.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e37c4sm52440266b.82.2024.07.08.23.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 23:52:56 -0700 (PDT)
Date: Tue, 9 Jul 2024 08:52:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <r24ym3ydptp5n7ozsyqslgu7a22toxxgvnl562gnwyubmvb3p4@xy5qqsoxwwsw>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="reie6nwaydlnyzqs"
Content-Disposition: inline
In-Reply-To: <20240709163715.3bcd6ab3@canb.auug.org.au>


--reie6nwaydlnyzqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 09, 2024 at 04:37:15PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: init=
ialization of 'void (*)(struct platform_device *)' from incompatible pointe=
r type 'int (*)(struct platform_device *)' [-Werror=3Dincompatible-pointer-=
types]
>  1786 |         .remove         =3D pispbe_remove,
>       |                           ^~~~~~~~~~~~~
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near=
 initialization for 'pispbe_pdrv.<anonymous>.remove')
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
>=20
> interacting withc commit
>=20
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>=20
> from the vl4-dvb-next tree.
>=20
> I have applied the following fix up patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 9 Jul 2024 16:03:05 +1000
> Subject: [PATCH] fix up for "platform: Make platform_driver::remove() ret=
urn void"
>=20
> interacting with commit
>=20
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>=20
> from the v4l-dvb-next tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drive=
rs/media/platform/raspberrypi/pisp_be/pisp_be.c
> index e74df5b116dc..7596ae1f7de6 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pde=
v)
>  	return ret;
>  }
> =20
> -static int pispbe_remove(struct platform_device *pdev)
> +static void pispbe_remove(struct platform_device *pdev)
>  {
>  	struct pispbe_dev *pispbe =3D platform_get_drvdata(pdev);
> =20
> @@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pd=
ev)
>  	pispbe_runtime_suspend(pispbe->dev);
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
> -
> -	return 0;
>  }
> =20
>  static const struct dev_pm_ops pispbe_pm_ops =3D {

Looks good, thanks.

Best regards
Uwe

--reie6nwaydlnyzqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaM3kMACgkQj4D7WH0S
/k6shwf+PMzTT5wTN/1/HDZMOOdnDCPmn36sQXpqK36TWxd3JfEF8ojZJ6u5ZOCv
liS124z4iEBkRH6CHatwA69+n1MpZPfMb9sS8nxt3wZ4IVqak8LUI0pRJvOsTArx
4sWAboZoY7kvw8ei3XawNngN5CERlnoBfFeN66DoLYOvuuSONI642Ju1MOxC/8Qx
NHIdHfP3yTPTt3V7aR9rPJvmS/KWVS00TJULC5Dborh2FnH1A5qMNivm6cAbtliw
/upHOaCnknH45MNMeibyQb/G60KS0JIqj2iFlQDmFwnKMHn0oDw7/FUM+ovu2KJQ
/MYfm8xZWngbLqcRC0unTqCzIBkysA==
=JJXa
-----END PGP SIGNATURE-----

--reie6nwaydlnyzqs--

