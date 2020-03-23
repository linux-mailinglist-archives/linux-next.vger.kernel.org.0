Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323F118F006
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 07:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbgCWG7w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Mar 2020 02:59:52 -0400
Received: from ozlabs.org ([203.11.71.1]:38041 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727130AbgCWG7w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Mar 2020 02:59:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48m4xw6NqGz9sQt;
        Mon, 23 Mar 2020 17:59:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584946789;
        bh=4zVZ8n18b5z/arjANnQYCVNjH7d5lumRkPAkbt+RQzk=;
        h=Date:From:To:Cc:Subject:From;
        b=jgXvOZpYOkQ8iDTqdDNXWuGK+LzfxJqTI0F4GsHlQzmogZTFaPyHPl++GsMM41aYh
         /PrHdlKU+3EXqqb94cVPvNVcfDKDf1F3Zm3byNPKbpos44pzLNq7SQW3i11ihDT2CM
         DgZTfKIySKuAYvhh+zM7BraFubvx15mHVc6PQOBqyNSkRVy33PjV4e6saUXIaAkBS+
         56a22mg0wp/MbTs1ONl7pdauEjZhEJjwlew6UkgT5QnZb+xk3N8vp0z7UZMp2VfU7D
         qSB8hTTk0zUCaFbG1d4wqZkj9KuydzpmBS2kifZFgGFLmt+lwA6BxzTKeoAwC+Ws24
         iBiILoZAa7N5Q==
Date:   Mon, 23 Mar 2020 17:59:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <marc.zyngier@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
Subject: linux-next: build failure after merge of the irqchip tree
Message-ID: <20200323175946.7ad497ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ohxYhixbqsgEzYBk7ocR=+3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ohxYhixbqsgEzYBk7ocR=+3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip tree, today's linux-next build (powerpc
ppc44x_defconfig) failed like this:

drivers/irqchip/irq-xilinx-intc.c: In function 'xil_intc_handle_irq':
drivers/irqchip/irq-xilinx-intc.c:176:10: error: implicit declaration of fu=
nction 'handle_domain_irq'; did you mean 'handle_bad_irq'? [-Werror=3Dimpli=
cit-function-declaration]
  176 |    ret =3D handle_domain_irq(irqc->root_domain, hwirq, regs);
      |          ^~~~~~~~~~~~~~~~~
      |          handle_bad_irq
drivers/irqchip/irq-xilinx-intc.c: In function 'xilinx_intc_of_init':
drivers/irqchip/irq-xilinx-intc.c:253:3: error: implicit declaration of fun=
ction 'set_handle_irq'; did you mean 'generic_handle_irq'? [-Werror=3Dimpli=
cit-function-declaration]
  253 |   set_handle_irq(xil_intc_handle_irq);
      |   ^~~~~~~~~~~~~~
      |   generic_handle_irq

Caused by commit

  a0789993bf82 ("irqchip/xilinx: Enable generic irq multi handler")

I have reverted that commit (and commit

  9c2d4f525c00 ("irqchip/xilinx: Do not call irq_set_default_host()")

that conflicted with the other revert).

--=20
Cheers,
Stephen Rothwell

--Sig_/ohxYhixbqsgEzYBk7ocR=+3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl54XmIACgkQAVBC80lX
0Gwhgwf+Ov/dsYwLKygiz6exKxfyD1f2MpdvOBDZBjxZh+t608n60XxvsLBC21jY
rdXY0uLYrEBZcNYQKMGGrecgvkgiOULJ6DPMDqL9a/dpL982k75HV9xw4B6oKN8O
Dw2wLH+wYNYB2X797QF4PJ+X2zBM0i4+3pme5dchWPndLlf5Y8Ie0tvRydZhPwhB
9J5XVr1mCAEhae2bW3nA/VMeB5ncCad+IqNJzuh4tZQUv6uLKBsMS3cOBXk3GF7s
3s9U/r4wrBhO/OLGeNgQWDeRd+wYGyQPjWJXD7yyPd4QHJeDHZhhqpfFWIKz4+Un
4veXEZQuPbZPKM1QlkEhtd4x1DXALQ==
=kq9P
-----END PGP SIGNATURE-----

--Sig_/ohxYhixbqsgEzYBk7ocR=+3--
