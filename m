Return-Path: <linux-next+bounces-3314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61D951410
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 07:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0564E1C23F3F
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 05:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FF455887;
	Wed, 14 Aug 2024 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aIcQ5X+K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE56C6F305;
	Wed, 14 Aug 2024 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723614870; cv=none; b=TnPLeWCWT35K9bq5YD/p2BCkcPVc+IXrojJuo5ct/zShqiSXMAFI3f/F4BfUdUQsNUpaH3D0GT40cs7dq48NmB9TnpzuoIs0EC1z+hOD9t6IyQFmMh/YxJilmfRhJVsy+PRdoGCKzY2TpQdpt3UbfjNbusJsehM0SzquhiAiCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723614870; c=relaxed/simple;
	bh=Dpoiw2FeVy4ZRATQYWzZsLCziFMJQd38C6Ox+HHgBAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P3OTKoEednl3jiIYjrCHlaGmgMFpJYyJdNF9BlczRWZdrgWR++MdLeStbzMNY70aW5382eK5h1kNsSlH8lFJSEkLKeMq6CYcFT9O4PTpImrhUhh956Pw3bSRQuRR0MrWlGnL5UHBZfeiq1lKJtAtxuJyoQP/qlt1vKN2mXCEspc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aIcQ5X+K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723614862;
	bh=obecI6iyhVqXVJmehG5kIn5dNF9/TeMEbXFH4Hxfp5s=;
	h=Date:From:To:Cc:Subject:From;
	b=aIcQ5X+KgNgUvI968+UULwBChoiSgv2DwAwEw+dwDMq82BdLOFiB4944pQbXjK+AX
	 2+4cOp5Kjxoof8ql2ikl7RVvIC0/J9KhSR1WpgSNci62C8wh52uAVGjYQli4YLAEwW
	 Jm2Yd8EDNL3HX8/cYrkrhI5V1XExz5C0CS2eKGr6AtiVhhNOeG73hQDa7jMqEdfmYe
	 d9yBEfKkLVDAjwZeSEVSVTMYmqJejROan360hSpd6AvmYpFWmXMj/4xx61kWaqequ1
	 k2xzkYcpCQ2H60vRLCNWlNv3Fi+pcZh4lr2Xgg2doniPs0HuYyUXBak1a939CX7Zd2
	 dwTZQdSnaQYjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WkHWf0t7cz4x0t;
	Wed, 14 Aug 2024 15:54:22 +1000 (AEST)
Date: Wed, 14 Aug 2024 15:54:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the execve tree
Message-ID: <20240814155421.61d49566@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yWIixIGUG7nsX_ypQONEtjO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yWIixIGUG7nsX_ypQONEtjO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  d5651e09b232 ("binfmt_flat: Fix corruption when not offsetting data start=
")

This is commit

  3eb3cd5992f7 ("binfmt_flat: Fix corruption when not offsetting data start=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/yWIixIGUG7nsX_ypQONEtjO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma8Ro0ACgkQAVBC80lX
0GxiRAf/as2cZmBPLnyOvAVGFvlXlzTBqZkOdF2FoBpGmwPssREF919Kp7hVVine
FwAc83sIQ5D3joCf0bDXCYyFtNjD25dHqRGcSyOhmh6Fc4MTOvAzuyImRBRtQq7C
1YURlg34ITcLr4VrkYtPpijYYiNCTiv1XKK9EwIRi9LRAs8nb7D/aajjc8wfU0XM
Uz8LtR6Nzp7/wRh1P1/6J2OareNWBgZfdS6Pj96eZL/Dwr/8Azk54181nzdSi3L4
E3fDv0R+nm3R7Z6O7/Sp/Sj+u6te/otuAcDj8zD8e1qDMa+HfB6F3pk/wy2sdsAw
DSMnA66uzqshxKHBNORBjxUX7kBv+w==
=95LN
-----END PGP SIGNATURE-----

--Sig_/yWIixIGUG7nsX_ypQONEtjO--

