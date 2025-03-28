Return-Path: <linux-next+bounces-6068-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A25A7497F
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 12:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE0B67A90E0
	for <lists+linux-next@lfdr.de>; Fri, 28 Mar 2025 11:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A021940A2;
	Fri, 28 Mar 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8Q6i91f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348012CDA5;
	Fri, 28 Mar 2025 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162552; cv=none; b=uOPfd7sagZuHk253Jm+CRfBw3sjqbfMFBMzqCOKsQ6U3JptWOHclhqdT37yORaybdXEoFAESdo0MfgQwcRKJQ5gTmeAPyTVGUnLzZbMPDKDqDU/ryuQZTK3B8IuLGzg3qPZ0Yh7m7TAJ9MgE+UQFoHHOHhDP5xiRzhtumsMY098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162552; c=relaxed/simple;
	bh=0zEkKMKBraCYtb5mtSN+uT7ZBhwEIcNCzdAPtVcplng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0yP4cd8G6GATUlYmM5q7CJoKzrpKnht7taPJWaXjTjH2DeUoh6ZL3KSUgZgYSc4043mhdVkTa8gsTD3yMN0urLip/dK5gVqe/25tGSqcs8PiGT0Hs2kzIA4kQMREsgxi+NqZaGkcaxoNn/uucDsrf6HMP/55H38OgixbRwgXqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8Q6i91f; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so46559495ad.1;
        Fri, 28 Mar 2025 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743162551; x=1743767351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmCEfmKtu69bI3FAW2+d7YTQS71wGEca1RL8cb9p8b4=;
        b=T8Q6i91fpuSH9PjstdfHjmuofjx+obmcY4OYYspdqDZhPYQHTteJcHAIzG3YPr8lxu
         NiraXJk9ECrmPzxABoEpp/a4tm+WXV1KEQv2HM/k5Z7c86CdDUEqiyPKz7SVQORUrraG
         m14oIXy/MKuIB/Z0DQlrH06i2slKB3nEzk+DiinOgbUkaXebNSgMf1lQqTaPdmlFa3sr
         cie3JTUzLVeQ/EuDy+4q7X7SvKTO6tHJAi9fV7yvutSqHoYzGZWxl+9/V5Dc1c8YamuY
         yqeZJw4hbk7cO0WbWdprDhdzrk1jYmiUHoCpUsIfmFrIrlZr2bwYTpoO4+j+XPiGuoLN
         f12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162551; x=1743767351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmCEfmKtu69bI3FAW2+d7YTQS71wGEca1RL8cb9p8b4=;
        b=rBlygtjHosFUseFujWNHrKo13QQ73C4xaM92DxEJKoJ8km771lQywIuWOLTb9sZd27
         WqJpCORRWHYtDX4ta75dGtOk4E12oWhTLhU37+Pm8IgIMsnp1sOmwf2CzdblC7FFSKMo
         ogAGyBRuHdktOCBU8LYqWtmktkxEexew9Wn7xfn8bz/Qb6A3CJh2p2zh5jPFxIiefFqk
         rqpyC5b2mEFDNLZdG7u0K9Gu0J5BaCgs3xhLQpe/gJJbsSvG5d79ajsXDgm88KV0qnVb
         FroE74BIJyC4KKsCBtd5yvAIM8VRVRu5I6ISKA0t7Xhpeh7bpGaxZmId9F0//2igCTFU
         GqRw==
X-Forwarded-Encrypted: i=1; AJvYcCWIOcmIW3LbwwkWvH1LTJgEZx244M0/ysMJsHiUNZSRGnZUEwd/C78aZEQhS0SNq0CMW92j4yleYHUIcg==@vger.kernel.org, AJvYcCWkxRQDuh7DCxwqiSQH1u/125NZaeNs5ulviI0F/eCFIyTUZYZYp1pFrm3jNlcO5KrsyLbqKnmTALye8Ao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlQ0AgOqAvuX8vNBuXUENKoaPJOu7NsUYV5O2XLLWbqhkW0bK
	w1o1mTgaXCwR0YSN7JNwWzxYL8EKLIrgP+ABwEiUzjum1QRIrKlP4W3Bkg==
X-Gm-Gg: ASbGncug+mDr23gti2cbSNXLfdt1f6GNKy79KGhgSHZAOIK12hAO8p64P0KqM3sw+Uo
	iLtsYW6ma9oaQd6RI7UBM6kVIor4ZiyOYpTtcDGBav/97DX9WmZDTEKbEGXVyI1YfiNezISJWvx
	OItphYn6fMD0j1Kf5/XNyWKRybJgkGLct8IraWXpjs22t5bAcnbc1DmME5BifZTjwZ89Cmbkhhg
	4UGEK7Ih0d65ZTI7IbWunIWFW4of3+Vlj5/hVhSkPu5r8ySHLhAaLuI7AKMYEMx2Lxu4yEPMpYK
	sfUgUnvxqErJ9B1CGLm9szBsC/vk6ebZ/5oYpgvb9yMu
X-Google-Smtp-Source: AGHT+IFFQaOmCK0iCTHGrRWzTWyXgcqukYghNfKOZ9vdJoDmptQQcXqn262rau+jeEOIhHNu2IkQaA==
X-Received: by 2002:a17:902:f646:b0:224:f12:3735 with SMTP id d9443c01a7336-228048c8674mr125053825ad.31.1743162550503;
        Fri, 28 Mar 2025 04:49:10 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cfb2asm15676575ad.141.2025.03.28.04.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:49:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F028B420A74C; Fri, 28 Mar 2025 18:49:06 +0700 (WIB)
Date: Fri, 28 Mar 2025 18:49:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommufd tree
Message-ID: <Z-aMsk148w8zgaRQ@archie.me>
References: <20250318213359.5dc56fd1@canb.auug.org.au>
 <20250328175745.7ecfee87@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eiW7nh+I1UK1dOHA"
Content-Disposition: inline
In-Reply-To: <20250328175745.7ecfee87@canb.auug.org.au>


--eiW7nh+I1UK1dOHA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 05:57:45PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> On Tue, 18 Mar 2025 21:33:59 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the iommufd tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > Documentation/userspace-api/iommufd:323: include/uapi/linux/iommufd.h:1=
033: CRITICAL: Unexpected section title or transition.
> >=20
> > -----------------------------------------------------------------------=
-- [docutils]
> > WARNING: kernel-doc 'scripts/kernel-doc -rst -enable-lineno include/uap=
i/linux/iommufd.h' processing failed with: Documentation/userspace-api/iomm=
ufd:323: include/uapi/linux/iommufd.h:1033: (SEVERE/4) Unexpected section t=
itle or transition.
> >=20
> > -----------------------------------------------------------------------=
--
> >=20
> > Introduced by commit
> >=20
> >   50c842dd6cd3 ("iommufd: Add IOMMUFD_OBJ_VEVENTQ and IOMMUFD_CMD_VEVEN=
TQ_ALLOC")
>=20
> Any progress on this?

Should've been fixed by [1].

Thanks.

[1]: https://lore.kernel.org/linux-doc/20250328114654.55840-1-bagasdotme@gm=
ail.com/

--=20
An old man doll... just what I always wanted! - Clara

--eiW7nh+I1UK1dOHA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+aMsgAKCRD2uYlJVVFO
o9YzAQDn1v3TNYpnKgI8UEekDsYLDjef3OrEiJ2fES/KcXCpSgEAqXDhWHOlgqby
6VzlrRXLBT9DsXWNBh79cIwjlpTDWAA=
=6llm
-----END PGP SIGNATURE-----

--eiW7nh+I1UK1dOHA--

