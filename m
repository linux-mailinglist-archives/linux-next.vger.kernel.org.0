Return-Path: <linux-next+bounces-5497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD7A3B29F
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 08:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C39223AFB0A
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 07:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE5A1C1F22;
	Wed, 19 Feb 2025 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQXw9Zj8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E91BD017;
	Wed, 19 Feb 2025 07:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950722; cv=none; b=ovonLibIi7wRYjCGRDWCMpd2gse4FTnFXVM0Zq69kWKlBPgY3b7esf1Bc78ycBoIhMGzKMitq3k+Jm1zWvqYdXwS+WeJUBZrvMTyRzAspcUg6uz61pR2gzrqSJFHEks1zJX+A6HY2H2V12kONCGiiU01qwUKdIS2fNdzQoiTEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950722; c=relaxed/simple;
	bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2vCugwAQk9xSK/ox0mPKAU6k6U5mkN+Twwo2P/r30vGK4v7AnTbW6YzR/YGGzoUwJ8LUXPDAFkYe3N/kJuUoQTSyvs2nDFAyMTubH8TDu9YqnVBElRDiNH+j+p5OmQLAIp49qfflwWffDMaut+3orNievCLCIzyHh+tp2wfw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQXw9Zj8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220ecbdb4c2so132396855ad.3;
        Tue, 18 Feb 2025 23:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739950721; x=1740555521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
        b=bQXw9Zj82mqjhFnBidjc87/5wIwYQXhY9tOzYu36JRo8K9PCdhqw+bXGYUAe4qmoQn
         uHviieB2U4c5U2PXG4fi4D2mSAeRiJoRYwKjI4PvzQZbmppL/kquv3xfHIN1J2bO22CB
         yNzxzVT5QWZYCeRvEvYagmPGERDYW/FNTTK75cwsFKxi2Q1yTwckC+db1EBPTlgcNRdT
         OfPF96R/CanxOwA6dmuXc+3PfrQD7MG4U6xOb4y2wLXfGsW8MZ95mp+q2tbE0OERhfLW
         1t6ga9se9rw0MCj7OgvR6Ch5r3UrAtn04Ow118uZ0WtDWUowJ78H3cdltirU2XYg+pkJ
         Vfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739950721; x=1740555521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/Djs9NrnZFyY7N9MaDIjuxsEsWYadjuwBoMmF+C/+E=;
        b=E75IEYKc5ycWpXyq5OJ4LV2erPoixdPOFwLemMmaiCy78jxC5UluB7gjKzws8cCn7A
         I+MuKtWXVCcol6Ml9Y9rI0livk8PEpyMXMUc5Im5x4G3nuwCvCcJAcyjo5Bn1oLUjFX1
         gXF0UbAQClPwU6yU3FAapdDX4ntEdkRXyu+0v15Td2aPf6QhbB/JeDRl6w10L3rCsRs+
         1zrF5Y2jztU4sCwxqZ+8xiuVrdMyNagWOL3NLkEoUGCbQZbA5gv/x07vHiRe0aEdMLb0
         uxy4J+mS0J53DGFeknMK7g5Nf+VyiY1ZmT+ELUfS1d8XLktqdI9l1sm8qfauV6TM8EUw
         64tg==
X-Forwarded-Encrypted: i=1; AJvYcCUmHHkg5LrlNpRUKqL+SwFNUMJxO8cZaPZwSgxsSWHlIgo+CrtOdgFsAIx5/MJiZ2EB7V7s4nBNDxU=@vger.kernel.org, AJvYcCVK63jRiCLt5jI8chZnLfiOrwpPNtkimzVIfJ0Xnz6EKho2SwaUl6qY1benoi4uAHJzdr/TwRQJb/+yKjUu@vger.kernel.org, AJvYcCVLb35D6pi7AFw+Eh55MiRctqEihbGRPr8EuKN1UhjYFXWdA3NNMpy62+cgiYzY9hLVl3Pi77AujXhd2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZRTyTihpDF8eCimtJrgIQUPYIs1mTVgeqF+bQ3DY5j2N6MUl
	2472cT9M9VFJ3q0Ug9XwDQSKWX7nMCzYvWjVfJHA3uZnbRhT96hlWUCP1w==
X-Gm-Gg: ASbGncsSN3gyoT5YTgXdOJMuP9KsmahIPZsPaysKeeJ8+jAz1JaMTx6JXId4R1Dn1bi
	EuD1J1cfad2V3A8h1aa7J2L2BCTjuBUp4FlBzEigu9fR8hRkdEyalmRjnrlM65U0U1EPlu5u08k
	VE2of6+hVKpb8KXe5mOxGP2Y5HPPEP1L3+rrzuaiOzh0TQ6aj731wqhTmXd+f2u8Wk4r5BxMhjX
	dtzNxI0rp1tzfx1d8Eyq1qrYPiLLf7hZyoFGcD46f2nGFnXP1OIQZ/Y/9z2G1whGCe5upCRKw3G
	K0Eug1nWh05Cgqo=
X-Google-Smtp-Source: AGHT+IEtnJVIN9VtJexIl05tl/mliZYyCnnzp6h8ajkOHvbvDh2lrvbG6zVZXn9JBV/VSoV5bJeUeQ==
X-Received: by 2002:a17:903:8c8:b0:220:fe5d:f194 with SMTP id d9443c01a7336-221040ced94mr211767065ad.52.1739950720334;
        Tue, 18 Feb 2025 23:38:40 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d468sm98155505ad.167.2025.02.18.23.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:38:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1BA5B4208F47; Wed, 19 Feb 2025 14:38:34 +0700 (WIB)
Date: Wed, 19 Feb 2025 14:38:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	mchehab+huawei@kernel.org, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl: Fix cross-reference in documentation and add
 deprecation warning
Message-ID: <Z7WKeru0VjEEsBXu@archie.me>
References: <20250219064807.175107-1-ajd@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kmv7amjBQtNnovnm"
Content-Disposition: inline
In-Reply-To: <20250219064807.175107-1-ajd@linux.ibm.com>


--kmv7amjBQtNnovnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 05:48:07PM +1100, Andrew Donnellan wrote:
> commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
> deprecated and moved the ABI documentation to the obsolete/ subdirectory,
> but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
> media: Allow creating cross-references for RC ABI") was merged.
>=20
> Fix the cross-reference, and also add a deprecation warning.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--kmv7amjBQtNnovnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7WKcwAKCRD2uYlJVVFO
o0jMAQD1Vx3v8OEwLm/orghsOT4E7eZHtXNBKDhk/IYj/kVqKgD/e27EzMa4n+YV
4zN0IkxY6Adkg/1+JQpYLwXUa/k7EQA=
=1Bns
-----END PGP SIGNATURE-----

--kmv7amjBQtNnovnm--

