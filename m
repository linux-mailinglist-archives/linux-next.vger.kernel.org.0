Return-Path: <linux-next+bounces-5398-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCFA2E18C
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 00:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEED0164D14
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 23:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D060824113F;
	Sun,  9 Feb 2025 23:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YgdoGZ2K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC76413213E;
	Sun,  9 Feb 2025 23:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144637; cv=none; b=D7JHRh4O1N0+RsaUMBzAfoXMXPDJHHQrI1izJFkBf6i/22roIjTdK+yH7xt8Iw90YHiw1wOEaannuW+WsAFgWJTCIT5TNU+0oG3P3h4c6ES6rXW2BvEIeTw5BjCjnofao/lZFqPBXuB3V/tkQ5VGjpd93b2dsb68sAJoT6Aacy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144637; c=relaxed/simple;
	bh=noCtb+T/OhhYSXkE4cDzdfX7moejIlYhBJ7IM96/zpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Df+qEh1B4hK02VKXhb5i+m68t+5IZXrBeDIStSLlK7Li1fLwv2+AkSH7f4uv6B07bEy5+K63pKPlcnRopcwNByCWcVXN9mVfFjqeGOTWkGTaXkqgOPPVGDOZSUdXxl6X3/ofPt1X6LVBuBMis/0rZVHhkKstwHA0/P5gmD2QAr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YgdoGZ2K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739144628;
	bh=S+k5j9aCreUGV8EOrFnBqZ50BADkyroJy1yvGRzjlKE=;
	h=Date:From:To:Cc:Subject:From;
	b=YgdoGZ2KnV6XDkqisyFNLwuL+qktKNoWZuOEJGHEUBQ80T11J94C/7S6XlseA3Skr
	 V8R3ELugq0RhSxG5gfdrZZwLKn1G8PFObuGrT3yRa4OZLmzTrsQpDmbW3KfuqPxe+4
	 TMg2jURd7we7F6X51O/Z/VsOWh61qgQXxyXy9hbWTaoAP4oO+bR91kpfwbBzmyr/AY
	 3vd1G3HsGdIY1EVx0ho0MPLOPuBogDzQtWItWnmrbEePj71jkzx482LsN3BhCvChYY
	 otO9haMBZCqz4H8OaBRHMyO2Vf/yMcLeMSRjubF8iw35kCRuJb7gFXjNDAi/EDD2Ej
	 l1zJ3HQIC9eEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yrkn005bKz4wcm;
	Mon, 10 Feb 2025 10:43:47 +1100 (AEDT)
Date: Mon, 10 Feb 2025 10:43:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Jiri Kosina <jkosina@suse.com>, Kate Hsuan <hpa@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the hid tree
Message-ID: <20250210104347.3d291afb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fPr_iMSqNX_5+qDOiuYDeXk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fPr_iMSqNX_5+qDOiuYDeXk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] =
undefined!
ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hid/hi=
d-lg-g15.ko] undefined!

Caused by commit

  a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")

# CONFIG_LEDS_CLASS_MULTICOLOR is not set

I have used the hid tree from next-20250207 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/fPr_iMSqNX_5+qDOiuYDeXk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepPbMACgkQAVBC80lX
0GynFAf/aldM/WEc17NZM6A7MSWUEzRRcAyCobbbfDT5LQN8S4V6s7zItEQJHXLy
ngDCLC2jgXlVaHhZo9DI3u44UjGOAzWj/gI2VwFR0A0EP9RBNj3+9HKEMXSWOIb1
+1SXnAc3V75inv+28G+ZKcVn9FBPai3Cl7y0gxSxFN2h2Di+T+EpFZHme4NaDPx1
2sgM+qRAj55WuQRCVW7HxX3MkfbPtNerI4p4P/QDdH2xGX+Od9op9xkPipyCcOR3
8cPzFcJ2MabFMhhP62GTyQGk8aGfaCqYEfnov7FchuhPw0xLm6JR70HXUGZ1MpRm
4zwcv8VCAFa8MGRfxl+U2o8Fk/tfsg==
=mkZV
-----END PGP SIGNATURE-----

--Sig_/fPr_iMSqNX_5+qDOiuYDeXk--

