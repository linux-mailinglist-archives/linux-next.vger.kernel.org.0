Return-Path: <linux-next+bounces-6457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A9CAA466E
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 11:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0441E1BC0FC5
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 09:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D939F218584;
	Wed, 30 Apr 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvuWXgU+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CE7158DAC
	for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004092; cv=none; b=H7E/5+2Adm4x5PA/BOlF/+fPp/5BtXvbVc6lHQd2EHWtgc1q142racRttLumC1G1wsaNlLDJ5nrw8NJ7cXEufVI4k7mPzVQ8BusunILCh63zZaQzM3sdgtXdtA9jLVMvj0Ai3l678pnUweEfblZOY2c0hPSQ0cFRo1TXy6KfYtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004092; c=relaxed/simple;
	bh=ZTiKbaSMf8anCR8rGN6vJZzC5O77MozU0CITgBq89Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBwLF+wMi9NPBG5B46ECD6/JKd7UwDZ4H12REH7QS+IR9ud++NVyUTUqFplCnFOOrIKEu/5nVTmUx6M2vcmQrdkbsFNnahiygmpCjFGqGi2D8k2M38GES/ta7j3FQoN5y9OaPVSeyIzsMwRveltHXbet8sNbFrjUAfvANxpT3f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvuWXgU+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22da3b26532so60141555ad.0
        for <linux-next@vger.kernel.org>; Wed, 30 Apr 2025 02:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746004089; x=1746608889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGk49vERce9Ao/sNmnIwPGXqhBWoOxQGOUY1KUCkyrw=;
        b=jvuWXgU+NGOzgQQLDEBaeGxGHDSD0OLGTUdgyBPk9K1e5W1OVGG9I17A0PZjhmCX9v
         KqMX6piD+FgWjsHbqydaZUq3QkZUbfOsYXfpM763Ypg8t/fqXD0MVIEo8CtPqE3sqPQc
         ZIWs7lH0X8bwRYUOZkLHmo8wi3k37vHJSXH5k3u+ZUyBYIiWyRfHHojtBSp790UJLnqW
         Id/Hk5cZa6xZtr8WLJeyNCLrpBV6VVmvfF4tdFxHWUMId3LQP5Csp1wcikOJ+rfszAXo
         XY8d9Z6xF7PO730FawHCTTU3uEnF1CBfO4LwfJKoXSSmLFrH3kL9Zhso8UhlCmxbmgyW
         3o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004089; x=1746608889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGk49vERce9Ao/sNmnIwPGXqhBWoOxQGOUY1KUCkyrw=;
        b=pHuXoj38oM0iHEKeFuVWslT4cur8u6fa373XiXugljAI+p1mYiEhVsb/9IAwEwlce2
         PYZOIp4PG+WD3owVmNGwOM6mVLk0035MFCd5AgvVJ+LeyXW4C+5yhb5V+4izXZE3C+lU
         Rp8BIAUsFRZlHrcAB06zJ6AoRLgXOhiIHCMqvqq0BPb7+qNGanSnnSBLY5M2VUZhUjUr
         /43fbiqiqtRcy1T3uBNasdsZ7493Z8FMFHtF82M5RijZcSw2q9b+uaQT1YsHtnC+rt41
         Pjl96rW9iqqiJCcA6l5ayzJf6IG5NuKJtEPwofdkGADRkpP8FvxL9G4FiG5Yf0lgvfYY
         5mpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjnCwZpp32la+tJbhlN3RN/vJECBk98FWxIvDLpQqBwND33yiuZXbGGgLtEh/JJJV69UV8B0NG1r+u@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkMout+wyYJ1PrGem/Tw+t9eJx9e8gBQquvF2NrmEp/C7e3rs
	3XVjNwr5nIg4uSlUa7mqa6msghYqBni3ZisBdL8+oasllPLTrQjE3wJ8JQ==
