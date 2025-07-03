Return-Path: <linux-next+bounces-7316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E43AF686C
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 05:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6FE63B4F69
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 03:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C34172BB9;
	Thu,  3 Jul 2025 03:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KEj8cY9H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1517D7;
	Thu,  3 Jul 2025 03:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751511669; cv=none; b=I6iPRoTAqnGQQr1YjgNV+9Op8KFLCz8kzCiKWvq1O+J6qj1CTtClKlWSqCTAjeUuoAOG+9geqPMacZFie6iv+mwi1dhZ2Y8KVg+M+GRW+sp2xHNuKlwdTb9hntFsC18DMLbvkO9N0CzU2Gi7jZdXyS13frZ6fntE+UnItFomIqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751511669; c=relaxed/simple;
	bh=vUY7f0Djx0zEZn+AW+YZahB84Jscggn6xd3e4dSocY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rGUMneWcyaiCzGFQsz6OsvluqpmPy8mWVy/QaUbK3wt44Vv4QAZrTHviMOCJqQ+vlDQDjS0qeDfyIn1Xor06X9WuG/7wDUsSJIJJ9vRxn2Xl1xjZsTquDslSdOP1Yzp9Y1RHSpZ49GG2Bah0rlE6uhZIYEsovBpV9ewDZKkXFes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KEj8cY9H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751511644;
	bh=s+yk+uAqFV3gUgjqjAi/UjTCw86A3rGnDWfIHLwuDr4=;
	h=Date:From:To:Cc:Subject:From;
	b=KEj8cY9HQ9gu91hmJMqS7aCogt6uGlKtT9DNlBNAmu2dFoEF1NR8nR+He49Epv6Gp
	 T/nV4XzyvyokxPuVQwnYe0slCMZkYvUam8Hld1BXJcgZLJiCn+MHirPUd/k01y/oGA
	 /hn77fT41nwU+3lqb7ksMaSKkT2pnsgZhAVkwAI1BqsU69BDcDf4qxovfJHy9qZQ5B
	 pc0M7W8HHPngVUa76eIVNbT0aN9btrCLjX5RuS5lfJR11sAai8ZIlVD92bnvUjaZGq
	 Ny4H9uOeZEiN2Yv0C1tLTmAjAo/T8gMWqFvH9KuKvdq1qMqlSDcWS6TYlBxnEHud1w
	 l8UYy6Sq04Xxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXhND0LV7z4xQP;
	Thu,  3 Jul 2025 13:00:44 +1000 (AEST)
Date: Thu, 3 Jul 2025 13:01:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the iwlwifi-next tree
Message-ID: <20250703130104.4b187e13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CA+r1kYDXcYp56kIqnF5DPs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CA+r1kYDXcYp56kIqnF5DPs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the net-next tree as a different commit
(but the same patch):

  fc80ea519981 ("wifi: iwlwifi: dvm: fix potential overflow in rs_fill_link=
_cmd()")

This is commit

  e3ad987e9dc7 ("wifi: iwlwifi: dvm: fix potential overflow in rs_fill_link=
_cmd()")

in the net-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CA+r1kYDXcYp56kIqnF5DPs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhl8nAACgkQAVBC80lX
0Gy3+wf+NlLpJCrUkb5ydwDtthwHZZcdFrYJml4Kv8FG2GWXeVDNf+bYHB7HepaW
Sl3PCy+3D7SMN1IB5R8T56klfOibVXQt3wGbh8gCje43a87spbr9hfbKUnbVzgBo
NjGkPAz3BMLd0DF4qzz4qr+M9SMzpffUlA7PiYTawga7ZoLPevdDPHZmhwdlzi+1
KSU3fKouAGgwLiMiablQTTZsOVNyrt2Qb+Sjt8TQnUpwfJf0dYvKdXaEzROOqMYF
CpY8Yzr1mVuCfisexGlOj/apZGu05kbuJrEkKmKzOiyAL2xrxGsPwrO5SqyOzFAA
BKt514FH02sTBBYoTdB34PSWsbJBSA==
=HII7
-----END PGP SIGNATURE-----

--Sig_/CA+r1kYDXcYp56kIqnF5DPs--

