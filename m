Return-Path: <linux-next+bounces-4803-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F479D1A05
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 22:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CD5E282092
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 21:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B1F1E0E0D;
	Mon, 18 Nov 2024 21:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XUpg1C6P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E791E102A;
	Mon, 18 Nov 2024 21:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731963785; cv=none; b=Edp9o9mIw14eoOws9PpnvgyfFQZArsHlCp7WgzzW5Nm04gNhypufPo5CIqFuPeV2fRGQQgRkcN7lYSH1LUAceaaPmogVQFYGt0tvTZtTr61WNnsLENoIk5Bgjc9PVayyEJpVJGi3P6cJ9RW0iDIFpoBSqi+BU4n0ZH5zkW9OOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731963785; c=relaxed/simple;
	bh=NlBwZHGHPMGyDW7AEDK2z2JS8dvBsx9JXfIEwGotLck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GYw2eAUIr+PCauS+OtRbRBC+8lZ8wSknwRG/56ahVAH8E4/RG7kxIv3sjhfh6G+VDvzqVJIs5iUlKIgxWPh8NQXkif59qdjBjPGvGzMOPKHpJ23mwrE+EVHfygrk3A6BeUBGpUhRb5c0ZdThTxZaS+sQpjZyO3gpChI7zkykiq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XUpg1C6P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731963777;
	bh=S2m2ISQL/DLp88Wm59cUZgwGAj8kc1IQWeWRU2sVVww=;
	h=Date:From:To:Cc:Subject:From;
	b=XUpg1C6PMe3RkY3i0xFmBaJ2GJAJPlLUMXc5dT6z3P+HpZFvbpNKh2xDrCvXS112h
	 bjYSOSZWMF4vzcY5yrYjScVJK25GBpHP3autbAVHt4hYnM1dOQ4o/8Dl4rGmSEo8Rf
	 01hf1MCXnyEee+K6rgftzjrgIyGjT025GaMNdd+G/LXe/o7aTa40XdqwBIGjeaQ/D4
	 6o4XkbLFhtbY0MlrjCuz3bj7PLSmMmmy5uXWSQLR2h41LHm6oFfEtoBu8jmwmY6vat
	 82ZZ33gmrU6p8B30reKO7IJKi7I8fTmp93KnrTIgjOOW1PYy/osPmghHYvkdTKRqaj
	 5sIRQkjFf8kIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xsg7h6fB2z4xfX;
	Tue, 19 Nov 2024 08:02:56 +1100 (AEDT)
Date: Tue, 19 Nov 2024 08:02:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the tip tree
Message-ID: <20241119080259.2d77b558@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H.6msWpGgaWpz7s6CreEqS9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H.6msWpGgaWpz7s6CreEqS9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  96f9a366ec8a ("timekeeping: Add percpu counter for tracking floor swap ev=
ents"
  70c8fd00a9bd ("timekeeping: Add interfaces for handling timestamps with a=
 floor value")

These are commits

  2a15385742c6 ("timekeeping: Add percpu counter for tracking floor swap ev=
ents")
  ee3283c608df ("timekeeping: Add interfaces for handling timestamps with a=
 floor value")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H.6msWpGgaWpz7s6CreEqS9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc7q4MACgkQAVBC80lX
0Gz91Af8DFwqomYNK5Z+PlP6zDNbDQXwNE+suYV89BHfiwbcMoTe5YZtyS9/R7df
Amkc3p/G97hzKvCkIFeegmzGfBWXDA2nnpUPW7XiTX6UT7j86ebz/qJBA+meHXB7
u4OiR7jp7d4xw9U8B20MxfFFhYw9QZwhfg+J5d4zTulFR72m9ZMflcztQQ1UDmL0
ogyJQZyh66TK+2TM4hlKHxOl2gCZSX1HHo+vQ6lsxlUbnnbVVinqvK9iqI10PPpR
GRb9WyrrjDB9WsMv2TBNc1B4lce+WCVXo00P5mI2SJ3yiTQl4Xttc+gPCkObuqQ/
f5qmEPiTqLCDJb3X1FPOlgwJdJ5IHw==
=6hgl
-----END PGP SIGNATURE-----

--Sig_/H.6msWpGgaWpz7s6CreEqS9--

