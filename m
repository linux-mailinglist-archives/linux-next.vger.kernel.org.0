Return-Path: <linux-next+bounces-4638-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 354BC9BE401
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 11:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE30C282EEA
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2024 10:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590751DA622;
	Wed,  6 Nov 2024 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NODiduU5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A6B1D0F44;
	Wed,  6 Nov 2024 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888126; cv=none; b=kOMFg38BO8winEm0yZWizfaTSF7WpdU4xzockeTifUObi6lu7B4VWyZS8AJYS8fDBedb0yf6AGsKPoZBzqiHlyEQ7zHWnite3EKLIRbUFLf8J1sUt2JiqGjdQ1nZQ0nho5yp85y3/fc59PNBro6cGZTfj2wum1sJC2HaFY0IT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888126; c=relaxed/simple;
	bh=Kk2Mg+juAsR7WQRM3pY13+cePOPXE5TlmC4eYylWueQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9uuhIkf7qQafGHS263frfh8907ct1kTq7cUaMj3/PRWVkDT1Pq9OPPF4k6XiC65y0O/bVb/OykBpw5JQuS3Vi1/DTIDRoQ1BTn5t08QB68lMC2WPgDB8k+1hYn56AQ+qVqC/+al5blX3eusAI0K1k74cMdQH49rM6bbINQIkO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NODiduU5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20c767a9c50so62824775ad.1;
        Wed, 06 Nov 2024 02:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730888124; x=1731492924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk2Mg+juAsR7WQRM3pY13+cePOPXE5TlmC4eYylWueQ=;
        b=NODiduU5kYX00PUoMearZHBENH5SCY1OXgrvjmsVkcamV9yvXzTUzk2pJ9epyZx86C
         OkQEpn3vi82/Q8mtaUp8BR5Umf8r+EzZBlkQXoghpshaJMyQHSbJSf47DxuwWYiNTrtJ
         nqEUbt0xuuP93W4wGkKqTh41Ziq+KBch9lbZh0FhZR2uldXZS9jqqMzcm/7ZuotwN1XM
         O1o1wnK1eDlPlQ8mC5DXkQzOVzGEvHvO/d8bds8FJbZlCF9jKAOtTd8daOk5WGRM3tUb
         2rJ9lIlIMlOJMpZO8q94eAY23IoqV+YELKr+pXaQPjS8baQQb2odKHac5AY4yQseMtG3
         Rh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730888124; x=1731492924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kk2Mg+juAsR7WQRM3pY13+cePOPXE5TlmC4eYylWueQ=;
        b=VIdRR1pj5zm2WdhIRiWL2Tg8s22hFhJ98PGC0H0u4pUL3+gI3cTfm5VGRbamfAUpU9
         a849Lix4IDPy2TY8Y4mVpJJhdd3xuuEJnSp+6HdxHex9b9rXghCQutaextsTSS01xu5A
         jaYyqas7LDoPVJwyacKJxoKNqDdJOWztMOl0eVT7HOxRCWEEvBlOHs3dNL7yfotlGWBc
         GKwBlbRiDU4GgjojiTGFGoQTJL8ITlCDOUlfz8S247eprPZ5kj6cvko6AHeUgrnPO3qW
         4eWYlr5TJkrYhm72GYeRlyfOHtVvz6gTVVqN2AxbkIWdjP89gdu2K9443HWHXbyB8znD
         Yxzw==
X-Forwarded-Encrypted: i=1; AJvYcCVRSCw6+u2ufVsLQiSqoyJn2xnB80OA1WweUJ8E2N0rksWWdo5dClHxh9782V9tz/fNfei8McEXU2DK+jc=@vger.kernel.org, AJvYcCVdovVNQF3yfUKq3tya+TYf4TZd4ZfOl4dzvoObChRCHlXc6FCQAvEGXfLuIbBbavp7Yg2cJigm5AcnpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjf6O776xSSqiP5pnEtbQFokN2guq/hlIqkP8auGh80cMDgY0
	+CeaisL/4Y7B62PsB18ZCGCZIh9P9nJfWvuyP2HJjdZiisyX88ne
X-Google-Smtp-Source: AGHT+IHCrwxxC/T/hM43rZ0+oojFA/JHrqLFh+NEeuiqci4BhpOIy5F1ZKwN03Yu/GNbze2PZjYrmg==
X-Received: by 2002:a17:902:f543:b0:20c:e875:12c2 with SMTP id d9443c01a7336-2111b0028edmr242839715ad.51.1730888123988;
        Wed, 06 Nov 2024 02:15:23 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a55c08fsm1211020a91.27.2024.11.06.02.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:15:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id A7FE44525300; Wed, 06 Nov 2024 17:15:20 +0700 (WIB)
Date: Wed, 6 Nov 2024 17:15:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
Message-ID: <ZytBuIRztNwrXoe_@archie.me>
References: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
 <ZyrAoWSF9KXxtuYL@archie.me>
 <1a3dcbe4-76dd-40c4-bafd-16be33607e77@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9623nhha283o+tV6"
Content-Disposition: inline
In-Reply-To: <1a3dcbe4-76dd-40c4-bafd-16be33607e77@leemhuis.info>


--9623nhha283o+tV6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2024 at 06:26:49AM +0100, Thorsten Leemhuis wrote:
> On 06.11.24 02:04, Bagas Sanjaya wrote:
> > On Tue, Nov 05, 2024 at 01:11:08PM +0100, Thorsten Leemhuis wrote:
> >> +Bisecting linux-next
> >> +--------------------
> >> +
> >> +If you face a problem only happening in linux-next, bisect between the
> >> +linux-next branches 'stable' and 'master'. The following commands wil=
l start
> >> +the process for a linux-next tree you added as a remote called 'next'=
::
> >> +
> >=20
> > Has linux-next tree remote addition be covered before?
>=20
> No. That document where this is added does not explain at all how to
> clone a git repo or add remotes, it just focuses on the bisection. So I
> don't think we need to explain this here.

OK.

>=20
> Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst handles
> such things, as it has a different target audience. Should it cover
> -next as well? Not sure. I for now decided to focus on this addition.

I think for those who want to test linux-next, they can simply follow [1].
Maybe we can add a pointer to it.

Thanks.

[1]: https://www.kernel.org/doc/man-pages/linux-next.html

--=20
An old man doll... just what I always wanted! - Clara

--9623nhha283o+tV6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZytBswAKCRD2uYlJVVFO
o0M5AQDRShK3Iju/OosulVtOR5OytAs1Bw2JbMTVa8I48IfF5gEA3v16wzQuefW2
UDKTATyC9P76ZIQcG0trJ9Sfm09T+Ak=
=Gi0d
-----END PGP SIGNATURE-----

--9623nhha283o+tV6--