X-Gm-Gg: ASbGncs6+O6LE33WfN81M9+ubFtSY41BcBLouEVaMic5qEtpaJo1mEXpRtHX5O9MHQk
	V4/+S1XKtGFVJVh5kWx1bTqttcNIojFfh2jebuIKP8nuDUqASEunFiSlm/9N68f7uZd4a5V3aXp
	NKaLOedZL8I4HRDDCo7pe80suxUgJbBqvEc0bG1R9k/WEx68DEnOTyTFG2kWdbvAT+2NIMFZlse
	9wxfK494iKZy1LdTC7rR6wroPCZhcSIHpEBNJG3VXumkBX8rqi20D4y+XbBzEZGt1Y5lGViV2N9
	2nEGQf3rL6KY0LEDuelqs2okexiN1BRm36TWsPcu
X-Google-Smtp-Source: AGHT+IGNdId1ZgH8N9ypLITt6W5dX5KSuwIUHGHLCKO4dd9hafaceBcm+alDaSMKQP3rtTIjMT4g6w==
X-Received: by 2002:a17:902:ce91:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-22df34aa1fbmr36008895ad.9.1746004089231;
        Wed, 30 Apr 2025 02:08:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102e13sm116931085ad.201.2025.04.30.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:08:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8F47B4208F70; Wed, 30 Apr 2025 16:08:05 +0700 (WIB)
Date: Wed, 30 Apr 2025 16:08:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
	linux-next@vger.kernel.org, hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
Message-ID: <aBHodTu4IjqzZeXb@archie.me>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IyftOE3+/ex4fxHI"
Content-Disposition: inline
In-Reply-To: <20250430022847.1118093-1-haren@linux.ibm.com>


--IyftOE3+/ex4fxHI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 07:28:47PM -0700, Haren Myneni wrote:
> Fix the description format for the following build warnings:
>=20
> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> ERROR: Malformed table. Text in column margin in table line 301.
>=20
> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> powerpc/pseries indices API
>                             <mailto:linuxppc-dev>
> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> powerpc/pseries Platform Dump API
>                             <mailto:linuxppc-dev>
> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> powerpc/pseries Physical Attestation API
>                             <mailto:linuxppc-dev>"
>=20

Hi,

FYI, I've also submitted the fix earlier at [1] (but different approach).
ppc maintainers, would you like taking this patch instead or mine?

[1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme=
@gmail.com/

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for p=
apr-indices ioctls")
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character d=
river for dump retrieval")
> Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-att=
estation RTAS")
> Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.a=
uug.org.au/
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index 017a23aeadc3..fee5c4731501 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -366,11 +366,11 @@ Code  Seq#    Include File                         =
                  Comments
>                                                                       <ma=
ilto:linuxppc-dev>
>  0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            pow=
erpc/pseries system parameter API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             pow=
erpc/pseries indices API
> +0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            pow=
erpc/pseries indices API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       pow=
erpc/pseries Platform Dump API
> +0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      pow=
erpc/pseries Platform Dump API
>                                                                       <ma=
ilto:linuxppc-dev>
> -0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  pow=
erpc/pseries Physical Attestation API
> +0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    pow=
erpc/pseries Physical Attestation API
>                                                                       <ma=
ilto:linuxppc-dev>
>  0xB3  00     linux/mmc/ioctl.h
>  0xB4  00-0F  linux/gpio.h                                            <ma=
ilto:linux-gpio@vger.kernel.org>

In any case,

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IyftOE3+/ex4fxHI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBHobgAKCRD2uYlJVVFO
o9WtAQDoPqj9Ii+tUdaxb4jYF5hN6yZ+QHVuccrGg0VCgwEwpAD/erW3LCkPQzuB
+WtWvCiOKZZIKZbGiIFyERE+4TOJCwU=
=9R4X
-----END PGP SIGNATURE-----

--IyftOE3+/ex4fxHI--

