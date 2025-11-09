Return-Path: <linux-next+bounces-8902-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AF482C447C0
	for <lists+linux-next@lfdr.de>; Sun, 09 Nov 2025 22:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A3184E1F5F
	for <lists+linux-next@lfdr.de>; Sun,  9 Nov 2025 21:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043EE223DFF;
	Sun,  9 Nov 2025 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oGXZHmo6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7451E8329;
	Sun,  9 Nov 2025 21:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762723909; cv=none; b=WcUPHE/NqHgF6UWS61LvlupzYn5repv1l4ORRsAlW2mNHVvxNInX7KSR2LJMV3nH9Eu6IIsE3IFLTSxhVnTxWh7BdDDP96NLQ4lEUTUvtD9lSXwhhL+nyx4J6A/WR82u2Qphw30XE7Rq97vk8aIxZA1h2v73w5JDXf6FyEGwIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762723909; c=relaxed/simple;
	bh=bUoeuxsyO0NRo3qpe9SCZEqBV4/ZpMd0vqu1uFwztR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=orNQgLa/0dsYsERNIKM1G7xgrZd8+SxKpb5ADL2iyEKKc819AlMMDXSqrA8/SVq0G54adl59lIz66lQ25oyFZWH+MDcmrM87WQ01QxxwNNNM0rYjWCM0Ma3WDBBQ4a/p0q9ULydqXoxvaoZPY0P0boGgTNy7IXWwG/9slDqvvlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oGXZHmo6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762723902;
	bh=jrgriPHzdwq6iyiGiVW84DnL+iJzoriYEGrXXlKdgYE=;
	h=Date:From:To:Cc:Subject:From;
	b=oGXZHmo6oNhSTkOS2Wizqbj3zpUg3tumFEabt7x7T6KuOCNdS2j++tCE+K38Ss4So
	 nfhTgOWJFZViPQj9JNgtlSL4XPBeHSUzCWwEfXI+d85/W8V/m6QsxbVV43hdurJCjR
	 uEV3oVya/KWbdcYXK3cwKBSUF9CJ2DD00opn9AsPy6JgrXJeJqXXjjH+iwN5Nap7uX
	 6YCHyaOO6LB+UqV2C3oBSUnLYmY0One8Ejm/3Ky0CUJXPZpWbvKyEVVeYwgxh9lMor
	 Lxk7RL0hpg84nGxpzzwg4pIbH9h4Z0N7VhDSg/UrSWVz/8weMI0/tP6bpu6sUGoRQA
	 eHMfuMaMlDkeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4QwZ4Rnrz4w1l;
	Mon, 10 Nov 2025 08:31:41 +1100 (AEDT)
Date: Mon, 10 Nov 2025 08:31:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the loongarch tree
Message-ID: <20251110083140.67ca8722@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JH0OioBltEyL3i7EZm9+.FR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JH0OioBltEyL3i7EZm9+.FR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4f82248f363d ("LoongArch: Let {pte,pmd}_modify() record the status of _PA=
GE_DIRTY")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/JH0OioBltEyL3i7EZm9+.FR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRCDwACgkQAVBC80lX
0Gy4Dgf+NpVKbojEjSasgo+koVLPM/5LI7fRMndukJdTDHa614HT5tL/RCahI0fL
wrjk6fQ+gP0/MCgPYkJsDQ/0LWkvlXqwsmuUYpLKeBTMp4sD6qXLQNuAvo5fNwPG
v/eBVfMGm24yGPM7gkaWjIBDxsu0/yhxDz/+MXuJKbfU6NB5+EhaPhkqnPGyqzQG
aLrFi1ijvDytqCUA3IkdbllxAAa05sRStBL9BJtlqVAW1XT15xadJ4P1HUNd8KOU
H4XLGBT8CrEiGxlqoeD8p76syxcBOwurtcEed1aAqJLe00T9EVz5l4jiwplOM4ob
bVJ8+kAVVVZDQ59bRM+IxcNA9dyNFg==
=i02o
-----END PGP SIGNATURE-----

--Sig_/JH0OioBltEyL3i7EZm9+.FR--

