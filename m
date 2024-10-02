Return-Path: <linux-next+bounces-4056-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 872AD98CC10
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 06:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 399871F25E0E
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 04:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC032219FF;
	Wed,  2 Oct 2024 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hARbMrV5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83BB2030A;
	Wed,  2 Oct 2024 04:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727843515; cv=none; b=tGUEB4kDzT8U6ljOkVhkk6MXbA/p45XueMFjvNxPBXBGyus7iK/mwJh9dB9JwDBktjLnKTCMqypH5DrNUfLGnsUOKjIsDwxFM7fHvl1CMJTJCL+Dk1x3KX45wwepr3ne8VXYLKVw2jW0SK0REPdov+k/CPNuUnEdyjrdqVPpPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727843515; c=relaxed/simple;
	bh=Texsv8l5dQpFDoziKzhJOBZYPhC2l1maJNeXZZiAtVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aw859wnefIB62CafDNkEr2Jg3Di4uWku8PoyKc39zsYBK3uNqOcXJhOuZA2fhgTqliZv4jZjDfIm1dTmXe0UkQ3UKzmg4WegRCwuR5ce05vX0jZtQPsoHshkqajFcacvG8qQhIfvexITANqO2yVBNk0DwlwpGRTR01AIKF8FlrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hARbMrV5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727843511;
	bh=jfRgLzoGzMEd9UHs94vk7uEPZjCwnEji6sh7OEzSbE4=;
	h=Date:From:To:Cc:Subject:From;
	b=hARbMrV52CqOXx3ZVKmCEQLqIr9A8I4knRsreRcksFJaRjVWk4sbXrA74lUxt68z8
	 A3EiJUZjVLjaZL6Ke4wJX1LRWsbagY5J63Zz3+68gh2pdo3Wxc3Fow1bcAR5JL7pW4
	 Rziz7c+KrvPwXQYHKKB77znjq9gfpoevevF0IHQdnZ1POmPJ8IbEmzawrMO0kTr31W
	 N6Icqywv5g7B6eJyyGFPk3n2laO7IK4bfpEQ6p1qtHFBP/KG9NlRao1rTS6FLGXmX+
	 rbqNZBI2NwwpL2F874UR31w1JdiGKpLRgq4/aVibdIIJJ5/IkeYOetvlWfFWT4Rat1
	 JqkGKR6AIoYTg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJMMq3Sfbz4wcj;
	Wed,  2 Oct 2024 14:31:50 +1000 (AEST)
Date: Wed, 2 Oct 2024 14:31:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241002143150.4349be48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SlskxYWXGL+HkRXwGfGWHLP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SlskxYWXGL+HkRXwGfGWHLP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:    =
      * @fbdev_probe
include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fb=
dev_probe' not described in 'drm_driver'

Introduced by commit

  5d08c44e47b9 ("drm/fbdev: Add memory-agnostic fbdev client")

--=20
Cheers,
Stephen Rothwell

--Sig_/SlskxYWXGL+HkRXwGfGWHLP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8zLYACgkQAVBC80lX
0GwG8Qf/fzKZo0zZNycOsMAZSnkTDrZQESBPOX6pf3oJpM0I8DH+XUHG38ZBsgZc
00tUBOFLiD5HyvOktDYW4PLNAasOtZ53g9EyX+Xk3yHkQHU114ID4H7VbhoP8JOs
1hGnsZUx/+OpqDqaqeKIhqPg0hmrxQUUGUnp5GxmLhDiI8Lg28znnwIWnzUOuy5V
4Xl3WelmuH4Ts0uP0zxdh9IO35PXOha5zyUgP+ITx/jK/UKF/d73wm/PqeW2qwEz
eU1SsKO5q+z3iU4PGr9wkPoac4WYAt6IDCj9DTXnBLx9cM3dj8VGdj6ZflYQIQdT
IxLQrBIGU/jszz+/X33QCXNHh6gOiA==
=VCeC
-----END PGP SIGNATURE-----

--Sig_/SlskxYWXGL+HkRXwGfGWHLP--

