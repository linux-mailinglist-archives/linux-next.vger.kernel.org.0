Return-Path: <linux-next+bounces-2449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D18D7A69
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 05:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67ECEB20C35
	for <lists+linux-next@lfdr.de>; Mon,  3 Jun 2024 03:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5ECD271;
	Mon,  3 Jun 2024 03:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c30BynLD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9ABE6F;
	Mon,  3 Jun 2024 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717385144; cv=none; b=I+/dYmtkLPkCv66xpV+gFCNZdgwfQe7jVxznkA42dGQhtA57rSHuyQx7vi2MCvvXDA8zPUOLjafL2UQSjUaf/rGtdmBCYQ9XXPUVfU+GsUUY0GES2lXFDD/D2wGjHUUJFu4vS1MFCuls4/On/OFZo3kVlC5wAgJ5Vbr09PZtsk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717385144; c=relaxed/simple;
	bh=khEoKwbRF5LuuL17kxSEtBx9BN7fZ0Ncm5x/svLrlQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F8CCD8/+zhGoZ7rUNlEGWARqp3LZV9ULrykyRfCaGBUx2GZDyOY1umtFhLY8fg1nU3ZFuO2oH2mYM2sbVM+qipMzlayn0dELrOyYzCFi9ebccUIfakyfUNtRyuhkgNWe7ddPLk6Cvb3EuAtfhAQjztdVEtjPmYFKs+0DFEBVC4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c30BynLD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717385138;
	bh=sax9x4fWHHaQmcIrQZWQs+3R/0tLxJ02wADSORQbDus=;
	h=Date:From:To:Cc:Subject:From;
	b=c30BynLDQXuXfSPMbJDgwpqjKN6Va53SPYHWLG6429l9GyLYpIngT2wqBes25jnmc
	 mejyW8Ztq0hdy9plg8kW61kmaeF37WvN74fbvRkSIPtpi5uMVz1LgE4cLoMlfU341I
	 BiQ8zMIWpUE2at5cWfkm3Mp9Ww78OrQHlss+QhHk81970fdnF3HO2DbM4EeJBlLS6k
	 EGEpwk6nQ4tJji1F1+Ar8YMwZ/FvKXcMzcdXOLdkuif0pexFt6XLs9n3Et3P4AwCoy
	 hxmzsY7NAjlCsfzhg/Nyr7KB7+wgLeW2TYJMiF/ToJ2z9Tg9TIeHVjyFgYfpkX69aG
	 nywYPc9t0yM2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VszdF0NDHz4wx6;
	Mon,  3 Jun 2024 13:25:36 +1000 (AEST)
Date: Mon, 3 Jun 2024 13:25:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Benson Leung <bleung@google.com>, Guenter Roeck <groeck@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Tzung-Bi
 Shih <tzungbi@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the chrome-platform tree
Message-ID: <20240603132517.7f344f9f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0tnaKXL/q0LsDi0RW+uSBSR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0tnaKXL/q0LsDi0RW+uSBSR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the chrome-platform tree, today's linux-next build
(htmldocs) produced this warning:

MAINTAINERS:11167: WARNING: unknown document: '../hwmon/chros_ec_hwmon'

Introduced by commit

  e8665a172378 ("hwmon: add ChromeOS EC driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/0tnaKXL/q0LsDi0RW+uSBSR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZdN7AACgkQAVBC80lX
0GzCCwgAiLPUykL4+Jhq60f1+fOvWyKo4fDzxyCxZaA1TybjZIhfAabD4F5nV++B
vhdxxirBcervdHkKcRBeGwx/s9/2j2UdG38pNjd8+Mit+m8rI8SMjNyzXTml8M6Y
Ir/g6C7A6nlluiBguaHF9vvEYC3X3j6Q1kbi2+Hxxeh8BWMwLZKOUbITBBVuV+PA
1gz/leoM/an8s6sEJo5CHZK05Yk9vjYsGp35ndvJxUvJubCHiJ/ldZm0GuBJ0OVj
n8vaGLvPrAkT8dBA65F1kHixu9vslu4N/JgbTRz3S2D1UAc5v9qgHOL69+3Qe0vd
V92H2taHUAmhJD/fCfpBRifxHrMtsQ==
=kIz4
-----END PGP SIGNATURE-----

--Sig_/0tnaKXL/q0LsDi0RW+uSBSR--

