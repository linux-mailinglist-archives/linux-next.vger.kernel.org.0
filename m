Return-Path: <linux-next+bounces-5255-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03137A165E9
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 04:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B1957A054B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 03:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB5C137C35;
	Mon, 20 Jan 2025 03:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hYQrtiru"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE11474A7;
	Mon, 20 Jan 2025 03:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345421; cv=none; b=IwvvjWZXZDax9T04z1qy09gPzGLVzSfIaDIdpCUPSdK6Pqd9p+qzq/+UwO5ZN1ZiJErNxfWnMz7I/sTXfFNGb4VHEWowM+6TlkF3MtHJJBLuFdHmfDAkjNRk0emGB2x1VlBRoVD9A8hLCYaNR9/w6TRzP3zdMZsGjJWR43jfinA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345421; c=relaxed/simple;
	bh=+m5M1mRCLF5Orifng9DxrX9YXw6XpbC5d7iI99KkNWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EgZUYc2BWc0+yg0hyiu/MkSacF+N21A9vjbP4eRwPoi8o5IZ3ceGucrWLJT2M3TS8fXOUJ+hGKa0zP+6ykie/DHl8mRoNFL4wblflVPJ585XTcvXmS3rQveOGpHqVWD2u8pCnjfx8svL13pOny68LVH0m8yXHqApnqhW33hDAbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hYQrtiru; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737345404;
	bh=FY1Yp4sc6uitio/NB14Z2F8LEDo5PmW57efSRvmeiBs=;
	h=Date:From:To:Cc:Subject:From;
	b=hYQrtiruZGjuJ+H684NqREUKl6MyeD8m/byaZvxrRjZAGEdyrHnKFQzJs3Fe0EIKM
	 vv2nVhPmrDgngFS+SKZvejyl0r7fcycG5Nyc8SLQ7PkbpI04iPlQMs2NJwKIhBXkv2
	 eNMNKG2/IneAdIt/eY3mDt/av9lUGwYAn4qFQ1UmKhR0DW0oGO7+/Rtur1F46fPi19
	 319iwqIJ3T4hhggVHdYdtNzozMCt4bGvgJJGCLfddCLX6YA5DPBIrhO7MNpRgk/I3N
	 kUvpbeIAcwB2iVofcCw1D5vZj7dCzh1UrISPoZKHN5TfGl5rTTWs9Qid5H1SwfoZpF
	 OuRaX98sslV5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YbxNX5pndz4wby;
	Mon, 20 Jan 2025 14:56:44 +1100 (AEDT)
Date: Mon, 20 Jan 2025 14:56:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: "Geoffrey D. Bennett" <g@b4.vu>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20250120145617.07945574@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/unWDXzrqt7HEEsvKkmJzewQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/unWDXzrqt7HEEsvKkmJzewQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

sound/usb/fcp.c: In function 'fcp_hwdep_init':
sound/usb/fcp.c:889:22: error: assignment to 'long int (*)(struct snd_hwdep=
 *, char *, long int,  loff_t *)' {aka 'long int (*)(struct snd_hwdep *, ch=
ar *, long int,  long long int *)'} from incompatible pointer type 'ssize_t=
 (*)(struct snd_hwdep *, char *, long int,  loff_t *)' {aka 'int (*)(struct=
 snd_hwdep *, char *, long int,  long long int *)'} [-Wincompatible-pointer=
-types]
  889 |         hw->ops.read =3D fcp_hwdep_read;
      |                      ^

Caused by commit

  46757a3e7d50 ("ALSA: FCP: Add Focusrite Control Protocol driver")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Jan 2025 14:49:12 +1100
Subject: [PATCH] fixup for "ALSA: FCP: Add Focusrite Control Protocol drive=
r"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/usb/fcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/fcp.c b/sound/usb/fcp.c
index eb6a5c1f9b21..8e9ed9c4de08 100644
--- a/sound/usb/fcp.c
+++ b/sound/usb/fcp.c
@@ -815,13 +815,13 @@ static int fcp_hwdep_ioctl(struct snd_hwdep *hw, stru=
ct file *file,
 	/* not reached */
 }
=20
-static ssize_t fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
+static long fcp_hwdep_read(struct snd_hwdep *hw, char __user *buf,
 			      long count, loff_t *offset)
 {
 	struct usb_mixer_interface *mixer =3D hw->private_data;
 	struct fcp_data *private =3D mixer->private_data;
 	unsigned long flags;
-	ssize_t ret =3D 0;
+	long ret =3D 0;
 	u32 event;
=20
 	if (count < sizeof(event))
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/unWDXzrqt7HEEsvKkmJzewQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeNyWEACgkQAVBC80lX
0GxdYgf/VoSKx+V2IGFvOxSJbdI1VIrlYakRcy19N1wX55s1UV6AbGzadELEzlbh
OrQZ2AtxVlg0Xf3EfNGg2eIT600uKVTbQbf/YmyEGLWsfhRBuFAiKil3cWPyh861
WZh/LfDXUBgEX/XLkxoGwEUir6r7dgwbZXyqamYOqbKDInSEiDa+UPR6rbyCtQrm
nAb9bSiNlBaepuFQBMcoayTQi9cxJhD/ocs7K0fR9qBMQ47obuDeEQJgj7dJYKtb
T5boYjCs3/c9Tsn/Tk2+j74XCb9JsgObi/unurNotJBwHUVEO0Rn0h/bigZtqsJI
xbBSEj/Rz/qlTLX/+K1/bMWfGKe4bQ==
=q5uS
-----END PGP SIGNATURE-----

--Sig_/unWDXzrqt7HEEsvKkmJzewQ--

