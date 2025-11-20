Return-Path: <linux-next+bounces-9120-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A61C76AEA
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 00:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8071831A0C
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 23:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B68B53126B0;
	Thu, 20 Nov 2025 23:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kWIe3s5a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B0310774;
	Thu, 20 Nov 2025 23:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763682741; cv=none; b=acgIkXwFy3l4/NPsh66p6luTdOp9sXZzt5BryFm4HJss4A5b0mtrq/I1KRMmGy626krU7fdlYYu3tjZbjdhuxqDAF42aVf96ilneuDs+OUAMwbup0Yll7LqntpFA4NKQlIUBuB/YdYUsqdjAeUasWzDacDm07imMnb5JzbD1Pmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763682741; c=relaxed/simple;
	bh=ZeYE6I7Z6ru3xxFbvXAnJqnmt8KlthEsN0HVcHUNK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DEmbuuHB7irzwgmhaXsF9JjL547KH4qtFyVyDaAtXIU3+t6MbVveDE8GXQNg0fT4FSRrXkT0JK6puQEcjeO4cILjI1DD8YG6JzBUMC2GNlDIayNfJNWC9f0Nt2LMcZq9F1iTAtlDCnUk42Vf08Tp6+Tg5i/Qb3E94S3y6ThQghk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kWIe3s5a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763682731;
	bh=U0k6SZGEoYLaN1kJ27sizazLWq8azFq+RLrZZ3tlrv0=;
	h=Date:From:To:Cc:Subject:From;
	b=kWIe3s5aIuYmF4AxLD4wYx5YhJbt5LUlK4KAgHanWd8moYZsV/7FhHufXfAJTHTbp
	 ubdwDvu/zW6+leCS1VifpmeVkTFfMLhrlsHWk2Q3HUBj7FwDAXlMyT809GfqWbmGem
	 SeBUyCFyrMAOO8az7WHHUFsrU9vkuc/ltJc1vb27HUFjZVSBe+ARwxWop/rO8bO1qC
	 ie3ZCrv8fNamNZckm2N4EnL192w3K5b56E5EzuMCZqLlEyWEijvfD3dRzSP30cGL3I
	 8noX1IRqvDwFGpzUDFYSvXlZXMHOcEY5ebfHulWD6gWdC9s685jSHCXspNznx5OQW/
	 sJQmBvIYExtlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCFWb25vrz4wHY;
	Fri, 21 Nov 2025 10:52:10 +1100 (AEDT)
Date: Fri, 21 Nov 2025 10:52:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Tomas Glozar <tglozar@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20251121105209.656f0e88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MH0AgKavj96oC9rBe4e2PQ6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MH0AgKavj96oC9rBe4e2PQ6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f45a0cb29720 ("rtla/tests: Fix osnoise test calling timerlat")

Fixes tag

  Fixes: 05b7e10687c ("tools/rtla: Add remaining support for osnoise action=
s")

has these problem(s):

  - SHA1 should be at least 12 digits long

In commit

  4b8e202c6fe0 ("rtla/tests: Extend action tests to 5s")

Fixes tags

  Fixes: 4e26f84abfb ("rtla/tests: Add tests for actions")
  Fixes: 05b7e10687c ("tools/rtla: Add remaining support for osnoise action=
s")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/MH0AgKavj96oC9rBe4e2PQ6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfqakACgkQAVBC80lX
0Gyhigf8DANxsh8LVv0ICdjOI79H5A0Ugz5hxMrMecV6JeeUGY0PyOEQBSCCp4yB
04CCR1GPqkkfWeoVVdWDA1UrDzSi8BsA1iQBTkvG14vIfh+u4NTHYZdCe8J4/naN
3w1BfuVzceqdfn4VpJzyNDUxLXhbfDmac9b4MrJi/vZVn1+KHx9PYWL5na8a7TqA
CGyBylo0r4E8Ifng/JEONGjbkt/za4er9WtKx4LNXhZOtvGVu8VJ0O0Ok/vMYH11
wYt1G7cWL6W36Oe1rWY1ljexMxFWhc6RuTh9U4+XY1H1d3MW4ud2YD/WT0vAzsZX
bRpFIZrH7ZWyCOEH8Ch+QhSapbBNyg==
=vyVN
-----END PGP SIGNATURE-----

--Sig_/MH0AgKavj96oC9rBe4e2PQ6--

