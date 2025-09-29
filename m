Return-Path: <linux-next+bounces-8520-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D4BA9A41
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 16:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D36DF188AB21
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 14:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DD530B53D;
	Mon, 29 Sep 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gH0vK5NK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B730ACFF;
	Mon, 29 Sep 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759156834; cv=none; b=aSF+pSB2QvWJ1liAkVBtvqnpZC6z9pZCs8ZZwreLGbhhdRol+qFP1/VwR/xG4r+NnUSoRtQX5C91oZdWXTEKxwlgrwGFYos+jBW7LqDvJxI/1WoTu1FiaESoTMFrl+W51/0TiUCUIkvBfJzm1kyI1I2E/b5uQSMp+A71N+apxx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759156834; c=relaxed/simple;
	bh=KhhwJgJEsaIazxH4pCE5n54NtiohJe9tGuRAIekXIgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYfmxiZhuPXYHoOdp529F411rMfBb3Ezep0gwTC1XFXSnwiYE0AxLq8zBXI0gV2l3uLJxemwXf0F0/NsAp+NnaXDaOPVkHnH6Zawp736XFhxhMyxYCJcfG1Diyd14xuU9qIUvIMIG5Ze/CtMtUdBmdeAhPzznm+DUI/3OqcJ6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gH0vK5NK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDF5C4CEF4;
	Mon, 29 Sep 2025 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759156832;
	bh=KhhwJgJEsaIazxH4pCE5n54NtiohJe9tGuRAIekXIgE=;
	h=Date:From:To:Cc:Subject:From;
	b=gH0vK5NKAwJX1XhhwMSNte1PHV7ymDlMyF4RoZYy+Q8kgzoA/sTXs+TpYMJy/3WVM
	 aDl7LDfJDNSKI2rtpwlq9WD76M956+Zy4Nv3ZvU1a21Z/9pucjX16+D+idVeJn0IMW
	 cu6c6M0KDFF+A7IMaJpECjIYIKETP5RLicj0Fba7qqIse1PI+toZ8N340jqxZXyThe
	 kyh5ixPQqIOBjGrvSIA5loEbTjGDyu59tXTDpDK7Di2cWOlhitlFUNP7fUB9SabPu5
	 DpHqdvqs/qxyAmVOEU2bc7YOUtkOk3JuGalmzh+tjj19QIyHkH7tPpetdMUPti6i3d
	 Mxj2aLzxyxXbw==
Date: Mon, 29 Sep 2025 15:40:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vhost tree with the net-next tree
Message-ID: <aNqaXDjhCkEwpKIw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="okK0QFtoUhf3CW9m"
Content-Disposition: inline


--okK0QFtoUhf3CW9m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  include/linux/ptr_ring.h

between commit:

  4e9510f162188 ("ptr_ring: drop duplicated tail zeroing code")

=66rom the net-next tree and commits:

  4a37c69fc60bf ("ptr_ring: drop duplicated tail zeroing code")

=66rom the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/ptr_ring.h
index a736b16859a6c,ba90c0e6ce703..0000000000000
--- a/include/linux/ptr_ring.h
+++ b/include/linux/ptr_ring.h

--okK0QFtoUhf3CW9m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjamlwACgkQJNaLcl1U
h9Advwf/bsV6i9NnTBUT3Clwx1pSDh81U/bCnr0oO1gKLaIMgU6ldacTo/QE/xc7
YHtzAm7w312gNx3Q3542kGbrN0QKeytiw4pxFBE2u04a5cyUT8fP3L9xK2VK6o25
0nC+lwR484uiHha/vnBHmOFg++zCdmF3J779QOnvFZ8yTthKxJkvpiPgJgcHpBU7
loqH+jEwsBdx5sSzf53/Cral+ZopKxpIl8+rNBxpQMCEDet75gdZaMfvwIa4DSIS
SWDUoq9eaJw+vS78a4kS6Ov0ub+AXSt6aSzXZtKp5Mqw7DT7YoifbtKuNRvvW5hd
wQKRdQyFuFfswEAJN0LsK5GAQo2ecg==
=0mQq
-----END PGP SIGNATURE-----

--okK0QFtoUhf3CW9m--

