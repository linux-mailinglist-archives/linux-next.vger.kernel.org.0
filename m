Return-Path: <linux-next+bounces-7508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D46B034BF
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 05:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1C11898F6A
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 03:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B2E63CB;
	Mon, 14 Jul 2025 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQy2MmZc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5277B652;
	Mon, 14 Jul 2025 03:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752462092; cv=none; b=FJCrRlbtsN4WI7d1InN589bS20XP1NAnCnYXnqpBbADwt5ap/BkO41pV7/tBwgWy06/63VKBdFRuCbcBj2CqGy6j7jjtmEorcG0eRkzZNgtxazuYVYfN+x2AKuKGf8cTWa9u83dl1yOfH8UJyOioegnfEn0SOVV3UgB6o/4hmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752462092; c=relaxed/simple;
	bh=ERgzvsslLVirasSKlBbVbFonq00aWcG2raAMszxdrjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E8KrQulxYtJ54oBs/IG5Azh0lmmDfGmWkYBqDeHMN4Wx8jpyuw0btCecRP9ABBBNYf9TBMWge03VZF9IPQZJ2XCLvIXH8xZikphKh/Y/arV0HJre3RykTJ9zKxbPvmXBc4IT9QOiPKg9qYgQFNydBiz6yBb7rchcZJKeT6jXMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kQy2MmZc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752461985;
	bh=Iqjf9O5T8nAP0FkxcU7OI+OyNrQDbwpMfJerUeBVolY=;
	h=Date:From:To:Cc:Subject:From;
	b=kQy2MmZc84PwsPxo/pSplFAQc3d4PTCbuq8UhWkU56mbeBckHszw5NJZ0w7Y39kRj
	 BWQkZvYWXi0hJnlWyDr4EWt5htXTL0jGGIcYGPypqGI/XAogM6TFU3f5cR5XHZnD5H
	 igOW1LAxZSt2BTb9uJtNbHg9Wrrh63YCsjruNAdPUgqEH/i5JeduKuVzV1u4BeP+7N
	 QvUxwQHdlRKBoB7YiQBPTbrqq3Cm6VM7yL8dGXs9/seBvlQDeiQFxmIzsVaV4/38rj
	 psWdUQLyMSXTgK5Uo0oFA+KeGyt503rL73MPzQ3m6acyKTrieKx7/w8JFhyw5Prfcr
	 hF88hLELAkNwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgRr053wqz4wb0;
	Mon, 14 Jul 2025 12:59:44 +1000 (AEST)
Date: Mon, 14 Jul 2025 13:01:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sound-asoc tree with the sound tree
Message-ID: <20250714130122.58f531e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.RFu7TFsY1DX3MKCQ3DCQyf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.RFu7TFsY1DX3MKCQ3DCQyf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound-asoc tree got a conflict in:

  sound/soc/codecs/hdac_hdmi.c

between commit:

  ed677858d4fe ("ALSA: hda: Move widget capability macros into hdaudio.h")

from the sound tree and commit:

  039de8f598dd ("ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()")

from the sound-asoc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc sound/soc/codecs/hdac_hdmi.c
index b33cd5178008,3aae0a2eb047..000000000000
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@@ -24,7 -24,7 +24,6 @@@
  #include <sound/hda_i915.h>
  #include <sound/pcm_drm_eld.h>
  #include <sound/hda_chmap.h>
- #include "hdac_hdmi.h"
 -#include "../../hda/local.h"
 =20
  #define NAME_SIZE	32
 =20

--Sig_/.RFu7TFsY1DX3MKCQ3DCQyf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0cwMACgkQAVBC80lX
0GwSSwgAmk+IeFlfjGSf1CFjSSnUhTvrV9GN7FOazgIjxv2at5bsqpcqIamtddzd
19/KiIry09RERLjfq8vlPAY+lVOJ5GKppKoBi+1ZSxiGs2twTCRpO+pSoMJOTpQo
EOAu5stx5FbzaSwGf9OWGrzlj3qCeECEVkxQU91YQQKun02xWWnrkPyeILZZP9/T
SEBjwxRFZQB5CFx6xetM5xEVHHNmMqUJTw/LYaSbw8U+XylLHOkM6SCKnp1FiYfV
7WjiBD+txpBo3tPOui1IaWlYL6p/WW1wOS13qqGyeGlKCkgocBfe4I6iyQvLpa+f
sGmMyeVm8QfY7Pvd4IwUZl8JMbKBJA==
=RXuG
-----END PGP SIGNATURE-----

--Sig_/.RFu7TFsY1DX3MKCQ3DCQyf--

