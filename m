Return-Path: <linux-next+bounces-3626-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34A196E5DE
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43C7FB221EF
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8B71B151B;
	Thu,  5 Sep 2024 22:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FK6VtJ4F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92813198A3E;
	Thu,  5 Sep 2024 22:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576403; cv=none; b=P3JCpjAInh2V/4mL8pDWB1QRkSz+XAGCivUieF57EKgJSuxE2H+c+IFef0BZO2vHxelD2rn1s7IU1Jschkl2k+Qy31gqlJ+6/s7cSC7/6WXyt/d+SJpD7muTI/8N/6IaVFOAbTgzy9L39VH9gVMh59CJkXftvNzuQ1v1FmnC8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576403; c=relaxed/simple;
	bh=m3vTGh+gNA+PlE7s/wgJ9fTL5hDf3JiiHDH8W4KsPKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k1HuAJUsGTaV1ipNvnsGjHXPr6DGIqoxuxydOVfBy4fe77It85N6uWlEqYuXNP+hlZYim6ql5gDjlCDgaf5vAIHr2NFZ50PsUv230BMmA0qW/h3kOtXQUpXkBkHfZ9JNk0dZ2K6JX40KGG2A4D0MtLHSlufaCtkdmbobB1M9BMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FK6VtJ4F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725576398;
	bh=iY0bT5Y0gF/gRtXW2VazxS/yon2401Y8GmxORw1pMBU=;
	h=Date:From:To:Cc:Subject:From;
	b=FK6VtJ4FqOJ3N2JLpl0GAA2M0HP/dpz+oIXwhjHMXhMEO5HHmcbA8RUyEpO2QSoPy
	 PnsEnJYlfQ3rQgscfrYQ3KNc16ugTO6KrN3ONq3LZ84Mp4/Y3/eBxUpF5uS80YJxE1
	 BHgRwYDvYcCpXBRkBsYemEFwvWDkIM099pnlxVTYVjZmF+MDnWOcX3eHwEY8wdRYt9
	 mtUftJpJVrGtFJacF3EAofQsWdrF1JQCu+oRYHabf9Lp3ne5G6kDUC7C8gTC1TCwLA
	 ALKH4ij7UfuJPv4TaK7QFUi58GGZUzQ2wf/cGIsJ0arqE13b6owvqsORXr4/+8Rg64
	 8788MDaxPdSgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0DxV3GLNz4wd0;
	Fri,  6 Sep 2024 08:46:38 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:46:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Steve French
 <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Steve French
 <stfrench@microsoft.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the cifs tree
Message-ID: <20240906084637.295241d1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XeoHHoPEBYMDCrpQzI++K7c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XeoHHoPEBYMDCrpQzI++K7c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/smb/client/cifssmb.c

between commit:

  a68c74865f51 ("cifs: Fix SMB1 readv/writev callback in the same way as SM=
B2/3")

from the cifs tree and commit:

  0fda1f8c6bf8 ("netfs: Speed up buffered reading")

from the vfs-brauner tree.

I fixed it up (I used the former as it is (supposedly) a much newer patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XeoHHoPEBYMDCrpQzI++K7c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaNM0ACgkQAVBC80lX
0Gw8WQgAnBFPeAjt3pZwNR66oc1+QNgwpd8ehgtjFxlAkqq1NvNFFdMkilKbc9RN
OoSxUvoQnhnxUdDCkelhsYzgQupJGa/uP/mPG31cOSn6NDEQM7qMjoWexJ6GGpjU
/xgEDZVE0veK9X0yF0ZfKD5jIJyOE0n46wggryR2lZRega8UAyiHAkttoH+/Dx/k
yhOukqf7KCeb70qaGvBvqsYNrCBIfchDEAXOEj0j4MDPPGhwb8M36GdfBGmGYozG
BqDXVVIt9kelEHdDsvVLMSCyoCEHx9mBWyPtwHE/uJQEs5mL0jZm/0GtgDH1WnHv
uIViAtZePbPPuQAEC9jZKHa7aCWB7g==
=qPWw
-----END PGP SIGNATURE-----

--Sig_/XeoHHoPEBYMDCrpQzI++K7c--

