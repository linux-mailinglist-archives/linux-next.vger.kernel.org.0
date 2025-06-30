Return-Path: <linux-next+bounces-7278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 924E0AEE960
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 23:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9BC017AB79
	for <lists+linux-next@lfdr.de>; Mon, 30 Jun 2025 21:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2981236437;
	Mon, 30 Jun 2025 21:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="KDDuBhtW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177C28C2A3
	for <linux-next@vger.kernel.org>; Mon, 30 Jun 2025 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751318107; cv=none; b=gplcOCA+BljEXuygs0o0uKz/tkqvIUKsWOkqZxE/IcP8RzlUIhJSyQDhqv0BurlGFje1HnKr2Jc+06dmowFbvV6n+z+lqTOFGk5xLA+4lRYX//QJJl8dAdIJ5FWDsS1EUQEeIiV0tgMTXJ+GrMQePx3Sd1hrRwD6Qet0nGO0BEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751318107; c=relaxed/simple;
	bh=R/16zujFisC9NdOslvjk65nWTatAJwCxTgv8elrO20o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hW2F6cCTSeY305vZXn1MrsqFc0VwC3RQfjchu3jyaDwvncMfpg925qHSBmQANIE1zluuTh1CMI5afMwySBMLJj8v9dNzQC0IeqYdpm8Bbxp9wwEtif2vZfADG2Bhhyjh6Uvi6aEEdjYFIrh2Fqt8dhMu6ZIBbmOBQ/gI7Fod/Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=KDDuBhtW; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e81d37a7so3559460b3a.1
        for <linux-next@vger.kernel.org>; Mon, 30 Jun 2025 14:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1751318105; x=1751922905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JUEvETXHTlKyXBMoL8O2NrqSNnjuNlXBT6Mz8VcsTmQ=;
        b=KDDuBhtWp9lB3rcXLkSVciLkDafO6Knaz1li4YQ+YqGO0R3aluie7MDyUrIAM+AqQ9
         k894xzvfpKhZpAQIq3EbWXZmjzZ2GCykd2ZfDMUOclTcGra1kVbPlZIsz/eAT9gzwVG9
         LRSNjy90DCB6LauChnfB56NsCxdnaeHFKuyKfZA2mvjvlG49mvZN+ubyicPt8LtelAv9
         qJSzXPr+6Z7c126BeGtKL2xsSyJzFSmNnqT3KjjKdZYCQoFY07yv1V5GjxgWQu4TDwY3
         7+qvgp8QoJQrM/MLWUpBbs9aTxLDZHOAZvzYyiKXdixFaRVKvhs/QFpLiAYQ6IkFjQp6
         bsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751318105; x=1751922905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUEvETXHTlKyXBMoL8O2NrqSNnjuNlXBT6Mz8VcsTmQ=;
        b=w9TisQ0/XOHQY/tVVZw2a++1JL1NW+7/4Zqfmgf5z0PuVTcs2iFGWqnXlOxrzDe7ft
         OlCFePqVSwI+fhbatsz3yuAzvsHqs6y3EuRvTPBr9XzEirYeyhUUjlm2CMFwUX87LLxH
         RIEh/DeFRsWo13HFiM4JiEgRGs47YI2irEqARPp/XJND0JqVvFzJWHfrbLlubctL1JqE
         AjxI8OXLm5WWyEajGkcWxmwgqU2Li7+ERr7xdBoc+ooF4K64eHUI433i8U1kJ2+jWMJu
         Cpp4j+qQHWoB4tQ6L5XPKxG6F/t0Zi0F5kwO6SchKc21bTl4MhamY/NXzqzXsSxAjwkP
         S0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8afi6w0Mk/LkujqiOPsNSOB//csrewYrPyx6epiXfLQM+GcWArvKEKgj+GqovOy4lTl/El0XoF6dT@vger.kernel.org
X-Gm-Message-State: AOJu0YyWbjzKzJKmDQfrNqN0gyCur982yt0dvFtbocrIrko9bz4sKq5W
	IhPukHFTtQexAOYa8lzFeHVd1mpdMr+23ZtmfnOPllqHUb5OcuMSPC6y+wXrOAY8GglKFkzZBiB
	J+3nA
X-Gm-Gg: ASbGncvtx2SnHiDdV01Q14IiI4Tk2nwNYEph8YyrYZHVZWuhzXG66VRkf0L2eclz0Ur
	PdeTkRhkalFxJCBqmSuvz4D6Yv/g5Fev/QEPZu9EjVrUE5BaEZa8FWNXQvhOcwar57zwmPbuxMU
	wjVGpZ5OI1Tg9/2TgjtoJjBQYgBlNIj0Z9UFL3YfQipUD/b3NIDS6DqZn9D6dB+4l8LIZyJmZPB
	OVsbHn0NqD5FOU96fbq/S5ulQIHCccikEhARIuefxQzrE53lwWWm3ZvtNVLzoQ3Gwi6Yy7NThF4
	xozbJeKaGj+smzssUju4EsClBM9BWdOjCj4CkQqXJoOWAGz6ItqXBmSX1NpAphdIGlfwXMHfqQ=
	=
X-Google-Smtp-Source: AGHT+IGL/SZf2y6jdZAAifdYJBwKcWDsEsUve+zOQkExo66Ml61nMbqpN6EBJpdG9Zp/Zyiqdnqxaw==
X-Received: by 2002:a05:6a00:3d11:b0:747:accb:773c with SMTP id d2e1a72fcca58-74af6f08200mr20130964b3a.13.1751318105082;
        Mon, 30 Jun 2025 14:15:05 -0700 (PDT)
Received: from x1 (97-120-252-192.ptld.qwest.net. [97.120.252.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574604sm10227155b3a.86.2025.06.30.14.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:15:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:15:02 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the thead-clk
 tree
Message-ID: <aGL+VmixzZNpfVpC@x1>
References: <20250630072422.4d30412f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hqjDcDDA25rk6M3"
Content-Disposition: inline
In-Reply-To: <20250630072422.4d30412f@canb.auug.org.au>


--2hqjDcDDA25rk6M3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 07:24:22AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   7bb23e0bdb6c ("clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUS=
ED")
>=20
> is missing a Signed-off-by from its committer.
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that and thanks for letting me know. I've now added my
Signed-off-by tag and updated thead-clk-for-next.

Thanks,
Drew

--2hqjDcDDA25rk6M3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaGL+TwAKCRDb7CzD2Six
DBv5AP9P/Mdni+PdO6gznrDG1cEkcSAPsjgWcBMdF4kOgsItaQEA4iMDSqzoJGRo
XofsFui8fMJz2ZNK9k3oZaDUciw/XwQ=
=8bt0
-----END PGP SIGNATURE-----

--2hqjDcDDA25rk6M3--

