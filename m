Return-Path: <linux-next+bounces-7542-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C7B04F8F
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 05:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771F63AF5FB
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 03:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FF22C376B;
	Tue, 15 Jul 2025 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C/yHqu7T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7187D1B4F1F;
	Tue, 15 Jul 2025 03:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752551718; cv=none; b=og47n1VojdWbpZcrvNbkNIGd2OKp05BSZOYONvofGOGcyib6TXvsFjnhBFfPuFdxLRw8p+gL4xNVEFWcjEpez3OI6fOo9nRHY1NMETwlW3U2njh6J29Fc5ZsbMpFLVl2ya2EtkaC8oRdLsynUQGErejf0a+XkBmRNjlbyyG98wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752551718; c=relaxed/simple;
	bh=vC+fqMA4VtW3tpQ4WXAdKOS+mJqf9WtNbmGIHy8GtuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HZb7r9/t0N17rgubmUe0rYSP824UCwULRel89zphIXmzyUoVrLPaLjh99ohl6F7n6pkcWZTUkjs9Y/rgtlz/ugOV47tcvDS/KwTFzops1PBJ1qJhsNX+RUrhhr4J0J5+tJ17cn0VUjQxRLSZVWD7rdV6J9i5b16MEAukfITxIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C/yHqu7T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752551605;
	bh=OhkOOt47JdseESe8RK+r92ft58pVEWn8H3iWaphyf04=;
	h=Date:From:To:Cc:Subject:From;
	b=C/yHqu7TQClDILJRuopUj0lV5SND1q4boALGG009VnV4wVTUJQZcQl8czC1U4cyV9
	 ZNJ9k6A2gyj7XS0S0luesogKicHjZWfMLQGPsiFBHAvsX2HVW0slav58/yroynfx0e
	 GW5zvr41afhK7ySVf2rRK9dmM80RvebBvagye01Q2+J3EuUUEoYEIgT1m4udI0Nu82
	 paj8E/dDJBeDuKsFodQTOByNQ4Ns/L9xP88XtYRDwqvjCweWq32hvKJCV/heAtDbzf
	 65cH0XLbwn9W7PmPrQNcQz4QVJYh2khP5ozZGj4khZcwFVlJnmeu6Vkp4BR4dTBvm1
	 B6sqgzJCnSPfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bh4zS58qKz4wb0;
	Tue, 15 Jul 2025 13:53:24 +1000 (AEST)
Date: Tue, 15 Jul 2025 13:55:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250715135511.63774cdb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6YDZpzCLRnEVVi85ze/GKj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E6YDZpzCLRnEVVi85ze/GKj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c: In function 'ge_b=
850v3_lvds_detect':
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:145:16: error: too=
 few arguments to function 'ge_b850v3_lvds_bridge_detect'
  145 |         return ge_b850v3_lvds_bridge_detect(&ge_b850v3_lvds_ptr->br=
idge);
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:124:1: note: decla=
red here
  124 | ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge, struct drm_=
connector *connector)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:146:1: error: cont=
rol reaches end of non-void function [-Werror=3Dreturn-type]
  146 | }
      | ^

Caused by commit

  5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hook")

I have used the drm-misc tree from next-20250714 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/E6YDZpzCLRnEVVi85ze/GKj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh10R8ACgkQAVBC80lX
0GyjQAf+LeKu6+Iw/kgHxqZHyhgEEw9F5xWJ/3rp6/wQ/bSZmbx9RXWn1+DZUxpN
Y1L6Z6T7xeZh+ffh8w2nkPSJg4v9P5704xktvrSyrxStslr3k7gsdgdJdwYKeWYO
wX/25ahNKL7ZYWF8VGN6XpRylrW2G3amaurfISOdJuLuuh62TdCoXg3Ht45DCEK3
lhJY1/u69DnpAJ9wJmrKwnjOjII46WisxOZtiN5d5L5hcfDRRArGxBAxTQavon8g
LsE22IWmAoty9MoZlX2AAkSPQhGnJW7t+dawz5Gvfv5OQj8ahQxytTwOyrc2eFYK
TzBdyj2xcg05yfiBSZjJGV1dlIwQzw==
=845W
-----END PGP SIGNATURE-----

--Sig_/E6YDZpzCLRnEVVi85ze/GKj--

