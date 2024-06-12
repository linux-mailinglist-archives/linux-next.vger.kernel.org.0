Return-Path: <linux-next+bounces-2522-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88CA9049DC
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 06:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B731283988
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 04:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE5C1F92F;
	Wed, 12 Jun 2024 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lh6t4AK+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6531E531;
	Wed, 12 Jun 2024 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718165479; cv=none; b=q148C+9Ma03EwVfDxg1C+UyQSnFisT0cAO1HUhQMhFehdcU0gDBvY7z+tyQQLfcZZGY1vy+IazS6bf+GxYCbaWSCTUK4D4xeMPkK+zduN1R+m/hzHxIdmJQ0Vk2Li52Yl51adKwxvTuotFVGUW09HRtHzbwR4FWRMNq0CkOL4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718165479; c=relaxed/simple;
	bh=uwOCSGaLH5biZ5+6C4iGb8Itq4liabUfnQwqde3yftg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KDBPAQLV+6+kNJj2C2KNwVvDyM7sd8XFC6sYCHl/n6ivnc0vHSkQdMwDv7+e4R3oKtmYLVV4Yi0wG1dba0WAGOpSVupxqvd/6YCi0QfOVWkZCFopsK07s3KiWM1kOrwF3Hupm3kOoRQV/GaSKNRlimamoFGOu6Rr6NnRQm5cz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lh6t4AK+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718165473;
	bh=ULpr/3m4ojGt/7RZA+O762TgofoB1Z/E9cgEf7iqBf8=;
	h=Date:From:To:Cc:Subject:From;
	b=lh6t4AK+BH16T3GOiJ5FIMVIIRq6+gpSRiY27IsOI9JdxrA5P/VLk8GrpnHuCSINW
	 1aAqrTeOvf8QfASnDjRfE7IPAoYWj+fURP9RuHPb5IPxjU+1U0DI3B+7H3fMA5KI7k
	 /8xDoF1Kd3S+kiTDU09JXAdxfxkdtPGUMyqtdYIJlHhLUqmxCtmc+EtfKA6IHHiYTl
	 NLDnhsScpMYjz5EpY34Ht8TWGGoylzNP+sviEuCAkQnThaEEcvhR83advxMC7DUotw
	 6TcEQ8FxZGMEYdnDTqUcuoy+JyepoVOWEH4iWd+VsuxNcokCmIRRSsYaZJXqSUWaRK
	 PD56LwVQUk/pw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzXCh4J2Vz4w2P;
	Wed, 12 Jun 2024 14:11:12 +1000 (AEST)
Date: Wed, 12 Jun 2024 14:11:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240612141110.3aebb166@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/display/drm_dp_helper.h:127: warning: Function parameter or str=
uct member 'target_rr_divider' not described in 'drm_dp_as_sdp'

Introduced by commit

  a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS=
 SDP")

--=20
Cheers,
Stephen Rothwell

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpH94ACgkQAVBC80lX
0GyTlAf8C/fRIVfzIoRZrb+jFqhA08vy0+OmZBJDpnmiOHn4Xz4pRSrwHFi1mvmA
2brDKfqnTSogJwYMJzghZGh4jCml+o+FJHqX6Nv/K3KRfulGx1GIj7CZf5TKxBXC
VRVDhRKJyzPnKm1+ENDdGxX7RWIjDjImybfWiGkSjOzC9/LTXePvXY5zwkPhjUGT
JeGdWddhqybyj+JaHfvvaX0OaYcqWdzgb0zue9oLWv1KdU4iV9SpOSm4yoYYkajv
cFzhq81CcpVfWB13e2RS1Uhwider4C51gTEFBZW8J2crpArOaOUsC7wkF9OqiSyg
l7BmCeqPN64DK3vQkDcvyzsHjYtZcw==
=WYQW
-----END PGP SIGNATURE-----

--Sig_/Q+4Mv/fqNFRzpsRbNCOPjLK--

