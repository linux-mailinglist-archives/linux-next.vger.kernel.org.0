Return-Path: <linux-next+bounces-3462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F82961A08
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 00:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969E71C22983
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 22:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FCF1D0DE4;
	Tue, 27 Aug 2024 22:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ef+Ay4sX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46F0189917;
	Tue, 27 Aug 2024 22:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724798018; cv=none; b=PZ9vAAh0h4UCCVydaMIvWu3nbuJo1koUZioHV8Hh8QdN+lOI0E6YBOAKlBcp6yRh6Bgrl+HkOPOgfhvilIRp9X6hVFJQwFkkE27OlIcB2t4e7Nb06MINAVodCsV+KU5RLrG/vU8t0coH0/jIUCXqJnicTJAP46ZpjIememv0epw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724798018; c=relaxed/simple;
	bh=qWfJM6XtvOX3xyxUJx8orxY3Naoa4F4l1qUESNUOlIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l+cQ1xyPr+uyD9mhQZysX0Os9BhbaQ04xKrymkh1aH1a8RVKGKUHx+3aVBQD6S2nX5KPax/M8qXxwJB18sz/VUrkY/UnDg+t7ShoLuLVbcqoCPBPRKKErfg3BhMxA2KnBFdjETjXiP7ZggL/OQtWsAyf2ctWorc6fVFkI8ZG0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ef+Ay4sX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724798004;
	bh=mCbPbc2Lf7lZFFVzeCHqpxdUxsWbdbxjO18xn1V3q5s=;
	h=Date:From:To:Cc:Subject:From;
	b=ef+Ay4sXya3S4e4n+HZVhlMytBR5COd084DIXYJ8pqOfgsGZQupglVFB06RcLwN0G
	 LPMfeOGTty61F3XIMlNLW036AjfiNjEqj+aWMneR1P4kXqCw30gl6I8HaRKYk2BbSf
	 j4aOl0tdtKFxmcbtmjUdDxx91ljLipgE9tb15IFvhGM6vCoCkYPzNzSyUcFiAEA5gT
	 23vF4RZE4lRSPXd9ShqRN4Urlw3qkRbVNm3EjqlYI8u0coKaQxJnWBtB1piG9VWeLl
	 equcFqiovjssldR5Cqd6VZ4SZyDM7EcwM7kYWnWf3ulL+4s1wWGjvSdJyl2kYTpA85
	 FCA6rz0efPA3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtj4N44vpz4x2d;
	Wed, 28 Aug 2024 08:33:24 +1000 (AEST)
Date: Wed, 28 Aug 2024 08:33:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <20240828083321.08802164@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fnSEs7lXinosh5uj7H=qcPe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fnSEs7lXinosh5uj7H=qcPe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5785ffa39009 ("Bluetooth: MGMT: Fix not generating command complete for M=
GMT_OP_DISCONNECT")

Fixes tag

  Fixes: 12d4a3b ("Bluetooth: Move check for MGMT_CONNECTED flag into mgmt.=
c")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/fnSEs7lXinosh5uj7H=qcPe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOVDEACgkQAVBC80lX
0Gzq+gf/c87Ma4KT/B1rsSeS8k3i6GDawZYPm1mf+1D639wlP6uDWHvXLpeuWs9T
7NPwI8TC/48wZvRXMLV8191phyCUsCMXQeCQZHNwEMc9AlkynIWeqr+OG/Mr0JeW
d11fJj2hj0Vwv+zh57n78n6yABHapsZBxFQf4vnoo8ZGeyMzkeFEzW9BVx4ftDM6
/St61dGUr39rChzbg8WmBSXa+x9BHVg5KMQGncNTDjSeH7xgoqrnbFvyDCf4fdfO
fNunYU2F92MEgA6JZFaZTsaFClZVQp1iGKIQY9G+QpVQx5llPlxuOViZtGsZpRdG
O9hkKldpTrvBs/EKolGQbwJQ/RagxQ==
=Xxqa
-----END PGP SIGNATURE-----

--Sig_/fnSEs7lXinosh5uj7H=qcPe--

