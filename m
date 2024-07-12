Return-Path: <linux-next+bounces-2974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BC92FA7F
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 14:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66411F22F6F
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 12:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0923A16FF28;
	Fri, 12 Jul 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tYHCHXXW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E016F840;
	Fri, 12 Jul 2024 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720788288; cv=none; b=RA1kJUQe6AmdcmMI2mwl/LOQPt18cj991aWziXL8bS1Q1Gr8LU5cD5L9OtH7BanLgF1wlgBuxsIcFgG7hcVaYXwmW9EH1TDUVGUB+mf+Ntw02jZqqZkwmuNtHz7x1UBsMVeDHkxncqUVJx6rlbW3tidH8BI/hKfy5ruIQxViMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720788288; c=relaxed/simple;
	bh=E3FVpYnRRpsgm++NuqRqUW9525EUFMflnlTae1gx0Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tefMEV0DZRvl6I056bh30bPupaQs44qzvGoJj4qYzCAM9SaqebrmD5hJUrjSYDERaTLDSQ7FV3D/qlT2Ikk3qrzcexb2Asz6cb5o49AbnGSxqNA+uim8V/oFYE3Jldv7fz1nUo0i/JneME3bG7PEBLLYBz8SGV6Z6LxrEK0I82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tYHCHXXW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720788280;
	bh=J9ISOixeuCIIdseLMlAuXrHGH7ICrLMAzKSNlG7raHU=;
	h=Date:From:To:Cc:Subject:From;
	b=tYHCHXXWTApWYqTMNFMZcvcY01vcXh1Ll7HqkdV02pZuo7S3czeHeBbCY6xgq6SFo
	 giKRrR0Tzh2CcTl74TQrhQvkP7KPemONS97qxRWwxVaZ8QUXlKa6962Z/s7fPNuScM
	 wy+oFZXJkmVspvSdIp1hp8whhxBYq1g3mS413fjUkitsT1KnnkBpZYDKCsZcyVzhTw
	 dyHu9H7aGaRZD1MMrkLOcfwbGwmPTjUrBEDwaV9yvU5erTNsOj2KfYUtncH5DZeD1j
	 cenHyP1h480xFCXQZwckOeNRgzSsCJ+QX5ObHmOojegG4stCpSNwRbqCM07BOZ7NYv
	 KXqpEd+VIJKUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WLBBJ3zMGz4w2R;
	Fri, 12 Jul 2024 22:44:40 +1000 (AEST)
Date: Fri, 12 Jul 2024 22:44:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Vamsi Attunuru
 <vattunuru@marvell.com>
Subject: linux-next: unexpected file added by the char-misc tree
Message-ID: <20240712224438.2d6e0cf6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bhlR1eVm/eRtMX6x5gs5Chg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bhlR1eVm/eRtMX6x5gs5Chg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5f67eef6dff3 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative =
driver")

added this unexpected file:

  drivers/misc/Makefile.rej

--=20
Cheers,
Stephen Rothwell

--Sig_/bhlR1eVm/eRtMX6x5gs5Chg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaRJTYACgkQAVBC80lX
0Gze9QgAlItiNThgpLaIo8LD6spD93ZzNJu5LPGXhs9w546pTRcnND+DKHi2Zt3E
oUrjc12eAJIBczjQno71Ol+4Az4wul4g7kFhF6AKIp0ahXhIUtFOX9KelSNtdwtT
ioiEozBr3Y/RedXdjMnSXrHxSkk0PRt/CYWY+Ik8AsCDGZpHVIIOAcY8mLos0CMP
n6UVo13fmLUruU6qNh6V3tn5M5g+rj+O3jX/lkbJhSnnfK+JunpjA9hgiWfB46gE
3jg5lyiGhcr4xBphQdJTydV8pItaK8M8xb9wSbJfqw+0JNYOpFsDm5tfFBM2l/Rg
cQbeuF1tDhx2UUqYyTe27x0N0h218w==
=W8zH
-----END PGP SIGNATURE-----

--Sig_/bhlR1eVm/eRtMX6x5gs5Chg--

