Return-Path: <linux-next+bounces-7163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE1ADDE2D
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 23:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00BC77AC52B
	for <lists+linux-next@lfdr.de>; Tue, 17 Jun 2025 21:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144A8237180;
	Tue, 17 Jun 2025 21:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VBjmWEz7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B655291C38;
	Tue, 17 Jun 2025 21:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196965; cv=none; b=T3/boQnCNbPdMb4dTK4o2xa+uUtLoreyQjmHVDjdFsXqHy8j1Al9hAVr0zKeaRhmo/HJVmcaX3ve3HGivix2HinI/rSEcOQk6hAVuEUlwoRmfKwvt5QoPiVAM79mlIwtMAPwp38gtvOFAMwpl+50+8eCzlVJ3a3aEaeuhgMGlp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196965; c=relaxed/simple;
	bh=2Qz3hiDElsLkmKIhWpLhf+0BgJ49gXk7h5L5iIMCk0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AY58GgWgKuhcOjUGpPjsuDzevilAJyzXYxrEYpb1KET/WKs2iFPPxRpZ+9ST3Js3MEpd2EqUNTaD35HQYVVBKOFG2vmHocTafFWgvPPG70TGC8xnpKrqBR74Zlo2FueR35E/OttyttSNwdtIDhvk7G/e874PbBK65E95CSfp0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VBjmWEz7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750196957;
	bh=c/x1G+6xuLNw77GaMNHQLPdvNnM0jDMf7f4v/4uh3Js=;
	h=Date:From:To:Cc:Subject:From;
	b=VBjmWEz7Tk8+7UrSZQOC9DtWpQPySi9oaVxskmIYmZXkDllQToId7vourBI1em01M
	 8ETDHhVi3ujv+nNXfsg2fjL7IzHpGgvZncOzx0dARW15PR/r6XzjbGxXc5ufJjy+j0
	 C2r64urkDkU0ZlqjUTy2+uHe1eKZSpEgem6rHKB5pEACNjLa3t8ByXiwsNfc6a6eb5
	 XnxNFD+tI+MnORAv0qka/VgdCuVDbJyziJALQeq3DJh0HYXfs7ERjLungZVMf/KYJ3
	 pnNuaTNDDejfVWWmf6c/FM5yUDePulSoiYqCezu2UcrxrM/VRXmrm2+4Z721m3vXuu
	 jDqbrgzTV7Axg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bML9n2Kgjz4wbb;
	Wed, 18 Jun 2025 07:49:17 +1000 (AEST)
Date: Wed, 18 Jun 2025 07:49:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20250618074916.7026e8ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/74NPFSy4IVB+y_Ne6r56JB+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/74NPFSy4IVB+y_Ne6r56JB+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  a4950419459a ("MAINTAINERS: .mailmap: Update Hans de Goede's email addres=
s")

This is commit

  3fbf25ecf8b7 ("MAINTAINERS: .mailmap: Update Hans de Goede's email addres=
s")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/74NPFSy4IVB+y_Ne6r56JB+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhR4twACgkQAVBC80lX
0GzfCwf7BXFcxTsinKuc+w0mkEY+ltV2G/TxDu06N4ISDyVkQEjjtZfG0Wiy7+2I
Bd+2uhilSe+YvsGkvYtiS+/U748kU7WGN3vu4SKkCLZklulVrhvWJ4dDaW5jRvf0
J3q0n5BUY4WYnX3YGuMIjV2BdYriYrjGgiGcPOI5SA3eOBmHLOj0ODAlE0ApoGjf
8T5Mkes80Cn6fjamjU9BK9uFAElBD7F1qwQg3hIKHyySmWZT+relQpQvxQYkwpTW
0NenJxl7KrBrVGWS8xCEXcFEoGeWHMpoL64/zZJFMA3/1oGlkW5jENtB7iAr92r4
QiWyL/RSJkGqulP/rmzRsb2U2pe28Q==
=U/zo
-----END PGP SIGNATURE-----

--Sig_/74NPFSy4IVB+y_Ne6r56JB+--

