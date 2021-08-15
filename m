Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0B43ECBAC
	for <lists+linux-next@lfdr.de>; Mon, 16 Aug 2021 00:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhHOW23 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Aug 2021 18:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhHOW22 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Aug 2021 18:28:28 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336BAC061764;
        Sun, 15 Aug 2021 15:27:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GnsPQ386Wz9sW5;
        Mon, 16 Aug 2021 08:27:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629066474;
        bh=GL0WkzuJBwb4nB1CUPHXfzKvAmz2FBpioUMDj69Vrw4=;
        h=Date:From:To:Cc:Subject:From;
        b=ArJ+wmRgQnsVs5WSYPO/H0OL9uRI0h9Z8orQJeRdsW8gmqBjc6mHhrEMfF1gxQ7eu
         AOnSvyUTh7DHM3RrIMHeIBlA/MNnLkFsCv9cNmZNEMh1ZDth9bSyXVdExLzZpiff9o
         IwrC1ml6V5JTGlC3LP0K4V+VGTe/tRRdy3fSQBBl6+R9NaWwt7ZIV6HjwDK1n8Uk/i
         bIGcuLZ+62126ex10ASRgwcqERZFs3UETRs/1K1cob1wx+k77Hi461HeecMmdKCgdu
         YqZXqfIiqCrzp2WmnROC+qXiiJaPcspjY0cdxlCHxT6WBkT2hO3T1f+rmqf9fvHdov
         LfFvpy76xGHEA==
Date:   Mon, 16 Aug 2021 08:27:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the powerpc tree with Linus' tree
Message-ID: <20210816082752.415ae787@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8YGGvlsd/AQ7543ZTVBmOiu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8YGGvlsd/AQ7543ZTVBmOiu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/sysdev/xive/common.c

between commit:

  cbc06f051c52 ("powerpc/xive: Do not skip CPU-less nodes when creating the=
 IPIs")

from Linus' tree and commit:

  17df41fec5b8 ("powerpc: use IRQF_NO_DEBUG for IPIs")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/sysdev/xive/common.c
index 943fd30095af,458645c7a72b..000000000000
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@@ -1170,22 -1166,6 +1157,22 @@@ out
  	return ret;
  }
 =20
 +static int __init xive_request_ipi(unsigned int cpu)
 +{
 +	struct xive_ipi_desc *xid =3D &xive_ipis[early_cpu_to_node(cpu)];
 +	int ret;
 +
 +	if (atomic_inc_return(&xid->started) > 1)
 +		return 0;
 +
 +	ret =3D request_irq(xid->irq, xive_muxed_ipi_action,
- 			  IRQF_PERCPU | IRQF_NO_THREAD,
++			  IRQF_NO_DEBUG | IRQF_PERCPU | IRQF_NO_THREAD,
 +			  xid->name, NULL);
 +
 +	WARN(ret < 0, "Failed to request IPI %d: %d\n", xid->irq, ret);
 +	return ret;
 +}
 +
  static int xive_setup_cpu_ipi(unsigned int cpu)
  {
  	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);

--Sig_/8YGGvlsd/AQ7543ZTVBmOiu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEZlOgACgkQAVBC80lX
0GzhFQf+PCiOx9n8QJgOMbL2b8dYOSvDlS7Q7e4n1g+ea3B9MdCbAUYVDP/XH7vQ
o0CD5hdNKcXiVOIKMVHmYB5pwTPFIjtDkxeECtUEKBseKVNJZM0NdwUgiPsR1JOu
yfNdQO6B8FFLIKjsA4b86cElyWEiSermEDm24hZLJ0NqFwSe/M4guMDxelRjHwKe
I+Z1D8rYJfpYRGan/QLOhe8fifnhGGwqq49noyidb53U3DKY6aoqEdP2lXbDPodT
GYrp2jIQTSrd3v7qUTNo9Rgrg1M/KDqDcl0bKbEqJ8e4LK0JuQ11eROcjuqtRHaL
w4b4hroL0r8GQxFss945ochaxSrv7A==
=ALq1
-----END PGP SIGNATURE-----

--Sig_/8YGGvlsd/AQ7543ZTVBmOiu--
