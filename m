Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5638AF6D51
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 04:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbfKKDb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Nov 2019 22:31:58 -0500
Received: from ozlabs.org ([203.11.71.1]:34929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726742AbfKKDb5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Nov 2019 22:31:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47BGdQ5VZPz9sPK;
        Mon, 11 Nov 2019 14:31:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573443115;
        bh=vP5Ytc5V6Y1ug4Ttp8PT0OCixHE3mZcJWYX9N6B1xrw=;
        h=Date:From:To:Cc:Subject:From;
        b=f/G4svEJHgpbRaPFJbcLuNXgf259iHGd9cl8p4P6kVfxfl8hLCAoCkfaF9dQTPHbP
         almn7lhsSg0FBO3/aPdpNhnaZriueGduoqALWWh6xo3DI2PCbtRQQtBZYudfawUWwP
         ifKbusUDuvS8h6iq6ZtcWDQNIfaLDM3tHAk7PD4OEjC9WiHzDzQ+Zavb+nDeaYnIZn
         aTWdyqawNYhcpsBvq0KkJ3AEqzyzZhVH9+brxLe/ifvV+Xk/pblO8xDXuhOVSy6nkk
         sMl8WLdKQzGGwwfrCjx+3ncOu9ujZqpr/4GXDRAKA/hwUQNE5YGP4nECvxxRYFiPK0
         hwl9YyJWdzjeg==
Date:   Mon, 11 Nov 2019 14:31:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>
Subject: linux-next: manual merge of the tip tree with the xtensa tree
Message-ID: <20191111143154.13b0a7ac@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/prKWrhXS8Vld8urfDAE1_q4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/prKWrhXS8Vld8urfDAE1_q4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/xtensa/kernel/vmlinux.lds.S

between commit:

  158b6b99ba7b ("xtensa: merge .fixup with .text")

from the xtensa tree and commits:

  eaf937075c9a ("vmlinux.lds.h: Move NOTES into RO_DATA")
  94174c9b71c6 ("xtensa: Move EXCEPTION_TABLE to RO_DATA segment")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/xtensa/kernel/vmlinux.lds.S
index c64abc15d38f,0043d5858f14..000000000000
--- a/arch/xtensa/kernel/vmlinux.lds.S
+++ b/arch/xtensa/kernel/vmlinux.lds.S
@@@ -124,17 -126,16 +126,15 @@@ SECTION
 =20
    . =3D ALIGN(16);
 =20
-   RODATA
+   RO_DATA(4096)
 =20
-   EXCEPTION_TABLE(16)
-   NOTES
 -  /*  Relocation table */
 -
 -  .fixup   : { *(.fixup) }
 -
    /* Data section */
 =20
 +#ifdef CONFIG_XIP_KERNEL
 +  INIT_TEXT_SECTION(PAGE_SIZE)
 +#else
    _sdata =3D .;
-   RW_DATA_SECTION(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
+   RW_DATA(XCHAL_ICACHE_LINESIZE, PAGE_SIZE, THREAD_SIZE)
    _edata =3D .;
 =20
    /* Initialization code and data: */

--Sig_/prKWrhXS8Vld8urfDAE1_q4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3I1ioACgkQAVBC80lX
0Gzjmwf/fr/fMLlfj21xgvK8rj9ecb2t7crLaOdR4SAO8VeW194rgMiz1fHEvFd4
eAnE5Ts3BuBL5MysBuiSsjPHoCITxGR0xcomC/weZTHKyeLjnZbfCjYA/7N7+l3j
QtqnnipeO1Z4SNi+WEkzehftMXwLI0mwxBx1s+eEUSrRcLeQ8HUWTJVYDYXQse+j
izPmxPy+t/ATCkaVkN4OfY1flGO1N3xILrugMZyIMXA6kG+zuDeTebxb55dtW5sA
ngER/CdMaeW+ag3azYmdMzKd+/Jrn0Har+MYBj0mwVsqo+U0s+Irdv/uYx+mutZX
xs6Jw0GfFnP1yixwARQk4kY4Ni/AsA==
=BaKq
-----END PGP SIGNATURE-----

--Sig_/prKWrhXS8Vld8urfDAE1_q4--
