Return-Path: <linux-next+bounces-2761-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E591DC00
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80FEE1F23731
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E206985956;
	Mon,  1 Jul 2024 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PO2uoFGK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD712C479;
	Mon,  1 Jul 2024 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828195; cv=none; b=dRwl8lvfUuBx2BYPZZoKjeWHgpEVWKyirVfDnl4KEaki3G1rr/6nhjoyzIAc7qZomwVvlSBIp6/ViagBBPpjG/r+tAAGrsCI1TzceIGMwHNDopuFw8L/0Q1AnBOT77xImzcnVLDJj6hFnsleC9v1pQQDVp3gg4+v0PlAm5qxrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828195; c=relaxed/simple;
	bh=XoTDAbWOLIESpoH9BMDOq30jyd4sCkuy9/DqEzEYJlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N5q2Tv/UtrJ5k4j4iQ4LRBcbKGPXqQre+U3kuzvZTuu9eRdWqO+3q7NSb8XIAybirAUBVEgWJPDbCEYMmqZJQOre9R8co3fS3pd8D+yeJSiO/1TqdsJfpnue2f5RM8mlapMDu9hssgwH7v5wUNnL4KOwIWAiELJpDSaYsomL+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PO2uoFGK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719828190;
	bh=TMcc74SmKXPi106EXt/29itxJEIX0AsitIPAF1hkIqo=;
	h=Date:From:To:Cc:Subject:From;
	b=PO2uoFGKDWWrv9xxcCuxxb0VbsuJFnNrd5AOBgLOVTx1pFqUF5hjz8qittFcXSNMY
	 ZzbGkOhcgdDFNtUxgwwAX2mQ19bvStMFlkr/muVxwHSOnm84B579uT0RVm4lovhTA1
	 8xBafPlzQ8oFVydhYh80LQV40HsdAfLiK3uAvMkaInnanP69zQWeHVz5hgnJy0h9WT
	 3ziXXBtk6INt1VVVSnH+i//hF6zDW8qQ8F4ekKqDpewWihQheoc7CTSBfr+pRy0UBE
	 aAaEFr+siRitCL6mRpkVANypZN2pGZ3C2TwBQs9DTAs6C8KeOMmO84ltwgkFWp9xyE
	 XFW5rD7tq/LeQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCM714t3yz4wc1;
	Mon,  1 Jul 2024 20:03:09 +1000 (AEST)
Date: Mon, 1 Jul 2024 20:03:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Wander Lairson Costa <wander@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20240701200309.5c6169df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KqrmHzdYBpv.Bdlr6acNAIQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KqrmHzdYBpv.Bdlr6acNAIQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a7accf658efa ("sched/deadline: fix task_struct reference leak")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/KqrmHzdYBpv.Bdlr6acNAIQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCft0ACgkQAVBC80lX
0Gz8twgAn211AGJ0Mg76iTz8WvyVqR0ZTioPSqaAbJSXB5QZezAMOKTkd1yyd/Xf
A/5sGYn7Suic2oOkuPgMYn2oBeA8DgNHaW61XAmTRO02RcU2xKbvXTWF5qdQ3Alv
wqg59aHhilEjjpSX+1c3hmTeU7wYKmioKCaDAPCKYODnSNsF8MYYqcPsGxP9iu39
j/BJAJSkH1WUjDlVOj5Z5Acr6eyE4HdMK5qNfLl0Df2hnDF5UO5BmnAuLTPHj98V
2VEU8bwf6zuTvKlKVw+t2qYMqIj99WGyS4RgxdRGxJVYWIH+0G44ciG06vHNKQKN
idff4Zt0SmVzKPugY/kQizXZi9Xlow==
=MbOG
-----END PGP SIGNATURE-----

--Sig_/KqrmHzdYBpv.Bdlr6acNAIQ--

