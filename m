Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DD63C1F7B
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 08:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhGIGqM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 02:46:12 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40071 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230178AbhGIGqM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jul 2021 02:46:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GLkBl5y3lz9sSs;
        Fri,  9 Jul 2021 16:43:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1625813007;
        bh=zRnKg92Qy0yJFqDlrH5MmaVcN8/HOJlucOHJWZHREIw=;
        h=Date:From:To:Cc:Subject:From;
        b=J6WixacCogbrM6dBgUYMLPBKiS+7LYPUZIQTr9FVh8GJIDuq9BU2ZWmlYKsRkUBG1
         fIDqdr7/Na/1tu911LzC5aKlE2aPiggn96PpgHlbOy6SxK18lrT+VMwi+P+kxmxP//
         GEzAcUZMhJruHmZO5Kn4jWGn/mdOhuJApXEviTahsYcOLo8FwK7dJHHH5PzJ56HEFb
         nxrEcaDB8krRqT+o+iyupKJ3BJhy8oza1UwJr2FDcKgeq1riRtxsq+jjbzvZ94+IhD
         jWxPPq95DkKNu8DzaOfd6xhbTG4ZRsrTxwhMQFrpojBxQ+jOzeNjEYkCHb3CiBjJp3
         /ShkphEgAZeJA==
Date:   Fri, 9 Jul 2021 16:43:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the irqchip-fixes tree
Message-ID: <20210709164326.18053838@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uBwsOx.SvS64Rk/+SwuRjwO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uBwsOx.SvS64Rk/+SwuRjwO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the irqchip-fixes tree, today's linux-next build
(jmr3927_defconfig) failed like this:

arch/mips/kernel/irq.c:118:9: error: implicit declaration of function =E2=
=80=98irq_resolve_mapping=E2=80=99; did you mean =E2=80=98irq_dispose_mappi=
ng=E2=80=99? [-Werror=3Dimplicit-function-declaration]
arch/mips/kernel/irq.c:118:7: error: assignment to =E2=80=98struct irq_desc=
 *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer without a=
 cast [-Werror=3Dint-conversion]

Caused by commit

  f333d6bc4a8b ("irqchip/mips: Fix RCU violation when using irqdomain looku=
p on interrupt entry")

Reported by the Kernelci.org bot.

Not all mips platforms select CONFIG_IRQ_DOMAIN.

--=20
Cheers,
Stephen Rothwell

--Sig_/uBwsOx.SvS64Rk/+SwuRjwO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDn8A4ACgkQAVBC80lX
0GxhxQf/SOHZ81r2kfXiX+Hgoinr7bWkVmVllkMi0ISNpzWoMPZWhdf9rMNKt0+t
eIBoDMei4GKbOUwwfRUNXWhbbISlIf45xNUOjArmXgWOEaWaljDNZe6MB0drMNvI
KVqO9d2YtZsW7YhPH23Vhr3Ucp41nQH08YhfbajQcTAaKz5fJc6Mg7YeAX3dprz6
7u0S8n6OJorbwEFhtsxmnACdOsigsDtEpLQ/iEaAetyE2rOZYEJyYdChsH0ATp+0
huMIBUULekwv6u5QQIkyQR9pTaRAUNCQdCm0oRy6Vx7E0KbjTk8YEqaI8aeqPDG3
14z+IgJ/XAhQ6lBn5DeDNHpZR7HqSQ==
=pYWq
-----END PGP SIGNATURE-----

--Sig_/uBwsOx.SvS64Rk/+SwuRjwO--
