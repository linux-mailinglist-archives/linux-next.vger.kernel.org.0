Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B7722E61E
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 08:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgG0Gzp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 02:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgG0Gzp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 02:55:45 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED71C0619D2;
        Sun, 26 Jul 2020 23:55:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFVv16G2Fz9sPf;
        Mon, 27 Jul 2020 16:55:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595832942;
        bh=V0YRt44wIYuXHGwhklCesj1tAF0YsqZncAcPDG9Sr1M=;
        h=Date:From:To:Cc:Subject:From;
        b=F/jAtfusKXiYRgb80GjgjxKMA/iILwKwv8mXiMcFqexMzotCQr+r47gSMRaPHNC9c
         ph7LzmUuAYdDQjAQ5ldbDhCZMC0abihNJhaMe+4Gj1cNeSeXklrJMQseEjguhNUfIW
         KCkTGYiQsUn/fmHSb4k/PtE5bwPDrzdVbTtbyUFcv/swXJd56v584A8e4oK1OqZf3N
         y8li+xrPgQWzRQCR5+HJqpHKSykRBQ4I+tCBm30oiEJU7dU5xMy3kage4cSFtNiLBJ
         61D1B27/bJLgYYLcrwRoU388+K6WMmqVaeJ3RWs+6IFaz2pETpEdah4aQB/XVTAbCy
         ZFqqZPVUbl8xg==
Date:   Mon, 27 Jul 2020 16:55:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Scott Branden <scott.branden@broadcom.com>
Subject: linux-next: build failure after merge of the driver-core tree
Message-ID: <20200727165539.0e8797ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nd0.zjHSp54xmHO7IGVQ0oq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nd0.zjHSp54xmHO7IGVQ0oq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the driver-core tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/dmi.h:5,
                 from drivers/firmware/efi/embedded-firmware.c:8:
drivers/firmware/efi/embedded-firmware.c:25:38: error: static declaration o=
f 'efi_embedded_fw_list' follows non-static declaration
   25 | EFI_EMBEDDED_FW_VISIBILITY LIST_HEAD(efi_embedded_fw_list);
      |                                      ^~~~~~~~~~~~~~~~~~~~
include/linux/list.h:24:19: note: in definition of macro 'LIST_HEAD'
   24 |  struct list_head name =3D LIST_HEAD_INIT(name)
      |                   ^~~~
In file included from drivers/firmware/efi/embedded-firmware.c:17:
drivers/firmware/efi/embedded-firmware.h:16:25: note: previous declaration =
of 'efi_embedded_fw_list' was here
   16 | extern struct list_head efi_embedded_fw_list;
      |                         ^~~~~~~~~~~~~~~~~~~~
drivers/firmware/efi/embedded-firmware.c:26:33: error: static declaration o=
f 'efi_embedded_fw_checked' follows non-static declaration
   26 | EFI_EMBEDDED_FW_VISIBILITY bool efi_embedded_fw_checked;
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/firmware/efi/embedded-firmware.c:17:
drivers/firmware/efi/embedded-firmware.h:17:13: note: previous declaration =
of 'efi_embedded_fw_checked' was here
   17 | extern bool efi_embedded_fw_checked;
      |             ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  2d38dbf89a06 ("test_firmware: Test platform fw loading on non-EFI systems=
")

CONFIG_TEST_FIRMWARE=3Dm for this build.

I have used the driver-core tree from next-20200724 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Nd0.zjHSp54xmHO7IGVQ0oq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eemsACgkQAVBC80lX
0GxoGwf/dHpXXGndf84Ys+4T7kHxH90+KyZxm7wg2PB0cj0j7gnjBEk0qrLy1r5z
GBlIJ6mVoJ5DX7EUi1T9zRwSbTaqSjGdJxDNFX4gCcxmibX2Du0FdnpqeVWE0leV
lGcwrGdrg9BHrNs7x6y6HRJ0mJrxV/dR0KsYgH+dJUh0OtADpSE9gEffHeTYk9+n
+BCbPIAFggQZ5cTkGI7BqTXQXJNAp2RPAJc0rh/SoaGkKoYZHMzyIDY0WJfTQ6QP
udmm8MWp4PDPvCGt7Z0twg6+khyvHpJ7KIGKWT4Lw/9Hh4q3l6IA5x1EX1yAQ4MH
Rb89vLt1ODbdOiXRhSpgN+Yh6rbKZg==
=Lq/u
-----END PGP SIGNATURE-----

--Sig_/Nd0.zjHSp54xmHO7IGVQ0oq--
