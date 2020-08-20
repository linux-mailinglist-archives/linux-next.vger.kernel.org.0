Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B724924AF15
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 08:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgHTGMo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Aug 2020 02:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgHTGMo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Aug 2020 02:12:44 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0A3C061757;
        Wed, 19 Aug 2020 23:12:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BXDpJ29GZz9sR4;
        Thu, 20 Aug 2020 16:12:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597903962;
        bh=HWHDaXPAm7UiyCrCIz0tHa8AKqef+xsZdReZwqUZtCk=;
        h=Date:From:To:Cc:Subject:From;
        b=WIoVvNV9zMWtLjwsaAQdOIsPopCnuWhalkBrjEc5gSecTrZcabjZEHS+r5nyzXgrI
         iiTqze/C2/JppxzpbKqtD+6BX9r+vj02ITkWHn2t8ae11L2mqU+U0dyeRxVDg8JRlQ
         xdSd+GTnWx8uVnqgWOvdz10m82xEP67/kxgQUkmegjdIae2ExxeHBWju6gLj2uH/YR
         XW9MUwccAKfULg9bW8x48+GEsGmHiKn99SmH0wanZTdmkq/Gbs8V7PIIuXnfhzSpSc
         SI7l3gg5EetA5f/XNJ2txM5YfcrZE3WZT5hd1lf/1snYiP2+LnvFg97p/4HoD8gtGn
         L3q2aywGTsecQ==
Date:   Thu, 20 Aug 2020 16:12:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luca Stefani <luca.stefani.ge1@gmail.com>,
        Borislav Petkov <bp@suse.de>
Subject: linux-next: Fixes tag needs some work in the tip tree
Message-ID: <20200820161239.25a9b3f4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r2GnR3IWt/2rjcvPS1kydfe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r2GnR3IWt/2rjcvPS1kydfe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  71aefb9a89d4 ("RAS/CEC: Fix cec_init() prototype")

Fixes tag

  Fixes: 9554bfe403nd ("x86/mce: Convert the CEC to use the MCE notifier")

has these problem(s):

  - The SHA1 is not all hex

Presumably

Fixes: 9554bfe403bd ("x86/mce: Convert the CEC to use the MCE notifier")

--=20
Cheers,
Stephen Rothwell

--Sig_/r2GnR3IWt/2rjcvPS1kydfe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8+FFcACgkQAVBC80lX
0GxGCwgAn2tHHsyceTZJHkTxKlK2ClsBJEAJ4wrpL8kc98GR2DRw4WpbwO4olEqV
LoJny7+iPPmpV/A1sR1ZUXI7od2qNEj8rCthuZm6JgkXPtvvnBL9quHeJyqHveTQ
DVt3eTatUZa6uXL2aJkY3gzVa5gncouEFdiEIPIhsuj5uD1HLNdewzLlQRSFQgjL
zBOakI1RxT719fVZlCpVhR11pZH32hHPut4LCsUA7n9meNpV7GyKEJtbJ5kb8UOo
Gorbg51kwvNOTIw4fTFzWbr/SByLlPXfaL97Ot7tF3jnS1JO9HebIkt5yiJPKh5L
OERFf8hlXJuXHS/zGdL7YlbrCg0kWw==
=Lagh
-----END PGP SIGNATURE-----

--Sig_/r2GnR3IWt/2rjcvPS1kydfe--
