Return-Path: <linux-next+bounces-4752-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F29C4C28
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 03:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 751F81F212D1
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 02:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA0E204017;
	Tue, 12 Nov 2024 02:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gbbD0iAZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DEBE6C;
	Tue, 12 Nov 2024 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376903; cv=none; b=FKEr3MhuntkKt1WMQpdp0yRYRROEk1QeaBDv/T6AG9pkzEEoBxpAmROOOwxJFo/AJDdCepCP8OVO3A3SUi51Jf3pX/hlmJWcrHsYN0m/T79xXGlyYzIlZiRLF23t0DQmS7mAEQoh8TyzQSBrP4dDyoXpfFyzV1w3N/nG9O0MWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376903; c=relaxed/simple;
	bh=+8LGsdzzlLVZCQqTWHUyeD1wtghlFpt4cuzyQegcvxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=e4nQke+cA3lcOq5l7LQW7riyL/yPw+maS2OtTchJic0Mmj+TeyPPm5bxu5TMUGDhwYRBXpw47g9gJg05W6Fh/m3t81VgWcF5jRkA1+M70m73SkE7TfH8A5PnglCZs9T56syXx317f4unxDbJAY3q1q2OqMYvatSLXHXj2ciuLmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gbbD0iAZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731376895;
	bh=/kA9+A1NgodvN0hDH2XDUvnAoXoBcJd0zAysmhegbM4=;
	h=Date:From:To:Cc:Subject:From;
	b=gbbD0iAZzb22c4UogwM3Ze9FYkWRMqgZBI1nKj3Y93gkp/ZobAvT+uPKg44ahMMWN
	 ht/PRg31pe2XwrMSLyplKYl4Kd3+WsXHqm2MRKd3dWKaR4L6xcJ6Cb9d4fhY/OZNgi
	 bh4MIz5S+QoCD3DfmTWF+Xy/YGh0oHWFPkkX7c2rG6CfbiP5TTO5MnaIz/BRwnZq4F
	 +dybq+qCDiRN+17/tCYrocT+VVI8zn0HJzGaL3POvCGv4oV9rBYW2/Fa30rsFHD8tl
	 35h1wyBfimS6YjNIVX7X8FdAWFQx6W92mj7Vy8AySwCMRJ0wvqd4o2fvxO4rfEaItF
	 NPT0U1wUJmMIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XnV5V2hRpz4w2L;
	Tue, 12 Nov 2024 13:01:34 +1100 (AEDT)
Date: Tue, 12 Nov 2024 13:01:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Han Shen <shenhan@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rong Xu <xur@google.com>
Subject: linux-next: manual merge of the tip tree with the kbuild tree
Message-ID: <20241112130136.52ffc457@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JnG6NmnKBRYs/jYYj7KfV8P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JnG6NmnKBRYs/jYYj7KfV8P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/objtool/check.c

between commits:

  315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
  0dcc2d106615 ("kbuild: Add Propeller configuration for kernel build")

from the kbuild tree and commit:

  d5173f753750 ("objtool: Exclude __tracepoints data from ENDBR checks")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/objtool/check.c
index 05a0fb4a3d1a,f7586f82b967..000000000000
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@@ -4557,8 -4573,7 +4573,9 @@@ static int validate_ibt(struct objtool_
  		    !strcmp(sec->name, "__jump_table")			||
  		    !strcmp(sec->name, "__mcount_loc")			||
  		    !strcmp(sec->name, ".kcfi_traps")			||
 +		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
 +		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
+ 		    !strcmp(sec->name, "__tracepoints")			||
  		    strstr(sec->name, "__patchable_function_entries"))
  			continue;
 =20

--Sig_/JnG6NmnKBRYs/jYYj7KfV8P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcytwAACgkQAVBC80lX
0Gw+HAf7BRYfVQQEe59xrArlmIyGb0btE1HDPaPt10bhq4y4+UOW+QVIv2wz+RO5
TmJ1OJtoh5oJZVgZhuZKN9s78VOoOm50Il6xVKHL1OK+PJ57kOs2/K34v0zyJekI
I6mLLSZ+crN+pOQNL57Hwex/XlNLkZn63Lnr7iNwoO7qI08hgUNk/ZaSjru9nWTS
s4L3anSpBbRP7ISuW+YvaaTiL2wXnykfl3M0yWmr4jXF13MadELjNTcrMpvF/P8j
yE0fp4cm99hiEHamlSibRB/PYAmZgteX210ZDPh8dLjGKXZWh9qT7v47XnkCSrdq
qtVpkVrnOntH+XUrS9bRP0nDXFDyoA==
=Ga5J
-----END PGP SIGNATURE-----

--Sig_/JnG6NmnKBRYs/jYYj7KfV8P--

