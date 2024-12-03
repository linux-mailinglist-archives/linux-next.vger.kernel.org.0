Return-Path: <linux-next+bounces-4859-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D849E1B6C
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 12:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3234B284E29
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 11:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C227D1E47B1;
	Tue,  3 Dec 2024 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uPNDxMqu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCD1DA0F5
	for <linux-next@vger.kernel.org>; Tue,  3 Dec 2024 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226888; cv=none; b=pigTG9EiO8yY9WNWsxZGf+kbu9Tek2NzdfZ6tjKf/15prmhVet+a0ST/W51/nsVRekYyO2Uc6sabqBfS8Ri/zjVfkCOtJm53N/AYmPb27QxaAUUn8TGvYZUIp1bPUdEHrweRMXmMCqATrCcYmBunj+AgNFDUAPDFzSutsmQ3Pqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226888; c=relaxed/simple;
	bh=lbnV9/OfKewYlnigAfj2lpnHbgQcZsOvD1YYnit2rqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROC2TJMqmvl4ZObfIPg8iIcvPpeD1n4iyp/4AGvOHrDwc48nGdnnJRW267xeRwTGi9qm3VJo1Qnf2kzOltixtsrMZBDo+vJExwhlI6J1MOKQ3iB/8JFsG28wAAPsCEpcJRt+touHKBYjqQ/Rb7kwso8MctuA/B6Eq0wvLZP84Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uPNDxMqu; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1949389f8f.1
        for <linux-next@vger.kernel.org>; Tue, 03 Dec 2024 03:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733226885; x=1733831685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgGNXpohR/eYydtB7L2Ht3fUc5XtlMm7UEOZZWUiN1Q=;
        b=uPNDxMquCv6/WoapqZp9bJN3IMjgDVJAF2cyCjvDb6Fr9s7Z/YUtJ7zaH1armcsI5/
         /j/W36tosEQUx01QANkR/gbtUqCHVyJVlQzMMUspQ0+Rye/GGo4ALg1RxZjt+YimSZnM
         s6GZ6SxCpeTCXGsPC+i6tgMPPHn8cmMJ5IdeRgGq0rl4vO5MDy+QmVX6Ig5tHGN4zanZ
         6+i4Il3XPA+cB8bxn3kDPQYFD8bMv2VTdPpm24rrgDAMz98mpX+JqLvC+3W2vyLsbMtb
         nh8LYxdgRnkm3zRtA2OoelUx8R5xrmr+cGiUtjNNDP+cOTKKeXn39E2HKXb8G3fXCcaI
         quJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226885; x=1733831685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgGNXpohR/eYydtB7L2Ht3fUc5XtlMm7UEOZZWUiN1Q=;
        b=aRSUmw1LH/zgjU7wI+j8rQbQa14GI+kB0cdGmkO+TYqv8QZME00NyXB1rTtUqp073Q
         D1jVCkfLdQRFtj7LAN5EmF5ZevyBEogS/nPzhI+8JaMJpCn2Hadt5Tc56mqd44NAaciq
         nfjT+T76Upls72VS/fSXx6+xn3G0Q5vEKJyKYKsoezPlK+Imqig5TMdWVNqtAjU8ZUdI
         XDfdHJT8vKUg34WCvOYCKy0DAQU6j7L/kO3LKnLw+8KylpzwEBqNSSgZxUyp2ixLeUsC
         QrdFYQ9y/6g8AD3SLzldpyaxNn1mCyLYbNHSxsENtOKl33SxKBxTGng+xouPa9oFNkZC
         BBnA==
X-Forwarded-Encrypted: i=1; AJvYcCUI+p96IksV2eZK87XUJEAlg783Naa0VNw5rgvS/svzbH7Xq7uxni7OlY6ZEk2JxoKmdvtT5Rg/n5nK@vger.kernel.org
X-Gm-Message-State: AOJu0YxEP6xoZWK78WxKnRgDKtLk17azfyeNymOVOBg93q3sirL9Xoam
	Hajd+kfGOv0/PAb7Q9fdjPSPhDuuJj6HEXYEmqYs5Js3JmPdwCBFeDufZL/eri4=
