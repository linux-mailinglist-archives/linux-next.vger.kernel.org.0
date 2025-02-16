Return-Path: <linux-next+bounces-5458-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323DA373F2
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 12:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E0418894C6
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2025 11:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A093815539D;
	Sun, 16 Feb 2025 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sa9NW4bI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772931624E2;
	Sun, 16 Feb 2025 11:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739705100; cv=none; b=bTy4mt+9enLmujM3BF3SbuBPnwasRidXIiO72Q9U2cOsuBZyF4F857jSqcIN58ys7zIQBHUa8iUwoLKApieuWd8qDWZ0NotkFYVjfJmCDZwBaeCdwvOgfg6tGeXX+DarLSYTrLr8K2RhBHBAeILPMzwmAjjRYZHWYRAXsECeIKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739705100; c=relaxed/simple;
	bh=uOmry1/9nwb5c3upcUXJfES1mkzJ76wINHw8amDhFVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tM4LQbIrk3+2Q1Y1RzQbjAu9dg0ZG8wLTMRn/+FZmuJ0y3ARmUuG5LAgu/FjhfEoTmrH8Ydenl51sgbs9fmleK99bXTo4sZ0Hgw70DjLHOlSAa4bHDeXhpH3Z8RROJenrhYojCbmIZmx3jM0z8kdzVMA8Drbvjo/yKmT/A2Fadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sa9NW4bI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739705094;
	bh=y8OZwAL4vyppIUoQfFhEXeABCEmYaNE0iem0dDlxlps=;
	h=Date:From:To:Cc:Subject:From;
	b=Sa9NW4bI3a5ilnpuG8SjkH+ldhfjdAArAElfX6OQbXIgKl271Bf56V09xcwij4Pch
	 BrGUjwEMivInlPnKRt8EP5JuYAIy0TAO6uZPWx59sBJAiYeIcey8ELHy1OewDYQOo0
	 x4xnVF0rVMpZV2ruvOo2tHoTx24xaId5RRxxNz7mkzR3dAvObL7YK3DXxeXg1s/DWf
	 P+qmaYBTOxExUN+0MP0VMh9yESBZ+R7NOGRfxforgsRC+AI/N7luVgc8CyePafZzKV
	 TAFLmCmMECVVPH+XK2BFBq5+kRhwiF633hs4JaPHhLC7HWBL2Q8NU44foWDRTWoJyI
	 V+r9VwpeTfkWQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ywk3B3Zgpz4wvg;
	Sun, 16 Feb 2025 22:24:54 +1100 (AEDT)
Date: Sun, 16 Feb 2025 22:24:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Matt Turner
 <mattst88@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm tree
Message-ID: <20250216222453.50b352d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YjW6b==FtpboK5mbzzGf7b.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YjW6b==FtpboK5mbzzGf7b.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  8efb49fa5fa8 ("alpha: use str_yes_no() helper in pci_dac_dma_supported()")

from the mm-nonmm-unstable branch of the mm tree.

This is commit

  1523226edda5 ("alpha: Use str_yes_no() helper in pci_dac_dma_supported()")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YjW6b==FtpboK5mbzzGf7b.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmexywUACgkQAVBC80lX
0GymVwf7BiO4ERBVj/+id+VqNh8kCCPSu7NreB8fvGK5MyY+oEvDTqs5q9inBBRs
xOP+D/aHrMTHxhEVQgKhTHyOjjcYmwsOaLkfNicOsxPDXDwPiUDcjVgqwQ78QQDv
L1dMMStNESM1nkInhRYa4d29mfJMeIBA48AVy0do8sIBpyQypfX5Ogq1aq2GvtYl
z9u6sS8cEmHDQ700Wlc01hcOP02z8VEmajJSjmvomnxXtv7K/X4f5mfYVmLGHSXr
qRwtPwnIa4qhkrlTiDg5/1KgXDHPz63647U1GWE/PQ9dS8FVI0M2JqtoW3sK+Qkb
whforn1OWOwQcB9CnI3lHbSAWsc0rg==
=ZClk
-----END PGP SIGNATURE-----

--Sig_/YjW6b==FtpboK5mbzzGf7b.--

