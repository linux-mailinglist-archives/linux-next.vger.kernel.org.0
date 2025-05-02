Return-Path: <linux-next+bounces-6500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 724CAAA6BCA
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 09:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 359841BA4773
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9512676E1;
	Fri,  2 May 2025 07:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/SrQc5g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A601CBA02
	for <linux-next@vger.kernel.org>; Fri,  2 May 2025 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171485; cv=none; b=bB9gV6opkwCB9hJcqJqlfbiql9dsRD71ws3mjY8oxZpgJteWWm0/KILb3E+s6FpMCl06SkNrqhmsS+MTu50i7wJTWJQJ7/NCv2RTO36aYaQCtfCcS8K5KKijJCHsjRCXR8e6owOas4li6UrUKoB+N+srW5yk2+lAeUKPIkAOSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171485; c=relaxed/simple;
	bh=MLgar4accZ+UU4r7pZwt5ME29rYPcncQM6t8IfTDlH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L09FaYIOH/ENfZE6R//t+6NT+NLIiRHowZc6B3yMqT5211/RUn/KXgtq/jjXpTumC0/HnhJPCcB8ukV9ZLptNuDTumzDZRnI2ur+P7g3abxYyzPEVvuJlureVULa9Shg4G7b6iyXcAvQ80nqb3B8X+o4CgvXcGdgzKpSd1huVm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/SrQc5g; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so1811013b3a.1
        for <linux-next@vger.kernel.org>; Fri, 02 May 2025 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171484; x=1746776284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIUUdyhk+vjr1/jIeHCt06X37I+JMP5uKdTdJjA4jRY=;
        b=E/SrQc5gojQLzlcuV1vZ4RfeLIzZUz4nQYSfrHwnoSxI7HAJXOl1yakG8mxAFTKQkT
         Z0PkGe1X1IdJKhWiBR0E8U6MbZxXJpwVJUNa5FWnQtZfMKyjbEGFl7ICikAaAfdgohMA
         Ix21ttD4h0yypde2twjRtfU8giipKT29SPJeVywFSEMhNoMv/l96BmT9a8Tto8CGMBGu
         +hGi6nTl6wJiU5TVe2x6eXz5LEibxj/k+LF1uyB9Wt/67n+9ZNdCKyredqO2Xb8VjEXV
         l5LQ4eVuD9QmzZr4b6vqUiODhT5DOCjLaHCJhLoGBct8az7EVh8ceZupDzSgcDluFY9o
         300Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171484; x=1746776284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIUUdyhk+vjr1/jIeHCt06X37I+JMP5uKdTdJjA4jRY=;
        b=dlS59rPvNZb+LomRYIJb5oV1EyBYC81D/WQqTgfKYFw88+QyE5xYiUnnIcxEmVY4KD
         T19nOniszQc88cHjMbd17F2s0AL9h5GeoJUPh+CHnGK8YIErBxVxc5Uqdq9Y+2sC6be9
         vPb4YC036RUk1/LxBRPbFHNn9gcGxHLrVD7RG0G4EHSvWXKoMu9CYtj8cNrlaMtucdQp
         BYRfbpu2gqrGEnbwvJr3z/4uxRtRcPfWhq4OB+9jILoKvG1URr/Qd4KS1nWdzVEeK4z6
         Y7hjtyywVBm8EuDBL7m7Fg9waI9dKYgLHMMemUbGPtKM1EkmLOQk+NlpRiDkCxYHC5P+
         qkHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmzFEqrHLf7U4qH1ylILjTKkguTSXXM5185ZQwYTOVQLiZ3MMTMgs3TQuNwQZ5ssUiPSd9dEX/2a6q@vger.kernel.org
X-Gm-Message-State: AOJu0YwLC36aP3oawD7jZJxvbu+Q4pGvb8rSl7NQNZ6oi0S7si8AJ3xg
	TMcqmbdSLseWKF7SYdMkU4sRiYI38LZDJ33Wl2QSdSHFjtimf7ZJuBDzpA==
