Return-Path: <linux-next+bounces-5211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 912C4A11905
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 06:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDA2F188A937
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 05:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF5A1F8F18;
	Wed, 15 Jan 2025 05:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ir3jkkia"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A74157E82;
	Wed, 15 Jan 2025 05:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736919205; cv=none; b=Wv8tImxYjR5yUfRw8PlY6eUFCkKby+x6nOnqzohHjti3cjExYR0LiOnEvI+u3Tx3MNxo3ftEE0bXk74VWn+V3ToNGA9a9zqI/enAm8GITYIkHifjojM3S9ooEU5ELfFY5vmXtA3IwxIya73pLNMum3ckIsPpzwC6zijVtnRe+IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736919205; c=relaxed/simple;
	bh=Kf5TKJuxbh/eOWb6rXVE5aV5m7XZ9GT+f399GZ52zas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P73TkhtoC3hnn8awrEyBa1gkupDIho65ll4h/Uu91XzMVr0ALcFCcESonnUDHWQcxreoXJS3A9ykU1YXGu+IQOdQS8viQnAqLv65FNnRQ1a+S6/E15F2wzo0VEQwNMvo5iIjPmbqALiZbcYHrQ4OlsT+S0JuAwS0ZCct9SJgpWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ir3jkkia; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736919194;
	bh=KJd6P5e60M/bOJGy8CXwbwit7bzO/ObrAp+as+LlHcs=;
	h=Date:From:To:Cc:Subject:From;
	b=Ir3jkkiau2QL2F+zNXMQv+5q01gkDGZw3PrfjzRyz2YMHOSacfgZnAUSknX/0nIIj
	 xKk+IrRlSoafSRzJ+8z7E9aF/6mx+yG8EeiCMTKyDvR6/MzQViOjlHtCVkaxs2I/AN
	 XyXc4HlNhmvz+wZMABNJ2zWmG1FeodoO3NVfIX39IYv7P3gKwprn2R/mAYAC1WpqG7
	 uzEtK1dy5aemZNrP7xyuAUjtbXJ7g6Vl0EJ0wG52LrYZ+O6s4m+fHutOKXTyr5Jzk4
	 cQOOm/PZh3O/C30nlEkI+DBgbXUzjKg8Su5kliVAac8O4Mzw1g5I4265Ll+q9pKv+c
	 iAa4FmvbcB0og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXvm918Qgz4xM1;
	Wed, 15 Jan 2025 16:33:12 +1100 (AEDT)
Date: Wed, 15 Jan 2025 16:33:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250115163319.5adbd93f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//_6Bxx2C6MY5gzp0ILJ4xFA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//_6Bxx2C6MY5gzp0ILJ4xFA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-stable tree as a different commit
(but the same patch):

  03a001b156d2 ("mm: introduce mmap_lock_speculate_{try_begin|retry}")

That is commit

  6f030e32e449 ("mm: introduce mmap_lock_speculate_{try_begin|retry}")

in the mm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//_6Bxx2C6MY5gzp0ILJ4xFA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeHSJ8ACgkQAVBC80lX
0Gw9Dgf/bNJ+jIXoGVIOai9pW8qzWGSLoBrbMBDUiVnsze59sqQ/bTX6U5b0PMMR
7bMmS5mEMcjU2fw0Lc01rIhAx1esmIIl0e5DnD0TPQzSPRYueBeVI9nCLZ8JmYa9
8LF3Ed+v5ZJDLeyZjHRhsFjw1ChkO+LtIiqAksGXzALvV27+S6IDWiAhKNxq8ydR
B0ngjTTeB2JeVs9T7Fd1xkx7zD6Uo0OmBP+eonRnR/vnsgnBXPFjuDSobRRJV2zL
/P3ldDLo7gxbUOrqqzXUJsXZKu0bBSyEiiODcy3GI6usoe6BDGp6VMFu6SJNQY+V
EASkpXjqw5LD7H+WIX3tO9j8d7M7ng==
=Ab5M
-----END PGP SIGNATURE-----

--Sig_//_6Bxx2C6MY5gzp0ILJ4xFA--

