Return-Path: <linux-next+bounces-5351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4051A238EF
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 03:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F9741887E34
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2025 02:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D2D42AA1;
	Fri, 31 Jan 2025 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="aoxgFPAp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F89F24B34
	for <linux-next@vger.kernel.org>; Fri, 31 Jan 2025 02:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738289917; cv=none; b=PlJIdrfB7VU8HgRiD15by0heyDmGWQyCbBq+24kzkl65nz4gN86+lrrkrCELNuQpJRBS1Wmb/Uajx3s+EOWnpv0zLKLMwygu459xYYxrnsIHSiSHC20duaX0W64f413EUvpnCv+Qk10aGPP+NABeSSYU/Ztq7MjRBbYi/ZV6yM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738289917; c=relaxed/simple;
	bh=XnOLiOAPqFuyycqvz0k4TD5hyRbsM2c7tVD098a3M10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szf4MKup7cu1mrZjCfmzPPQ+KXOrNXJoyqOALAUnoe0CKcWK/vZZGOIt2O+wfy6OXNvtX2zr1rpC+xI1wJ/LwqKKB+KE57mvATpigg+0y5cv5gWKYxfiLyYetHEWxXvzkTHQs+E1KYmYtqcRBi6KWBaHRFmpfXmiH1rNOKsGR/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=aoxgFPAp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2156e078563so21533735ad.2
        for <linux-next@vger.kernel.org>; Thu, 30 Jan 2025 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1738289915; x=1738894715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeapXKg7pGSTYAjdi+WZBYgB1YuW7HbwD8RdeOPOKSo=;
        b=aoxgFPApjIUkJDVGJmWi9D2//YdUzhSDvo5Q472ddXC0hTboY8fQmgZGlPZ3gwJFS2
         yrDH25ZEdG7z+iUZiHKmiMosEvhzpGvlfoHrv2s+Jbdu+rCxszhOm7XK0QkZ0nMeCT8h
         HGS7jjrW6hnEf++/vgBXExl8X1P+pdyd6IKVlQxQy5A1s3CewmhC9Bk6mMhcFIUwuxQW
         PaWPgxY+2TF0TuHGa9Rf9GfcFmH5iUj7+hPIWXpNCVAOSCHUIGgd1DIPpPZvlbw4y+/U
         JVIzWE1c+SQDS6INbrKRyGfQEiQ2atL6ubxByHnwsX83B5x0vAYkIRRnwJKc1PckX2Ln
         wFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738289915; x=1738894715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeapXKg7pGSTYAjdi+WZBYgB1YuW7HbwD8RdeOPOKSo=;
        b=FZ0VbjCJOJuG2syvseFU9caDNI8G8VjCJGtt8MT42wtFcc9tiI6RP/fI8yhMpUnlth
         K+ymigy0JqXyA2p0/+jhrasfxm/8DlZb/JQ5peUJwIjiKboG7cDLQ5ejSyc6dxMUBQxd
         3ymePJkQLesSYiDJ97kH9B4Ch9hYUeXDCvlG3WIpnrHSJsQLJjATdjFVjCChVMwrzIbD
         5KyZAXBwM4XW0yD+PTvvD/8uKq0NokYWB4kvS0M3LcYVWHcgeZS0T4n/VCxIT8gdlgyQ
         uCPjx8Bk63RMfFjwHcqz14LNoiPr//QMWBk0RjI0jdRUB4/ntPntb7WjPCX+7psWtSxH
         uXpA==
X-Forwarded-Encrypted: i=1; AJvYcCUS12oMgheJsIjodQJ9CAm20asYpMZulEx5D8yUsa06+BtyntfhYfvzUaEPSBFpug1TsnMtmo6h1+5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KPhxQsiz4l0kr6aOaOWtU4pDif4MRM03pjzNTdKB8wVFGgrU
	lGOtlmT1cWZQJgwhfVTIJWBgdoy0BWKSy/DlPlABvx+XpJJoTXmRNODECdmg5lk=
X-Gm-Gg: ASbGnct0OzFT9w26xbdpYOTOiO2hfrIvojOsCd/0kU0fs/4X5Q8haPh4dij+NHj/VNZ
	2dB74OSb6tChS4CnfIMobP6ifELBt5HyS/Utc44vyMTbqrQvYtQzXHy5b/X+jKQvp1Y9FFIRASU
	2Xw30+BuPLun4ouG9mByR8peYl8NykXo4rhgzPCT++R9lZG/Z4PzQyhZZfLmqW81PPESoM+jG5j
	ytFdSzOcS4GJiWH3/uzeNii0BquDDmGVzeUGclE7oc6eP8Iv5l9xjwqimW5VrQF7pqojcMKY2Z2
	DsUiuX3mlef8xgjEpfMHSw==
X-Google-Smtp-Source: AGHT+IFiw3qM2OLJAOzrht8znQypwnZ0VIBRkG/SQsfw+mpAfFJbX2GlbCZASwokcRTIuNT3Enb+JA==
X-Received: by 2002:a17:902:d584:b0:216:2a36:5b2a with SMTP id d9443c01a7336-21dd7df1bfcmr114645165ad.47.1738289915459;
        Thu, 30 Jan 2025 18:18:35 -0800 (PST)
Received: from x1 (71-34-94-122.ptld.qwest.net. [71.34.94.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331f2dcsm20448295ad.226.2025.01.30.18.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 18:18:34 -0800 (PST)
Date: Thu, 30 Jan 2025 18:18:32 -0800
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the risc-v tree
Message-ID: <Z5wy+NosgbxYk3fN@x1>
References: <20250131075413.6fc6c272@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cjn7TpeWn0+zx8Ni"
Content-Disposition: inline
In-Reply-To: <20250131075413.6fc6c272@canb.auug.org.au>


--Cjn7TpeWn0+zx8Ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 07:54:13AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support for T=
H1520")
>=20
> --=20
> Cheers,
> Stephen Rothwell

Sorry about that. I did a RESEND on December 15th [1] which Conor took
on December 16th [2]. I did not realize when I resent it that Palmer
had already commited it on December 11th [3].

I'm not sure what the correct resolution is. Drop 0207244ea0e7 from
riscv/for-next?

Thanks,
Drew

[1] https://lore.kernel.org/all/20241216003114.326129-1-drew@pdp7.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/arch/riscv/configs?id=3De7177ecdd2b73de4e19a02794d29e6c5f06728ab
[3] https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/=
arch/riscv/configs?h=3Dfor-next&id=3D0207244ea0e7fcf45e68e24b0fffe964624a22=
ef

--Cjn7TpeWn0+zx8Ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCZ5wy6AAKCRDb7CzD2Six
DD9IAQDhe6p9qTHCwVhHI8GCN4qh/vxHiSft1a1gTw+CseeTzwEAzD6wWiwU5gcV
LfLVm/SNbJIrXwD18NuzOpZ5Za0IKAA=
=DGyT
-----END PGP SIGNATURE-----

--Cjn7TpeWn0+zx8Ni--

