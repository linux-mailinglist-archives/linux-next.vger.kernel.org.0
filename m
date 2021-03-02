Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D9D32BB6D
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhCCMZH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:25:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbhCBX4L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Mar 2021 18:56:11 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3DC8C061794;
        Tue,  2 Mar 2021 15:42:25 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dqtqm2Km3z9sRN;
        Wed,  3 Mar 2021 10:38:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614728329;
        bh=HZ2vAoGNj5OWqgNZ6FEohcALW6fx5sLB+t19FtoWZ/c=;
        h=Date:From:To:Cc:Subject:From;
        b=EOdNEMh+8kjh3oEAzvh/qpeex7G/ohmgYkwBJbtONz6Xn6Sh1wHy5vgDarFkn61Zf
         rAWL1hMVq/vRYZ1govkG0q3pKXLHnScHFv3DBwbG6cq/k2yDgefAu5qIEGzhNWksps
         LZwTWhmteVUkzgpDpemy+zRaqOqrtDLREusk1Fa97v5G2DneXDHVs6IS0OszD4Xr2I
         35vN2xrhoo9n3fRKZvImDZZ/qLfi6S6qUFJy5EXMY1PDbytBGRXryXT+ibQny6jSz1
         AxhUUvJQ+D+cAMyIBzgSi5z28MlsTXj8/D1WIlQEtROmI0z0dlJHG16CU4nNAibLCW
         20Y2J4ebEP7zQ==
Date:   Wed, 3 Mar 2021 10:38:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20210303103842.1a0ccc8f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//bSgc_o_9XaAkHSyXXwXL6Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//bSgc_o_9XaAkHSyXXwXL6Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from drivers/usb/usbip/usbip_common.c:18:
drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_handle_init':
drivers/usb/usbip/usbip_common.h:348:20: error: implicit declaration of fun=
ction 'kcov_common_handle' [-Werror=3Dimplicit-function-declaration]
  348 |  ud->kcov_handle =3D kcov_common_handle();
      |                    ^~~~~~~~~~~~~~~~~~
drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_remote_start':
drivers/usb/usbip/usbip_common.h:353:2: error: implicit declaration of func=
tion 'kcov_remote_start_common' [-Werror=3Dimplicit-function-declaration]
  353 |  kcov_remote_start_common(ud->kcov_handle);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/usbip/usbip_common.h: In function 'usbip_kcov_remote_stop':
drivers/usb/usbip/usbip_common.h:358:2: error: implicit declaration of func=
tion 'kcov_remote_stop'; did you mean 'usbip_kcov_remote_stop'? [-Werror=3D=
implicit-function-declaration]
  358 |  kcov_remote_stop();
      |  ^~~~~~~~~~~~~~~~
      |  usbip_kcov_remote_stop

Caused by commit

  eae7a59d5a1e ("kcov: Remove kcov include from sched.h and move it to its =
users.")

I have used the tip tree from next-20210302 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//bSgc_o_9XaAkHSyXXwXL6Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA+zIIACgkQAVBC80lX
0Gx8PQf/aMVg3kN2CKbrWQW4T8oQ9HXvQYtPaEL/5wBV2P0c+8i8ZG6VC90cK4Il
6wPDwRxiKDbyb+8ozIsOUWA8ToOZFd5sxSBJjJq0o6C9lrTMT+iUNiR57C4cS8N+
GDmDdqVFlV9M8ZT1kTNQFt+0Tzw4PiSh1gALW94MZ11aMWpp3081Vjucb0+CHAYY
WHAg2zwCh5NRnEwQ4mJWm2j+ATfv2ruhKZDtQIT1lWwWBbNT+Y+mfLNm1hza2ZOc
IleTNt/hW15BaLdot5zDQnaVo1TskOZ28OLR8WFeL+7YZAkMceInXZGOvCndoIXR
guPQa81tIXi6ZttpsF85zcn9b2EHuw==
=W10b
-----END PGP SIGNATURE-----

--Sig_//bSgc_o_9XaAkHSyXXwXL6Y--