X-Gm-Gg: ASbGncs9ncdcG3xydcLkhQKlYvZv7VNiZ7N9tvwm3X0b1CT6fnYbDD+K7imwU8GJPbB
	Ln51I+e9o7ujhjw4HNho4/Ic0eCHDAwdZ6zZhk/Sse5Xt18CpRIhixb6E+Xke/1XWz/N2wQsNJZ
	hOWhSZNZPdScUB2hCFG1+cQNZexAiSCrDy6CecxNRaeVJ+m+I5neA1IeZJ1VHoQrpzGMd2xd/4F
	zWwc/6v6bDHADVtV8yds5DGnPNUAEXkg7E6iRU4u7fEWXmyEFi9Ic7K9fOGfJcXa9INtqLZvZ/m
	eHG6c+BLXaK6axXEKQ9i1yBdMB+iBzxX80TUKFa0
X-Google-Smtp-Source: AGHT+IEkx5U45M+fmLoDrTtgXvtx/OHL0KLCFdrVje198BJ8SaCMdXadAKJcV3ecPgmXQZf/gd2R9w==
X-Received: by 2002:a05:6a21:33a9:b0:1f5:8678:183d with SMTP id adf61e73a8af0-20cde9525b7mr2724388637.14.1746171483583;
        Fri, 02 May 2025 00:38:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbcd0sm922663b3a.63.2025.05.02.00.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:38:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6C66D420A6AB; Fri, 02 May 2025 14:38:00 +0700 (WIB)
Date: Fri, 2 May 2025 14:38:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: sfr@canb.auug.org.au, tyreld@linux.ibm.com, linux-next@vger.kernel.org,
	hbabu@us.ibm.com
Subject: Re: [PATCH] Documentation: Fix description format for powerpc RTAS
 ioctls
Message-ID: <aBR2WF9VylGPSNlj@archie.me>
References: <20250430022847.1118093-1-haren@linux.ibm.com>
 <aBHodTu4IjqzZeXb@archie.me>
 <5a23e0d7-f32a-4097-b3cc-dcccb7355778@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uhdSpaHqEo3xkb6N"
Content-Disposition: inline
In-Reply-To: <5a23e0d7-f32a-4097-b3cc-dcccb7355778@linux.ibm.com>


--uhdSpaHqEo3xkb6N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 09:42:37AM +0530, Madhavan Srinivasan wrote:
>=20
>=20
> On 4/30/25 2:38 PM, Bagas Sanjaya wrote:
> > On Tue, Apr 29, 2025 at 07:28:47PM -0700, Haren Myneni wrote:
> >> Fix the description format for the following build warnings:
> >>
> >> "Documentation/userspace-api/ioctl/ioctl-number.rst:369:
> >> ERROR: Malformed table. Text in column margin in table line 301.
> >>
> >> 0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h
> >> powerpc/pseries indices API
> >>                             <mailto:linuxppc-dev>
> >> 0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h
> >> powerpc/pseries Platform Dump API
> >>                             <mailto:linuxppc-dev>
> >> 0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h
> >> powerpc/pseries Physical Attestation API
> >>                             <mailto:linuxppc-dev>"
> >>
> >=20
> > Hi,
> >=20
> > FYI, I've also submitted the fix earlier at [1] (but different approach=
).
> > ppc maintainers, would you like taking this patch instead or mine?
>=20
> Looked your patch (thanks for the link) and it is more of generic clean u=
p.=20
> I would prefer to take Haren patch now since it fixes the specific failure
> case. But would encourage you to send it as generic cleanup patch.

Do you mean submitting the cleanup patch (essentially the same
resulting table as my patch would) on top of Haren's patch?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--uhdSpaHqEo3xkb6N
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBR2WAAKCRD2uYlJVVFO
o5EeAQDgZMzLaVa90fJIFN5X/wUO/RR6qiHLHkJlzXscE0f+QwEApjJtouQHYJtQ
OY+IXAvOY7ZcKJQoR0c76S9eTZFnUgw=
=J55u
-----END PGP SIGNATURE-----

--uhdSpaHqEo3xkb6N--

