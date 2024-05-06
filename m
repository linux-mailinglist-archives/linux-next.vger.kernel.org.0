Return-Path: <linux-next+bounces-2181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC448BC708
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 07:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97DA828196B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 05:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DD24779F;
	Mon,  6 May 2024 05:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AzRqtd+Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1B4E1A8
	for <linux-next@vger.kernel.org>; Mon,  6 May 2024 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714973618; cv=none; b=YopMrhvhleo7BSufD28dKqNTnjQN8OXIexg6/avSgkLGsbii1KL74GRRYVMvMBpQaD/3fVEqR8WhKRdBPtV7VUrJcIfZX16RQI1NjycLudV5Fbbdojp220FFiC+bfbpilg83xpmtDJal/Q5Wml57LewO1XhzHCHPRV8af8dTuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714973618; c=relaxed/simple;
	bh=cSZev26Lt/lfG3m+5gdZrQVik0OeEM7nmiKDcL3auhI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WljFVhs/X0xeWVwtQ1bAlxq+6y8/gqVpe00FdBwgZGAFBMUPwKnPyXyUnavl6L88I3bHk9h3LviSqUR8udzG5gdA+DWYxQDkUkB2zHPg7+ESob9Ou4cWshhE68rAZx52nX2wxQthc1EEKc/7N9ei+kf+5Q9s7zVi/DTqIhjmHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AzRqtd+Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714973614;
	bh=Q1XfhUwv7Wv85FA19C6wWY3cGZGZ1IW1KGrsPPLZlVE=;
	h=Date:From:To:Cc:Subject:From;
	b=AzRqtd+YGy5k/BKCeCxaXeMAbMNVfzrDvISofWx7j+rfDsfD3/Dyxv2pyhwd9hdNi
	 YoeF0hiZoZo21knuA8Y11mZp1DZvEDo+gakZVqLE7kqjqDXhHD3TP5OPfcf6F3JxMk
	 QBWSGfIWxPj8fzQ1mu8YBeKwbGB2aWGB4lrWmwikmE6RFu6Il2WgQt1hk6e2ZRbe1p
	 GcDU9rsMcmZRgwNZo1ezLMBPD9f7T0g3Rsipf/NfPGtD9Tm6rTD7aLDM57ysXvQdpF
	 2cYE1eJrqWi9DRW/9Vp3mAGEjC8FDfHqLhmf0QYR86VKax8GEmh7uRhDwtXdl9XP9m
	 BniGdmsGA0wNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXqnn6qjSz4wp3;
	Mon,  6 May 2024 15:33:33 +1000 (AEST)
Date: Mon, 6 May 2024 15:33:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Wedson Almeida
 Filho <walmeida@microsoft.com>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20240506153333.7b36a0e6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GD0o5K_9VpLqt8a9NlNOdBI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GD0o5K_9VpLqt8a9NlNOdBI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for source=
 directory")

from the kbuild tree and commit:

  11795ae4cc43 ("kbuild: use the upstream `alloc` crate")

from the rust tree.

I fixed it up (the latter commit removed a line updated by the former,
so I did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/GD0o5K_9VpLqt8a9NlNOdBI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4a60ACgkQAVBC80lX
0Gw+8ggAkd0lllbfi18Y2hj3rp53ZtF3xqwV563Xzi/5u5uw4NqH0PY8txmd0iHl
qZZMU+5Vo1RX3yCBsTrVdGLdOcQ/yETnHr+hFnTOPSvaXoBwrZWtCpcLx81EJeEx
WB4mHUBxeIxv6MXiy16WwrN5rRZeWtAJsZMVDp8YypqRBVHI+biq28/6W3U3u69e
eyZvjyTHES5OmcdW4cgwS2HzEf3eFqz+lSL7DrgWzCzwENS64R4wjENPfhLH6bPy
vhLPD8Bg3x5XAKiFETNUmt3X6QMZsoIOZUqJK1o7Mrccrc3k0o/tIDWT5bPh8gEO
u9scgDoKtAD4cDeXpTPaQKh6bVZ2YQ==
=2Bsq
-----END PGP SIGNATURE-----

--Sig_/GD0o5K_9VpLqt8a9NlNOdBI--

