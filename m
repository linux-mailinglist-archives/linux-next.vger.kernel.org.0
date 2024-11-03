Return-Path: <linux-next+bounces-4596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A59BA86E
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 23:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91E90B20C9D
	for <lists+linux-next@lfdr.de>; Sun,  3 Nov 2024 22:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB24A189BA0;
	Sun,  3 Nov 2024 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tDUvq+Qe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6229C176233;
	Sun,  3 Nov 2024 22:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730671325; cv=none; b=rtgbo/DuQm7+ogcXhQujqAtJQeE65iZ+BZTltXAwrMVFoxkn6Os+PFIIV0EkFlWcMoFm+HLspIpi9PkE5wMxfwX/Qpi0DqPVzvsFsKcQTsm72SI456ziX3Fxa/cTMByW5i9Hkqo65uGlQE3MbmQAbgwY5voaUCv3xTjhBzT23ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730671325; c=relaxed/simple;
	bh=q+mf5RANB7wydw+jiKUJ3BSQWayMw6nB9DTYPeFt6hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hX056wn8lisDpkiE8zM2V2TdhwWnulAv0ZZkaDNS1uofPdwj3c8ziIaJgVUo7ISy87DDIfgVeVVFKsreqn5RHYgCesiQprHl70UU0l5PAZ169RjXoXGUCN289AydRoP6RiyraXmAUist8OY/43Z4W2/HE8jpCXBWhpMAJtDGkRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tDUvq+Qe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730671316;
	bh=Yvflh5PE3f+Ui8kPCPOF9gGn01jbzuy28HaUiIQEqO8=;
	h=Date:From:To:Cc:Subject:From;
	b=tDUvq+QexKU93h9b+HXqQN1br23+QYpItGkFMLCtRgqMDcR5fVADFRqSn+Vn/0XUk
	 gnyxv7b0FA6QpJlyuym9vubQ8nNglo96wKxs0hLYw8XWNwoF/qcjCoG5Y6pKKaxsmQ
	 wti+bCNAxarK7E4X7WPMN/E+oGHTjitXvP+/0bjhu94Nw79x1zntrp5Z0n/AB1nwGC
	 z7ZP12YBlqxKNy5ZZmkHXAnV/+idCiXJXrk/ifAGNc3fzExMIr13yPlPMrgNwFQKBt
	 lmfebDXDKsiACJc3YUm/pBZHymuMSLZAalNaa+7WU4B1nr+mQcTFK0/la0jFr8Wwoc
	 oB1xJodN4/G3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XhT8h2TrCz4wyh;
	Mon,  4 Nov 2024 09:01:56 +1100 (AEDT)
Date: Mon, 4 Nov 2024 09:01:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bcachefs tree
Message-ID: <20241104090157.5797283f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fHv+Zpypp5c8vE/LYl_jX.O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fHv+Zpypp5c8vE/LYl_jX.O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  42a794d6eaeb ("bcachefs: Don't filter partial list buckets in open_bucket=
s_to_text()")
  40add6123c8a ("bcachefs: Don't keep tons of cached pointers around")

These are commits

  e0fafac5c4b6 ("bcachefs: Don't filter partial list buckets in open_bucket=
s_to_text()")
  a34eef6dd179 ("bcachefs: Don't keep tons of cached pointers around")

in Linus' tree.

The latter is causing an unnecessary conflict due to later changes in
the bcachefs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fHv+Zpypp5c8vE/LYl_jX.O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcn8tUACgkQAVBC80lX
0Gz/Bgf/f52xuQcsym7IGbaPUR83I3qh110UHPlkfa4gpWx4D9KdI0j7c6xhRMuy
O6TLPRl8RfiFDGT2/Z7++1zK8DQGJaMZfhD8MC4VhjJP9tXtG3Ei8Pll11i0TJ4D
DHPNt0HO1GngaaOM8nw16xOYTzUVz6wIY9w306CEmNB4cWsLSdZfuz2tFfO3IdT2
Wiuys0Wwtvs53Zyb+CpNWAZG1AytQIKL49UBDRtNEi60/SwK5mdQmvbbsiPCJd9B
6MLMgrXDdDIoT2pGJG0mdM1rMCQnXyFKEQJSl0kG1u37rMiMxSD629gvKJhrp9t8
3RJNbvBe7URcf/czx6Y7X1NDaO+Gyw==
=J/xi
-----END PGP SIGNATURE-----

--Sig_/fHv+Zpypp5c8vE/LYl_jX.O--

