Return-Path: <linux-next+bounces-7416-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4206AAFDD84
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 04:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8668E568319
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 02:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0D41865FA;
	Wed,  9 Jul 2025 02:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcCO9AAl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32C1C36;
	Wed,  9 Jul 2025 02:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752028620; cv=none; b=E4xYja8FecDbC7OE4StdANb+EgthvjVL5tqTeFZfXwHpCbpCFpQengV+RI+n7/rHh59LWLMd3Ykm2X0xBmnWJLVsWFePFVU9omn4447EVchhSJ5WblR1l0fmloXtRPBPXJKSJQaLzqz4+Lo4Paklf462VxyfNb/gPyMt+rDUuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752028620; c=relaxed/simple;
	bh=7YJZljkDk48VpGjfw7srEnqzVo+ciJWtnRlO0F8qyqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxPhGzBOhgeWuhy522zrelbmU81lsCpI5O2CK+tKd6TdcNGJQeZG7DJ9cFE67D8LTe4R0mK7K32DtyVqbCyQHGgStxMB5DFkhU+rC5R59FGGUwBvFl2MWQBpmOgWf19DGTH5zxVrv2tsJgoQQANuYsXoZpfSKkxaT1tK7h89kTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcCO9AAl; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4528264a12.3;
        Tue, 08 Jul 2025 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752028619; x=1752633419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQy46u3MyUevid/JqcuEb31XzqKEb+o9x+MJnYqqpKg=;
        b=VcCO9AAl4lUbGH9IjhBlpu3bZygvCRKq6vQgh7heTnnKoq+tkSs80ydASpBYpHkr2o
         LyKDLxczOIaIj6ywvcaNISe4OOCacVGOWpqhci/S8u6Tv/gG/WaXXgXhmrlh3O2o68Q1
         t/dhhDTYK8323NU0LY4NExYKTY9T9+o70ImGhjNP5GISKrs9c6mjTVkYXDNxB68wIkwj
         agY3Hw9e/QDegrRnUFkYQ8GAcmZycUASGFrQBgIZS6nuOfRv4vIZcQm0GTtRc7mYsEVd
         CZAx3/1aYpZG68/5Jv06i5VUj1pRECpJdt1pxpxr6jzr11849dBMNj4Lnr/dX9pSQbNL
         07kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752028619; x=1752633419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQy46u3MyUevid/JqcuEb31XzqKEb+o9x+MJnYqqpKg=;
        b=CpfP/5bHM7L1dwefp/lGh0CWzYQl8e6//dF/dA/I5lk75aNDf72QP7mHfsxmGngoyE
         cSTJlsYEWP7dcxSk3ZibdsDeJsbBqOZQAeJAF8jsZ7SlCTUCR6TMSOW1nZsAYbtVFYfw
         7MPGYaT5dkBfF75vI/i7MIzfe5y/z6/+wTiRq4NvtglqcqLjW/FEm/FJlrDONAVkAcMz
         wYsRW4ef57bzGes2Z4OpjugIMCPtTKT//yMgwCwPqap3gneyOC2KGPKvlbTRYbIhatR7
         C7aVlXFSxrbBFg54Tmk2EK1pDFQVIzI7hvwURbNjYyapR2wREPdl/bOpBQoRqXNwgvie
         xbNA==
X-Forwarded-Encrypted: i=1; AJvYcCUpGUeCaBgdny+XvU2uyk25rWnmZdmRGHBkPTiO7fuSX2PUmFhz4F7VmiTkccgtRBE8yR97NLEtrdKamNE=@vger.kernel.org, AJvYcCVca+G9EC+dlmxRrB2zGKPc3aqDdlgXAhcCuF/Hal18V0FapWiTvIjpse0BCHKLvqy6uwyq+XEJ+dwTLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwosicLKHpeIPY78aExXWtpfdd7UhmSksHZsZDCMZxNrKqXvwZk
	k/JcIfSfXcVP9TA4VCkdHqV3wjOMARNT8S3/ZsHpGVHB4V/bSJQARWOxPonRWg==
X-Gm-Gg: ASbGnctcjdzX1rvy0OxeTH3xQj7f5YyhJMfESPq8BpX2e6hjDcKh/Yffof6c9saCJoU
	lOs6Tcrn/kwWFthsuR6RIQBw+AMEWX989w0Kh4s90RTdQ1/vA8HgBkduU8JpmFR1B+PJgM7W5Ox
	ipaMIK6cmyeBDN6oGeZblApSx8EoI1JRwT8OO1xp7riCysoHysD3f92HGG5OzjJWn8VEvvyKRvD
	NA+sk7QERI0hU/FUmf0BVfdj8C+raBnIFTc9oHNsfSWBVqVKm0pFFtiMDjjiBXY6w1HTMIVCmku
	c5Uh8LhwCJ5rKKvsKOhG797TPp142HGNOaC0K1kciDKI9Ecs4m0/umwafVpRUw==
X-Google-Smtp-Source: AGHT+IFu611+OS2OJWmiueYge4xL9xXDv/cgxhH3RKbqIXjWA2QveArwFAqLTIWh0x/PHAU9cF8RVA==
X-Received: by 2002:a17:90b:4d0d:b0:313:fab4:1df6 with SMTP id 98e67ed59e1d1-31c2fdfe552mr1088851a91.32.1752028618581;
        Tue, 08 Jul 2025 19:36:58 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c30068d50sm536038a91.15.2025.07.08.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:36:57 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DD0D1410194B; Wed, 09 Jul 2025 09:36:54 +0700 (WIB)
Date: Wed, 9 Jul 2025 09:36:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task
 information"
Message-ID: <aG3Vxt8tc0HYRNbe@archie.me>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="haaEsPDVn1u79Kw7"
Content-Disposition: inline
In-Reply-To: <20250704190724.1159416-1-andrealmeid@igalia.com>


--haaEsPDVn1u79Kw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 04:07:22PM -0300, Andr=C3=A9 Almeida wrote:
>  Task information
> ----------------
> +----------------
> =20

LGTM, thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--haaEsPDVn1u79Kw7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaG3VwgAKCRD2uYlJVVFO
o1MLAP9FVqHMlgBgrBCNQWQ5Wy/3bHSvsDX+VYwBBA8Dn1HcXAEAupzs6l34AlqP
JH4vmBESL3jhhoqwa48adXKPCQna3wg=
=jpJw
-----END PGP SIGNATURE-----

--haaEsPDVn1u79Kw7--

