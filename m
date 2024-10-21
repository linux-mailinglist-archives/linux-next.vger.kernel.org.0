Return-Path: <linux-next+bounces-4342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED639A5871
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 03:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41F53B20BB5
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 01:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D121EEAB;
	Mon, 21 Oct 2024 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fw8e/QwJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20866DF49;
	Mon, 21 Oct 2024 01:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729473236; cv=none; b=hQdpFWgKGs2aKCJd9jTxiQXo5XTxjZkTmJgNPGyyDF+8ccO3ZifR8cR01g0z8pnO2AE/nhmbXgdtaaoM/gkyb3U5u+kuWlXXpv0dTwxueEMEuFF0bCTDsKIi/g13wXXsBvkZoQtPDVx7rbQTHOXX1O+wqs+qWCyR9gBFwo4QCz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729473236; c=relaxed/simple;
	bh=xmOFIc7UL6nimH312fjzPftPE9PYTHGVlw1oJojaILE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cyof2/V6+fZ0LRWzo1bj+adQTF4u8HcGKRWOdqhdixjaptNubRbOQJGv/2seDtMpUd2WI1ZBXmWQLoPd+s4IaWytckx6neHcTn/Ydp8kDr0lxT50cd1YoLOyh1+3Q4J+d14ugEx5Y5N5ZkuGykTOQekVGn3KfrPJ9Yt6ywYFG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fw8e/QwJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729473229;
	bh=h32jElHbBaqpGucnDgLckBhcNEW7fIGoLMv+rsBlEwE=;
	h=Date:From:To:Cc:Subject:From;
	b=fw8e/QwJBCQEBKQHFCjjdOiDIjNG3kVrn2LSB6FFe4qVmZq46yin8+pqKwiKBmbnP
	 ZPukbqOd0hdxB+7ToRMlpkWYAUEMyd5uR88fnbYR2LFUWM3siKa3BHPr6Wvm0pCOfx
	 aWxBO5NTEFw4EhTs22U8akCDC18xOoEwZAqu7wzuSSTgfP711GApIUN8AuZ+ErBWa/
	 VRiyR1e//bPnrRJjT/qbBull5T4tIm62A1sgq5yK+rqsaa/o0tqK+YnHiSzkL4jTMA
	 pVPekkqYvYRjfnnFNbw21GK6THt3J+fCPkh5iLm0x8IOg2D4enxKx6h8usEKVKCbYD
	 AwYUltm52YHpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWy4Y4Trsz4wcr;
	Mon, 21 Oct 2024 12:13:49 +1100 (AEDT)
Date: Mon, 21 Oct 2024 12:13:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the crypto tree
Message-ID: <20241021121349.14a5e2c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C..pc.4S6nh+Enm3rkJxE1=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C..pc.4S6nh+Enm3rkJxE1=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the crypto-current tree as a different
commit (but the same patch):

  6100da511bd2 ("crypto: lib/mpi - Fix an "Uninitialized scalar variable" i=
ssue")

This is commit

  cd843399d706 ("crypto: lib/mpi - Fix an "Uninitialized scalar variable" i=
ssue")

in the crypto-current tree.

--=20
Cheers,
Stephen Rothwell

diff --cc block/elevator.c
index 9430cde13d1a,d6b4eb5443d9..000000000000
--- a/block/elevator.c
+++ b/block/elevator.c
@@@ -708,23 -709,12 +708,21 @@@ void elv_iosched_load_module(struct gen
  			    size_t count)
  {
  	char elevator_name[ELV_NAME_MAX];
 +	struct elevator_type *found;
 +	const char *name;
 =20
  	if (!elv_support_iosched(disk->queue))
- 		return -EOPNOTSUPP;
+ 		return;
 =20
  	strscpy(elevator_name, buf, sizeof(elevator_name));
 -	request_module("%s-iosched", strstrip(elevator_name));
 +	name =3D strstrip(elevator_name);
 +
 +	spin_lock(&elv_list_lock);
 +	found =3D __elevator_find(name);
 +	spin_unlock(&elv_list_lock);
 +
 +	if (!found)
 +		request_module("%s-iosched", name);
-=20
- 	return 0;
  }
 =20
  ssize_t elv_iosched_store(struct gendisk *disk, const char *buf,

--Sig_/C..pc.4S6nh+Enm3rkJxE1=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcVqs0ACgkQAVBC80lX
0Gw1pwf/TxYb3divxta6nuL9xqF+aOkytTxFhEvEy4SdLsXvxuFsQshqpwhgSFXu
lNP2xGYnikstRtyJfdNKY4zbyUagbxNV3Cq2O1YZKWOKvt/0vujGFRtel8tbFbbJ
Uo5VSEfFlIPg9twEBb7MroCk9skpNJV57JdvexcjIrT0gApMu8BHebWW8DVLJZ+H
TEfLuZnTo2IgR+goUWPLtiA6vBu6ev48PHUCV7SMkuG/d01U6ZRHiW57G0B/SbTS
3EEGOlmarLJdETGBjjifJ6AmoCS2YmxFYw0v7CWTKJ77+lCLqOtbAJS5e682ngtV
fbE28GO7wl39mQ1fiwNER1jYTpMnIg==
=nDxn
-----END PGP SIGNATURE-----

--Sig_/C..pc.4S6nh+Enm3rkJxE1=--

