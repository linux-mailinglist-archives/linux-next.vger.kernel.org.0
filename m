Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8157D2C6083
	for <lists+linux-next@lfdr.de>; Fri, 27 Nov 2020 08:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405338AbgK0Heq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Nov 2020 02:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405327AbgK0Heq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Nov 2020 02:34:46 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB75C0613D1;
        Thu, 26 Nov 2020 23:34:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cj5xH0prkz9sRR;
        Fri, 27 Nov 2020 18:34:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606462483;
        bh=EEi66I6wkbE2eoPGHmLaoUq8UzLfcpztO0xUuxBn1a0=;
        h=Date:From:To:Cc:Subject:From;
        b=MFWPgYg5/Y0iEU2g+E3UqW8XEtheaGJ+6PKcmVnIy+C5SUdOFjqPYpRX2Mh2h7ElF
         Mx+bSfto73/+cfvOt0l85xBAsI+DRDpIFTkR9xUh/VbEzZN1mvts8hc/ICAaR9M5rZ
         Sa8nOXWV9YfryA3uNbROr5ewvmDlBz3QoLJPewt5jD8CJ/3YXf+DtdBzFQ+atMDY8x
         5Um/tXjNSj3o7HjvdoP5VSiwsgT4VPNXp1IbOABaar6KzkXJsiUjirVEqtrMCfbHcv
         SmN+Zt4V2YhWzVzgDg0hHAhLIu6gNRfC2K4zcXWaNbm3cisZGjAYAVEIsCoNo0Scuv
         Oq3xOfszS1Rog==
Date:   Fri, 27 Nov 2020 18:34:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20201127183441.347e30e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mdpR1EtHM1Px4jCiL8ByTj6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mdpR1EtHM1Px4jCiL8ByTj6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  5cb0080f1bfd ("riscv: Enable ARCH_STACKWALK")

from the risc-v tree and commit:

  46b9b00649f6 ("arch, mm: restore dependency of __kernel_map_pages() on DE=
BUG_PAGEALLOC")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/Kconfig
index 8a2a0523a9a3,9283c6f9ae2a..000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -14,7 -14,7 +14,8 @@@ config RISC
  	def_bool y
  	select ARCH_CLOCKSOURCE_INIT
  	select ARCH_SUPPORTS_ATOMIC_RMW
 +	select ARCH_STACKWALK
+ 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
  	select ARCH_HAS_BINFMT_FLAT
  	select ARCH_HAS_DEBUG_VM_PGTABLE
  	select ARCH_HAS_DEBUG_VIRTUAL if MMU

--Sig_/mdpR1EtHM1Px4jCiL8ByTj6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/ArBEACgkQAVBC80lX
0Gys1Qf+P0Mf5+YYWXdzE7V6jud1uw0+5ZhGrZYYKgXbcX+y8W8yw4h4fVj1cWCL
+JKCdCIyEKbzCGyG6xT9Vk2R8LnPSHCpQl11gfAb521Jo0/o6kYNyan7mpehaOfJ
kxfZ40tp5o0T/j/XtSq08dFRRZ3//+c+8gL7taKN5M3V2LG3XAeWU5rQSPa6FfsA
oIdR5tx4/BaxCJzoPb5ReHhJC3wEFNEi3bZDgMqoEgIv1Y6g27nbbvJsGABoRSOO
uhJbPxzuu1Vcg8GbZrl1atqRMALN7HhwCeuBbRkbYgRgNd2YWIzjQp6CIgJxGjB3
+nK0DIH9GUe7z8CRKfGVt4TNRhR2Jg==
=v5F5
-----END PGP SIGNATURE-----

--Sig_/mdpR1EtHM1Px4jCiL8ByTj6--
