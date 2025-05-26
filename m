Return-Path: <linux-next+bounces-6927-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D260AC3AC2
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 09:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA293AF25E
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCAE1D63C0;
	Mon, 26 May 2025 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HDXAq9S6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056E79E1;
	Mon, 26 May 2025 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245069; cv=none; b=DBDFas7Js23ZxutIhegkBy27nQP7a5pSsXyMDVPfUo0QtBgCXeelz4ShrptfikcN3IU4SpB8s/xjPhrUqMFTqBzKx1Dj9OSKhYIAzqVvV5xxGLPnN9oVBs6L6PMtBlE3brMhedtcI+WSKfw04SJM9zK80xUq5G/b5hvrPEOt7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245069; c=relaxed/simple;
	bh=bqqheiEw2ZlPa8KPpbcr5ky1M9IYwUooffwPFNNqGUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qZ0803l8pcP9O0ZwEeBDKTXsNqtK14O6yURwr4JVdQy52UKeNGM//yu0ngi875vhrLVMaWE6SMHRhOUMGryF1qMs7egCYDqBwvlSBDJIynSuPLcHN+Polc7CrlZKgrV0Mgp2uos5YKvxX7LKYipMxf/2npMzqK6mMZBQ9D6dRGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HDXAq9S6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748245061;
	bh=qz8843x0JEVbsJNKf+LWej4g0qDZ0w4sbkRSaMTxsgs=;
	h=Date:From:To:Cc:Subject:From;
	b=HDXAq9S6PHmW2GDh89sLfxzA+IOVgZgkcRMcCvXcx9b5GWBr9bYzoORv1d0LJloyJ
	 DZUiM7IBTC5R88LCM5CHUu1c+ixwfGyc5jzd77If/jlCsuQbMZwAr8ukP50HFbOsC5
	 wCPoLawSBOjO3S96+GrN9eZOWZc/41KtnUq/piLGb+TFmHXjq6pVB//m79TaWG+Qvz
	 x9tjsRzUavzOXJ8eTP9XQXsah0iuTTbqgAXv4hK0ENIGyFhkqKusouqUSoQ719ozUV
	 5oLD2Ow1G1u4hoPdnglyM3+DTeKiseE9D0+GMawBN12TY5WgtXkFNc0B/ftK2ukbYM
	 VjAwGvMPBxdag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5SKK5K7zz4wyR;
	Mon, 26 May 2025 17:37:41 +1000 (AEST)
Date: Mon, 26 May 2025 17:37:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the mm-stable tree
Message-ID: <20250526173741.2dd77e75@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=fEi=eVYj5NQmombk57TkR+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=fEi=eVYj5NQmombk57TkR+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/task.rs

between commit:

  6acb75ad7b9e ("task: rust: rework how current is accessed")

from the mm-stable tree and commit:

  f54c75033338 ("rust: task: add missing Markdown code spans and intra-doc =
links")

from the rust tree.

I fixed it up (the former removes the lines updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=fEi=eVYj5NQmombk57TkR+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg0GkUACgkQAVBC80lX
0GwmtQf/YWjc389AkqIIB2lZuVsdiWPHyM5Yx99CCkbzk0scekomx5nx7WIZzfES
3ETsCGx0ztf6CK5a6lFP/y3l1oEoCzj4SvW11JZMqzhUPBJj+pU2knafs6UtXVWc
HbgByxQMCNxPWeI78ydn/qb6o9F1pzX1ImK0J4ZrvXyPLz7S7M1E/CqJ7MnJz2Rc
iQNU77g9V/k/bNE2CpUE445Lg1YJ3X7l8V7n291KCUtDenvm60Md5ZwutfB+cF2T
STZTklthaP7lQlt6yQxP9yHepMNeHsvaS8K1kJxhyIc9H3gSOmhU1Q6E8jv/Rv2+
gxgSPVxsX7qg1NNF9ON1qBo6aklmew==
=/2GG
-----END PGP SIGNATURE-----

--Sig_/=fEi=eVYj5NQmombk57TkR+--

