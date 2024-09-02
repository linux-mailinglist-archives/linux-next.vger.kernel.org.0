Return-Path: <linux-next+bounces-3527-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 927A7967E22
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 05:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18743B21A47
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 03:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC5E5A7AA;
	Mon,  2 Sep 2024 03:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mevVNPp8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032F4C62E;
	Mon,  2 Sep 2024 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725247751; cv=none; b=NJs8RAkelI6kjqq3dSMLNL2k1wl3r4KuLRV8k9QurE2++18pE/mmfqnB7bEJh8ddahhhqppRstwBsol2aiL9FmHkDX9S3bqjita6kATP5ph2B047wsrA6KOBjsck6u3ONhtLgfGEoJBUaJdEycyKkL2aVnqHj7GYDqE8jlMqG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725247751; c=relaxed/simple;
	bh=zXAkEfE/jARFXwKo9G412jwE6gnAL5yHmlO/3R+qorg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ROtBc5u5OWlzZTOq8Rq5BQrzax9TDOQ6up2PxyrE+UFHne23htlrUNR20VIvVwAXE+0qmH+i5NREKRnJkOBEEoSl37li8TAKQ/KP6ADNvIQtIkVP5VcIoXyhcxGa1jPhADq+p5XojE61PBoBaAkDbIWVQzbRn7qflC2A2rCWHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mevVNPp8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725247745;
	bh=/GGLhPsMxMhPD0iB8dyoWEKQeMwpS2wW6NFVBO/cQlY=;
	h=Date:From:To:Cc:Subject:From;
	b=mevVNPp8NEsp6l6icQrv97mhv9dXBYwyhXlYvsfXMIMsDq3+J5FxxHU3h50bo6j/v
	 F9gWGztJfPZ58Jw3omQNSSuNYY9h7esRACLeKfRROmOHPm/TYldB1Sx37oxW7PcRKe
	 B04MnAQMc8kyeVwf/s5AA8mhxWQgT+L3Evb2so9VNuuzlbVixkRrkb5nU5amt4Gu1c
	 mmLvl6AR2qXhE1wfN+2IW8J6hWTjOO2FTpzneFO9Hj+ct1COsf5xS0nnJmcU1QEITI
	 FVxJVJ3lfzB7h9VEteMqpxdVKxU81yCP83sTap+XmGwGJs3OQv7RZLR0TlKfNQXSr4
	 cwqQNbMC5IhHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WxvPF2lt8z4x2M;
	Mon,  2 Sep 2024 13:29:05 +1000 (AEST)
Date: Mon, 2 Sep 2024 13:29:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound tree
Message-ID: <20240902132904.5ee173f3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kQ3mm8oHXU8SBm3rfV=sYuY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kQ3mm8oHXU8SBm3rfV=sYuY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/asm-generic/bug.h:22,
                 from arch/arm/include/asm/bug.h:60,
                 from include/linux/bug.h:5,
                 from include/linux/io.h:12,
                 from sound/core/pcm_memory.c:7:
sound/core/pcm_memory.c: In function 'snd_pcm_lib_preallocate_proc_write':
include/linux/kern_levels.h:5:25: warning: format '%zu' expects argument of=
 type 'size_t', but argument 7 has type 'long unsigned int' [-Wformat=3D]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
      |                         ^~~~~~
include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
  135 |                 _printk(fmt, ##__VA_ARGS__);            \
      |                         ^~~
include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
   15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
      |                         ^~~~~~~~
include/linux/printk.h:620:19: note: in expansion of macro 'KERN_DEBUG'
  620 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
      |                   ^~~~~~~~~~
sound/core/pcm_memory.c:215:33: note: in expansion of macro 'pr_debug'
  215 |                                 pr_debug("ALSA pcmC%dD%d%c,%d:%s: c=
annot preallocate for size %zu\n",
      |                                 ^~~~~~~~

Introduced by commit

  43b42ed438bf ("ALSA: pcm: Fix the previous conversion to kstrtoul()")

--=20
Cheers,
Stephen Rothwell

--Sig_/kQ3mm8oHXU8SBm3rfV=sYuY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVMQAACgkQAVBC80lX
0GwWBAf/WyQ2n0yyTZPt3RHH3p/s7PxFcW/CClN/LOIXkN16fS1sw5dw3coKAtHK
D2V8wykmoyHY8bYgUkxX9SLi1Md+Jm9U9P3E7dkJLU5ESlN4ROfTVF7l+QH/MGp7
Tb/fodDnmiMsNn/ydKz8UsULhH3wayR1gsorfIVp2pucyVGKr5OGvxfL7qfkGenH
hAtAzkSCEret578hICNi9kdayifMLmN6ebxOPJADD7CV2QYgEAC8T81YIte28iBR
eq90IBvOqLa4vL+lfBhgmo3x6kgg1Ut1KPjsN2NojtjfTbCJHqudwvWTkPRR9u/b
L7jc8jH+hptrN8skVi66Dqw4g78yFg==
=iB2V
-----END PGP SIGNATURE-----

--Sig_/kQ3mm8oHXU8SBm3rfV=sYuY--

