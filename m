Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C1D134DA3
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2020 21:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgAHUbz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 15:31:55 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:36815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbgAHUby (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 15:31:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tLWW6tZHz9sPJ;
        Thu,  9 Jan 2020 07:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578515512;
        bh=5boFosD/ENHo7UsD6cFKHB28xFHQmwHWBpM4On3/+kA=;
        h=Date:From:To:Cc:Subject:From;
        b=mqg0NbI0WaNt0rvEdIpDIDmNdu9DQHN1FTFrW5l8jVGaFV5besLGIp35Doy/VN6nZ
         zrxm1S0vtx68U6aCdSxpgRG9A6ppH3gZAmg4A0HzKgy+hNxgPGCC6MR0bGfu95cVrr
         r5350OC0+ove4kFYFvKtwOO6kC12+SIY52cl4F6Vi1IZF9EBay3561JAMQPD5tIs38
         zLFx+hmJj+Tuut9vFQmhUFInGxJ/xIWYsv0YRKYNxoV+A4WXDglHqdTJ/I/UEFxMSo
         KOq69z1G85c5l14tPEG8OQTxnxNgf2EL1PHVMTygsuUCR8f/BCTSnJAiLfwhrMFYxo
         VX28jxApUufLw==
Date:   Thu, 9 Jan 2020 07:31:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20200109073149.4a6979ad@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sR/CEJ9FL1qE0HnFxtjSWOQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sR/CEJ9FL1qE0HnFxtjSWOQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1dc8b65c944e ("media: v4l2-core: only zero-out ioctl-read buffers")

Fixes tag

  Fixes: 6c625c01c7a6 ("media: v4l2-core: split out data copy from video_us=
ercopy")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c8ef1a6076bf ("media: v4l2-core: split out data copy from video_user=
copy")

--=20
Cheers,
Stephen Rothwell

--Sig_/sR/CEJ9FL1qE0HnFxtjSWOQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WPDUACgkQAVBC80lX
0Gxe0Af/Y8ER/COX0Oi9yHozHeOgdM/AtXfGCGDChqernbWpg7pcEaAGagMix6g1
lgb6pqOSdNNVwqPkwDrckztIYqZYJAgWt0nLjl7VjgZq3dk43d7mTCENt47hHdr7
vqrjT23xFckqsOHI3mEGlaZB2ASaD5i2nWM5Fia1N4zEyTxhvG0Wh47Dd7Y35WGs
V81v/VglavAbIX+acuea/LlkwUEaABRvYPtCXt4X/SxhsXlxJN+0rfz7zygbS3X3
Z2GlO3uFafZS+VKk5NKRAUraKjYKAO3Z+vKVoWAN/iHjxoRFZkn+qcLByYGsaeI3
vuLHm9mw7vRsmlqUgS3kvKWyhR9Fbg==
=AnbX
-----END PGP SIGNATURE-----

--Sig_/sR/CEJ9FL1qE0HnFxtjSWOQ--
