Return-Path: <linux-next+bounces-7670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBCB0CCDB
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 23:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F966C3A36
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 21:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4F02253EB;
	Mon, 21 Jul 2025 21:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QoeufmB5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F772221297;
	Mon, 21 Jul 2025 21:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753134689; cv=none; b=S5aR+cSJc8qJm735JlJK/tTrrS+S+T663NFNMSmTGODy07D8j/l73RuUoXXTqQj+dJM3/h7JIhBFgVLLvPP0xgi/SzdC1hWyhSClcI+j5kqz9VIu9ns1Z89Unyu77IGhAcDERf+z/3VHUSHB7gpUcW+KphjWZePTshTdW76i4qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753134689; c=relaxed/simple;
	bh=QMFkSBrSXS4CvDe/aWesC9WGsdHoyu/5S+kCtUVYlYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FQZO5fJ5Ze9VEFX3M77yCdMKOtUMirWKONp16PuX8zes3i9YqLslDGJcvOMIuJiT602HEBA6V5lmfbxSl7uL/JCTY0Jfljj9SnDLFFAtjxQ1kAwowl7AkTUw6KO6myT5LIVYt6RjoyA0C++68TBWKKB9/iRDOPf8js44VNoKLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QoeufmB5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753134527;
	bh=4hOLQ1YnFHfeazq5prF47osutUz/9SaXOdaEgyoxeOU=;
	h=Date:From:To:Cc:Subject:From;
	b=QoeufmB5g6vj5SLlKuGLvNpWgBUZKEQd2hLUyIRO1N22WgDHN/3sXh+Ow3bnUbdqs
	 mxe11GHFEIKfl5C+3WB1GnsNX0rhK51Le4DA1W090gJbODn10RUzE15fqVs601yut2
	 i3eXu1hIjkeUfYptSTPouDmbt/qj0bujFn4LvJ65cQodAfOY2neOHkeNAPXvCw80aS
	 JCaUOfLeNaxsLf2z+b58rJoMotvBcpjWrgeViemp0jZ9C/wZtzjOfL11S4hO1nOVCt
	 K43m4yKrmzJUQozZHTlNwSM8yrMDkHYNDTCAkjpvfktyj3vb5StqPtBySOpO9Ev2/Z
	 75A4WPvnUwc/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmDYW2ZG1z4wbx;
	Tue, 22 Jul 2025 07:48:47 +1000 (AEST)
Date: Tue, 22 Jul 2025 07:51:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Abel Vesa <abelvesa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the clk-imx tree
Message-ID: <20250722075121.79d98b42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/01S5eqr4Gb1u+yxlzVcrqvh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/01S5eqr4Gb1u+yxlzVcrqvh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b2be1327a6ed ("clk: imx: Fix an out-of-bounds access in dispmix_csr_clk_d=
ev_data")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/01S5eqr4Gb1u+yxlzVcrqvh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+tlkACgkQAVBC80lX
0Gzwbgf+IMLPUSQbAsLuFr+JZMLTsx02eJu2HMMeeuooJSJouvkQGsozFmiaTqNQ
/OuebhaqwE/AlbfjghaQ5PKxp7OoTDN1CVRfPcqpwk/XiTnUV9dvfs7EnhQdZITf
/cTz10qnVS002xRzNTop1OK93wQeZv+e4oMt/2Vkie/WLTAnn8Jq1LOCxFbwmGR5
6K6Y2F0/uNyO0DKPvOhqft56RpHj4GKH2MSHm8sFFsnY4YIuu6RSQwVYADvriATp
sqW0fBVaHbiIyuiTq53sEdQj4o7LpDFGOzulXXUKAa+zZDrcMhUYeCvPJM2yKkHN
0CKtyWth/uFXzRibiS37hvzmgSrm6g==
=dJUB
-----END PGP SIGNATURE-----

--Sig_/01S5eqr4Gb1u+yxlzVcrqvh--

