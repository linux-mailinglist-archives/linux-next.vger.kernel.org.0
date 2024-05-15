Return-Path: <linux-next+bounces-2307-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C68C5F1F
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 04:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A34C1C21526
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 02:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CE436AE0;
	Wed, 15 May 2024 02:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CzZthND/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94689364D2;
	Wed, 15 May 2024 02:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715740686; cv=none; b=P5PqOT5fNNFE5C/xAC2uQUx9B+gSDbh9WVJzag5NMlM1xvd6o9DFew5nXRfX6aZX7rnrO+lPRHfQtr4LkXSWjndPXhS+4FmfD0z3EqPD8zEy/xJpy0f9RF9FyuUfvy1QshcuYfMflXrL0TGcQTVndHqtg7XEbz+f9tUf0660PF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715740686; c=relaxed/simple;
	bh=fdnNK8EA+YS34XB3xhvOTBdinVxhF7TYHT979IK1Isk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q/DQWP0RSQBIseLqd1BAa1KVAyKzuatrdFMyAM6rzSHycUYCqqpuCzjQfvAGr6RKvcVx54LrvoM+hZSMVXj8Kg/F8Z81Z8DEwEWk4P5N9wCvoKWPy2KtQmrfz3oXmDRk6Udmd7d9sjC0Rc2wjuufEBT1EZJFTYbe4hLj0fBKpmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CzZthND/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715740680;
	bh=hCu80+x+uxfZ+hDUfZpGx8ICgUdnOeiPUZ1GH0+k3IY=;
	h=Date:From:To:Cc:Subject:From;
	b=CzZthND/ARQwmBwTVs6IWF7FmeXg5OOhQ2BTrbVXbE6mk3Wjuma6BxDnnassa/mWL
	 JPG9kdFx47+on30LzVL3tHJtuFC17gD7TiHOvsRqhjE8U9zQb4DFDBdA4AWocCwcjs
	 qFpZ9JVwxHr/0CRlzSRw5OBymStkr7SVjhpBhO50TZNqsKpYzPQGI95iscQfvtSEBZ
	 SixiC9Vl/MWMMiunWqWuSKK93BE4/s1g5tCTFC0B7mXA5grxtMBMTj6PUGC2ftpcyS
	 nKx6IR2nnMotG3tSf4sd+o8Mx/4BWAtu6mLkTL2K7aCWRTKjYBKT7sRfyU6BLLtFQ1
	 hYNOJ0OJZelZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfHT44Fsnz4wcR;
	Wed, 15 May 2024 12:38:00 +1000 (AEST)
Date: Wed, 15 May 2024 12:37:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>
Subject: linux-next: manual merge of the ftrace tree with the
 mm-nonmm-stable tree
Message-ID: <20240515123758.30904383@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KSgvXggGgL+9b4U.DA5HJSD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KSgvXggGgL+9b4U.DA5HJSD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  init/main.c

between commit:

  212f863fa881 ("bootconfig: do not put quotes on cmdline items unless nece=
ssary")

from the mm-nonmm-stable tree and commit:

  efee03a50c28 ("bootconfig: do not put quotes on cmdline items unless nece=
ssary")

from the ftrace tree.

I fixed it up (I just used the former - since it has an extra comment)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KSgvXggGgL+9b4U.DA5HJSD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZEIAYACgkQAVBC80lX
0GwcXwf/d2hNSVlcoG3A7tKQknNtUGBpMP7gm9ZLsUonK8/g6qoWRkDV2jgBar7Y
w2QB6nvOYVYqjuRpxqSVYmQSFHdQA5WATxFFxSp+AXaqOpCfUnMZ7ed/ywdJnudR
Sag1IuMv9niGhbDMwPB/uVZ+hwLBkCEeprGaF25kA17rcBKnOtzFva1Y/lq9AeeJ
8AfohaG7SfZCykc9j6gXfPGTpnOVyvMMCm6eYVzL2wYedTdYgMgab9IZd23T4DXk
2la3IazvLkCkaWnWSDm/U6HL7i8pvAraLXWJZOySgPyQ7zIi643VPCz0S8Evl2Ny
5w4BXa/yQs4CV89vDRBlIg0JEOy6Cw==
=qJXg
-----END PGP SIGNATURE-----

--Sig_/KSgvXggGgL+9b4U.DA5HJSD--

