Return-Path: <linux-next+bounces-2679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6D91880D
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 18:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB9931C224D9
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 16:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8802F18FC69;
	Wed, 26 Jun 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQ6X58mC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2818F2DE;
	Wed, 26 Jun 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421185; cv=none; b=N8DhM+ChkCJJpZQlo2w/HNvqvnwfSp0iO2EEOIAx0zup+GDtwugs308iSfiRev0yqn1rE9dBc7vnrMrCSe1s7OBk8+LmUpRslMbwP31i5jXs+bpGXbjJ4u8Mg7IIJsqIuMSSSK9Umkh+Y18q06p7dVq8vRVmU40J1r2e6Qg7XuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421185; c=relaxed/simple;
	bh=Jg97XQfkjU/0E/YatQBe6xBkWzYg8xUOrvHmt5RqJ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJvCp5mdqflM9B/B0Ju24zvK0iSIuCiTj0OBovL2fSTsoe81PV5AFsi4Fo2GHaIfbTRhJq5HTP21tXA6kGODeM02zHPapQbOT61W9hXkB56b1vk0wLuOgmeuNoVoliyVJhM3PtcHp8s+3eqieJdC8ZaoSfl+sTjqxgGSjOHZVeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQ6X58mC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800D8C116B1;
	Wed, 26 Jun 2024 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719421184;
	bh=Jg97XQfkjU/0E/YatQBe6xBkWzYg8xUOrvHmt5RqJ7U=;
	h=Date:From:To:Cc:Subject:From;
	b=KQ6X58mClCRWR62IeXd6JjNq4YKlMZqFLmJF1Sgu550T6RceD+yhAFseARqbOO5TU
	 wngfccWl7umEp85gU9QaTxTlE2zm9czMCaMxfUQTmFOnrs3QxmvyvmBgr1RYQ0xkLF
	 a3qybWnm6CFQZSgqAUYPdJR7BXmZL5OpCyKsLCcmLxzCdeHiBnApeOiftPH2WyV3ys
	 TFiHokK/1/0l4b9zvmMMtOmxf/lrNlmxU5NbtBur+gWpNmYs/IXF+trWMg8UD5gbbD
	 mLeRrNNK61dz6uwryW2tcgq6Ix8MPBoN1qe5qjxHoz/biNm/drnvMkpGanuxjnBQUc
	 BXDizR/b5hxoA==
Date: Wed, 26 Jun 2024 17:59:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jai Luthra <j-luthra@ti.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: linux-next: manual merge of the sound tree with the sound-asoc-fixes
 tree
Message-ID: <ZnxI_O6OrGKN9XxE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Es/C7Eqyq4ZnWaBW"
Content-Disposition: inline


--Es/C7Eqyq4ZnWaBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sound tree got a conflict in:

  sound/core/pcm_dmaengine.c

between commit:

  e8343410ddf08 ("ALSA: dmaengine: Synchronize dma channel after drop()")

=66rom the sound-asoc-fixes tree and commit:

  6a7db25aad8ce ("ALSA: dmaengine_pcm: terminate dmaengine before synchroni=
ze")

=66rom the sound tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc sound/core/pcm_dmaengine.c
index cc5db93b9132c,4f18511f1c92e..0000000000000
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@@ -349,23 -349,8 +349,18 @@@ int snd_dmaengine_pcm_open_request_chan
  }
  EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
 =20
 +int snd_dmaengine_pcm_sync_stop(struct snd_pcm_substream *substream)
 +{
 +	struct dmaengine_pcm_runtime_data *prtd =3D substream_to_prtd(substream);
 +
 +	dmaengine_synchronize(prtd->dma_chan);
 +
 +	return 0;
 +}
 +EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_sync_stop);
 +
- /**
-  * snd_dmaengine_pcm_close - Close a dmaengine based PCM substream
-  * @substream: PCM substream
-  *
-  * Return: 0 on success, a negative error code otherwise
-  */
- int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream)
+ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
+ 				      bool release_channel)
  {
  	struct dmaengine_pcm_runtime_data *prtd =3D substream_to_prtd(substream);
  	struct dma_tx_state state;

--Es/C7Eqyq4ZnWaBW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8SPsACgkQJNaLcl1U
h9BsAAf+O8BZrudDTaJUo1X9wAvK41GVr+jD7pqwx5nY7Vf1lhsYTogufboNlkzo
ICL3CYsJ5CWf4TsZHYRZ09LBDsSKbn0ON+KLoYgABbhAkfL2f7KkIR0zaGs8QEO4
tOdbovMpVYthFIkRIv6Aj20uVfaIzwbtNzvvohQYPNJvxIXGBGrqea7C5AtBEefB
c65IPsywozoxZFwk2fbQ0TsaZ0mc6VRi9aCtkFjXjbTfmeAdTn6S6Ulgc5b1KK2E
PJ5o08YDzH7AZ8rKC2kDJHrGvi2HsOFrXmELFj9rR/Y/LJTPYYS+LhCHxcQ0bd9o
/mcpnrAe2f7PdXfkiSwbwkfABwDMYw==
=gtkb
-----END PGP SIGNATURE-----

--Es/C7Eqyq4ZnWaBW--

