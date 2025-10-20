Return-Path: <linux-next+bounces-8650-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAFBEF31C
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 353323E283D
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0872BD001;
	Mon, 20 Oct 2025 03:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLLlUaZ/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC1626B2CE
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 03:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931246; cv=none; b=aERDkJkKu1jecjSLXfJ67zl9j2r03OHpqUd+kWAHPJdTzzye8koLAulzOOdHLrleeIEbyOAp2whdUb65cqWmsz/0DJaTCfRr+HIL0sRclBnc3MVN/Dfb7Cl8yaFdskRGf2pOYdH9BP42q2CdTZCs7lKFTloJKurpI6dPH40z3zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931246; c=relaxed/simple;
	bh=ubONa7ropRcOUm568w5bPPTu9W0xpzaxAOWU/R0wKy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGQ2/RnpTV1yTOeL7bcHJsRdVZOJJ4uxbtlWYkAEua+h5TKq1U8hz9quvmzzmpLtSMuiMPlC6zVpNEPaCFSiL69tXChIo4Rns0iFxYitywhvV0aVlcW1jeRV1oJQvKwOioQcamlso6HdaWx1DXPloBejqWAuEmm836ne0x3Nlxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLLlUaZ/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-79af647cef2so3379605b3a.3
        for <linux-next@vger.kernel.org>; Sun, 19 Oct 2025 20:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931245; x=1761536045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9KCGk0JC3CTk5iIZQYbC1DgG/1ZW9eR1AJEbPiuOW0=;
        b=XLLlUaZ/gc5cPikZoKIpw+1TRZ9tNhl7I7xfmjpB4ygJmBH8vz1TczHOaqGKmeBb3E
         /Du6uwAOnuG8jW9x5NpzkHqWU7MDMx68Y6W30GWI3UgVZbRFTM2ve29tWHuIsnuRrhsI
         uq1W/GQAv6v5X3w+JEn6H67gNrYiH+G/JzcDx/GpPDQuyU5CCFw09wpphVNDA4ao02RU
         Fmt/gWQzgdnbanrMasK2RxPl9Xi2CHhuHFWh5KMtnPrJWNixBfIt1EdLIFU0SmAiu86v
         NhZMEKt80MoZIXatn2nz8FF1KO1hRGfuEWWzJ505rCY/x1DJtIv6XyqnXW9p8/H5OdUT
         erag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931245; x=1761536045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9KCGk0JC3CTk5iIZQYbC1DgG/1ZW9eR1AJEbPiuOW0=;
        b=XhI3NtHkx4jw+5SJPd+ATWfs0cGTLdA+03rIR7MphSVA9dqXi6l45V0ohel1y6jLDI
         nfi1UWk0toEgzdP0H28hQ5qiIH8WqB1Aip5wPhBNGVEYrgDqougqyZdiL4OnW2dnT7iI
         QzrRm31/gwI5SESoqIwXIIOfNdIzvj/nxmPPkxayhQtu0Fa1NECRVNmOWmmlBXxPXDFV
         tQ7LPTJ+4oreesUvJ6kmLrdKdi3LsmBa5pLqahg/QF/9gaS5rUGHMuxA9E/Um/BdHzkn
         px0kOqQGDwi3ROCwAuIMsgZE0OhJHWlLr3h8idWCTVpQEo3yqVm4ve/BPJMI5hTuRX1K
         gY9w==
X-Forwarded-Encrypted: i=1; AJvYcCWrrihtGBUV6iKh+SoufUYWToDJ5XxwyqR58jUewFuumGZzSiu6yBDzdPhlc4ZR1Wl1hpYx1v4E5n4j@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyR2pPanpDJuNPZD3edSzktoyQ9lEJh3bJ+v9kbWQSg7I++a5
	jzOrRqSI07qK6hGILshy2zq0gQcVZ2B2W/DX/pVBmcMVIF2V4qcKH20doj07NCEf
X-Gm-Gg: ASbGnctUHb2VTYNAOkJj02zwDs8sU9DBfylXDGetondBqj2TnZoeHrCclvi0Ll5Z1b1
	jC/lOg+julDIfpkn+W01mRjK3qL95UdIdiMQnXv0U52UzDJBB8EKOvYHmk4wZc0lqGf+g6a2PRd
	v8or8arCJKt+vUowszdfCkEFExEBuS6cROzTHYVwM3wHk6mnf6/KQlB6WT7hzFku2HXYAEt5pX5
	GWxy00e1p0v6eWayjrf8g+SLYfVpiuklDzAora5V4rAw0ELBnDhOMRYtDvQ8iqZRfk9p+86UglU
	I8SlKduMJS57L2YZBjcq3RhH0nqXwXOBVh6wxGAjGWtXCU6XoFnz2hzyQEQR6bi3vfkAAmgJSIO
	HvBC/ZNMIAmF2jh0bfq6F7igJju9PQGj296lJXm6h6P6zmbG2Lz3CITGcL+ZtzhrTz7vnKKJHM+
	XJgiJ/0LAVxTQ3wg==
X-Google-Smtp-Source: AGHT+IE3Iwg4NUHF6OYx4wb4cVhQ7Cs6qD/ZwCO1Ze/O5Ksvhac9AtWKMOgaiXSa0ybeYFo8/3pCWg==
X-Received: by 2002:a05:6a21:328c:b0:334:8239:56dc with SMTP id adf61e73a8af0-334a8650107mr15007720637.56.1760931244502;
        Sun, 19 Oct 2025 20:34:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b59d0csm6330782a12.30.2025.10.19.20.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:34:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7AAE641E481B; Mon, 20 Oct 2025 10:34:01 +0700 (WIB)
Date: Mon, 20 Oct 2025 10:34:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the crypto tree
Message-ID: <aPWtqT17TiqKTibG@archie.me>
References: <20251020135339.5df5ec50@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8rjPh9wMhciqOQRv"
Content-Disposition: inline
In-Reply-To: <20251020135339.5df5ec50@canb.auug.org.au>


--8rjPh9wMhciqOQRv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 01:53:39PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the crypto tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/security/keys/trusted-encrypted.rst:18: ERROR: Unexpected i=
ndentation. [docutils]
> Documentation/security/keys/trusted-encrypted.rst:19: WARNING: Block quot=
e ends without a blank line; unexpected unindent. [docutils]
>=20
> Introduced by commit
>=20
>   95c46f40aac4 ("docs: trusted-encrypted: trusted-keys as protected keys")

Fixed by [1].

Thanks.

[1]: https://lore.kernel.org/linux-doc/20251017181135.354411-1-krishnagopi4=
87@gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--8rjPh9wMhciqOQRv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPWtnwAKCRD2uYlJVVFO
o6V8AP9EERIgzNXWepKUt/dJ+FI1xiL7XrKtxTO+dHX/XlNmhwEA8F+VLcrlw4CM
RD8IRaGDSenpZ7Pw8YJ1mpqsnKVGDAQ=
=4Xco
-----END PGP SIGNATURE-----

--8rjPh9wMhciqOQRv--

