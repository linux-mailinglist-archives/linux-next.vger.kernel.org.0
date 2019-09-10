Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5004BAED15
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731630AbfIJOdc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:33:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53689 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbfIJOdc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:33:32 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SSFJ0fKlz9sP3;
        Wed, 11 Sep 2019 00:33:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568126008;
        bh=yXOQaT5bvinXt6pLKKFxeQT0Z7vZcluV/1M6yvoOkqo=;
        h=Date:From:To:Cc:Subject:From;
        b=V8/WaLQL4amjraDF+8MRg9up2BqbXq6XgqKbvGEPGuUAcCjhr7Yczr4pTwJuKxMEb
         St1q2n7FsNMeOjo/q88rl8XCvvkupFP7BnIrWzhQ950dHxgm6oz/R61S5Fv8N9ce/B
         UALrbTX5YQ35r7R0TvEsh8cVAHF8iQky4WRTtanOmD/x+gCMMrW3A84QmHTgKg0+AB
         OzQsjfzHQgGp8UfLGLsCpXooZHuF/Y2bezFeb85BY8JkB3MlfZ6+Y+oim9nqJSaWS5
         PbxRSklG8YVAFvbYp3eLFM/ZOqRiRwx59sqJdURJyd3+GJLDR8B4pb0eoPAiW+OyU1
         cZuAftDTqb1jQ==
Date:   Wed, 11 Sep 2019 00:33:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20190911003306.74ca7251@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ri4BnrE64cvCcnMy8wwFDih";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ri4BnrE64cvCcnMy8wwFDih
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fd3f7275826f ("software node: Initialize the return value in software_nod=
e_find_by_name()")

Fixes tag

  Fixes: 1666faedb567 ("software node: Add software_node_get_reference_args=
()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Did you mean

Fixes: 1666faedb567 ("software node: Add software_node_find_by_name()")

or

Fixes: b06184acf751 ("software node: Add software_node_get_reference_args()=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/ri4BnrE64cvCcnMy8wwFDih
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13tCIACgkQAVBC80lX
0GxCPQf7BwgHuRft5yeff0IEVoiG7l1HNaTMwkibwKOs63UX7rhHBjOFOMnrXCCe
KBBLqZDkwbqF/+l05nrIJKriO+TBrRxeuZVQXowxJdwUdlagcRKJ+t9vlZMjrWEA
JSfc05L8IyZAivn7Qu/XiMEbFqTSHoihXFwG3sTw9ufQhLtFk1ndH3CkFhg2ZZkm
PLTKOSoF/ZAV5pw6up32fe9u/E8r5MhFjgOuaGKxMLdV3K1yMCy3oMeLnhMwuoGi
DV72p7isfmnnsXEJvaAsDB+LSwl1NckiMfbkzuVxdlV3Hp1TpfjTbhzk7gevTlCk
OKr/jnuSw+SjnKZFIbQksJOfz0Kf6A==
=/MsX
-----END PGP SIGNATURE-----

--Sig_/ri4BnrE64cvCcnMy8wwFDih--
