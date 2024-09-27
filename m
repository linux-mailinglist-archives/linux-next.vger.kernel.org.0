Return-Path: <linux-next+bounces-3985-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D43987C9D
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 03:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13CFAB219BE
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 01:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B068BD53C;
	Fri, 27 Sep 2024 01:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MlRJuwM+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0C41C6A5;
	Fri, 27 Sep 2024 01:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727400986; cv=none; b=IQ8em7GGuhOgVDYdXI/GbcmGXvtmYX97YMTD60hu/4jLNmI8hcVUfzACA7qyONrPa+bBddlBwsMeB/r5N3L1k5Bxh64dBZSCjm7KCODao2XrL0oy39SdshQ5cDiQT1ptL4rBjT7v38kRi6y6fAhHXOGwtXAsTXWuzKoQjx20J7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727400986; c=relaxed/simple;
	bh=/UxO8pdRkY1fwOe41jiTmYBnfvHHYBE9RpGigum8k+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HfwJr6lIjPGnPHho3MWUSEDra/zjldJquCSXQlniCTwjxQxZ6S1cQW8O9FoCFew+XsiilU+PVIO7ZM11ri3b/d3sPyru9LDfEQhSAO3ReVOGkpayJA96XgWKqlkx4yD1RcNnw5MRG/gS7Xs0ltvW2rFbFWlaJQir68dxvHpYpEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MlRJuwM+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727400981;
	bh=MAsua5Me1iiz9pzK2nJftJBBmjseOrYAc74ImhSJTAM=;
	h=Date:From:To:Cc:Subject:From;
	b=MlRJuwM+xSpop25XN0iRA+34hUfEzf+U3+xZz0RfFfxzUrgheo+7M38ptZGqxIaKL
	 Q1aJojRYzxKPKX2I1DBYaPUADBKgaWralkSHsD4BePhOj+aFTma31atjiKKLT8pui0
	 y2gzTzjywHU0Vzf3b0sww+cf4zhR0gZtOwhtBUP9cydpYCWrzwobDAbQWyg0FfvqgI
	 fffAqodHGGwMlQrF5orgxaaOyi/5bU25iNVflAivoXvjKN8jWQ0YFHTpQde2jkAOx2
	 AOx8S6W1LuaiX7Q0UYz/VoDSOkweO8N8uXGHpRcnEyc/tk3qfFcpbdPyOyvows0qNA
	 6X8CoHCWbziUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFCjd1K6Vz4x8T;
	Fri, 27 Sep 2024 11:36:20 +1000 (AEST)
Date: Fri, 27 Sep 2024 11:36:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20240927113620.7a673f55@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hLUib.QrRiz4W8dLoHm=.d1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hLUib.QrRiz4W8dLoHm=.d1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace_uprobe.c

between commit:

  10cdb82aa77f ("uprobes: turn trace_uprobe's nhit counter to be per-CPU on=
e")

from Linus' tree and commit:

  ca088d067ebd ("uprobes: make trace_uprobe->nhit counter a per-CPU one")

from the ftrace tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/hLUib.QrRiz4W8dLoHm=.d1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb2DBQACgkQAVBC80lX
0GyKIgf/T1wVjbZ9hQdhHAtkEfRHRfuYKsp3m0d/0Ud64DkERifcMTV47tWCPm81
IBcIc3tLiW9Eo+zrTGxnrdpJbJyhP9EhrPmv9HNcYw2qqzQag1/WghtV9zHD8jRb
wO+hcXV8xjNzl6SttoXNytWz0BpIYgNgDsZLfIscLZNDjyu35bXm84kUtGd1clL0
7KhN7gKzgpB47KE4keZy7tfuSrzSd2hyMHRoDhWtqI+NnDbyDhePFBmnmWYh6lhA
mmfqI6fHp2CA0UzTBzIMjMoyc8D/Bywbma7nUqjqlDv6cgSTNdIhP7K+P2sypg/D
pty0TIWHtkFwK3cB5dnaQ1LuRpGJ6g==
=mJCb
-----END PGP SIGNATURE-----

--Sig_/hLUib.QrRiz4W8dLoHm=.d1--

