Return-Path: <linux-next+bounces-4958-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 252909F2864
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 03:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77A1188500E
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 02:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D39317591;
	Mon, 16 Dec 2024 02:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ps/6dP6B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B78BE8;
	Mon, 16 Dec 2024 02:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734314983; cv=none; b=eg7JRGXzTOUf8/H+k16BFR5SW3kftUuqzuljQ+b9D30rXfyGa68U+y7gpq5JP2U6zROt89K68xVlGJnD4PJOC7dChLbjSHmXpITKSQObE1pUbRZkOki9hCsSsfc0NxDZuxJ1oApMnqrU53aHQLt2v2Ec/DcmlXHzvcN+2HASvV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734314983; c=relaxed/simple;
	bh=1pPJc5mwLWF/GgbGn34gtJpM1DulM/+XjwAZxpCgh0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q65YgKddr+9i13MC6yoEvSg2unT+WiJKFgzhhmZt/g1BqMnMnwgndEioZbhvkLVDclEvBDvEYeUrmRlrnaJAljje/0HhNwL7CrAhgqtGqgS4Flmej5hUdCRS/ouISxRWYc79GNoRox3KQpL9MhVJsekAHdvgltPAn9Tth2k3HTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ps/6dP6B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734314971;
	bh=FrlaD/2YG469lfKQzRNUOtrphgauwfd1DYk+f2bdUos=;
	h=Date:From:To:Cc:Subject:From;
	b=ps/6dP6BI3kl9JKYhVoo5oGCFgYCEGnfv/rshTxhp8a4DicS2ebpor7N7cfmc0aDs
	 9T9iOzIgpnBIYqmWckWp0O2miZpATNkwD9Q5IjDJ4LfiI1408dA/hjJ35c3c/V4prV
	 8XmsyOIflclMP6cIkLWz4ZOxGk+BcwJuS4sm2d89SR6JZQbzpG59vVgUSyNUHWjxA9
	 Sv1Ui1At5eIWro0deEGYZr/IBKXlxIW3+Qp8biUuvzKsxib5gA4H+aCGRg022KjLsy
	 mdc3t33L6D7gvl+tyu4gIYVWSOm8+ATCihCqzDlsaUr1GNm4ai11u5SDsC6pxmr1U8
	 FW5/YziJgm0Uw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBNfy3B36z4wcZ;
	Mon, 16 Dec 2024 13:09:30 +1100 (AEDT)
Date: Mon, 16 Dec 2024 13:09:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Shengjiu
 Wang <shengjiu.wang@nxp.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20241216130934.0d1ef471@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6F5qfDxItApWFQZGUL.E9z_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6F5qfDxItApWFQZGUL.E9z_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespac=
e DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespac=
e DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace=
 DMA_BUF, but does not import it.

Exposed by commit

  24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")

Presumably introduced by commit

  04177158cf98 ("ALSA: compress_offload: introduce accel operation mode")

=46rom Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6F5qfDxItApWFQZGUL.E9z_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfi94ACgkQAVBC80lX
0GxJ6Af4icO9qf5VJ6fvt0bvNVjoKPaYEv+P32eL6LmdG9kkpHfyHzjrv0qRTaA+
L/ujG7bU1OekQP072jxlbAdpyns5KWTjHQmZARfmeKFKhM/4MizfBv7hET15KHDe
9yk5Zyy+pBd2MY88Gp3KDxdeevtV/TpKuivV/yciKHT0EPzTfQegwkQhuFZe6Ijv
Rt8sucQ1iSW3Xxxqcikj3vX+KZXf1ucgX4SntIncO4KAPh5YKVEpcFZjPvXatM7p
qJuBkA3VME5zOkabLlz5zWNUzJxORuEH2yPq3ZCepig63+xRSqjDxPd01TPC0HbI
gdEX0N3msqWuMo3UcJgUGUpcsp8+
=L5u2
-----END PGP SIGNATURE-----

--Sig_/6F5qfDxItApWFQZGUL.E9z_--

