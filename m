Return-Path: <linux-next+bounces-2375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D28CB642
	for <lists+linux-next@lfdr.de>; Wed, 22 May 2024 01:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27DB41C21B94
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 23:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC96C85649;
	Tue, 21 May 2024 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gIztIkT0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CF5579F;
	Tue, 21 May 2024 23:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716332647; cv=none; b=NVtCZW0kP5nt7hbItEtlIZp/Zg1uyLtv5OmkMbLzGkJuZcRFBki1kKeNrsa2V9xMK5qI2qZlXAjEXWOEoLa5Rw63O/XaNPnP6hmNSpInaWTmSu/Nee2srn99K/TGa4QeDSDL72Nfc1c7T/ATHa7UJd2WNLRQtUkT75ttQQj/ISE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716332647; c=relaxed/simple;
	bh=uU493qNl8Qt1zL3HSPNR/cmVFEpRdjE18t7GID/lt1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uND+l0+azb8hKAoKC1WENuPwPV87eAszRAKpcbuVeprpCnAd3gCPtGCtccEUxUd7tiaHr+uQBP2f1g0CGiCaxiXtJl2dKgyRRBjgucv0+oIlkuryioqE0uF+BOSL9+NZ3l8IYTUep34sQnppHf8CQCfHyjwImIs9Eb93vSmWdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gIztIkT0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716332643;
	bh=AxT+Spph1wgNuPwBwNjeSkPiACdg/bXk+3ATRuAuvuY=;
	h=Date:From:To:Cc:Subject:From;
	b=gIztIkT0oRsUjrN53V1DTOh7304pH6SiKprgoDsUMxVpPoVUY/wPuShTLalNNYRu5
	 jsuujzBqqGAK/NQNJD4ZQHKI9/O5EWqbu92uIbCV/pB7BxVWu6HGnYydbdVKCgREzG
	 9qnEJt2dIzhhdshrEnmpZCiwqwYHOEv6CPut5PloUDMW3Wo3ymhvrY4hv3KZx/0HdO
	 G05C2qnuRTZMYPAqxDOJ+qqT7uTlLgV2u3rGbW/iT2OoG99Iw/LgJmrXQ7lkEWV8h0
	 YDrh1PlTLrowdWEoSvfJKdSQ/JOphD0dtxLGZh5Q5p0uWKyFvpj7cebPCnxT+c+Luy
	 8BYFztmgl5Q3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkVNz0fKxz4wx5;
	Wed, 22 May 2024 09:04:02 +1000 (AEST)
Date: Wed, 22 May 2024 09:04:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20240522090401.4826762b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.3Q1U2I/sw12nPh6hiOJOGO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.3Q1U2I/sw12nPh6hiOJOGO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  15c4fbf8eacf ("x86/boot: Clean up the arch/x86/boot/main.c code a bit")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.3Q1U2I/sw12nPh6hiOJOGO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNKGEACgkQAVBC80lX
0GxG7gf/bjNUSurjUffrgdp9XtVjFHobNBYf7axlilNLtJDXB/Pj1thOMJSzFRwH
+XBZIMVEmmwAI0cS1OJu04nZizwFTHybVq2j4WLhOGWrn3xEbeCBRshbAZjwN74/
hhhvgrvdAyGH3oCf9qdxgPM6PdcYkNdAevfff1YBq0TTbUk+C29UGMNMKoNL2cI6
r5NqZGsoVIJDDveMUnbHnQn87URta3PrR3io685gn6g8mf3x2VigMpv+pFWX9dec
gDn2LgJ/Yba8Xe9DFm6Zyi6MW3obMpa20ySkcAiAg6MJg9p/ZzPlrLUh1VGBKVek
dG2S0vzZLpumi7FwmC81mR25Z1BkVA==
=vqSl
-----END PGP SIGNATURE-----

--Sig_/.3Q1U2I/sw12nPh6hiOJOGO--

