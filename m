Return-Path: <linux-next+bounces-2742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBCD91D77A
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF5EC285184
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F51A28F1;
	Mon,  1 Jul 2024 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nxl2acWw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3F46434;
	Mon,  1 Jul 2024 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719812363; cv=none; b=q+E0zYV1TnN9V4+hVLYdsScUWzQJ8a+eMhhi7bC34vh1Wl4AHMfOQBxc6m+haiporyJeLkdyDb276JS3ic0T98irZTiMmGoP0iASsw2w0G/Zb6djQX3ukzvkpBkWzDf/WdXD0kNhER019+wLYycHWuI41N60H/EvrTeQZeoo0tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719812363; c=relaxed/simple;
	bh=RJ8xCR1JYp6tT75v34uU+ssIfcIE5+6G4jki/RxvGDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A1vi2gXFzM84Y7VZd0CMzLxlWWJA86L3iFcXxg/nXC3K2zy3IHVejcKN7oqeAkeYkCIosDLr9yS8zDwTKnqUc1pIN0SJ4htWyQ0l/ms1gyM5l1KHrvLgIjLvVBoD5P3xd3QIu3EgFctK4W9RoAUdu5iMBQYzbZ9xIk65LDKpU+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nxl2acWw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719812358;
	bh=teeHPyKJJzs7w+TI3wYP0PPGnaSwkfmjvc2NyTmO0Ik=;
	h=Date:From:To:Cc:Subject:From;
	b=nxl2acWwy/wSWvLFWjLIDnEGotAOo9pN0OwIjsMt+I8poXUZ7q3Wc2lFt0dX4U+2p
	 opgAEAmzHFmEcbIewvB5hX5X9YNpKIRpSnkUPn7Xp5w/yJ0MZMzUOVevu8+fuZnNNY
	 dWZZwvcPxaGWZBlcW5w8CgopirZXCLcaoJD8pXxh/KFAhiuObu6B/ZQ2K4Sj4Ub9O9
	 +aw6aUxCXax5bQDRPO84uS0bnD0ykyPzliDz8/KDYXT+wQPT9MTV4jX0HXBBXGVToF
	 z5jDlMeYOGcD7tiWot99HAjR7n0J7l3zJ8XitnYRlYDQA07kWY+RtSQwSOf8smUJQE
	 g/t3QoaUqe63w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCFGY17nzz4wx6;
	Mon,  1 Jul 2024 15:39:16 +1000 (AEST)
Date: Mon, 1 Jul 2024 15:39:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simon Horman <horms@verge.net.au>, Pablo Neira Ayuso
 <pablo@netfilter.org>
Cc: NetFilter <netfilter-devel@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ipvs-next tree
Message-ID: <20240701153915.317fc7a2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K50fw14UlBDSbAEAWWz4pDC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K50fw14UlBDSbAEAWWz4pDC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the netfilter-next tree as a different
commit (but the same patch):

  8871d1e4dceb ("netfilter: xt_recent: Lift restrictions on max hitcount va=
lue")

This is commit

  f4ebd03496f6 ("netfilter: xt_recent: Lift restrictions on max hitcount va=
lue")

in the netfilter-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/K50fw14UlBDSbAEAWWz4pDC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCQQMACgkQAVBC80lX
0Gw9LAgAhK4z7j5PhvTzd2VkoOMl1eN3ufBy4ikW2uC1khDOURTfkVG6JQDyUc8q
OyPs69Ny63aZqWAdKuo2rD9TKxm9IEZymGB5yobsm7Nugz1HNpNb7267hBJS5XI4
AWUAbMWm2CCnTjnolDfZFJePCaNEbCegVOAP2qqoTfSLzu2r3oYlhtMJHIbeAWJt
BxT84qxPmufJj+zuI/ip4MIZRAWu+acVTipt6ZMUWlBtqENK/pwm3FHAtSz7SJs5
K7pf+5Gu0/4aOxq4xptQOJ7iqcosJqAZTNOL612snzNNrykjL4dsBTGcvZb9umhr
UE3ce1UUNarOCtrCyoLKr8jowepXQA==
=LKzh
-----END PGP SIGNATURE-----

--Sig_/K50fw14UlBDSbAEAWWz4pDC--

