Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3432983CE
	for <lists+linux-next@lfdr.de>; Sun, 25 Oct 2020 23:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419103AbgJYWB1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Oct 2020 18:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732483AbgJYWB1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Oct 2020 18:01:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC52C061755;
        Sun, 25 Oct 2020 15:01:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKBkQ16tyz9sSs;
        Mon, 26 Oct 2020 09:01:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603663279;
        bh=ajB3nlrlQOTI3FVl3gFKgdse2XiYhx7mmQs6teY6l1g=;
        h=Date:From:To:Cc:Subject:From;
        b=oGMeua4bD0CG7Us+x5bVyqc0wdk0cvVUNd3PWzzLFhNHn6vD6snY4hFK6dKfHIAbk
         hCjSJ4mqY/FXEzJPrxRfPj2aEzwD/KPfYb0OQeso1s/br1sVrm4jIPw/0YehJKMpLU
         sMxu9C91zOGQAk6LuZJnWzzH0PcBR43iw5hwHwfzus/YS29P83K/p5xtzJtbBHvzAy
         Z/8QddV0INUxbrgJyMvQ3377kd/0BEh1m+9s33EN+thThoroEUfWgn+f4i+75j1fYG
         ctDgfT8YrkLGBqDP+fd+qXYPHCvX6L+ZDNq7h0sQnehivhlN8+7pqYZM2gHR8j82uP
         sJUFmeKZAwsMg==
Date:   Mon, 26 Oct 2020 09:01:17 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Bill Wendling <morbo@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: linux-next: manual merge of the risc-v tree with Linus' tree
Message-ID: <20201026090117.76fd366a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b/17+tVXVADn=a.FHZvaDsk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b/17+tVXVADn=a.FHZvaDsk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/kernel/vdso/Makefile

between commit:

  a96843372331 ("kbuild: explicitly specify the build id style")

from Linus' tree and commit:

  f69e1c7418b1 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")

from the risc-v tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/kernel/vdso/Makefile
index 7d6a94d45ec9,a8ecf102e09b..000000000000
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@@ -43,6 -43,8 +43,8 @@@ $(obj)/vdso.o: $(obj)/vdso.s
  SYSCFLAGS_vdso.so.dbg =3D $(c_flags)
  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
  	$(call if_changed,vdsold)
+ SYSCFLAGS_vdso.so.dbg =3D -shared -s -Wl,-soname=3Dlinux-vdso.so.1 \
 -	-Wl,--build-id -Wl,--hash-style=3Dboth
++	-Wl,--build-id=3Dsha1 -Wl,--hash-style=3Dboth
 =20
  # We also create a special relocatable object that should mirror the symb=
ol
  # table and layout of the linked DSO. With ld --just-symbols we can then

--Sig_/b/17+tVXVADn=a.FHZvaDsk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+V9a0ACgkQAVBC80lX
0GxzvQf/f6Elav65+my6s3dvwR4FllhzCWcrQ4LaPAjv37msmdOSr1cLcV7Cfryw
DGv2ASCIopxjp7J1U6X2im23sFvIz3Buy4JBqAJuB/BPOgzBCPUo204tmA/oGs7Q
J6Q/K4Ui4scNKsaOv+EBJsQWsOiXofef9YrTRaG7uB1oc8pnkvir21naET6bSpp0
tCWBekGMYwU6dt0BmAIHcu2mN5uPw6fiqvsxuDCNelAbnFGTz3h6UwqvXnpBzRc+
6TApa47XWlqOB6gzJ1gfhLbumNJuqOvq/6scBWPEZ8QltZ6ma+HcW+R543rgSewh
8+0d7dq3q9ll+Ec1TrMaXcrdB9PQEA==
=F4RK
-----END PGP SIGNATURE-----

--Sig_/b/17+tVXVADn=a.FHZvaDsk--
