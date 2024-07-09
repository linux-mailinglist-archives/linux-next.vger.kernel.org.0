Return-Path: <linux-next+bounces-2864-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8792B0EA
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2253828345C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E2A14373F;
	Tue,  9 Jul 2024 07:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jGJEV+5m"
X-Original-To: linux-next@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4013D880;
	Tue,  9 Jul 2024 07:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720509303; cv=none; b=gVjegeZEnVyFO1limSeaz6c1BRyaRobuMmyp3r7Vb7jk5qX7fprARVMIea/YZ33rPUFkBYra3V8ER80x0M+h9p2hy+sl7d5rRnBWSbGa058L/9sMf5vvdtX2JQmU/gEfBJwW/ZCa6iu8iCSwLcWl5662COTLd9hl7R/UIb4CPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720509303; c=relaxed/simple;
	bh=0IRkMnPjOmr42J2uUwAmWKuvX5+19g/fLDCTdqFPxTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYly1kDbeiRoUgsaOGhKZXnMOFsG6+5lc3fu+Iu+s/6hT0b0hCVo2EHRTYIiv3sCRI8FImgB6J1CvbmeLUoVU+a/z+cE8CWvE/KabYCxh1hCKuxxmq8Lz3aZ4dD/YQkX63wr/bclq2tdewjW7iY8av7NcKOEla5pWS4o/dCmQRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jGJEV+5m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 923881440;
	Tue,  9 Jul 2024 09:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720509261;
	bh=0IRkMnPjOmr42J2uUwAmWKuvX5+19g/fLDCTdqFPxTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jGJEV+5m6IeQijZqZsfr9YCYjDkcJIIq+owCKm0JLZYo9ytf7U/9INtOojdA9PzbN
	 ivUNceIK+SRvNjFG/BZnyuGc6B4EUE1fqKgemxJEI3ZVFoZss2nSoRGUinSL8k8lXe
	 OZhhQ3H96vKE1InNXtDgnkNND/u6F0D0bsVSc2eU=
Date: Tue, 9 Jul 2024 09:14:50 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <5p5oghlbzhnstri7auqq2ku6djjij7quhcw5lwyxtanjh4nffb@umcurt4wizy2>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k4m6oak7gqfijgea"
Content-Disposition: inline
In-Reply-To: <20240709163715.3bcd6ab3@canb.auug.org.au>


--k4m6oak7gqfijgea
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Subject: Re: linux-next: build failure after merge of the driver-core tree
MIME-Version: 1.0

Hi Stephen

On Tue, Jul 09, 2024 at 04:37:15PM GMT, Stephen Rothwell wrote:
> Hi all,
>
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>  1786 |         .remove         = pispbe_remove,
>       |                           ^~~~~~~~~~~~~
> drivers/media/platform/raspberrypi/pisp_be/pisp_be.c:1786:27: note: (near initialization for 'pispbe_pdrv.<anonymous>.remove')
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   0edb555a65d1 ("platform: Make platform_driver::remove() return void")
>
> interacting withc commit
>
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>
> from the vl4-dvb-next tree.
>
> I have applied the following fix up patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 9 Jul 2024 16:03:05 +1000
> Subject: [PATCH] fix up for "platform: Make platform_driver::remove() return void"
>
> interacting with commit
>
>   12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
>
> from the v4l-dvb-next tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks, I haven't noticed it as I've based my work on the linux media
staging branch which doesn't include 0edb555a65d1.

Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> index e74df5b116dc..7596ae1f7de6 100644
> --- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> +++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
> @@ -1756,7 +1756,7 @@ static int pispbe_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> -static int pispbe_remove(struct platform_device *pdev)
> +static void pispbe_remove(struct platform_device *pdev)
>  {
>  	struct pispbe_dev *pispbe = platform_get_drvdata(pdev);
>
> @@ -1765,8 +1765,6 @@ static int pispbe_remove(struct platform_device *pdev)
>  	pispbe_runtime_suspend(pispbe->dev);
>  	pm_runtime_dont_use_autosuspend(pispbe->dev);
>  	pm_runtime_disable(pispbe->dev);
> -
> -	return 0;
>  }
>
>  static const struct dev_pm_ops pispbe_pm_ops = {
> --
> 2.43.0
>
> --
> Cheers,
> Stephen Rothwell



--k4m6oak7gqfijgea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAmaM42oACgkQcjQGjxah
Vjw32BAAj3VA7n1T1s0ZS92IyHhovhWnnxHMNJsa+6/F5Hbp5lFEDDSyhvo22wL5
+02hadQfR1Jpqr3wp5pnPD/Bio1ZUNqyTD43SLCvy9tUG1oUjuNDiKez4OmzOQDy
rxe+w1SMoTpxH2pb1ZomB1OkPkLJQBMsobo0/O9WU2S7cGUuBRKUNw/LZOZCa46P
rX3pNeAYdr5WammNO08Ww0kleRgObpDp/VBSLVVIIeZAzsEuuicDlISSu+3jHSBn
s5Uq6zWnuUos5+J92vG35Ka/BOjsZ+HltZmQarDWzvTcu1e2JHvkrr2TGSqJHoQt
B2djXTwzcKVBXbAH0t4W0AX2wFpKmL2fkAW5Y68SVGlQftGhXPe5yZIuPjNj3gLK
jmqAY92753mDMimcMZBJ0E219Cml1ICuKtYts7V1c5pKAdPiYwvcCGh5eBJLkHoO
Xqi4NaLjxp3+FoD+u17+MOjYGs7SJkWPTamOY+lE5WnyHCfWQ/1kYlV/IKxA1wKu
OkZOP8wETegzcEX9fZeed+6x1EUSyAgn4qzjMPejwODXnvzt1dlnEDb921AAimKL
vUtMTA2YRSIu+0SOEm0wiJBp4Px59TpV+kN/lJz+4bVnktYwJM7r4Lvf2FX1GDkK
fhMUvnJKCeefbDxEqQOyGc7lrGBBeAibNCwH9dzyEuAcjenrVwg=
=CYxR
-----END PGP SIGNATURE-----

--k4m6oak7gqfijgea--

