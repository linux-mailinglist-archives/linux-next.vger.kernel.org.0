Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4813F534A
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 00:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233002AbhHWWTo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 18:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232990AbhHWWTo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 18:19:44 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7716CC061575;
        Mon, 23 Aug 2021 15:18:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtmqH3pXwz9sXM;
        Tue, 24 Aug 2021 08:18:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629757132;
        bh=SqFR1+GFg/XzfjLfUoPrAsGOSLBS8fPQOx395SHMlpw=;
        h=Date:From:To:Cc:Subject:From;
        b=YMnFvd6rOIYSZxTBS/8sGKpEyx6yWiKjGULZ3aWSJcANT4o6xMsHnr/ThWB8lmLDG
         oGTExIonr7LZzD6SwydXtbB/lIvj6P92IqWqkkpMKG0ANR155uOrg1H492INe4uyYI
         cDkwRUCg3wm0CLl0JZI+rElxIdGHJv3g309J38A5AtfTk0u+VKgwwmDFjp5bNI8fky
         I2wpjhtVQzJ2lAsFLnRBfyEvoiPasG7P9yWBkQEDK2h61wFSEApz1wC8wmhpbc5MQh
         SOMj4BfkMX4dTiFaR5xflxUe8YbvSegXb/QT9QTWmTCX5QSwrfwTsF43OuJ9zHqAYh
         z7dj3dnf0asaQ==
Date:   Tue, 24 Aug 2021 08:18:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc:     HOBY Simon <Simon.THOBY@viveris.fr>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the integrity tree
Message-ID: <20210824081849.75909e73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jN1k1M3TtK=Gu64qD1+JGqv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jN1k1M3TtK=Gu64qD1+JGqv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c594ea470f30 ("IMA: reject unknown hash algorithms in ima_get_hash_algo")

Fixes tag

  Fixes: 50f742dd9147 ("IMA: block writes of the security.ima xattr with

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split FIxes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/jN1k1M3TtK=Gu64qD1+JGqv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkHsoACgkQAVBC80lX
0GxWgAf/YKvKfKJ6Q0eQTmtQOxqlW/mUooMSTfamf9guSj4PgsaYrPr4WaxQ/zgL
AAU5cJKwZL1KqNytIM3LmpkvACd5MhF5px127t5FyHPGbblsgKtzsgIOecvMeBaG
oXMgAGH8xcPZZelV8gcKkwBT/O5srYM/cCDrLp3dPpzvOKBa3PdC9rew2nsJCPFm
0UONbnJNRp2IdQD9T1E9rqJ/DK/UnPlluBZ4AhHnWXJHlYVIIxIPxDiXXJuuPZOk
y46tImrdFPBJeJZvwhl81CoApX0BgdiBuU/iMG1IQTewq75kdbQn+T63QoMMTiW7
/ctMHDaROEUCRfpn2gQlXGDQwxmFQw==
=q9j1
-----END PGP SIGNATURE-----

--Sig_/jN1k1M3TtK=Gu64qD1+JGqv--
