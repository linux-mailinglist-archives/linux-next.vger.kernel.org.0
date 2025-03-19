Return-Path: <linux-next+bounces-5881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B996A6888C
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 10:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85792178BF8
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 09:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E2E2571CF;
	Wed, 19 Mar 2025 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ifISZfNv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7993725335B;
	Wed, 19 Mar 2025 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376895; cv=none; b=SUNg32ZD6egbNnzyxjdu6oVYxAAAnXcIJSPIHaN8XQOicB5DrixiTM8M8O3uQ0QWn3+euIg7HzK/wKrAmbZeIhwO43no/ybhHJkG2n/JaMNCulxd5HLNbiAXrMTRXvbm3eTueVgeQV2xOaXp+1cchZcF8HfowkGg/nSK4BBv0sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376895; c=relaxed/simple;
	bh=7iRreKMp4uv/ls+Knss8Xl20fKJ+g1JXIencg+k8WvU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EFMmUq69HeIZ3KKmpYShcYNjF7XtgGdxuD6NmtGX5EKcHzeh1xkPnosW0RIepIHRVNEtExRsOmyqTvCnuf1gMxLJQJSEsCZrtV5z3uL75FUgKLnxdp2ucMllBJQH8rDh/AvtngGG2ZV/yKmuFHocaqrObslOXbATIT91CSvk9zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ifISZfNv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742376890;
	bh=7/MohhKR+11sDnpcy7Mo7u2pOk44eb1iqGi8YTyP2OU=;
	h=Date:From:To:Cc:Subject:From;
	b=ifISZfNvBzOcoKcqoobxYqft580v5hIwR2bKz7EmnR9ocp1cVjOZVZ8C7XkGj3qOt
	 d+9xQN/MHLModwJMBVLxa313BXESjoZy67s57nWHHKw8rf/0aQL7s3h3C1hHJSjMwR
	 Mea+OIeNUWtLu+tGLsWVCCEISp4RwLRcP7+NiyIB7f3rI9KvDL+d0hAGZvXUE58HTH
	 Yw8Xkn5P0gnvenMAQDXQi95KTwSf4lzauk+blE9K7TT+eAO9cldoCUWyfspv/s4BfY
	 lKUgXjH9/lgpD8Xihwt/lj032iAOfOyl9bXXWALpaqjlLjTqW6n23n11AOeahlIpPB
	 YdTKpzLmWPwRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHk7t1YF1z4wxh;
	Wed, 19 Mar 2025 20:34:50 +1100 (AEDT)
Date: Wed, 19 Mar 2025 20:34:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dominik Kaszewski
 <dominik.kaszewski@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250319203449.386f9e00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y5jd7EzePGe44WaoDpwtojz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y5jd7EzePGe44WaoDpwtojz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of ker=
nel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP=
 Locality Check FW
drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of ker=
nel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP=
 Locality Check FW
drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_=
LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'

Introduced by commit

  84ff5895399c ("drm/amdgpu: Add debug masks for HDCP LC FW testing")

--=20
Cheers,
Stephen Rothwell

--Sig_/Y5jd7EzePGe44WaoDpwtojz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfaj7kACgkQAVBC80lX
0Gz2WAgAgnoUl8mSLdeV+mhYllVtD/RjjnVAneK/Aija7k1FBaqX5DC9LIdt6EXS
mUC+ZyLU+xD8Hoa0ULI8Cy7yhtrUI5LS/a7uLxWrAq5POfCUFX5yPg6xnP+G41EI
5M/5ytJ/Ogf2MEU8P1aeWlp3sY7+wNZmGjnvrgvzgwFz4IChkZ2iuboRKUdSRmZu
fJEl4qvPaegyPiiFAtqvlLDWO3F+LrDhkkposAX8tzWCDN59dcxr1238GxKrZDcX
EAgc6K0Jyu1TqY0gcAHuI/W7AU1wlQ2Xeto4UzCvAeniQV4rSD4Dgrt3Y+TshNxI
AJxiz+ssuVg8gF7R/IhTronmrcyvmA==
=l7mo
-----END PGP SIGNATURE-----

--Sig_/Y5jd7EzePGe44WaoDpwtojz--

