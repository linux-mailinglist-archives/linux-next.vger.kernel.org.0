Return-Path: <linux-next+bounces-4262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71999DB0C
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 03:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0AC31F23283
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 01:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534DA224D4;
	Tue, 15 Oct 2024 01:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lqS8Pchk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD13DDBB;
	Tue, 15 Oct 2024 01:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728954094; cv=none; b=iFD9sDctHIdbkQsBHJLSIna+lyka5hGA+MKaN0A2ITGeM/cwvPh25D03Dsfv18tSfm1Sr4M0A3bJEUsAISywc7rfIh1VYCc3867jsYaHYfpx7OjgutnKvEkQrBfGafYXf9CeF1IKd3Vk+pKA5pTY6Khn/Y0MoZkFGcmGxTbyaGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728954094; c=relaxed/simple;
	bh=U9EHMBYnfHikub41nvdX+9JSkC89XnFHuR/oFFnHX04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Yihja07U8btXnY9nSgV7/IjiO55sh1WuK2fOfDScI6ykdtwU8SU+HBPW3MO3KDVE03LaPGdIyFVTNPxNia7AZA4NPLB8lH63veTZf6L+vdpZ3hNNiA03/ltNZeHBtmuOEbG3IdIIhf75Wd9uvja31ffTPZAHYMPx7FqWIV65iQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lqS8Pchk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728954080;
	bh=BoWh030FlO/8yb9qoKDTgUbqzMZBk7PJ5SIfV0EJssM=;
	h=Date:From:To:Cc:Subject:From;
	b=lqS8PchkT+GdquOlucIfXaSmQPW6UvF1McufwRZIbQOLgEppe2nFHRpm/FmzI7fS+
	 if6KFyhXTPey5/N090snAXlXGusqe1a32RrDjmvDG2O5sC4hT2nEf/xepuTeXgKzjo
	 y4zDQ9QJWwSv0ObWiuNL5heofszgof59C9/RdZaCpqL/7FrzJnA/rOehB1FiZcg+fI
	 cF6605ZqKkHxdP0tiVmOMDkS5GAYZPeJCOzio9cYnnUO6gD+K+FAH62JxaZRq9jiHK
	 itPRGOWXMz5jyg08D3xbURfWJD6Zp5t/VG+aMwWPdNKFYGEbZiU7d+oWxglrosYqMW
	 K0PEJX1vB8XhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSG4w102Vz4w2R;
	Tue, 15 Oct 2024 12:01:19 +1100 (AEDT)
Date: Tue, 15 Oct 2024 12:01:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>
Cc: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: linux-next: build failure after merge of the fbdev tree
Message-ID: <20241015120119.533e65e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N.8WlUu5_=o3EVUuoEJUkWp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N.8WlUu5_=o3EVUuoEJUkWp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/video/fbdev/sstfb.c: In function 'sstfb_probe':
drivers/video/fbdev/sstfb.c:1439:2: error: invalid preprocessing directive =
#fdef; did you mean #ifdef?
 1439 | #fdef CONFIG_FB_DEVICE
      |  ^~~~
      |  ifdef
drivers/video/fbdev/sstfb.c:1442:2: error: #endif without #if
 1442 | #endif
      |  ^~~~~

Caused by commit

  7c0510bb3452 ("fbdev: sstfb: Make CONFIG_FB_DEVICE optional")

I have used the fbdev tree from next-20241014 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/N.8WlUu5_=o3EVUuoEJUkWp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcNvt8ACgkQAVBC80lX
0GwWIQgAhzPvzGrhlJtXThXELWekh/DSl/jekUuJPvSfMU7ZhG1iUgekrF9KVblS
9VoZZNuSaTTUaIYNDz7RGhAxXJQ3bZt4V7pPQO7m4LVzr0AZZPdiZ9khoNXFLY5k
aE50rjwPR/QYYXE9fXP08kIuTg4YkRlQiomETC6XNSjUnRjPoNsDzD/OyF1mhc44
LTqekFB0VXMuBg4znrp19hgcVoEUF70OK5QiXCafQQkq7wBft7q/ReRZIkWFoVKp
deP9ouf8XnpZ6lUa+Y0XiuHkANRdvnplmHnaMQvM174wtCvR9+RvMPCKnzrS7VXf
nyE9tbEMB53k4rcedvIHs6Sgf6+CJw==
=rlaY
-----END PGP SIGNATURE-----

--Sig_/N.8WlUu5_=o3EVUuoEJUkWp--

