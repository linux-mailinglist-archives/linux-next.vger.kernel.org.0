Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B54B44BAC7
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 05:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230244AbhKJEJf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Nov 2021 23:09:35 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:50603 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhKJEJe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Nov 2021 23:09:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hprrg4FTqz4xbG;
        Wed, 10 Nov 2021 15:06:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636517206;
        bh=zDOFWlhrqvXpxdABPaiFn3r3hetL0dG5vM2kbVkljrI=;
        h=Date:From:To:Cc:Subject:From;
        b=XsZyPdbwD5I0Qyy+TJ1oB7wWxPcj+NMVZR+LfOZqwuHui0jTw0+rn6gp9wk73KmkV
         xplnJ+RdTFWIYOBKmdE3ljivvq/JXBbf2Fi1ZqRYacrATw5EdbE69l56lpBc2mgxn5
         F4CVNVQ3VAUEVQnImJyuAhe4vqpamgRq8JtW+cgp4KURJVw/3jxrJVczYvrZl5DZB3
         hsGrSeBvwkAAxOKny1JQ1HkHd0Gu3pLYLnv+zHHkMFmZsX6YLUBm3UgjKbPcUPUGLj
         w4W+VpLq6j3gnKtaEcOjGPbrMCMroKy2oH96N+KoZJ5W4ksMgodCgrCB2horV2hhzE
         0YT8+43rjLNIg==
Date:   Wed, 10 Nov 2021 15:06:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hid tree
Message-ID: <20211110150639.7db57ae2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/31D2D=t/IxzoaCbnoL=BqX/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/31D2D=t/IxzoaCbnoL=BqX/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hid tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/mod_devicetable.h:909: warning: Function parameter or member =
'guid' not described in 'ishtp_device_id'

Introduced by commit

  fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")

I also notice that there is a @context description, but no field.

--=20
Cheers,
Stephen Rothwell

--Sig_/31D2D=t/IxzoaCbnoL=BqX/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGLRU8ACgkQAVBC80lX
0GzRhwf+KaKZoBukB4ylUv6Ia1nFd0l+VeDHe9DdIKnxWDj2DpNq/ZmbnTmlEALZ
H6m1Xb3R+Wng8h2RL+KEbkofU39QRZGE3VvCXvcLnAauEhQHH6KBEf+uXrN169oh
4cmfScjg2pcXUt2tzxkdbWtEoZqzdwKhwMrdghDuRiza6eup9Vxw1IT9XeYZPnhK
2OcWTVBr43XGuFb8hDlEMImuC7Fr8zZvPcE2KkXMpEVigvkEtk88yzYJ5HkVhmZ6
XWrWuPLzGwABUIArHRVZoE8M2Hva/AvPWI7AtbrqMobZmSLWkj+yXCg1HVgmvKhK
NJLIVZEu2XiYszNMTiwv5N/ApF19IA==
=lP0S
-----END PGP SIGNATURE-----

--Sig_/31D2D=t/IxzoaCbnoL=BqX/--
