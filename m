Return-Path: <linux-next+bounces-5296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2BEA192BB
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE9471882850
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A7B211A31;
	Wed, 22 Jan 2025 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtoK4H8O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3F4E1CA;
	Wed, 22 Jan 2025 13:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553181; cv=none; b=UlHCyyz4TgL3X/sdA/+YcHcmWtSz8BE7EljBZdQU78AjHK4SRAZczkq5xzzenJU1DQoCi+e2IpvQ4UAwqCFRNNy28xUXhEq3SiwJkVdEp8l2he+kL3JtPXbBB5TEPTVUG/5B1Af8RcKwONZV4wgSeymYW7vBrWletGo7MfvGMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553181; c=relaxed/simple;
	bh=GsMzRdgSI8Wql7ws8lMf4mQcv1YOdQMDFg66eLs2oMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeWz2MlCyHkptr4pIZStDKIX61jO6xi04nQFlXbJoflAx8z+iVkztvSouknTYJePTerWDshpHfLENsKLQePPq3tIWbLlz0KUMfq6/S/JMxaq84nzVtaTw5YzTU/CMLy0CYaOvXUHgS4om/s/KJruNQFmhE/058rrgfAwD4BzPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtoK4H8O; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216395e151bso12556435ad.0;
        Wed, 22 Jan 2025 05:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737553180; x=1738157980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8bhHRbPOJuYHoUrzETf+VpTu832aUcAcQIcYgRyMno=;
        b=AtoK4H8Oh9M8Aius83K8ruKtDMxvgm0jn97eyAoDTbDI/D75Qq5zitj6sLSh7ioEsZ
         USLsH2uFL0TPx1ZKJ2BOs6BqzdyfXRKIUAZE83haKGohF4pveGjvgRQe5ES/8ZsN16zt
         8wx2edAhWf2bg8c+OOV0lA57GteVGp3Bma56tzZ6N67iBA478BN4RbMbQ/V80stjsIXn
         PkeZ/MxROX+1fO0FXzuY2Zp+IUCzgLPF15WVHyT+DnQ+DNDCYIbfsbAXg7iXCzNshbWK
         au/c7WcJWfAD9ngGKuioeUX7dys4VaUapogyF/j/i4JLJaYiX+jKevKZlJoVG7UeGM14
         pQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737553180; x=1738157980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8bhHRbPOJuYHoUrzETf+VpTu832aUcAcQIcYgRyMno=;
        b=c8W5clnXrDyDOiDgg/SZWYBdOCiRMgckpYaAu5WivGHwpQuwXZtMmKLO8G0jrrS92E
         +wUhpyovzDNM6p/r85VBscgTiuKmDNn0G6nWGVeBv2kMYKe7FksHTjC+EQB+jra5bvG3
         XD2ee2b+udeM5ybxdIsA+KZYuC4243Mf59iX4JoYY0nCnQ4TMUioOBm0zdsRcTksv+zr
         o4LmMpJYWMazpykTdfOSIsPOtLI8nL938iMZL+2erh/b1FScMaZmnjsOlXyFBYA3xcZM
         e/Q6fwxNcOYPPzPVhA54CYHehEyq8+U7T/gsh890Lp/IWf1MZQCmb+lpM26lheOONaMH
         ncXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeH66UdcAPfT/OJo2OcL4ma7hYu7mdBbM5UzlXAgXGvA6cEa3FpUNlresqiITCvz5SNfekdGlYNW8=@vger.kernel.org, AJvYcCW17W13WKKaCRgka1gpdwXQuLWawH9zmvPwNeRDT5H1GvdIBbocPtc1LSxtaLllnDVI/cdWY4a/Tqv+6g==@vger.kernel.org, AJvYcCXW+vOq/lDIWO6gsqV7Q4DiR34kNT6GFH+aH582Hg77LctUiZCXK4s2xbmBfYFIkVhKkwtxq1FMBvpZsddS@vger.kernel.org
