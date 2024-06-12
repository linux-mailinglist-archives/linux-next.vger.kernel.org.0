Return-Path: <linux-next+bounces-2524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD999904B55
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 08:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCC391C2316C
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 06:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E091127B56;
	Wed, 12 Jun 2024 06:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LcWnkjTk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CBB13C682
	for <linux-next@vger.kernel.org>; Wed, 12 Jun 2024 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718172466; cv=none; b=FMN4BU7AC7Gdx592/gPELBGlP7bx/k+n2VbixNUwD6bZfaPSLAaNM0TkiHLzjaotRJEJW1ns38INHIzxkfDsCvVG9tDD3xHBPoynuv/Gp/0KS1SNyIZpiStiAf3Mh5WecFtusyqHjWQ96B84EpGubNBlZn88LaIavaQ3znQjEg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718172466; c=relaxed/simple;
	bh=EnfWLYvB7VF/zjv/C1ria4Ulv9lWBTxrHxmvzyOIjFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrxobXaeMUWEY1j69e1GUM3OSiCWvOxs+tBBLy3JsLDJRoMEY+xcwBW6kftk9tdxfs6ussytL4u3IW5sZEamH7XUcCdxNlY5R55XeImNI9Li4RFY0ryd/Ntk/N88augWF82zi3/9yLyhzvwvJ0sta7ejU4LqEJ56tZn7QABP5O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LcWnkjTk; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-579fa270e53so2915916a12.3
        for <linux-next@vger.kernel.org>; Tue, 11 Jun 2024 23:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718172461; x=1718777261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sgAombxwaBa61NgToQONMbTwPLjUykBUBMLngEAsJD8=;
        b=LcWnkjTkvwm/uTP/FfkK8s/tGoRPeOyJAjow6mqP9oct2cP8ENO5vmnIz7h+D40ktR
         1ZP6rqw7b6gbdl92nWtB+ehbOOum5W7jc+U/9qvd0HyWQ+F4RqWvHVxuV6KMW1Zu+Bqy
         u9G+ownzLNWG/EjhcJryugFpThAa0MqdDIRH0cg6CUR3HXzzxkOywodIqzF6HA1ddgiU
         Z/FamhdFkc9Rm4F+qbqFwBjJulxb+IaxuejK7BxowzXFlE3+1/9fZ09zVSwg1RmkP803
         CaTSMA88HygrMPZoJOhZs6grsk7NTNPhvKBxOGAj/w+Ty1xnOLe2YcEmktQV9pK4NDOM
         K6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718172461; x=1718777261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgAombxwaBa61NgToQONMbTwPLjUykBUBMLngEAsJD8=;
        b=DDb3j0k4eyxKEi/7yCmBxRq1dseQcH/WIG9Na58t+Efv28f5S0G1mHS9OM3MqJxGSN
         ChUW9HzCrLBc7SYD+HE17kPHiOwwXj8mTRn+f6X0VBadB8tKtdwHXYc68gge8zeFXiz5
         +GBvqW50G8CUlvxsAbC/gHJIc+k4VajsZZY9CqX6WiizGJXfGMx7YmttGmHSC+rSa7AJ
         OAFlkYZbOeZnoXv7wbCg0YkB7xfv6CFYDuyp4Yz7C1MU+24gVllMhYwf8Gbj2wBpxXEU
         5TJLR6tfMGHeixkURDl93sqMjXWVRoLqHB4cHEPzlonIraMBdLWfLuBE4/Io3Sa0hJOS
         kLFw==
X-Forwarded-Encrypted: i=1; AJvYcCUmLWI14kSjnoNmsJdnVuk7ikfF8dUeIB7lZ9KD3tbgHiUyMiJV93oxBlEgjqtYdSYffDVO5D0X7GZjz1JfjG6l3G7bNS6EMaUK9w==
X-Gm-Message-State: AOJu0Yxez8s/4TQm0LkDDblqdoyB0eEMEK+rFGsepw6ydMXarCWz/wTr
	kJh7XDYX6G9TkcDAohSEQJnYsXwCc/TFeBW3fg9Ce+x+YntrWkXkCMGYSA7JSDA=
X-Google-Smtp-Source: AGHT+IH5m/QjkhbZYaalRO09qOdJaCqoEizHkUosGFoVTQH/IyB4ADPFc/3pWLfe4nNfKJPQi8/IVw==
X-Received: by 2002:a50:9f41:0:b0:57c:9dbc:2b6e with SMTP id 4fb4d7f45d1cf-57caaac753dmr610246a12.42.1718172461199;
        Tue, 11 Jun 2024 23:07:41 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c831ee0cfsm4532814a12.28.2024.06.11.23.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 23:07:40 -0700 (PDT)
Date: Wed, 12 Jun 2024 08:07:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the mm tree
Message-ID: <7c6mpxaxilnh624zt2ifmxttfp62yyaj3zhwfdka3rdpeuwvow@p5ezripyv7xu>
References: <20240612123640.68ae0310@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dcjyokx52cz535jr"
Content-Disposition: inline
In-Reply-To: <20240612123640.68ae0310@canb.auug.org.au>


--dcjyokx52cz535jr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Wed, Jun 12, 2024 at 12:36:40PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   drivers/fsi/fsi-occ.c
>=20
> between commit:
>=20
>   2d2bf1e680a9 ("fsi: occ: remove usage of the deprecated ida_simple_xx()=
 API")
>=20
> from the mm-nonmm-unstable branch of the mm tree and commit:
>=20
>   29f102dbb11f ("fsi: occ: Convert to platform remove callback returning =
void")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> [...]
>=20
> diff --cc drivers/fsi/fsi-occ.c
> index f7157c1d77d8,21d2666c4195..000000000000
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@@ -718,9 -719,7 +718,7 @@@ static void occ_remove(struct platform_
>   	else
>   		device_for_each_child(&pdev->dev, NULL, occ_unregister_of_child);
>  =20
>  -	ida_simple_remove(&occ_ida, occ->idx);
>  +	ida_free(&occ_ida, occ->idx);
> -=20
> - 	return 0;
>   }
>  =20
>   static const struct of_device_id occ_match[] =3D {

that looks correct to me. Thanks for caring!

Best regards
Uwe

--dcjyokx52cz535jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZpOycACgkQj4D7WH0S
/k4qPggAhsqkKKxocPwhpTL12fU5huAgcoPVsUw13zC2ntWLxJt2xMXnBFCrch2+
ihKdQIPK0otifGpFj3PhmpSQCxAFGj9q9w3VMW3nEiYL4dEN9jMlLrZeHYsikvKR
Et4g6NuuhyV75b1ko4mCWMBE+nx5qybvvbYSWjOoxIPVdueYCJoqacCi/m6mWIOH
2VTYx3YTEmC0F2wlZDhUwKyDkymnyq3NbgUZEjtLm3kKxgdgFAFMGoGXKLVCgqkS
FLyaCNzmR25F7NWjIq33o5FtBYA6YVaadB2hXgq2j8hAFEaR6Kghdv1LS/cDSLyz
VC1aUvXZUM+65Nu4tjq7l57fn0IFbw==
=ujHZ
-----END PGP SIGNATURE-----

--dcjyokx52cz535jr--

