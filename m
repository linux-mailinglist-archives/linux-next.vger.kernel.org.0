Return-Path: <linux-next+bounces-8652-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E6EBEF355
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A3C34E1095
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D311E9B3D;
	Mon, 20 Oct 2025 03:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I9XrFF2A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D61CAB3;
	Mon, 20 Oct 2025 03:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760932368; cv=none; b=Pu0cBKHWdI31yfPIWCZGTCg3hepmvVnVmHeXa3BIsrHBwHLqtxsc4tQNkTzqJ6n+FHffrRM9IiEABvwpYiNt6swwrFJ5yjZ2tvMxKU6Ge/fgLbToLNDTERgNm9kAMnjeX6i/NJoVkRiPudrsswoPzQ5zSCcjY5HAM9KH+70g2D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760932368; c=relaxed/simple;
	bh=U3g7wYH0qePdK7Ad2YYnoKzcs4RtC8AJ8f+wY5NsG5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kz9t8R5LcHQRqRcp2TZUCX2z8p4BR4bBEpI8ydUnDTRCuabUTqwWf80jj7lB5550WJwq/lmBC+VPUDj8Lgbqlab7pnNQQFkOYpPPc7GLE7bewjhaa/tiOkh2y2DwHohWZT0BeMYZO85ACu+E4NQUrlnuYk9Lx77IqEbflBtlKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I9XrFF2A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760932360;
	bh=Zp0xD0I7qFshjrJbahsPhJ5yCyx5tg1/oVy+rB8vmVg=;
	h=Date:From:To:Cc:Subject:From;
	b=I9XrFF2A+jJGnmyg5KOhbUBw9NAklpAUYVKvg1ncU8vsQGhW6RFywE6zo1lZW5hpO
	 YHLi9yz0fm77Eyd/8Mi2s90L2QXFeCtZ1LAE7kPmAa3f6+SPg8KaV5WDqmvhwHj1Nq
	 BrW11vatEwjWaxTccf4qPKxIdjLQ9U/a311wWU9gJy+/TzKHlUliR1GJalpUG5uDt+
	 DYzIR/MhXAOGamMn4fkS6yZeMQUCEYmSZF2/n9pdDApYPb7SKuUkXyw24ZA3JZC3+z
	 f56MKK3h6Br0KFlJ4zzjyYjp18AUYzQmmjGj0rynvHMzE0tsfXpEIXQwxQ0vcdOm9D
	 9GtYaxncxwobA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqhMr1zGwz4w9v;
	Mon, 20 Oct 2025 14:52:39 +1100 (AEDT)
Date: Mon, 20 Oct 2025 14:52:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miriam Rachel Korenblit <miriam.rachel.korenblit@intel.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iwlwifi-next tree
Message-ID: <20251020145239.72fc628e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G6Niw5e/4tP6pI3d2.3a=G=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G6Niw5e/4tP6pI3d2.3a=G=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iwlwifi-next tree, today's linux-next build (arm64
defconfig) failed like this:

drivers/net/wireless/intel/iwlwifi/iwl-drv.c:180:13: warning: 'iwl_drv_is_w=
ifi7_supported' defined but not used [-Wunused-function]
  180 | static bool iwl_drv_is_wifi7_supported(struct iwl_trans *trans)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c: In function 'iwl_pc=
i_gen1_2_probe':
drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c:4222:13: error: impl=
icit declaration of function 'iwl_drv_is_wifi7_supported' [-Wimplicit-funct=
ion-declaration]
 4222 |         if (iwl_drv_is_wifi7_supported(iwl_trans)) {
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  1f9285c0c2eb ("wifi: iwlwifi: be more chatty when we fail to find a wifi7=
 device")

$ grep CONFIG_IWLMLD .config
# CONFIG_IWLMLD is not set

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/G6Niw5e/4tP6pI3d2.3a=G=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1sgcACgkQAVBC80lX
0GzTPwf/WjZhfjB0Umvk9HbnbVQzwibGA+agMP9j6mDTOEFncs1Ji/l7rp9vFkBd
90GO5r2qz+69+JlDjytTqbCfBpMDJhHwhw7UtgqrDqNsWlW+qt7qXS20ysy2gq6F
9+W9EbFv6XhUQRMq+3j0/PhPM5ZMYCf/QsVm/354RwjCESkjif+xg27nmw63N8uv
FftKGWwl8kreRD2RMQTrj9nts1YB/Kf+MuXapEd93Ssqq9fmpn48sKD0wwOq+GVv
lUKj3vqIvxTckRVqBVmzTCAYM8P6ZFAO1laPkquiIHLKp4Ip38q6Yuwiy32l3b7e
79B8CoMW3u4RANeHoADbgfn13TGYLA==
=KZOJ
-----END PGP SIGNATURE-----

--Sig_/G6Niw5e/4tP6pI3d2.3a=G=--

