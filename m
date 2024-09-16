Return-Path: <linux-next+bounces-3873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88AC979D11
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 10:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104C01C21E8E
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D167F13BC1E;
	Mon, 16 Sep 2024 08:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YV8twIxW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6154F5336B
	for <linux-next@vger.kernel.org>; Mon, 16 Sep 2024 08:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476151; cv=none; b=tQ017S6Yfb1sqd460JRc7ndZXqfA5gWN3ItuKzgYBrxMZwaNLxoFW8LthXr4pI+EDIZpChOkSLxTeawAcGQS71iTR4XyhRqovfBynpVX1Y1f8rdGX6WQDq1RQQ3nj4xztfm69ErIsykIbjyVFuuEel7l0C1I8uFRXB5YCF0P9kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476151; c=relaxed/simple;
	bh=VuE4GFKesFmZx2eFqSVy+A3vpjd+XzuiuKY7IvyFkKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqxJ0mr4quohjjFbDLgClX7CA9HqtH9kEuq9966hm+5Wp02RHbB7NtlHNafntFNhklgCD0m4C8fUKLeVEqJNCFZV6r6MCfCnR3zg+N+RwbM+Jukx4snoogANlS8ossKb1h/E/QHPQb3uJuiwB4DNya9sCMhv7O8FOi+28h3E6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YV8twIxW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37747c1d928so1890388f8f.1
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2024 01:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726476148; x=1727080948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F41eJySA9MyUfcQ6T4gd8Os3YEj6k+P9iYhKHE7FxrY=;
        b=YV8twIxWDFwGYg6cRBKSi5/tYzbZ4x9uLgVssKrZOsTfIk5CrQByqPJYMB2R78WpK7
         Dj+fsHl1NrLdmdziw04w4ee29a7DKt43Pj1qbe+PqUg0xQUBHDzanIpR7Eazbu+NV9+k
         WYgcgmbhpZoTPELuvxYbN/auWD9I6BkA7s9lgHAyEqThOSJMLzO58WuHxoNX9/NHVAe6
         qyHILg+q9bmGO/X5w3I2Efg2diLKZmpHN2h5/bGrK8p7bAZmO24oZVbukkeVgYBgwpUX
         4iz31rmle/c2WM0sUKjrz0y+jmAzIQ7BjBfarKlSvJ6oPKe0ArjfdvlUGup8WhsrFhCl
         nuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726476148; x=1727080948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F41eJySA9MyUfcQ6T4gd8Os3YEj6k+P9iYhKHE7FxrY=;
        b=P+uN6CDcZ4L840vPBkxQpgqr1tAAGIL+UdDu2XjqestpIPyWbxHk4sf4oMYGMMw32F
         bYP3Igky1n8/9lbxyABt5AWNnndIjGmhPSh47smRxurw7w6rkb/WpD4ZsjPZyB/IQkdj
         yv+RV0VFfq1E3xmuVZeG6c/eQVx6deudPQpAASMUnF7FCk7aLbmXCTdSFB7ufnVorMFB
         2UGA5bZiX1+Byi0uTfwnaFiOGJkHn/Pzn7EnZP7MKy7faj1vYMNn7bOwKHCnpiVaWaih
         UlqWVh2k+ND9DZdPqVNz2+t7/1GT5FJJFYsGQYxQ+ovA2LzcH8SLbT1ZAsKAfkrkv6aD
         De0w==
X-Forwarded-Encrypted: i=1; AJvYcCVQEHKpYjWaiK9wKWVXvqjpJH7Ok3nWKlFJYqdKGtbLxeCR0US+ehCn08CGv9fSqmZH6eYVmEyLSht9@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5KkvpB5iQbTOPduEpnHyVfbzeYqsHVkUaUxSEp2oR9Vj7H/Z
	Kq3U6vRMLI3UNhLhc932RB6VUVRfH5Ei2i0rmPY+IC1R6ZZsLdYuJ65VNnCJvpU=
X-Google-Smtp-Source: AGHT+IEPk0T87WkJERygtPKKvksvulvbFKRtwgjwTfmVpOMU5kYbIYXhNHyzU5/mbAEkOQXEF8dEPg==
X-Received: by 2002:a5d:67d0:0:b0:360:791c:aff2 with SMTP id ffacd0b85a97d-378d62435b9mr5987168f8f.47.1726476147332;
        Mon, 16 Sep 2024 01:42:27 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780016asm6646235f8f.85.2024.09.16.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:42:26 -0700 (PDT)
Date: Mon, 16 Sep 2024 10:42:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, Olof Johansson <olof@lixom.net>, 
	Arnd Bergmann <arnd@arndb.de>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	ARM <linux-arm-kernel@lists.infradead.org>, Mark Brown <broonie@kernel.org>, 
	Nikita Shubin <nikita.shubin@maquefel.me>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Message-ID: <rn7zribry4zpacbqynr5ljdlpj6vjs37nn2cs2lffoee3ehilx@kfthit56sgit>
References: <20240916145800.743302ec@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i2nhlfrio5p22hs5"
Content-Disposition: inline
In-Reply-To: <20240916145800.743302ec@canb.auug.org.au>


--i2nhlfrio5p22hs5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Mon, Sep 16, 2024 at 02:58:00PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the sound tree got a conflict in:
>=20
>   sound/soc/cirrus/edb93xx.c
>=20
> between commit:
>=20
>   7a9a9110d765 ("ASoC: cirrus: edb93xx: Delete driver")
>=20
> from the arm-soc tree and commit:
>=20
>   130af75b5c05 ("ASoC: Switch back to struct platform_driver::remove()")
>=20
> from the sound tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary.

JFTR: I didn't check your tree, but that sounds like the right
resolution.

Thanks for your effort to run linux-next!
Uwe

--i2nhlfrio5p22hs5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbn724ACgkQj4D7WH0S
/k7LjQgAt1vjQ9RbA0FUG/L3JFSfyqaTkypQdJjqppvVWQuVOekRsx2R5cRQw0ME
Jg7oXeHB69rKsBK8Kk2ckHHKvsS1PCC993oxCAt/xMCPSj7RYtvrfx8bzuEX0vAE
9WjUDTQMCPzeru6djPsAVCTzKkBzYjpBQlgrgCLf4/D6AzYGX0O2IZOUFik93wTu
Ygr+GzfMWRm/qywO1daSw3wwpa0KuhnH0Jj8ZGzyyOxiuCZoi1fk7OWi4IS8Az7m
M2oIfWVIFr5uSU3OxaNB6OuAU7kViBK0mPpvRVNtPeAkO25HtXNXiBBRkV8UZcqT
iSHBRhJh65XyYnR1SviRGc52yy+V0Q==
=/pfz
-----END PGP SIGNATURE-----

--i2nhlfrio5p22hs5--