X-Gm-Gg: ASbGnct8laK6hOsTSw/DNWJxSawuVUfksQUv8C6mTneDplzn2nn/fuyD7zmKwcqRFMJ
	+NsFAGOrUEHl1Pcd7eMguehyE7o2DW0cmiXW3AZ/Cy50ipcQmDI9knhkcXwmwLCYI4Wyzw/HCXq
	ftVyqakVXBr/nnZwnNtD084tyd70BYrxkJUeQR5+CWx64MsdxUsiE8FBHTdZ5UBYuOLzYVsbFa6
	jXWl8WNrv4yOLUxYzER3odILVQlNS8B3zxpXIvtRKH6O5SIkzzYwUACDiq6OIWPjJyzOG6acAlt
	qdc2JIvwWcwiggWuVvdHRo75Xh4gl5nEZoK+xgo=
X-Google-Smtp-Source: AGHT+IFUw0oxE1rIHxN7paauKavjflFV52kyqjZANtW6RS1An0zFLwPqSvIguwvhLlxrYC7v/VwhcA==
X-Received: by 2002:a05:6000:4028:b0:385:f271:a224 with SMTP id ffacd0b85a97d-385fd3e784amr1626024f8f.18.1733226884558;
        Tue, 03 Dec 2024 03:54:44 -0800 (PST)
Received: from localhost (p200300f65f242d005bbc9b581c6b9666.dip0.t-ipconnect.de. [2003:f6:5f24:2d00:5bbc:9b58:1c6b:9666])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa77d01esm224113545e9.22.2024.12.03.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:54:44 -0800 (PST)
Date: Tue, 3 Dec 2024 12:54:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: [PATCH] watchdog: Switch back to struct platform_driver::remove()
Message-ID: <g2e433wsfey3smpg6gc32nr3x72eb6kdt7orieaegbl7qya74m@trtgyqz3oenj>
References: <20241010203622.839625-4-u.kleine-koenig@baylibre.com>
 <6236624-1239-9671-7fab-7b1b84d5e778@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kx3eny2qjv4nijvj"
Content-Disposition: inline
In-Reply-To: <6236624-1239-9671-7fab-7b1b84d5e778@linux-m68k.org>


--kx3eny2qjv4nijvj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] watchdog: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 10:57:59AM +0100, Geert Uytterhoeven wrote:
> On Thu, 10 Oct 2024, Uwe Kleine-K=F6nig wrote:
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below drivers/watchdog/ to use .remove(),
> > with the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
> >=20
> > While touching these files, make indention of the struct initializer
> > consistent in several files.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
>=20
> Thanks for your patch, which is now commit 562b0b03193b567c ("watchdog:
> Switch back to struct platform_driver::remove()") in watchdog/master.
> Note that this now conflicts with commit e70140ba0d2b1a30 ("Get rid of
> 'remove_new' relic from platform driver struct") upstream.
> Resolution: just take the version from upstream.

The conflicting file is drivers/watchdog/sa1100_wdt.c. Linus's variant
looks as follows:

static struct platform_driver sa1100dog_driver =3D {
        .driver.name =3D "sa1100_wdt",
        .probe    =3D sa1100dog_probe,
        .remove   =3D sa1100dog_remove,
};

Mine is:

static struct platform_driver sa1100dog_driver =3D {
        .driver.name =3D "sa1100_wdt",
        .probe =3D sa1100dog_probe,
        .remove =3D sa1100dog_remove,
};

The difference is only whitespace and my variant is the (obviously?)
better variant. So I agree to everything what Geert said apart from
"Resolution: just take the version from upstream."

Best regards
Uwe

--kx3eny2qjv4nijvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdO8YAACgkQj4D7WH0S
/k5WRggAtQrQGFRg1w5mkNOkimvVRGly8uThCE2drmNsCKsom1Xcpk3/wZ+b2th7
50qjqWOGbU/MhYVlUEvwRwAkXVv9JQ+XXitqmZN3wwehOPrzZZqWBFGv67/56hjx
OHG9anbqX+ifsUcEUwM0LU6oAeptqUXT7w+lbMFqaFxuRzAnUXi8SZXtNiLRcfVu
kBTvCi2X0AX8bXhMXWd2152ljxQFpkJXmjaY0hssjOtBvxhXy7T/06qnQs1OwNB9
8uFpxTql3anzWvY7qlAGKbA4ifL9Gm44d8xwjk9oqhSSMKLSmvpNIPewVcg2utQg
V5wU8X5kJHV+nBYlxzDq+5OBKnGIQA==
=z2tQ
-----END PGP SIGNATURE-----

--kx3eny2qjv4nijvj--

