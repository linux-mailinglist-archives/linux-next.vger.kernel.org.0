Return-Path: <linux-next+bounces-2531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C31E905FCF
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 02:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9FA7284004
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 00:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832CE8BF7;
	Thu, 13 Jun 2024 00:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G+vZYs7E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A758BEC;
	Thu, 13 Jun 2024 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718239754; cv=none; b=Embk/Qcbr/tx9B0ww77yZczbaYegMv3uGJlETOK8MT7yHcAi4RN+agWdu0oBvPYJrpAj5o6ocSeSqA34b/rLMecDxl3bSN+KjlI27qCWUckJ5VEIYx9VLXoYubeDn4dkuarS3H1x32k1RwlOMNmhiZWC8FfA5366IY2A3d13LWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718239754; c=relaxed/simple;
	bh=fe5U01rmWr3rZyOyQ76SE/H9ue/yECNbsLJpJpFn14I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FrjyMVsLmOCl2ZoNDtlyrXfQ8oLDI5IaJxYNkudoe26CCik5v1TeF7lWS9gSocwn+kIXuqUnGEfynI3fuzXPgWzaqEAAyN/QKpRbYrf/f5K8JL6YPe/du0t/eryL82Y21LKxe/HI8KifrR4EBEh8BbF9Ppvt/pqXHzK+cn/Q1SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G+vZYs7E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718239742;
	bh=87SUkLe0q72yXLlJp4strv9BsncnC7PqoId9N9/m2rA=;
	h=Date:From:To:Cc:Subject:From;
	b=G+vZYs7EwbHj/JeLOdMkVmDVgDHfdr4mXOREdgUHgI0Ckw1Bo7TNtw2xCFaSiC0oZ
	 L/Z2W34HUL7NnZXhfEFOMybbMBi7gd0nxwXbtJLXOSMZTcDDiTdG+tkkQInH6Ov6Cx
	 zpQJqqh5R7Ey/7kXGR4Rb0OFqNfPxMw9hwsce4+J++6L8CFJ+R0U8srnQl6Qqs/Wn2
	 YnWiMVBHlnduistckUz2okKiQsipu0/CovnoZSR8cGrR5o/AL7I6tjLVB33szXrPzt
	 1mB2UiR4K+KQWyvT2O2RfkX39YPVoHKxQnd5yQduET9ZxeHJfFFM3ktRqRN1PzpRZO
	 wNh77whoT8Nqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W03gx38znz4wbp;
	Thu, 13 Jun 2024 10:49:01 +1000 (AEST)
Date: Thu, 13 Jun 2024 10:48:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240613104837.346519cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rf1_FXR8Clb/fPR.7Am4k/N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rf1_FXR8Clb/fPR.7Am4k/N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patch):

  08ce6f724ce9 ("proc: Remove usage of the deprecated ida_simple_xx() API")

This is commit

  d92c9986e4db ("proc: remove usage of the deprecated ida_simple_xx() API")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rf1_FXR8Clb/fPR.7Am4k/N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZqQeUACgkQAVBC80lX
0GyVnAf7BFLoxAg+Dr/6YaS5Ic/6vLghOC12TML4JjJfxMEArmNc9opQI4taW3dF
yQg/X7KLt5S66g74rFxBkx/nB5clj/pF3D1eJpkXlPZkukAcVNn6LkG3ZvWqhAVD
qhKLQhPyhEUbjZQT0lY5pPG6j6VsOoxrIwJr3X3ojxnjeVAbCVW2rS5xAb9tpn/x
QNQODEyzc/lp1SsDR/9P2igt8KztWc4c0qx2b1uz1S1Itfwt7JcTezoRJyGOU1d4
b26upQqJAijnLqqJ03TPKVSJOE4skzfCVKs8ZxC2Af6VxMPKsnmvVYf1Edt3uh8X
iTCnLwGtQnAg39yJ2TuYr71WMhj8+g==
=XkyJ
-----END PGP SIGNATURE-----

--Sig_/rf1_FXR8Clb/fPR.7Am4k/N--

