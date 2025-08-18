Return-Path: <linux-next+bounces-7974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC67B29936
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 07:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DA521887551
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 05:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E53B2701BB;
	Mon, 18 Aug 2025 05:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EV8v6fgY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51D826D4ED;
	Mon, 18 Aug 2025 05:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496571; cv=none; b=hz97oSyASjjMKm7H1UWTopCowJqlHSWl61ukqhdwZyQO++8fQi9RVJq7TFfIhaI48QJCc+FL5B6rQVS+hDECtgen8TcKDkJfh1/q4nZ/2D8P+VnyfXmak0bprwnY4F5jt0R6s80xosG6+Ajbkw/s23wSSCt8KJuSjgGKxYGJ7uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496571; c=relaxed/simple;
	bh=gARdHJbs8b0x8u8t5QDtFMcbkXmNw7kgUbr/Vzt2dUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hh0W7hyFRGLd1hE0Bv3nBuhmadIhE5nmJqWBxtDiu/kGBFxpqDhD2oATHOKsgX0Yi9eThSXs2+TqLDfyKTxCEs152LDCJXTdCsy/0Z/0F6DrM4CLFdm+6X3P8AzubSyueax1WSL7nsNUvphiPkOJsPw6bvUwBDKl8cgkVmtLSAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EV8v6fgY; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-244582738b5so28649615ad.3;
        Sun, 17 Aug 2025 22:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755496569; x=1756101369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDnEbrSfurZQ+Y1DvjkMBGJWcaizeGgNKLPFyaBX9ww=;
        b=EV8v6fgYUGvKHYdurvhd1GFv+MZlIAFfnpXdIuDLhc2BcJzDVruachpMV0y50I7u+h
         xV7q8ZWjCF6/dV2FBSxhZDp75jorhisJTqrvnpbb6k/N8ncqs62kbitzfyQiVWZho2/I
         qmbN8akTOzEfUmgFAenqy+HHzemwzxJbGz/Y/Xftw1FebYld4wTFox9d5zoh2uL8IM12
         R/xFEcjODE30xMWUtLq7qlC2sDUVB76uBk8oVEBksizZ7eZRUvAUHGG0yYx8n9h2Xn8y
         J4BK0O+EanVOkv4/rfZGx6MEE/fQFiGzdnOwWAq+PXFA3BKnd0yvKo/J4lG4D8LkH/Xx
         lDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755496569; x=1756101369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDnEbrSfurZQ+Y1DvjkMBGJWcaizeGgNKLPFyaBX9ww=;
        b=oW3lpbbOofYPdSA8zvMkmSzSJdREaTEDqff+MA/XnBIzh825xSJ31cqNw/XUR5IbxG
         2wcsau06cjEulLO/kMRqdoPZ3SoDqQmPbswg8ep4EtQ8bQvur/ZTzzX10VMwgEQsww21
         OLBkZEZ9gpv5dkGUjAUpdkYZ91/Mccwvbw1KFQaZ5r0n1mb7prkaP4GtvRg9nTaIap4r
         JHoHLH55HanZvHoT60jkzjHFCkawk3bw7zfZcipyOPnKMIbo/KiMRTvMqAdO3TPTxgWe
         6pYuFn0lOZk4mBSE7NOBMFfscLITRmwgYdurheXzHsy34iattdTrNoEVxSbHG835XZVx
         wHRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL8hzWTs5ol8UvvdQBar8bTaDkR3PP4eM5V35NXa9ok8EleyOmHDpKg7yzr7f8tbjYa+MwWrzyNbjqbQ==@vger.kernel.org, AJvYcCVqyxBvt41FxurpMaFqyXtdo+Fe1YbrEhTSF9lnZeOYEMp2kDLIWIVKFIp0eX9fL8iunebyUs6cB9+t9AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmkJ69ET/Yt2PnmCVr6F9gNGnv/BciHb9JdjS5a/CadgcxM+q
	bpjqfQfdww87tBl21kpwSym3WYO64uEH0HqR5wBrbBqpJ236pBpovQES
X-Gm-Gg: ASbGncs3HZiK5xDlIre4zpdJPFFaaQC+0r4Aq5bV80bQj7na8vSUuG5ux9opMhwSLFg
	I8hyD8gE2mZOFj8lYQWrouOfNYFHvs+1DnW4Z5xQ/cZAO6Xy0bQZm072cYLZpRIt+SBwmzTNrmo
	Ft7UgeyBua3aarPCcqOSbhobucv6SDcEW1YMIeMn+MLwB4w2GA87XOZGHyiIS879Bz4D4QgtVnU
	U73hEXgSdNuqejcWsAa0D9Zl74lE9BW728hzHlzJQFLlR/ncvN4vLLlYXJIHH5Jg+C27VYHIfJS
	lhMPxHUUKI+DYIXNzXLsgdpoHOB2h15iwRL2VpOu8RBAPv2XqK32vbxdlhDWzqiQSlL4RO9js/W
	yk/ZmmUqUlbhB3ZRdErqbGw==
X-Google-Smtp-Source: AGHT+IGrZb2yXUpDByWXrf0RogRL3wdxGrw6LQsIafOIhXImWcKlQrD4Hqci3k0Rb6xnexOYz1c78g==
X-Received: by 2002:a17:903:3c6f:b0:23f:df56:c74c with SMTP id d9443c01a7336-2446d715b0bmr129857355ad.14.1755496568819;
        Sun, 17 Aug 2025 22:56:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm69189155ad.157.2025.08.17.22.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 22:56:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 14B60459631D; Mon, 18 Aug 2025 12:56:03 +0700 (WIB)
Date: Mon, 18 Aug 2025 12:56:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Javier Garcia <rampxxxx@gmail.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc-fixes tree
Message-ID: <aKLAc27XGAadB8n5@archie.me>
References: <20250818123853.51aa3bc4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ys5Z0BDSBVttoXV4"
Content-Disposition: inline
In-Reply-To: <20250818123853.51aa3bc4@canb.auug.org.au>


--Ys5Z0BDSBVttoXV4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 12:38:53PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2446: ERROR: Un=
expected indentation. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2448: WARNING: =
Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2453: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2457: ERROR: Un=
expected indentation. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/gpu/drm-mm:506: drivers/gpu/drm/drm_gpuvm.c:2460: WARNING: =
Definition list ends without a blank line; unexpected unindent. [docutils]
>=20
> Introduced by commit
>=20
>   6cc44e9618f0 ("drm: Add directive to format code in comment")
>=20
> interacting with commit
>=20
>   bb324f85f722 ("drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected us=
age in literal code block")

Duh! drm_gpuvm.c gets tangled...

Danilo, can you please drop my commit (and kept Javier's one)?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Ys5Z0BDSBVttoXV4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKLAbgAKCRD2uYlJVVFO
owDKAQCoKfhqaU9MYn5NO39SYn5JIOoZm6yD0EQIjQ8QNH3+YgD9GtPzY2zmWOwU
dNDspoFrAULfH+otQwwYcVaT6w0F8Q8=
=+vhx
-----END PGP SIGNATURE-----

--Ys5Z0BDSBVttoXV4--

