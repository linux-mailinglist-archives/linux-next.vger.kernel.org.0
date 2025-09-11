Return-Path: <linux-next+bounces-8266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC245B53EB0
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 00:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6676B3B71EF
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 22:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C76C22156A;
	Thu, 11 Sep 2025 22:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FYKAGTrv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B472DC78D;
	Thu, 11 Sep 2025 22:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757629866; cv=none; b=W0VIYDch4rZqjh0bfoUkkUcqX7sh4J6Lyk/slClb09u/4Jh4s4iYwZkxibX5d6yg5DqUYESLvPhQj8sZX2brbCWfUwljoPac3LXWEU2oovR9PE3ZM5Xe9hc5kb1nWbGgdSjKRcPgBFzUo69wlD3/Ei7h9gqTFmGk88Jd2lJSP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757629866; c=relaxed/simple;
	bh=sjQ9ud+UX0Fpv903ff0j9qPzxnitPhljwJGiiGhioBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rirwUU7KUG5QO84ajtglFxij+Yx0nrFRvR4ynKHGLdAdi+pWW4gzaHIYMO3hyHDGz623TwE6I+3IiaDvYCZlraX843n5zYhIr4+bwtw8WOkfL5aF0D9YGVKzgdnxBt6bmnwnCarnpuOX2IaB41ZYqE2tJt6rPfcRIqK7fNLXyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FYKAGTrv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757629855;
	bh=GHz98euzHuRIXjPJdll6Qp1cpsvozW93PLvs2wubJHM=;
	h=Date:From:To:Cc:Subject:From;
	b=FYKAGTrvs0cET46PFdaSq2dh8JHhf+42QPxcYo493EvaH4omFHJBcAlsx0NuaUfq2
	 97fE+x1ApK3+3EEl+cyyFgASElXyM1xueWaIhs8kskfPh1o5usUw1z3oWzykIWkNdu
	 nf0uD9za+C2Ja6YnbqG333EGL8lyMd/BLL8bUJ/DStC2QWKq6BFmOlxRSJ8WAs4bdC
	 4opImo/jJ3qsPUWn3QUg64k9LeEbs6dU35XDApN1Bhn0E3MvGmLv1IUWNTXK89WihB
	 k8nwOJDWQ2zoAXeLYS4Lhs2bEo7E/skTnn/roPuN3UM2RlGBNjvqAgfOGeGOIfHR1O
	 oYmdktcqyp3sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNC254vkJz4w9h;
	Fri, 12 Sep 2025 08:30:53 +1000 (AEST)
Date: Fri, 12 Sep 2025 08:30:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yuan CHen <chenyuan@kylinos.cn>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk-renesas tree
Message-ID: <20250912083052.399e505e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZfReB4AgYvyf=1ZF=1zS92L";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZfReB4AgYvyf=1ZF=1zS92L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  380c74a29937 ("clk: renesas: cpg-mssr: Fix memory leak in cpg_mssr_reserv=
ed_init()")

Fixes tag

  Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned t=
o non-Linux system")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ZfReB4AgYvyf=1ZF=1zS92L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDTZwACgkQAVBC80lX
0GwJ2gf8CGUPq36mcJUTRzGfmwNESQOp5ppgOoXE0XZ4VV/CLhv3ia5gLIxO+gpW
Pd2TWXggxR6BGqaLqySWealDA0ptGO5ZUP4jgs6tEQqq2CQjKRDMwsig6DYmPh4l
9oCNMxhXzsF7C/LVNF9oBYrE8UC8WMSwbtZ8OSL5f0PnqNfz0hSQf2KcwQ1z/ksS
12v1MbJrLDyNXT57ZeQzTKyijOQ7a8oOmTzExKja5G7cQf4nlLtSMjwXXXfPZu2M
FZzedKkX28AlxN8Ydxol4cAoLWjucbag9VPAvQP8VPxlsl0msvDTbFn/nWoEzFzt
1Awuz166RGnXwC+4H8pGjERCMOWzfA==
=KO3q
-----END PGP SIGNATURE-----

--Sig_/ZfReB4AgYvyf=1ZF=1zS92L--

