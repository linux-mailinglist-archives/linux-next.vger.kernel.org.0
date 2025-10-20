Return-Path: <linux-next+bounces-8654-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3078BEF3BA
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 06:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B182348ED6
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3259E2BE048;
	Mon, 20 Oct 2025 04:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcQj5RPH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90F929D270
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 04:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760933985; cv=none; b=i0HysbZSXjP4YTHYIUtcbtLNgqAqu5Y2s8VWqpHaQnQK0v9w7GTolzXao8jB7afns8i9ZXGGD7J9OImuQMLzjbfBJuCyzOLYcF3kJ6dF4JPdUJDfY10fLOQFnzDbv70ZPZwGU5u1vSKVq7j7Uy1TISeVHhqn+tQfPK+LvGuPWeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760933985; c=relaxed/simple;
	bh=s3zAr2Lw3rD/hCeK/LxHqHkhg0wpepJJnQXf3fhGEoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aqy0pEGQRan4jKZ2iiIuQB6HCBLbOrQiHDl3nveqd3KDbiERdOq6S6ozy6L7Wy1X48R6lZaL21lO+n2ahiLsJnB2xMuxOsg34ABbfeq3AKNobTWE9+gS8Ejhw6/0kuIdf/3FL6X5eZFFSAPsKZp991HfqqvDICB7VXq2c7YlwwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcQj5RPH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a226a0798cso1997493b3a.2
        for <linux-next@vger.kernel.org>; Sun, 19 Oct 2025 21:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760933983; x=1761538783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWRlJEZdwGAnIwAauINa4R3cyyZ8Vt+QqKXF4C/l9tg=;
        b=JcQj5RPHWujfCC3Vp3fxckb+Z4suvrkwe0eRJnBjybmx/djHhdLKufoBCTJ734JnV6
         09GsMfB9w4ctiYupw/N0rqoc23WL4Apmt6LxrAep/nJVxPSdSL5Ogkx8w0i0ReUf0Zm/
         Nmz4/H+M5/3NG4e7nrBZA0BVlRAI9u6UNhRawC5F8YZSEgPbEAhzJhd/oWKfSH1QhI2h
         f4gBf5fTEvXUrK6z30qcf8fSmJcRaQ6e76V+dA/khkxx4A/oMQbjUIywZMYsbylIZsc9
         29BQLt+soP2q2WBQclaUX07ufads66uxz0J30BpkJVzmjAyeR9dThWlv2dD5VcEiSGuF
         pMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760933983; x=1761538783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWRlJEZdwGAnIwAauINa4R3cyyZ8Vt+QqKXF4C/l9tg=;
        b=l4LnuKaoAwNSfNuqLEU2H8QjnJkJugipLLsUtDVvHGBll9Pf4XTFgiWe65+quC4ZWf
         +MR1h1Xa0RQUxkDBH5Hkg5e7/LNdOQN815UO/JJzeIiPh0dF/tSSF51VD4UE5sDoz2Cl
         ba0QAMYWerMUwRImLT+IQx96PGvK2eHB+GNovmEfwJKQuSerXIaWXRUk4Hszjhvqs+IC
         RMItswucXr3nbJRdG33Rl4rkaKLsIrwlRPEV8ikwgNfmF/KCsE0uuPGmbsQCPt6rwQ2B
         a1Z28Dl72A1mC6vuRtVWm1OPdtk9v9oS/pzxsyZ+nz5+uAPdz0a902pCeymWYolqp/Fq
         inig==
X-Forwarded-Encrypted: i=1; AJvYcCVRky4679GGpcDYAyl6jjZR8j9j+gizos5wFs7CHFF4kK7SpjHvEM2jOutwbhYVuQ64/hYndZqa/ysA@vger.kernel.org
X-Gm-Message-State: AOJu0YyZnJmEjnQ/iRJuvyVp5JKGTpHAnj0B8HrFQ3ZLgKOPH4cEKfXR
	6tyamA7Tyj/6Iam5VbCF/k3YQ14Gxpj2bYZWFSfbRlBWDZDDxP94LGtkcT8svT+5
X-Gm-Gg: ASbGnctmW2F5wX0bd2JUaMVKp5uqotpEWSXg/1OcMaQJYuC5fWyQiTL3aMlO0mzOn5R
	LYFpbvys1bx51B/lj9HDID96jwVnrpo3IA0yiMfjI4ebxC3KWqs5A3LDWwIwMOxAp03eSNyExyn
	9VP6Ht3r1xiZ0t5v9LJsWFGXQiA6ftSAqYOfbAuKinhJVFLpuWhi8em7RClLAW9szD7ST7S0DjU
	KkjOODUuGAxM47wL7ltuOjs5H7enWQEX+hYB8pahTEbEgwsR/xR7f2RxOChy5D1pf64q1smNyz5
	X5pHBccCOZRRa9l5YJWOJqWLM5/4gxWb6iz8LUlzNTAnStkP2BqhqqJyoHHeI1q1z+fgghSWo7w
	TFguexFgwmSza9Bc4r848QT1WvKnN8m/Cnpz+tVmvBk1tGQ3qD337QiP+GLKDr/R5WBwhdmCqNw
	iuqoz3lQXfNnug3g==
X-Google-Smtp-Source: AGHT+IFgXTzodinLLkmL+sZBQeQk+ymkQXYFzmC5F7odb2hPBu8wYY31SZhor2FAQq/w5Rr23U2jYA==
X-Received: by 2002:a05:6a21:6da8:b0:252:9bf:ad9c with SMTP id adf61e73a8af0-334a8629f82mr15461749637.51.1760933982959;
        Sun, 19 Oct 2025 21:19:42 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f253csm6975121b3a.47.2025.10.19.21.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 21:19:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D938941E481B; Mon, 20 Oct 2025 11:19:39 +0700 (WIB)
Date: Mon, 20 Oct 2025 11:19:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Baoquan He <bhe@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <aPW4W8cmRS9w3lpw@archie.me>
References: <20251020134517.795a133d@canb.auug.org.au>
 <aPWvfu5MQROcWKOf@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ACjYVYqtsauwiUs9"
Content-Disposition: inline
In-Reply-To: <aPWvfu5MQROcWKOf@MiWiFi-R3L-srv>


--ACjYVYqtsauwiUs9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:41:50AM +0800, Baoquan He wrote:
> diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/admin=
-guide/mm/index.rst
> index ebc83ca20fdc..bbb563cba5d2 100644
> --- a/Documentation/admin-guide/mm/index.rst
> +++ b/Documentation/admin-guide/mm/index.rst
> @@ -39,7 +39,6 @@ the Linux memory management.
>     shrinker_debugfs
>     slab
>     soft-dirty
> -   swap_numa
>     transhuge
>     userfaultfd
>     zswap

LGTM, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--ACjYVYqtsauwiUs9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPW4VwAKCRD2uYlJVVFO
oxZAAQC5wdKajBQyJLJrs49+X5zKeEvwkgxMr8ESkCVYMsSVSgEAxXXgFHFvTKqT
iDSaU2Ad2+9Xs1jakCfqypLctL5sKQg=
=jxQm
-----END PGP SIGNATURE-----

--ACjYVYqtsauwiUs9--

