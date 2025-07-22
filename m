Return-Path: <linux-next+bounces-7695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CEB0E6E5
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1514F16F665
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 23:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4DA287260;
	Tue, 22 Jul 2025 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g2Qwx4+F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979CE1B808
	for <linux-next@vger.kernel.org>; Tue, 22 Jul 2025 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753225548; cv=none; b=sTk5iknqkkArb/oID394JSFgkSZEpwA1W9HVAniGuMdEOQ5yKM4HBwdCgSYhXKk2T0pEe5arYmUxVfP43PN/0G3I+n8alqcC0LKG1jvBZRsb0aeqkIy2tJmuTmCz6sKWZJIMMpYPUwwiZqsdhWL+4q6s25pHL+a7CI8wy1KtwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753225548; c=relaxed/simple;
	bh=xJ3LtQh3376VJKuYx4q/hPPffXTtODHpFYf5zQ/NND4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RnI5H0VwtL2WGAeLi5zA9CQJoorVVjw2WoWIKITb2xxiaAaR2Hbku9sEUhAw/Jqme5gGRr50yzBgz2l+lXv57NemCEUpvRlP6FuFvt9193Bobykwad8HBoA92tEddyF7AEIzavimDQ8fP6eQIO4G2r3QCmqKpHho/MlJBakemP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g2Qwx4+F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753225379;
	bh=JxNIUZNxJi5qlKN93dLziW8I6ljlPVV4y5DEy4ploQQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g2Qwx4+Fo8MOWubxPkSUCe4uejPOG6jfeJj0TKRxIjjrWbJXOBbm41z3mXfAS90Hd
	 oPSad9BqZKkaC2zS3FyW2uzgzhX196q6J4jU64T8YKyfp1qdjYXfpgem37TI7QuBSX
	 JOQ384Mm7a9to2MCUGt+hQZDszG8l3yl/IR6W5ubBylteWBNouOXi7/eMFEi0neIIN
	 EMCqrxc/xYarRx5wWWUPLMEwFhNuuNKwo9OwkgsGY2gLgXSmoIMmHBc8WaNl3/TfRJ
	 q15oZXkTz9c7fIO2XaMa1MKZ6ovs++OaYCrteFkCFSeltkuw3kBGsSEWImqYNOTQg2
	 ETV/7Qotg4/8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmt8g1jWLz4w2R;
	Wed, 23 Jul 2025 09:02:58 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:05:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: <linux-next@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: Add the hisilicon branch to linux-next
Message-ID: <20250723090541.5652a182@canb.auug.org.au>
In-Reply-To: <687F7586.9040302@hisilicon.com>
References: <687F7586.9040302@hisilicon.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g7xmY+KOIpqpxv_vI22_5P3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g7xmY+KOIpqpxv_vI22_5P3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Wei,

On Tue, 22 Jul 2025 19:27:02 +0800 Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Could you please add the following to linux-next?
>=20
>    Repo: https://github.com/hisilicon/linux-hisi.git
>    Branch: for-next
>=20
> This aligns with the MAINTAINERS for the HiSilicon tree.
> Thanks!

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/g7xmY+KOIpqpxv_vI22_5P3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAGUUACgkQAVBC80lX
0GwmSQf+PnHWc3pRsQ5yggv5+B7VDHQfccUSW1vL9KuXWVTP7Sk9ku4+n+Wg9P5A
jRkcbcSlctXmJK4bbBnE0t7de/7ZdZp+zTUTU6hEshelNQ/+FNGqnoBe43F1cpXf
H2rlv51mb7CW9YTAqiik1cOiZ3KhqtrVE+8Mh3vbVAanSKh2F4jfYpfz5k24dSPI
H8F70WjCjJJ4QVxI2Q1LFWAkM3nELvklAqOv8ISS/LvSKAC2oVsFrPQYjhMDYBQk
dnVdP0dLfOgUyW0xU7k68N7cn54N7s28fcvqRt4LZqIMBESnrn3cQmYSlrTUI16G
it6X6JwybXtA4R7fTMitVnfb5IsVWQ==
=bxDj
-----END PGP SIGNATURE-----

--Sig_/g7xmY+KOIpqpxv_vI22_5P3--

