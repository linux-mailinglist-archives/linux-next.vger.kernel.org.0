Return-Path: <linux-next+bounces-2363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297B8CA74F
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 06:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0881F21B7B
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 04:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76908225DD;
	Tue, 21 May 2024 04:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mg80VdDM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187A17C8;
	Tue, 21 May 2024 04:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716265661; cv=none; b=JBgPkVdKvnXVU0mTO2z+tHtWGF0NxWFxdm2WWL/Lre0xf6ReSXllOVxNOZGRl9BXjj4AlXlZV0rVga0/dMj0qHs+S2EuuN7G9qlAhsE21428L3+tAW0WM57EEdPUQ6RS7znQ+a7KeXjiTjwqQGOyLgPgTwgyFxhzcHtpPFnax+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716265661; c=relaxed/simple;
	bh=DyyAmWCOuSSPvvCCUKaCM6Ayg4sujehxnhhyX8oe/3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bGeg4ohd4bwLULMPgvsSAp4IXmnaDK9M6nwZ3c5sax55w8fkThwsdklnFMf9gjUd+nV0FeVONiCV4z2ZRc2oIlcJMwAAilkREfptr1cXSEd3qK83clA4C6PAU63KOhqel7Xq2IjwJOBPqYe1YF8UFFogGJNEcBNiSolgQ8IZfl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mg80VdDM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716265656;
	bh=UmWxLsavKqo8/VKWOVXIpSEFzAkAD5QyAX8AhKdl0ds=;
	h=Date:From:To:Cc:Subject:From;
	b=Mg80VdDMCUgwe4819IqEYazpu8kpKREF179RVrF5kmJI3zSApFg77OOOtmUP2wV5D
	 s9ATEjJbI7u7onWo1eq5OlAY8poFae74PpWdMLbaTOh1IKE0r3iPMLYCrG/JIwEnYv
	 8n0KRLGaNV87AAZfOr18DQeODH6WKvDQI19Wl0omU11u2RKccUuMuEQDl2M4742h3g
	 Ldg9kGNTkN6U0HV8phaJLzml/DI0xWqCLoFwYCjnggbInO1N6gllxWeWteDzPicvZP
	 Y41tiueKzSGr7TyejDAyPiOgeKnKUvtwboJsw2FVPNpOFy4M5aA5oHaEuKg+M+LEsC
	 FcPTPQZ9EXRWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vk1cm0Xs6z4wxf;
	Tue, 21 May 2024 14:27:36 +1000 (AEST)
Date: Tue, 21 May 2024 14:27:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild-current
 tree
Message-ID: <20240521142734.3dd04bc0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WeeyBT62UyOdz0Eo8cCJprl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WeeyBT62UyOdz0Eo8cCJprl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5b3d83d46584 ("kbuild: scripts/gdb: Replace missed $(srctree)/$(src) w/ $=
(src)")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/WeeyBT62UyOdz0Eo8cCJprl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZMIrYACgkQAVBC80lX
0GyWKAf+MM49yzM4wVCPeffZ4H+ul9PibeIPigpNqE6lBusLA8M8EYfiasKse4p5
sq1i3vd7nI2M9dsrtP3/BLo4/xoiLp3qj1/ZzoUmX2ffBFS4uEX3L5Qe10pD1jby
ch0xv24CVMs8TsKPHMGNcEo8b+wK3PSbRoynxpl3w12gulcTgBJ/qtHjeVJA/vSN
VU4H35SIwevY4isIZeo/fcSR3ACIVm4AEJEeQDOXmyhyqwU+MtO76GW5KOSdK3Ef
Up5EnyMGZTEBj7WiCj3lHk704qze9cpve3zhqTZQWL8CSsk6GzMEZK81/U/pt+sU
FI/k41TJnvyPjyMqw/LidYV0FfGGsg==
=sARc
-----END PGP SIGNATURE-----

--Sig_/WeeyBT62UyOdz0Eo8cCJprl--

