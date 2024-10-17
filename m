Return-Path: <linux-next+bounces-4315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA09A1B8E
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD5C4284CA3
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAE71BAECA;
	Thu, 17 Oct 2024 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G0Rs2lBC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756417965E;
	Thu, 17 Oct 2024 07:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729149623; cv=none; b=VAAQOZNmrxweYUFIDfEBCMUdxaJzKFhsUIo7hV2Bp1r/7yTzL5bRlmC2AS5pVHGyqTgzSdMsgiZF1AYf+VeqLVWfEJyqVZljjtT/ubh+LIqAL+p3XnNhdz15vEf7juqVLDoQU6svdCUxzp2L94JCe4SNC/po041az7IrIXOp4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729149623; c=relaxed/simple;
	bh=aRxW1BJqdCi5MzjTtoeD2C0YSZTsYkOxcTuvbzrynIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VDsT36WtYjZffpcrYA9PfK74507atYbz8Y6yjgLe6Us53mOYH/H0IKeiWZtWPG8sBAPNFc//70koAxibrvhP5trT1fb3y+gdjJGYnO7udCGIh5GvV6pMkzIvkymRNSWRM4MGAig2c0ruye1QqGzj14WFJUsQLo2gTLueWww89Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G0Rs2lBC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729149610;
	bh=N+JILi/6idzzMDcS0KXd99wejiU/zlMg+c+CKpZnLoY=;
	h=Date:From:To:Cc:Subject:From;
	b=G0Rs2lBCLBsGoEAJUbVInvm3FDia4BnzOQl6YVayQGOzd/lrA/xYEiw6q/EpwdrJW
	 vwlXB4k0L6/CPgZeUMy8BpMdh4gZ28JUY10PJl7jrHWJ64mUtvm7JLfKOxEBDuofK2
	 se4SHk5mcdjbQKKctfHqKu4GVC3ViUdwONJLlla1iwetjY1MS4HPpWLmxzXL8KORVF
	 9VeBDipGJoyFB4Co1UiXQDd/4dT+8qWxBfdNu89eddmZW3JYzEFOHAqPnGyFCd6FYe
	 BmPhEirge93RgKQxbNTvH7b8B9jTOQMthqmCG2qCUpr5zen8oZeUgYNYgdPeCCBSNd
	 k4adtGWrE4eVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XTfP62j4Wz4wc1;
	Thu, 17 Oct 2024 18:20:10 +1100 (AEDT)
Date: Thu, 17 Oct 2024 18:20:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clockevents tree
Message-ID: <20241017182010.31d14690@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jOT0mY4VioUOXGAw2Fidlol";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jOT0mY4VioUOXGAw2Fidlol
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the tip tree as a different commit
(but the same patch):

  ad4890d40229 ("timers: Rename sleep_idle_range() to sleep_range_idle()")

This is commit

  102f085d8460 ("timers: Rename usleep_idle_range() to usleep_range_idle()")

in the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jOT0mY4VioUOXGAw2Fidlol
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcQuqoACgkQAVBC80lX
0Gw2JAf/a4YWHmE65tluJltghNDUkop3J7xhEtoo6Pjrj1pnrcejoQJpGJiHAGEc
QzfJzzXwWUzrGkWhh7nHcD+DKexcBlh1hY1Y4jimR3NZxpll6DiS9ez7PMDuMIRz
XfIsnE4GcSbbzXhxmjwBOXvvagplKv4Z+Eajfwcu0/PEVXQXvBWpVdCsujTioEIx
3RFHM1dad8xY/jUKjktqWLMFEXDuSoJOFQxKIcbZ+9WfAFo+x9ROEVqP1Di/qOpr
+WEi8Yq41KaZy1Lnb9P1gj+XZYI0EylJ+6SCCQl3f/bNMsVpM0tQgEt1UrRArqpN
C8aSohNfMXVArgOjX1yifJO+oHfpow==
=SDcP
-----END PGP SIGNATURE-----

--Sig_/jOT0mY4VioUOXGAw2Fidlol--

