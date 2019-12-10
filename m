Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC56119F15
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 00:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfLJXKH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 18:10:07 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:34367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726631AbfLJXKH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Dec 2019 18:10:07 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47XbPS55Hkz9sPJ;
        Wed, 11 Dec 2019 10:10:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576019405;
        bh=s4kAVRmu0qUkywyluDQQPX3/eJtFL6sVUWz6pbtnLkg=;
        h=Date:From:To:Cc:Subject:From;
        b=owDXI36xHWMwOPrx7dl3pP2kAVlhunsk9+rTmeSHQb7jLosb7Y0Nww8UtQ0XB3kkz
         DSbYquREyGExvkYzuljsh0PJx+4Jqu1CwPmsSA4mJWqBJ8a+njctzOiP3Y6IBQ6Fpc
         R2m4gyqoKZV+5sLuTI9ba6xxx485WpmhHYRQI6g0pHdM/DRhQDYKPtW5uxmHTI+7oG
         DRuG0txWlX3N8XQYXlfpQr5QqaH0f18Hizbs6v0on2G6ayiz2Mh+QlAYvHl3AlkGBW
         sj020lJhd7zaeko9hrzPoAmhfarAD4IgomCajfnEJbTPvG2lx0YR1qcB23nGKaPXoy
         EgcEWuQRrxzSA==
Date:   Wed, 11 Dec 2019 10:10:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Subject: linux-next: build warning after merge of the gfs2 tree
Message-ID: <20191211101004.35db8a07@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uBg0EnJmkZOQ2GC8eCmCFzh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uBg0EnJmkZOQ2GC8eCmCFzh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gfs2 tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/gfs2/lops.c: In function 'gfs2_find_jhead':
fs/gfs2/lops.c:536:13: warning: 'bio_chained' may be used uninitialized in =
this function [-Wmaybe-uninitialized]
  536 |    if (!bio || (bio_chained && !off)) {
      |        ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  1ee366c67176 ("gfs2: Another gfs2_find_jhead fix")

--=20
Cheers,
Stephen Rothwell

--Sig_/uBg0EnJmkZOQ2GC8eCmCFzh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3wJcwACgkQAVBC80lX
0GyhpQf/SS6rQr9mlG3fPKdI/toUmmkZiEr1kVd/g4xPUs2BMDJBJkjunBpP3ISY
dVDeXy+M9xMb+tjVqa5juobYgnidNZxRLkT8BBWUTZo0lLF/w+U7nwmaFtJCEIcR
gApvOYx+ciz2EZvgz49BeG02J0F+geLZJHkuj0S4Jwx1mcKqxjJ3ZHGkEzF2HpuI
A4HSLykIHT+swWzo+Al60LKabAIz4hgF0bwfiZU9uvy103e025AlBDgfXqIe8YIi
YFV2N6FqPbdkejVCU5sZskP8DGjFrwK0OJghpp+UUZ0iLofFtYTbMe7NlkRa6MjJ
2LzLa+sshrdhCzAGmfcP5x7p045Iew==
=WKg6
-----END PGP SIGNATURE-----

--Sig_/uBg0EnJmkZOQ2GC8eCmCFzh--
