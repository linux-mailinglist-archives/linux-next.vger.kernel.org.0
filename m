Return-Path: <linux-next+bounces-9078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86AC6BC28
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 22:48:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D900E4E0576
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 21:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB59B2EB860;
	Tue, 18 Nov 2025 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m+Ws29r1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45BA2E0926;
	Tue, 18 Nov 2025 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763502512; cv=none; b=HzDa2dxXaMJaDh8cI2brdp7+VhqVLqz++2I0X2p1qU+JiraOxAVxuLgON5ZoEkLlVOom6kBu+Hhpg4Z6iPNmrLdXPd3IPGo5Bmzxn/A9PCA1PsYTXvIkW0dt0VeFr+eudOViFXHIrp4PbQJ7x2x3qxZMBc68g5MJHPr3QJoGzeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763502512; c=relaxed/simple;
	bh=+/W20/PlGtE9RotvLegJYTqxmLnTTG0PT8vaIiamB4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uZfSp6I+R7k9OyC3gsmql4NsLINGClxE7NQksKdCE6FQAWjPTMSGVDT+nTSbtx1ggQ+LxtAJJ/HImXkSKpt3nqPptU+ooYw+p4c1M8oXIgAypNuUdw94bQmuH531JEYgeseeIdnzWk5c1VX1NYSofNFbdcPXO9qCiktB484XOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m+Ws29r1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763502504;
	bh=zJcA4iiaUStggvtieDMYAUbkCze/T2T31IfeCKS26ig=;
	h=Date:From:To:Cc:Subject:From;
	b=m+Ws29r1tAgYDxgweSfdwNBGeVNLPYLBRWzt+JgfBCISQUEPtIR80RYMoFaIMv1fc
	 Id/v6wFuz8IZfXCvsobt0DeoYQ32rEs/13pLajPAYhwjs0g/l7YXLx8nxUE06d6TiU
	 1AIMFcDDU9mmowxLcxLlzxVFP41WZE3A0jW4it4W8etR3vSQhTQHXlxsAFYJUOmyUS
	 vJMUmsk/1WLIvzXarJvFayRnppm7moqitTsQUdit6p+C8PQhEoDwdIefMNvENM18sh
	 d+7c7jtq3kyKRLrk9xlLZXvTCrSlQTba81SaIUQCegQYYcVmSUCN+FxWTWakwZFnNg
	 m4dve/3OEiKiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d9ysh3ZJvz4wGT;
	Wed, 19 Nov 2025 08:48:23 +1100 (AEDT)
Date: Wed, 19 Nov 2025 08:48:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Xue He <xue01.he@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20251119084822.18534f63@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QMg0909rWFkproXBA7.H4uC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QMg0909rWFkproXBA7.H4uC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ddc32b7f2921 ("block: plug attempts to batch allocate tags multiple times=
")

is missing a Signed-off-by from its author.

The commit message looks truncated ...

--=20
Cheers,
Stephen Rothwell

--Sig_/QMg0909rWFkproXBA7.H4uC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkc6aYACgkQAVBC80lX
0GzTTwf/VdfYyx2G3aibneZwBMhFY5liJ2PTPKlVv76BgXxz4S7ogapefNwqk7Xx
6ovHONnSYEB1mVkcIGtw/z+1Pen0OqJjXGoAcHVuU3/y5IawojRkfs8no3XOtPDE
Ejl22RbRfmMRZ6gnTu+IRZ1GUuQFcNo+k/yixLiv5IVLt4qhzhdlEM3EFTjNky8+
BZCR8MzxDVtnL40e4JzVPJW6sZB96z5xbar249zSvu9SRscF1gg6ubxZx9sAyNsP
uphWIyKszPlCN3WxYeCDzs4KxXoJYSEKjd8qqiCCNd0I3eS2Q17P9oB5MzedMVQW
/DX0mzJT/2D2Id1tRHSUD+GZUCk62Q==
=HQ5i
-----END PGP SIGNATURE-----

--Sig_/QMg0909rWFkproXBA7.H4uC--

