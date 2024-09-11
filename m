Return-Path: <linux-next+bounces-3734-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B39D974735
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 02:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 760BCB24406
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 00:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DB8B65C;
	Wed, 11 Sep 2024 00:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="deqSDgUu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BB79C0;
	Wed, 11 Sep 2024 00:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726013896; cv=none; b=dKNTJRgbvvEYG4XlR7tUEVPsH5jrHeqVke0B0MURIvPMLt0oyJEdR6W5bKBowWL0zLzLeYrGHRxFiQzJSenZ0O5w299IugTbGb86gGDL8JnqIjQ8OAExkE24K57Y1QwZ/0ov2sT8EiXXfmMJLLImPQXkbIhJRSsZ5AY7TY1NCyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726013896; c=relaxed/simple;
	bh=mjnFXIz/wtkItY8FF5V80CDofaNlc6qyZJMJmNCkweQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bLYjt/ClhotzNXc2+NMlasvkb0lOYl3aHferZEF9p06hLB0CCXof7KaQ1t09dUoTxlK8NJBFQbVSrAgCDGAEQvHQF/VLYRVSFBbXp6uRD3pc9zn9h+bem9FieGFFDRU/4DkhFXV1099N4sEgdYjTBOKezvCeCxHpjkSv50yBhQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=deqSDgUu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726013891;
	bh=HecXGA9URokwl4lTwUCosaBvaGi+rBWxqj3iUDMM3og=;
	h=Date:From:To:Cc:Subject:From;
	b=deqSDgUuo4D/1ym7JYCozbHrLBUv+rOGD32mg54VyyBSd689/qyjdB7qDCnVOcn3H
	 VMuABXMwCqLQ8/s55Xund/nZNbzengU7fMOA140AqvLqqsJnzXBAHAcb3pTlSmZeOY
	 Y1No0aXFqW49h4V/48hpgbeGcNgjc5PLwILPniU1dugqQtJXOk0FIFR6kZJEdo8hIK
	 srj4aJ12AFY1oEH+gzs2G3IkQpUO7BXnyFKpula7Dg7Rw5gPgXFf0hWlL/wR73uRkc
	 Yj0EPLzQgM8BhJhpgm64v6W4e0KuOKls85UrkAsMOSqBwqfWTYtV1Ar+5kGrbfobgb
	 uryZpReSgHBUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Lkp6sZ4z4wd6;
	Wed, 11 Sep 2024 10:18:10 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:18:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20240911101810.1d5dde08@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yKFosfO/xOBC1B6g4AGKtln";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yKFosfO/xOBC1B6g4AGKtln
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) failed like this:

make[3]: *** Deleting file 'modules.builtin.ranges'
/bin/sh: 1: scripts/generate_builtin_ranges.awk: not found
make[3]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Error 127
make[2]: *** [Makefile:1157: vmlinux] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:224: __sub-make] Error 2
make: *** [Makefile:224: __sub-make] Error 2
Command exited with non-zero status 2

Caused by commit

  04b15cdd611a ("kbuild: generate offset range data for builtin modules")

I do not have gawk installed - I do have mawk installed (as awk).  Does
this script actually need gawk, or will just plain awk suffice?

I have installed gawk.

--=20
Cheers,
Stephen Rothwell

--Sig_/yKFosfO/xOBC1B6g4AGKtln
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbg4cIACgkQAVBC80lX
0GyD2wf/dhae4gvQj5ZvBLcNI49aauw74dYTS5UuowzCmZ+3dCjZdobTXrrPG+Lb
+sDqnew4MeeVFk8DyNPHWnDlSdXh4mMtw10iSxpK9PpGfmPXNy3WAR+LTJESW81y
HONM3wPPSUU4qFfoaODOIozt1ykd3L9cg/uKIGggUv8hqeNnw7Ye0JxAIpDmy8+a
BvbcGRIC0IZ3P3aW0ONJqvaJ5sH4bKnFRzJjBlM4QgFDLrXhZ86cEYiw3M6yT2r3
WotI/tDqN4IfG2yrqhhTZnypGIsXq14xIR9mdJAWpu/va8it4reRAlpnMJkbTVDN
1s/kzlrHg25ydTi+HeCgQpYqtbqEoQ==
=2yd5
-----END PGP SIGNATURE-----

--Sig_/yKFosfO/xOBC1B6g4AGKtln--

