Return-Path: <linux-next+bounces-5917-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCAA6B3D3
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 05:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1E4D1895F51
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 04:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632C71D516F;
	Fri, 21 Mar 2025 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M2v7/0GJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC83184F;
	Fri, 21 Mar 2025 04:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742532727; cv=none; b=Tid/efhBs1gUiTk1hYHFsbVUIaUDko1/PNFQSZ2KACE8rRbeLXiGsE3q5X24XjTZyCbAJap2JYTgVdLM0HBf4dT7s5mxIMtsM9b2GGj3tPBF+M79bM3DvdM+ZbGd1sY36KatQZd8T+dkVi5UBnh6VSTvU0QQQuvXfsEZL+buUcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742532727; c=relaxed/simple;
	bh=VpE+gT0a4UR1Jy94CKOKTOXH1wCUdAcsLY8o3iPt6cE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qQvPFn7bCfu9EmkUHfjo8seQ0z8xd7THYcDCsT/5rmnTVZWkAY1XQNftKvhsg0vlgDpPSBhY6FQqy29+d/HH4lVFHAk0cwjDtsminakidWGB6XHvK8SEVLLjUfBVKArYW6g1GNG5JWR1yIQ2scnraw2rRTwxZVmflEe++b3immU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M2v7/0GJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742532722;
	bh=6IX4fIC0pg4XhhuZD45G3Tg7HdfjyWWAGnmlZsJZeo0=;
	h=Date:From:To:Cc:Subject:From;
	b=M2v7/0GJYcGpIKd0IURG2k5kKYGVad9ZcBK8yh3sG68Wo4PfDASBS3yQvKlkJmHWQ
	 neOX0Fsf4Lh+Dd4Brv0NzyzyMrrR0YrEAVEGrkHzhUZ5ode3EAI0LKKLMbPhgCrsFA
	 uTKF+UN9CB3tnn0SpzhZLhaFqE1iIXq99QnBiqw89u1UtV8PWdpSy5D8u570/CvCql
	 jkCfgTKMixT3hFe9ZZ510xB+/XiCW2kv9EUbArwqrRm0i1EFigFWFeZHmiQOHdu2WE
	 9xIfWVD1KaBstg3A4sX2rfQuFKrpF4eW9cAMjpo4+tHpRxe7eHkc4NkFtDBwtdphs9
	 TQM2WG09S/baA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJqmf26Lxz4wy9;
	Fri, 21 Mar 2025 15:52:02 +1100 (AEDT)
Date: Fri, 21 Mar 2025 15:52:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20250321155201.633e8aed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0C+rp0DRIX/O0lW/75YQvMP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0C+rp0DRIX/O0lW/75YQvMP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds-lj tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/leds/Kconfig:1027: can't open file "drivers/leds/simple/Kconfig"

Caused by commit

  f33c17919d44 ("leds: Rename simple directory to simatic")

I have used the leds-lj tree from next-20250320 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0C+rp0DRIX/O0lW/75YQvMP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfc8HEACgkQAVBC80lX
0GzNawf+N4oiu6e+myeu6SCKqwKGrQKYU6kvG+bZ9DUtDehALRQZDEVkR2rAEYWT
1BisICNU6jrlUWNQ7AmeXEWPLpiKYY2/yqWNcdu/jFGvZNlKiuvYI1F8Lzyn7Bp8
6ktSwRKNiQuV6JEC1MbTFmiLE63fu4k/qi+uoadWdAtvRVbNAwhGPHdD+vghgMnG
aHueQJepNc2SdM5y++mxfAzgpHsXuIOUCGOIsaQ6OPkyZf3scwTAsXdPCa0alizE
eDkdwDaOGGxkClfum4nmjL+NWRZPt3ixCaStc6bbBe5PaQ3Z6r0FmKk51k1+1tSw
Go9JtjWAYOmmzM6jNnBqGo8MuPe5IA==
=/FzK
-----END PGP SIGNATURE-----

--Sig_/0C+rp0DRIX/O0lW/75YQvMP--

