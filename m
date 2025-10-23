Return-Path: <linux-next+bounces-8688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B34BFEE14
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 03:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 538FF3A8D89
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 01:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4721F91D6;
	Thu, 23 Oct 2025 01:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gGeaKQtv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F921EFFB7;
	Thu, 23 Oct 2025 01:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761184335; cv=none; b=A/x7gmed/Wp+x95BVAvADXxIw/tD4Kd4qwBjbNexvuhwoMC2ueC6H7UdzsXzb3frFV3wFCkNZDS4L83B85XuGrW0plbzSElO2F2XOQRPoWPJ6btD9qSFf8BtPTa+Jc7yahzkiEszbF2Nr20WU0bVmWjTkRWuXePXdbi/i6Wnjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761184335; c=relaxed/simple;
	bh=j5EAycEuABicMfnSIUYW3MzMfbfjVjcHmAXpC0w5heU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V+aPzM8KP+GPAoJ4/AZrsRRLIZIwMAqCBEcWXK2KcXpKK3A/PgESss/yEvUHAPXPR7lcrEylj0H9OIWF4XlCFZ8t1UuaUdpiDY4c0ZYUL4yl8JV6E2YlV5iFviQ9lQCKy/Jt7/QPji0vO07ti3bYnciAoMK4ABnkTspAuVfjsWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gGeaKQtv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761184327;
	bh=gdv+UgGc7eOLuwa5+w6WdljU2Qv5teZuHKKO6TWAFdM=;
	h=Date:From:To:Cc:Subject:From;
	b=gGeaKQtvZOZ2A3sevSPP/RRHFLfXIFOLMN7Zw+7y0xhnkbTeqZfxaHXScKabogRQh
	 9mmlOT1IU6SputoYYrGj/S4sFdsKhkFINwCvxjXvNZBRuASZfItF+DPfx1ATBF77Mo
	 x+jfOQ33JOx9+TkVxoZqR3xR+/55CTUV1ClEIZ51BwOSIWYzj8jBo7RW/sfyvWnXy9
	 sV79T78c46nYOOhqQG1DA4b3MR8gPEioHUJQ/PaxOXShxGtxg68ztUcUtBGkuRIEOE
	 gcZMRp7EzL0SVJuKar/hCQtcSYjtWEJ30/tzp1nFy0vD6qRd/P5zF28KLpnFCm6C5Y
	 OErorgeSMxWeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4csTYM5CW2z4wCX;
	Thu, 23 Oct 2025 12:52:07 +1100 (AEDT)
Date: Thu, 23 Oct 2025 12:52:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the gpio-brgl tree
Message-ID: <20251023125206.5555dccf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7kkl8zm9C/2l+fw=Z1gcZ5O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7kkl8zm9C/2l+fw=Z1gcZ5O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the gpio-brgl-fixes tree as a different
commit (but the same patch):

  ae495810cffe ("gpio: regmap: add the .fixed_direction_output configuratio=
n parameter")

This is commit

  00aaae60faf5 ("gpio: regmap: add the .fixed_direction_output configuratio=
n parameter")

in the gpio-brgl-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7kkl8zm9C/2l+fw=Z1gcZ5O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj5ikYACgkQAVBC80lX
0GwWKAf+JgyHAyh+rCiCAtHABsVvDxBHQd3QhbD11LzfmmucACLb7PiXAu8Y6gi1
z/UU04Yyz1WENcvCRbH/LXT6AFwII/Vrpby3VmKmNN+bxTJJUnAYe+6wMFZDuGf8
KB3epQNWx/vlGanGl65ySeMxaX+nsfBSCpj52e/iDtMgoje9wkz39tXoiwZulOTO
aGwK9E3h+q3VT53xlJGL7wLoRSufeAHW+qxsFm0pqyJESEPYBd9Bzbq+pVyuu5Qz
x+c7O1b/aZf9/E/lThvtc3UMozXw2wNURX4hDlPXOZ7nt0kMatw63r05ixWUvQoF
5HA7XbiOx0jnXTAIRDfD5llSbAhw9A==
=Go4h
-----END PGP SIGNATURE-----

--Sig_/7kkl8zm9C/2l+fw=Z1gcZ5O--

