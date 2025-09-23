Return-Path: <linux-next+bounces-8442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EACB94F33
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 10:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 923C448136B
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAFB3191A1;
	Tue, 23 Sep 2025 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4YRH9rf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B042F531F;
	Tue, 23 Sep 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615459; cv=none; b=qZPa2JEihj5pIrS3hCsM/bQlYtN9SzSII8WoIAXptT8s4H/vvr0Tvwy0Zz/RxdeF726GxMhcACQtWE84LCnLmvn52OGc7l/unHElnv6BxJBcW/v45CIVhm51FT8QRRAPsXRVxQsbbg0yYbQF/9HlSQZEVBl4kgj0imKiBwN5epk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615459; c=relaxed/simple;
	bh=BBajYzG29hJ42gWPRxflZEnzNi37NyQzf6sJO+pArMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snYGfwIX8OPhYFmK9dwOKuhmHv28xsgwHHVzfF5ibEojhwA2hicMoo92LwdEgnGrpWRekeiuxcV+Z6sfOCXJm5g10nglGK/sD5bUGhwbF5E+DNDdxJW0xuIxa9Rlmamf03W22LbFYG4bdAm0x5pRpC9MeRrDSZCLKqNK7A/PZTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4YRH9rf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F3DC4CEF5;
	Tue, 23 Sep 2025 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758615458;
	bh=BBajYzG29hJ42gWPRxflZEnzNi37NyQzf6sJO+pArMI=;
	h=Date:From:To:Cc:Subject:From;
	b=D4YRH9rfPMmTndJDKlaw6uRNrN5LshdQ+FsuDxl0xPP5Oa/hsrvu2ajM/t8iPLC45
	 g7S83SDTVlU9ljJDdAOxM8JJbn2f6P2YzMBuRIbxYK2JRCvAkRGOWjvMiYk3oyzouP
	 evNMxjtNQByNpAm2xTqySYA3xXK2kCGaZ05yGiP1kO5cHLfX9nIRdpi6PSu5TGTlVx
	 aRmZK9QLOY55si06Px3svUj29WtRZrdj0XHk8/B/E4bH8M2LhSRDDPq/nVvCl2DZxM
	 4WsTTKVOcomBzaY4ducDXh4KV35+kO9Mx8qfGMP6aHkETUgB3VkWSro0fjHWrNlfBY
	 e6OiFDRalaA7g==
Date: Tue, 23 Sep 2025 10:17:32 +0200
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jakub Acs <acsjakub@amazon.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with the
 e94608c9744b01b6136ce6b701f34b4078a5a5fa tree
Message-ID: <aNJXnM0dyGQ5CaNp@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xPu3XKVfGtfB6ISF"
Content-Disposition: inline


--xPu3XKVfGtfB6ISF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  fs/proc/task_mmu.c

between commit:

  e94608c9744b0 ("fs/proc/task_mmu: check cur_buf for NULL")

=66rom the e94608c9744b01b6136ce6b701f34b4078a5a5fa tree and commit:

  ecd5d2763540d ("fs/proc/task_mmu: check p->vec_buf for NULL")

=66rom the mm-unstable tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/proc/task_mmu.c
index 5b5b3ee328c5a,fc35a0543f019..0000000000000
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c

--xPu3XKVfGtfB6ISF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSV5sACgkQJNaLcl1U
h9C7kQgAhwl/ydbU+3FvUXgxA5+0Vg+nLU6zbo32pU9pMjvOQRIwWp8TCyLNcrBD
/hVPlXyj7xnU+eobLbC0F4HZpUTnsT4IwpKARjTEjAprjeKAcEZWhbiJhupqEvfX
NTvkFKu6QbE7Z4DXzlFsBJkFiMv/aDI7Cx6cM3/EncB9QNd+t5XumJIusL2811Gt
rpG7zpraZZ1FjOSG1epwGfqkwVkQt5INl0YGvBsNdwh5ULVI7FAc5VhPTY+7jqCY
Hi8nsUdQHmWa6reEypE8nFwzb5YWTKyU4/TWVkY5yIAWVsHKqEESSQ3NvTF9syYU
D0vh1Ds/UwBOQqVG+CeLrwCxyj56qA==
=j7cB
-----END PGP SIGNATURE-----

--xPu3XKVfGtfB6ISF--

