Return-Path: <linux-next+bounces-4641-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E29BE483
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 11:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 514381F22CA2
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ABA1DE2CC;
	Wed,  6 Nov 2024 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMBZMFWr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609351D6191;
	Wed,  6 Nov 2024 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730889844; cv=none; b=j56S99jkJsB6OQmaGqv+Kq4S4Bp9Xnmzw+R6SZ5rmde0gak5I/FWekDPtbZTmrK2cH5fzT/BdoFNSH5eAFpTFUzOyzi/0USF6CqfDa7c1rdIYdoszwek+SWjv3xKhnQy/Wm5FweELPULbm2MEYLX9Iydkhxiy4SByLZt4vvcDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730889844; c=relaxed/simple;
	bh=WNI3xSGo3nesqRlhZePkS2TRbCQNJ8hkYEk6M3sj4uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUMIL17ZPghXuOBF9SBrkT0DOmt7UwGREGazNEtBz/z5z5vxOUkiTpPHvfmpxLxqkdwxDaHyh7YbXow6j5O6XKPUbN8HMLoGRjsP/6mHaFHRIPmB3r2gPGfzKe38ZcH4c8CzVzG8IeXWQr1KLkA9oaqW+eeaxZDL7zCARihFtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMBZMFWr; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e604425aa0so3536323b6e.0;
        Wed, 06 Nov 2024 02:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730889842; x=1731494642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T25HsGVJcAN3ETqyfBc3tR6NSPcizy5l8tnRPPz2tQk=;
        b=OMBZMFWrtjc3dknioexXcyx7yLj0Vcb/nKVOl2v7lMpbbWIjwzqf4ltKMwvPPWDBCi
         d9d7vNc6S+WIv123uQW4lTDHNTR5LyfpR6YVftvdvVGZnjBAxxmN7TkFVTgUHjys/Mc+
         6fNYm5HsW6WAfSJFpzF1c4C2UNQ6atLWJlBr+HkBzNGgNY1QMTRyM+dDBBoN3udC/Z2w
         3XKd+BlzPLs5L6anwQW5nc69AThUyjMpWASiHMDPOCKWzVKEQjI16AX+uX8M/8X4Skuk
         VhmCY4IujhdGawEKiy6IjeauvVtfdXnUqtvfw78LM3ARguDnRssB4zs5A4LSB/7pUdrd
         U8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730889842; x=1731494642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T25HsGVJcAN3ETqyfBc3tR6NSPcizy5l8tnRPPz2tQk=;
        b=e+QszUbxTUxAgl66VK9DJedrIulq1M6W0+Zyfqz2cX2JOFaSOJ2vUO8yaoNbZvXVU+
         f761EF8yyJvFxjB6sua/684BSaHdXxW34/f4/XkII5d7a82yokQ6qNJ1HiOTaKx8or1Y
         Zyo9uzkbbGINBXKXZTYM07i9bRggiemaGNA+kFdWuob40CQLnx4RVEnaqT3Rr3k9wLoA
         LyzbNhF64C+eQ/qDD9eWzavI9bYeq2D49n8Z37gNQ68+XhbopjXAAMuOU0a+BjybxIPx
         9WUFlojPqkCP3FEbIhLg0WS44xKqwIlTZVscGKSbLBZYOw40sEVTZ4pFHsvk0m1Ke7On
         mhHg==
X-Forwarded-Encrypted: i=1; AJvYcCUoZejxojsRelYylftbDA+5aU84o3LCjL6qJjsXNIzDMKuyxOX7/J47Cmgv3Un/P92N6WDmWgLGxrCrCOY=@vger.kernel.org, AJvYcCW+8Oja5Q+zEQZoHaIPp8SSQv2M2sZ8rs+vFs2+6pj12+OxEqnvc/hhkuh6WMOmMNgDbbJdROj5ROJ7bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjEa6xut7SDYU87fI4t4eKQeVrRxEmDZ7ZSU7rPuDbJCJEZf6o
	q/M+1CihPQv2ylP46bprtomdl1I6G/iP0LMLKmE8bEU+fIOFw0Hmw6E0hg==
X-Google-Smtp-Source: AGHT+IHfKkKTotxeeX3JSZaK04Ih4Kl8flPmrwwKt0CbXwfU7tWoFhUoW9SwoLyLj+UFu9asBYaaRg==
X-Received: by 2002:a05:6808:3c46:b0:3e5:dbb6:4b6b with SMTP id 5614622812f47-3e6384c4da7mr37487332b6e.36.1730889841911;
        Wed, 06 Nov 2024 02:44:01 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45298a7dsm10706225a12.6.2024.11.06.02.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:44:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 70C964613072; Wed, 06 Nov 2024 17:43:57 +0700 (WIB)
Date: Wed, 6 Nov 2024 17:43:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
Message-ID: <ZytIbemd-8FqLfKc@archie.me>
References: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qgDl1AQ3jO3q4+Tm"
Content-Disposition: inline
In-Reply-To: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>


--qgDl1AQ3jO3q4+Tm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 01:11:08PM +0100, Thorsten Leemhuis wrote:
> diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/adm=
in-guide/bug-bisect.rst
> index 585630d14581c7..f4f867cabb1778 100644
> --- a/Documentation/admin-guide/bug-bisect.rst
> +++ b/Documentation/admin-guide/bug-bisect.rst
> @@ -108,6 +108,27 @@ a fully reliable and straight-forward way to reprodu=
ce the regression, too.*
>  With that the process is complete. Now report the regression as describe=
d by
>  Documentation/admin-guide/reporting-issues.rst.
> =20
> +Bisecting linux-next
> +--------------------
> +
> +If you face a problem only happening in linux-next, bisect between the
> +linux-next branches 'stable' and 'master'. The following commands will s=
tart
> +the process for a linux-next tree you added as a remote called 'next'::
> +
> +  git bisect start
> +  git bisect good next/stable
> +  git bisect bad next/master
> +
> +The 'stable' branch refers to the state of linux-mainline that the curre=
nt
> +linux-next release (found in the 'master' branch) is based on -- the for=
mer
> +thus should be free of any problems that show up in -next, but not in Li=
nus'
> +tree.
> +
> +This will bisect across a wide range of changes, some of which you might=
 have
> +used in earlier linux-next releases without problems. Sadly there is no =
simple
> +way to avoid checking them: bisecting from one linux-next release to a l=
ater
> +one (say between 'next-20241020' and 'next-20241021') is impossible, as =
they
> +share no common history.
> =20
>  Additional reading material
>  ---------------------------
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--qgDl1AQ3jO3q4+Tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZytIbQAKCRD2uYlJVVFO
o1uGAP4odbwPktbyPDf6WsZp4aCO6ezYhRoW6x7uG4tcGtavWAD/RMicuJOL4/R8
91bqPk3MOQ7D+9c4JsFbv+jV0Hkh6gI=
=LodR
-----END PGP SIGNATURE-----

--qgDl1AQ3jO3q4+Tm--

