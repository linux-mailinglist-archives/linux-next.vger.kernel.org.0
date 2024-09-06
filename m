Return-Path: <linux-next+bounces-3643-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CF96EDFB
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 10:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A985528339D
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E957B14D282;
	Fri,  6 Sep 2024 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VWh14/dI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1C13E898;
	Fri,  6 Sep 2024 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725611354; cv=none; b=IjvzXLTwNWvldD7XHYDaw66CDogWmLcHugkIMJtyPasg+C3lEHv/gBwfRkEFt0cINL3QuCe4KDB6Its9ixN/XrQrwhS9EjfEhvqXbaAbZNCp/RUN7PPXXjG3EaUyavsly/fwWqenA6YTVUZUMYQftp3zq+PtET/4vLo07+KZDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725611354; c=relaxed/simple;
	bh=2keYo2lgk3+u8/KTLbluWmIqaXS+4zVJ9pPSATcq4kE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rBbD5pGejZaXMXvpS1ptvyc2XSy8s5PkQ10FKfXsyo6/XJgv3WIek4bV9GYPTnyuEmCdVCiJng9s5TvsnONKbSvbohRlaDUeZr/tBEMLdPLLIXC1u23Zs2gEhwfDmXEtM8bZjJvQ4iC8dy5SJvCqpdWjehzww5eEJyi6sb7+j8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VWh14/dI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725611347;
	bh=wTy8a23gUAo+S9eEeZ+b2EmYQJGFPXWGGQkDji6Y7bI=;
	h=Date:From:To:Cc:Subject:From;
	b=VWh14/dIxftNaGH7a/gEDruMpK3I96BwRj4qZuhr5agli8+AeqbL4boX86+zaXZvk
	 eJYVSDxXxqFPruUZOeoL3l30nsTfUuZxUnlzul3ZBsK4NKGkZdZDceskUNhEfcguWt
	 zm6tp3iZiIaiUfnAPRgIF5+eR1d7QwGmLjbEigLsgWPS6Qun29c0QvdNYlf6ItCng/
	 4cxlGT1aOZWkVwLAslmuwpijVZuXH/81cwifBobpLvGjEOrSHGJQfS8J8N+eDoWTxU
	 sXQDn8Su/xZ3bJ/wDS18DHpSA82Hv8w0pZcdRjT51Bz+UCLTXbNs8lSLhvISAZEOA3
	 atCHvOa7Zj9Yg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0Tsb1662z4w2N;
	Fri,  6 Sep 2024 18:29:07 +1000 (AEST)
Date: Fri, 6 Sep 2024 18:29:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240906182906.54527fbf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t_Hzun1RV/kVPp9RK/+gb.K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t_Hzun1RV/kVPp9RK/+gb.K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Error: Cannot open file /home/sfr/next/next/fs/netfs/io.c

Introduced by commit

  550bc501ff91 ("netfs: Remove fs/netfs/io.c")

$ git grep -w fs/netfs/io.c
Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io.c

--=20
Cheers,
Stephen Rothwell

--Sig_/t_Hzun1RV/kVPp9RK/+gb.K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbavVIACgkQAVBC80lX
0Gy7jQf+NlOk220sQGxT+TiPp3NY/rkntF6sdR0LVhA/85YVafFVV5Gm6yu968cK
6ZU+vjKxL/XoD16/Cc5cjp6lo64FO+Pu/ASBkpC7Llvzb/0tN8g6QNreVR+pcRs5
EACzWFT1YGIA+rMIFJoyP34ZmSLT80r8ToDcTRdsxSbaE79jg8DbpwUYARYlTf0X
njK/Zpjw4STh0NWwoCxBShyD+o+3b9dzE2XgQRVb2snbNTNPVbSnhxa5coTMS2UN
XCWaY4PFmcS3YWqHJNTWMV78AIomU2efM53OTyCwuX8ls3f0YzpWFZCQ34FXKGsv
Cc3pkQ92sjoP+U8dfVzf5+TfdB1jMg==
=DxdE
-----END PGP SIGNATURE-----

--Sig_/t_Hzun1RV/kVPp9RK/+gb.K--