X-Gm-Message-State: AOJu0YweswDow/zSkptwW8g/y97oYYs8Fi9lu3D+SESoiT9FRoE3nXh4
	nByTwuzsYPJF3Aq1uNFvIJraXgSQby7dxRhBwerAJayiMwOCynFJ
X-Gm-Gg: ASbGnct7Pj0lXAeBEhG+xpjV7Nq6YLhNQ08AlgINUjS2jOfN0yKsH04vELozGziQaY+
	GV+IsAeaGZZ+rcNT2+e1pz4QL5dGZVQ89xq4Y2m1EvWK87i7HewlxMCuqCpgS6JZ8skD1eaW24o
	8z4GDDggGp0F+nEVQFGF9e6fM/48N5eD+q9qABXVUo38BBCizcyRFPkz070KX09oi8wQoXF/B4F
	JFpv2EjSGcM3UleWKzbpQyhVo1AI8RYWsX4ToIXak7pk9K6g/1kRl586Dt2Sf6vqSp0bw==
X-Google-Smtp-Source: AGHT+IHdfg7I/vsglcpMokTvQOEdp7rnue+y1Qs2bR1p91bzPbo75ToI9OpU+6x8lMZfFHlVqBEbLQ==
X-Received: by 2002:a17:903:2409:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21c36e608b0mr308853545ad.20.1737553179601;
        Wed, 22 Jan 2025 05:39:39 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb7476sm96627465ad.56.2025.01.22.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:39:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id D223F4209F8C; Wed, 22 Jan 2025 20:39:35 +0700 (WIB)
Date: Wed, 22 Jan 2025 20:39:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, sfr@canb.auug.org.au
Cc: bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, mchehab+samsung@kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the origin tree
Message-ID: <Z5D1FzkmODr7YC8I@archie.me>
References: <20250122170335.148a23b0@canb.auug.org.au>
 <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dHiJOwaPe7fD7PNq"
Content-Disposition: inline
In-Reply-To: <07507296-a37b-4543-97cb-0560ef7fb7b8@gmail.com>


--dHiJOwaPe7fD7PNq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 07:00:43PM +0900, Akira Yokosawa wrote:
> [+CC: linux-doc]
>=20
> Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next build (htmldocs) produced this warning:
> >=20
> > Documentation/power/video.rst:213: WARNING: Footnote [#] is not referen=
ced. [ref.footnote]
> >=20
> > This warning has presumably been there for a long time.
> >=20
> > I don't know what causes it - maybe it needs a space before the opening
> > bracket?
>=20
> Stephen, fhve you upgraded your Sphinx recently?
>=20
> In "Bugs Fixed" section of Sphinx 8.1.0 changelog [1], there is an item w=
hich
> reads:
>=20
>     - #12730: The UnreferencedFootnotesDetector transform has been improv=
ed
>       to more consistently detect unreferenced footnotes. Note, the prior=
ity
>       of the transform has been changed from 200 to 622, so that it now r=
uns
>       after the docutils Footnotes resolution transform. Patch by Chris S=
ewell.
>=20
> So the above warning is real and prior versions of Sphinx just can't flag=
 it.
>=20
> To silence it, you need to get rid of the unreferenced footnote, I guess.

Hi Akira,

I think the culprit [#f3] footnote (that triggers the warning) refers to
Toshiba Satellite P10-554 notebook, where s3_bios and s3_resume work only on
uniprocessor kernel. The proper fix will be probably adding a space before
the footnote.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dHiJOwaPe7fD7PNq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ5D1EgAKCRD2uYlJVVFO
o65NAQDvtbk8Y9o1ZRE6DGzN0A6DBR25TnnzdyjA9G2+65aUDAD+MKQlYywbYMLk
Vo73c4PgcxtT4GrwFoFzkiP7eE6FIQI=
=STQB
-----END PGP SIGNATURE-----

--dHiJOwaPe7fD7PNq--

