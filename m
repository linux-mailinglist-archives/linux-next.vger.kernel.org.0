Return-Path: <linux-next+bounces-5853-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736EA67165
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 11:36:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDCD03A7D32
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 10:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BC52063EA;
	Tue, 18 Mar 2025 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R+SEHnC5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61932202997;
	Tue, 18 Mar 2025 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294156; cv=none; b=UM2e9hoxMWAIFdqPnGEJQbhXFCR/EwX98vb9b7RsfWRSgO0mja+vD2SdvEt9LOfVm7dDFHASUr0GU9twUnEbpZE1i4IhHuknnaoSyfolukexggjiNnvwfLKqa0zjU1ClTJD/BEJ373A6Uc+8EWjbei+FcTx0a5lKna+WvIUJyXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294156; c=relaxed/simple;
	bh=S0upM1fcGaVKMTFPNsnTq13dtFOY8TgEu3qJM3AM7Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=o9wgPvjVWBydRWqox0tvWjFtiOJsJ0aTZd3cIh/9YPdLkVEjVeskEkHzoqWuOudMylFgwrVw82Yr2L3YemS5J2yw/IBbcxKcbaLAhOy6H6hGuzAF9hsCPILTKUKpjcAKt/+ovjlqkG9wZpJCEfy2QV1vUfTSVvtq9Pmw3G+FJZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R+SEHnC5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742294147;
	bh=ZCYgHewgbfqasiCQqbCQ87WPbhsDtNw7MnN5fuTgmy0=;
	h=Date:From:To:Cc:Subject:From;
	b=R+SEHnC5FleCv/4JjEY2My7Ch9n+JvelWwJcm7fg5OS8awIRhh61kMJRdVwZ8/7rh
	 8jYiLp0zl5tvllg1gcJCYCniT6Km+zRfpjbS0hh+04OHAC10KYTCBf/GxL3E36E6S4
	 LC2UQzjsP/CdGJXGio6WTIBUCUW1gHoYwZE0AyQVxuptnqMPkm4pt5KhtDvbm+gOMb
	 Bz0DNWM+3XF6f5R+aaG82f45oyIdkkrgCmIgLyuRunMKYEA/wL7WdUncNSfibadsCK
	 Fy+4znTO68CAiUZ2n961bEmiYO+HPWUKvEeEhe3X1rwbvd/7Dq6aym5G3kQvEg/AcT
	 0gvG0+crUkNGQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZH7Xg1C8nz4wcD;
	Tue, 18 Mar 2025 21:35:46 +1100 (AEDT)
Date: Tue, 18 Mar 2025 21:35:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Leo Yang <leo.yang.sy0@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20250318213546.3a560928@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/da83T74A=nMNfS3BacMWLj5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/da83T74A=nMNfS3BacMWLj5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/ina233.rst: WARNING: document isn't included in any toc=
tree

Introduced by commit

  c56110bc68aa ("hwmon: Add driver for TI INA233 Current and Power Monitor")

--=20
Cheers,
Stephen Rothwell

--Sig_/da83T74A=nMNfS3BacMWLj5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfZTIIACgkQAVBC80lX
0GyBugf+O058L9ph2LQuD0mrdNo1eKeEiLzw6jC3Y+/Dh8sTo9I2yoJpwGmifYXq
fHvr/fE7bnMJgY31jBsl1Cb9QQ/0Ncr1o3flxWP7dwxv5XCXlruWsQLWaiyzlX7S
htNxUcxkhuqp20zlYE4rKBCIUqHSIdjD9WlLE0TIUwLf97YLf1ob5bgc2dqttse3
XgQuqHkeGPuQSNvTds8NvIUligWPylvO+QRURWbo/J1ciDpO0zmOKgCeu6qktrX0
7zlXDZ6ukhPOLD9Q2TWPft9bVVnjGtuhgyx/3H8SR9nDLcChdejLh3ulmuonVdwe
aWtz5ygSJF7P4kZB5+WjH9HaeNIyrQ==
=RGTQ
-----END PGP SIGNATURE-----

--Sig_/da83T74A=nMNfS3BacMWLj5--

