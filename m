Return-Path: <linux-next+bounces-8638-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C20BEEF92
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EABC400BA7
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 00:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2004C1A262A;
	Mon, 20 Oct 2025 00:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sXAgyt2v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF8946A;
	Mon, 20 Oct 2025 00:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760921780; cv=none; b=oLc6drRRQE3+rllELhPW4BxhbEwMSNWsXa330whRDaB+bfn27+nqBmc5lwgG7L4hou7EmW+xGg3+ZXkYfSUS26ogqzicnI+GzQNQafq6zmkw//IY6FMMww7ULCQeTqQ9KFaOutIEoMm+6j+1A9egBhYQAzpQVndl1bCc91kNTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760921780; c=relaxed/simple;
	bh=RnjZ5swuWUkQ+kQx9gnLyXWfy9qb5Dvbi0Ta7UPHKWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CJ4iFS0cHmnSYjJtzd4Q9uDxH/iHFu88qMRluaQ86kHNO+cBixui3e5GmC1CjMv1bL4F5/hNoCxduEWE/oKXgX3hExZDw6a2saQP5UjBUjtk9vkoUKzAfk5AC1O3pcrcJcmwBpw1zIwn1IDZv4nsS3O+8omzYPDUUfpbDQ2JMFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sXAgyt2v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760921773;
	bh=WFbjIRCXON9Eq1qOnB5ZauJ0EJeixnKzWsqP1bsBnP0=;
	h=Date:From:To:Cc:Subject:From;
	b=sXAgyt2vntjRZp5ZGHgSIKhp2c+YmvAaEJqn5XCinLXkFVUnfdeela/xZ/tWgR87i
	 V5Ei6Tg7Bd8tKRB8Qx6AaocZi6kLGpoUj1AzvxxL8d19rqLFde88qlGYuuRErC9gmc
	 HTq+BMmjyT7MK8tO6CijEL7fkS/NGpb2i8wQhuJf++5HznlNbDXaOzrE6X5niP+1zQ
	 IVxyB1X/HQROvqweo9FbHCaSpL1FzAY8cKZ4j+UI8oBs2MAg/ftM8uG+RJv9Vb9Woe
	 rgKJ92Ei+EW5RNkF6xDgRnV4u88CcwA0sjYZxadkCIThF+4CoHG9OljP9IO6fH9vNc
	 l3bQOPGrjmVYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqcSD4ydlz4w2Q;
	Mon, 20 Oct 2025 11:56:12 +1100 (AEDT)
Date: Mon, 20 Oct 2025 11:56:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the gpio-brgl tree
Message-ID: <20251020115611.6170f156@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/va9TTpehDXBHtgJW1TeImuf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/va9TTpehDXBHtgJW1TeImuf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio-brgl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/gpio/gpio-qixis-fpga.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-qixis-f=
pga.o

Caused by commit

  e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")

I have used the gpio-brgl tree from next-20251017 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/va9TTpehDXBHtgJW1TeImuf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1iKsACgkQAVBC80lX
0Gx/7wf/af6sJ1ut8DL0wd4J/csJVpab3EQRvLizM7FQ1FfXJqxoPl8hi1blvfhT
JVjp6qB61Fn3WCZpElkLFH4VMo0ypLLoCQlf1dEMptaM0afeH2TQquK7ubNjeJCJ
F8WP1yzqE7vk3xgorHw24mttQROVTcWZax2oCRwYNbdgU5Gl3gTUrEbgJXgvmkyp
7HPoX1LFaCoH7HhCu/AkqIOL+8vHuQ127GVG+qSEOTCfUHN9J/32GBjscnpJKoml
PJ2dAWHIVKZ9jDCcm4l1hUTLcIdjBlqo8UcJ87ellWjE5pbTyvaFr8tvSguJPU3+
+dcHga0UWqo0qVtB/plu//26znRkKg==
=wVes
-----END PGP SIGNATURE-----

--Sig_/va9TTpehDXBHtgJW1TeImuf--

