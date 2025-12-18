Return-Path: <linux-next+bounces-9458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C517DCCA4B8
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 06:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E86273046586
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 05:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E85D277C9A;
	Thu, 18 Dec 2025 05:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F57glnms"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8318B0F;
	Thu, 18 Dec 2025 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035009; cv=none; b=IFM4xvphWNYhnA9QSfAdNitki+cuYS+TA6BpULRaV01Q4UOf9WZXFegjQdDEsPV5T1+qpTpXDZz4AiB/668YAxdvJiE8B0DuDcvfrJ8xcWt5QVA6XknUdSNRN9Da3RbuOgxsydeOxUcCez0BWX0Z86jNkuJDLmPMhUQk7mzG7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035009; c=relaxed/simple;
	bh=r/9MD9/Lip7taYSpgStK5K1y2SRBbjp3YIAh0q5mc6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S73tm7SIvAjq3m/qdmFz/YUhYQEVqrMqZsB8IHDidWrCl8tLPKDBp0zTMXyTAqljJKjvTEH5hkOEN8B0mFp2X7a4wxlFjTV578yOMvwJ2QBvUw2PLn5CnCOykNLwdmc8y5L/cAod6m4iQZp+ZfDcM6N+Eg8k/Sj21T1NsC3DCGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F57glnms; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766035003;
	bh=u3pIvkDHpn9DJipHjNGXD7HfnTW+zjrf9Fs4iXPhfrc=;
	h=Date:From:To:Cc:Subject:From;
	b=F57glnms8CDMo2LZuEnyL9sQa26fvR/rsjD45V7S6wPx960ZTW1pM4f9GJWG/UOXj
	 mpBs+rkK/lKssuOiOyzxdihBeO6IWRbukxYf7xuH1nc1q2rOPd6k4kE7BcRZl1SwBy
	 2vlmwPTcHxtbTG/PdIGkYNAlfg9RTwIiEURIDW7VX+0ZVmiOBv9WdjjIPsS3Hr8vRO
	 /oO+MnMqyQtKPcOa+VVyjB5LBHkDy5Ms6s9VPru60BxJkv6oJbqkvXAxvVH2xB6Xgd
	 rhklA2PuXWRIJAAxBMKaGD33qyPsgIi/TbndfaQSqaLFZV2xnwhqVCHbs4k1HVwacw
	 5JQd8xpVnnlVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWzRb3BZSz4wDn;
	Thu, 18 Dec 2025 16:16:43 +1100 (AEDT)
Date: Thu, 18 Dec 2025 16:16:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mateusz Guzik
 <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 mm-nonmm-unstable tree
Message-ID: <20251218161642.7706e7b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VFeSO7zl+NEe4N3gBx4lK=S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VFeSO7zl+NEe4N3gBx4lK=S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  kernel/pid.c

between commit:

  0367a5dd4b09 ("pid: only take pidmap_lock once on alloc")

from the mm-nonmm-unstable tree and commit:

  6d864a1b1825 ("pid: only take pidmap_lock once on alloc")

from the fs-next tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/VFeSO7zl+NEe4N3gBx4lK=S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDjjoACgkQAVBC80lX
0Gyu+wgApin6RELBW3nOf/JB22WgfvxfO/EMMaIM43jGup+Lsk8iaN6q2fyG026T
2hkIjZJjyG3kEPlSKlPjdfDJk/NGQHT2F87VcJsnA0z3711b0Q8mtzmcU/4ZFXcf
sDTtZnS4Cy78vqOnzpqKtYgJKWPq3H6IwNDFgpjY2qTD9f/JxWvy6AMJsNpwjA7Q
XQ5uM6iHy6Uw5muEeSWLj/OXN+CXFII8dTa/XcZIEbWZiWGnkaDT7NdmJC7UDrgZ
xqL3+ExmJgKhk0r2jriua5iLxil1XlRVMMxiE2FvQonO5RMx6uW8iSfHDO759EiZ
GIuJH5Ckr3kZSmfHXZTHtjFncce3kQ==
=fXTY
-----END PGP SIGNATURE-----

--Sig_/VFeSO7zl+NEe4N3gBx4lK=S--

