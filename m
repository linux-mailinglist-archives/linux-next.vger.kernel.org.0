Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9A4273D01
	for <lists+linux-next@lfdr.de>; Tue, 22 Sep 2020 10:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgIVILe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Sep 2020 04:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgIVILe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2020 04:11:34 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEBB0C061755;
        Tue, 22 Sep 2020 01:11:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BwYt972pXz9sRf;
        Tue, 22 Sep 2020 18:11:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600762290;
        bh=4+6lXUooVHeQ31amWJF98NQZGjJOhn3ZoiUqLYqrFR8=;
        h=Date:From:To:Cc:Subject:From;
        b=tl/r2Uj5XxqkM+ZXFv18FyE0AryEze09c9pfyOkUS0yMMwuvqNHdk6pS8VsypQdlI
         mWLQqXoyVcU/5ML0TrUt0NBI30kfRL8q+6Czq1EAmUF5GWYxCKFM21XuB2JBeW3i7p
         t7TuMtlgZc/iSWbjz3giEbxNmOHnBZ18F7J0pTA0tWXsAps0wXub09qQrGj1xhqPOJ
         DmuIe7gdwKqRO2JWeMb9qfT6H4AUsC+1KPn8QlYUqcax6b3HsLK0Eu4FEY41aP2NR2
         aerCxq7RyoGXYLX/nT7AHYyPC93+53qSnhGXfZ314r98+ijNqelq1NAadmtTNLgDQ1
         vhGjuligNrz3A==
Date:   Tue, 22 Sep 2020 18:11:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warning after merge of the pm tree
Message-ID: <20200922181126.3cae159a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0AhTDhabbqDCyGKu1u17Nrc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0AhTDhabbqDCyGKu1u17Nrc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (i386 defconfig)
produced this warning:

In file included from include/acpi/acpi.h:24,
                 from drivers/acpi/acpica/hwgpe.c:10:
drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_read':
include/acpi/actypes.h:501:48: warning: cast to pointer from integer of dif=
ferent size [-Wint-to-pointer-cast]
  501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
      |                                                ^
drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI_CAS=
T_PTR'
   18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr))
      |                                         ^~~~~~~~~~~~~
drivers/acpi/acpica/acmacros.h:22:43: note: in expansion of macro 'ACPI_CAS=
T8'
   22 | #define ACPI_GET8(ptr)                  (*ACPI_CAST8 (ptr))
      |                                           ^~~~~~~~~~
drivers/acpi/acpica/hwgpe.c:50:17: note: in expansion of macro 'ACPI_GET8'
   50 |   *value =3D (u64)ACPI_GET8(reg->address);
      |                 ^~~~~~~~~
drivers/acpi/acpica/hwgpe.c: In function 'acpi_hw_gpe_write':
include/acpi/actypes.h:501:48: warning: cast to pointer from integer of dif=
ferent size [-Wint-to-pointer-cast]
  501 | #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
      |                                                ^
drivers/acpi/acpica/acmacros.h:18:41: note: in expansion of macro 'ACPI_CAS=
T_PTR'
   18 | #define ACPI_CAST8(ptr)                 ACPI_CAST_PTR (u8, (ptr))
      |                                         ^~~~~~~~~~~~~
drivers/acpi/acpica/acmacros.h:26:43: note: in expansion of macro 'ACPI_CAS=
T8'
   26 | #define ACPI_SET8(ptr, val)             (*ACPI_CAST8 (ptr) =3D (u8)=
 (val))
      |                                           ^~~~~~~~~~
drivers/acpi/acpica/hwgpe.c:85:3: note: in expansion of macro 'ACPI_SET8'
   85 |   ACPI_SET8(reg->address, value);
      |   ^~~~~~~~~

Introduced by commit

  7a8379eb41a4 ("ACPICA: Add support for using logical addresses of GPE blo=
cks")

--=20
Cheers,
Stephen Rothwell

--Sig_/0AhTDhabbqDCyGKu1u17Nrc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9psa4ACgkQAVBC80lX
0GzGSAf5ATk+4n3391Vk8W/JOb+AOCSwIfNqu6fCqB49Eq24v7z9JOYG1qAO6NaN
bU1S1uNdUK7xHmb1RY6NxClfFpmEkC2exhdUsQ4qT+zIQczC81iWezV8RWqieXyZ
CaGOvhebd7QfPCJrzbT4A0iWvCSPJRxFGl2NEIQc39MOgpfWtVv7AYlh09vAxUQA
qpZh1/AwYB3YsrDmU5a0fDv64OIimLP5+PtUxyFQMSRbkOt6NMFGYl8KF63V9fLw
KlnChBvVUOyHGaD299p/9+ALEpQ+LjdJ+pHXcLpfsneIhDFlFENHiOnB1AFTZeBw
rFRK9FeJ6aHpqpD1e0DD3+uFSWOLNQ==
=T2Zw
-----END PGP SIGNATURE-----

--Sig_/0AhTDhabbqDCyGKu1u17Nrc--
