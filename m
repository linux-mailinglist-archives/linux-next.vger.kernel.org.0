Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F10CED27
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2019 22:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfJGUFf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 16:05:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728212AbfJGUFf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 16:05:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nBL44Xncz9sN1;
        Tue,  8 Oct 2019 07:05:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570478732;
        bh=wuhQtMO0NTPtDu5wGaxF3zJNA91geQJ+Mf4J5r7hpSc=;
        h=Date:From:To:Cc:Subject:From;
        b=BGclEVl7NsjIbTWVxlcjb+mFHfF9yourqutHCF/Q1zYGj8DV21ylxkdrnp7xRqeWY
         tMg6gGOiCVWZk4Ucl8XMeNon0aA8n51xo7dFDZZ+uv5hf06fW8WQ5nOUUB/KsqLroC
         DtNvDBXwZOmgzztXjrPUZHIQHxEjwVg7lxXWOTenAuJ25fjFV3gJMVcZMp7YfyNp9W
         IovMbXkPIt148kOIbBqoSES8tCWmZOcdenbPQPBlp7vMTTpG/+fN38hQOjBC9w2rOt
         ecT7la68qjlzD3C9ujCunC8Qh0gc52/iELzGPpWjPH+QQ6wWJ5qZYzZqjMYw2EutAD
         L+6GcIEVX9Jmg==
Date:   Tue, 8 Oct 2019 07:05:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the kbuild-current
 tree
Message-ID: <20191008070525.0bdc942d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ubrsCXn7nZx=8+GqaSyjva";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2ubrsCXn7nZx=8+GqaSyjva
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  da6221f246f9 ("scripts: setlocalversion: fix a bashism")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/2ubrsCXn7nZx=8+GqaSyjva
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2bmoUACgkQAVBC80lX
0GyrrAf/UY6cZaJDePchgsa1UGpgEBE1YA5v1EO4q6JgL/Ud8FzKgvva5R0p/tnm
/bJ5DMns0BRG7VbdhryVbZydXEgbaBo/a38+AC11dlxNj5kpDx+1Bg/60+YMp8GJ
A+MAR4P4CLqLP3D8xsihgbGXNJVDpnoM0BamJT+1kn0wNpZZVtVrhUZ/BiE67oor
6c3WdzRWdcG9475a5rG0NFMpKQg/N+VSgsx+S8yDaO4j8cvgz1oDcnvGhz/V0DMG
p0pu2pE1dQgW+si7JgmfRIp1hmCsKE2Y/8rOGeUoLdSZLtgahyr1cvIM7jcLwxS6
n0W7Sek6P8RZFPT3IooyfXA08y2GwA==
=r2C8
-----END PGP SIGNATURE-----

--Sig_/2ubrsCXn7nZx=8+GqaSyjva--
