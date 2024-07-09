Return-Path: <linux-next+bounces-2901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E7692C1A8
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 19:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5821C2137C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940F01B47BB;
	Tue,  9 Jul 2024 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QjCRkdR4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37341B47AE
	for <linux-next@vger.kernel.org>; Tue,  9 Jul 2024 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542957; cv=none; b=C2Q9pmMdorEnxbxYn4WsbYpWLA+mHgkBzXAMOPcihyy4MbxnMEq19fQ8WrSyGTjv0whLCB7Y/Ghb6+4+fopBTh1bAdG5dQ5WJGl8xtpucAwXffaHCs5EVVXB+DmDh5S0cXiLbw+U7RvUjmV+bGOzX5RZCYLh5/tY7dQEL9sSxNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542957; c=relaxed/simple;
	bh=PePAGbhMUNOE0V833DZkBuDOtd4qtBDONsf9+SAawk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szvURP1BUHYW2NnjRMTAOVehxjAKWUnAlAdSo0gNcWbKD2R0GLtnThELNz54UKuU6JwPrYE1n/rXW3FY3uTpiaF96OCXTL5x0EYzKK+02745G0N2TxqtpIDvlPCzlLNFFo4GQE+HmotAZpxq6rhEpgHEfnxPfZkbSVub6fElIWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QjCRkdR4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77baa87743so581650866b.3
        for <linux-next@vger.kernel.org>; Tue, 09 Jul 2024 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720542953; x=1721147753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PePAGbhMUNOE0V833DZkBuDOtd4qtBDONsf9+SAawk4=;
        b=QjCRkdR4TsJQzTtTmrJhcAXyZJwxaxUyef6mviMOJZz/NN8dIYAEBxIawRAjGK6xQu
         VNcFbOO+fN9L0obm9WDDv3dd3abogUHdYWRIg7ZVHQeXv2iKBCFySxVvyg82e1HT09f3
         sHvkMECW4lCE9vRmp6tdxKPfeGlJNOLDF5vbfjb61ai3qBk39+8aZ22Et1alhQ+GmcK4
         OSwVQ6Knnz1B70XbDp+DwM4HntGLeGqO1NFOdqutq7sQ75DqhZWJC9rG0Bf48L/Be/i1
         rNZpRDh5EUv1czr8HXK3d+Uu+YK35Y+raMkhJxCS559Joy5/y/bepNbPGv0SfuWOp+tW
         ecaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720542953; x=1721147753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PePAGbhMUNOE0V833DZkBuDOtd4qtBDONsf9+SAawk4=;
        b=huYrh3aTWZ5RTXNtS2AsRgx7PhZ1Y4C8yAN1Amka7gS+1wJFuPNdoNIOXZ6an+VYtt
         uNnlcCWIivI66yKlD0HP4h0dXTWYZ4ybwa+AKHxFaTv4/9YtEWagn+WFlOtZFTvA8QN0
         /nkXENntKkmE/hnmsvvTkz6+F5W/3ptYVUgpqwEO/TrvarhB/BHd/EAl6dJSPFdrgnAr
         3n0n3xclJOfdqAnfawjrIRLJ3AhAO790YTlcubE8+M8lJvk2IavJ+eZdjbfWgAt6xOkL
         yru4Yi+O0kNgIPtWp6WqkoMTj1uOlRz+TWjmAx9dJdosj5ZmbuaM0pn3WrvjQTDyBJ/r
         grJw==
X-Forwarded-Encrypted: i=1; AJvYcCU0W3SgMWcqZJewx9QNQASm1ByyCt72kUP9HnDTMFGD3CD/b/INXB6pZ7IWOyTntrqcg8qzwOPH0cHRPVKI04oUn6ob/fEg+AFRdg==
X-Gm-Message-State: AOJu0Yzfad1lEyGyTpfa45BxR1mms2iJyKDsi342RegfLUmk1hSgb08W
	0RfNhayn8dwyKBDDSWkVtJUiovm5CTbPbG1UL6B0aqJL95KOPrDqNnOkZZPddrc=
X-Google-Smtp-Source: AGHT+IHG9sM381M4u9R6ru+Q2K7lC5oxBE2d7vRqLXAPPx0tdjk+KxL1mJvjO39ifs+Mw2YGUzrc6w==
X-Received: by 2002:a17:906:9982:b0:a6f:b0d0:1beb with SMTP id a640c23a62f3a-a780b6b1c63mr238978966b.24.1720542953030;
        Tue, 09 Jul 2024 09:35:53 -0700 (PDT)
Received: from localhost (p200300f65f217d00930e0db224f9e8ed.dip0.t-ipconnect.de. [2003:f6:5f21:7d00:930e:db2:24f9:e8ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a855e24sm90830266b.177.2024.07.09.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 09:35:52 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:35:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Greg KH <greg@kroah.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/1] media: raspberrypi: Switch to remove_new
Message-ID: <be4j2t3vjdgstmps4i5m47rcwgc7kkbqut4gzxs5wmdvl6qxiy@zhjub5ptwqm6>
References: <20240709163715.3bcd6ab3@canb.auug.org.au>
 <20240709161735.3724913-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="taw6qsx5tso52cco"
Content-Disposition: inline
In-Reply-To: <20240709161735.3724913-1-sakari.ailus@linux.intel.com>


--taw6qsx5tso52cco
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Jul 09, 2024 at 07:17:35PM +0300, Sakari Ailus wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
>=20
> The remove callback's return value is about to change from int to void,
> this is done by commit 0edb555a65d1 ("platform: Make
> platform_driver::remove() return void"). Prepare for merging the patch by
> switching the PiSP driver from remove to remove_new callback.
>=20
> Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
> Co-developed-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Acked-by: Naushir Patuck <naush@raspberrypi.com>
> Acked-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks and best regards
Uwe

--taw6qsx5tso52cco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaNZuQACgkQj4D7WH0S
/k73dQf+L8wl6JY3B32JKuxz5QOwwZFx824XGARH0QVZLQxQl0ieVxMi4VyHz5fU
gl8E9vbjMcm3Hc1XHMBWLbgAKfKsx8+zfO8Op85WMj+XFZKnOwqEMztf3HUPrmTG
xKEQxO281+LYAzRok3P2YNhQAKQlzBEINfIfnQF4228xiMsrUtvSrSa91pM3Z/hc
2sBnFUJOFxgkNUl8Cf2VNp6HqD9vbShPuhgbKFPUqbs9aUoGxKIdDxii88aG+DSY
27z1WwCva5AOpzwgl+rSxqRI82aFe7f5uZZtZBclgeJrtXXZwqF94clg4SDnOkxO
5/f3KbxN/FvNGPQxglDIhMTFC7K34Q==
=KSGa
-----END PGP SIGNATURE-----

--taw6qsx5tso52cco--

