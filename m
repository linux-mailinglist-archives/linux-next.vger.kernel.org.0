Return-Path: <linux-next+bounces-8157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE21B3F1DE
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 03:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96693BCAAE
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 01:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9032DE71A;
	Tue,  2 Sep 2025 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RlwrKRxF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9305526560A;
	Tue,  2 Sep 2025 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756776203; cv=none; b=SHGZ0yLiow124aieJ7J6JMxGr14b3JgaTpzm4SgVyLYp++m8UJnoV93zndPIj50vklD4n7FJHXuP+ei42Z06hNkFTmfoo7ScP1EKXNuGqvDlpC8ADcz2hUl+XDkIfQMU0HA/BFm9wWU5yifX7ZKaLHX7xHronQsu/P6cmXKdFyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756776203; c=relaxed/simple;
	bh=oofmoBFNCtQa52HU/bjrnzgYw0MgHv0RQLCKJR0rHuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P9aF4/RXX87PaULrZF9eyKwuBTj9sV0A2AcO7k51WXQtgRyXwITLtMEMMUPkxFuXlKmWeqigNGn6+Iql/neQIcSGcZAhHsfWFnmF3XfiPkv+fHx2oPt03hQq+kLO3zL5R4G0hDEQZYGnfPCOPrc6K93ZTD5yCqfi6IUa4txN3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RlwrKRxF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756776191;
	bh=73kt0bqssBWTqr6VvundfdjpN1zG7KcgHqbktaYdai8=;
	h=Date:From:To:Cc:Subject:From;
	b=RlwrKRxFyJMkrLn4FjLXoP2O4pQ1IumUqtkCzKgJdXDbz7elUKywxvgRCmN9UeGp6
	 QmMvakLWOF2pKdIMMTKNsSCLl1cCUyC3mtpIyq78YnyPoWOHsou3O0yEzzmw/lLNPM
	 7QNT9jartXKTCk98jlPXYr7QigRnsSa4SMKXA5+o+uHBJSGhUXL4SYa/0DfzvquJTI
	 9yZjuMy/qEgQmrSahJrEjGZqSpeHgTeONd+0Smz6hUkWHAhOPwzAcn53aYRF8mUi/8
	 cqZ9V0mRdHfcOZXukO2T7eZSIf1Cx+jQep5QSTtmMOKAr1R2opIw1hacg9R1wJPGO1
	 0Ri7r+N1oqAOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cG7KV64XRz4w9S;
	Tue,  2 Sep 2025 11:23:10 +1000 (AEST)
Date: Tue, 2 Sep 2025 11:23:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250902112310.53eb8fd5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N+2Y+Qgr+5UpVMqhryGHqMt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N+2Y+Qgr+5UpVMqhryGHqMt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  02925b3b935e ("Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen=
()")
  c27de1739b83 ("Bluetooth: vhci: Prevent use-after-free by removing debugf=
s files early")

These are commits

  862c62810856 ("Bluetooth: Fix use-after-free in l2cap_sock_cleanup_listen=
()")
  28010791193a ("Bluetooth: vhci: Prevent use-after-free by removing debugf=
s files early")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/N+2Y+Qgr+5UpVMqhryGHqMt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2Rv4ACgkQAVBC80lX
0Gz/QQf+IyzoujOunemeAzsGEylgGKRISInl70sX7+pcR63DXguJKsdZR4geA/GO
e7hDEvDCtFr/oA02RFMms/NxJDRQtbgDNONh5GDquZXBO5L+zV6tE7CCIClOPTDb
+/N2ERtoZaMqmnOe3zoiumlr0xMcfal3ZxVlLZI6JGBZgqTBdcx+RokdzrzmotPr
haCfHc2BKVyf/F6gcHgDJbOfDNgt8RCC7QC9hkPmSPrwoQC1okIR9HuI/UbIK0l9
K83FKiTD8Gp6db3m6z16monRKIdGQOp4XQfdx215uKmZR6TIT1oGjLwSETrxg5mk
r3AWAmhlBPSCqzpr+0xrtjXLCShduQ==
=9Grl
-----END PGP SIGNATURE-----

--Sig_/N+2Y+Qgr+5UpVMqhryGHqMt--

