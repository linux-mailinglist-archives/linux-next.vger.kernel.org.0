Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED4D187AAC
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 08:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgCQHw6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 03:52:58 -0400
Received: from ozlabs.org ([203.11.71.1]:37745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbgCQHw6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Mar 2020 03:52:58 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48hQPz2Xv4z9sPF;
        Tue, 17 Mar 2020 18:52:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584431576;
        bh=DSwURBa8VIT0PGHZw7lwX4Ge4O+gelfo51SaBJ2swuE=;
        h=Date:From:To:Cc:Subject:From;
        b=NTwOhRl4EuzkD7IUdweJ5shFBxIdD9cWY+Gl11jZKlpEz72tzhSYpU6VD9v0qUtk+
         eT4QHNYXzLvExKBrtgFYyWPGslb87rwgn/ygzg3ot/qPYoUr4jmUHUR/cOpmwmbmGF
         zMl8KhXhFBz7qk+8frS+x0+1prN1HxinOqrEq/bCHQZmVH+1DHfVaYZVy+v+yKfI1C
         rrSXQzgR2lpZy6k+dvd7G1Y45QUNKSb20OxkL/tGzl8MZFz3K5hrq3cUmph7sLv9D2
         UHOpIKLXYjxNxb/LFL4KbLCOruf7fRtn5vyYCr4KwVsmWPRWMiJk0wlBaAcbap1Ctj
         ZcpXwDVmxN69g==
Date:   Tue, 17 Mar 2020 18:52:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Colin Ian King <colin.king@canonical.com>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20200317185252.3cfeecde@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uI9yGzSnE/VILAmY_B74A.s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uI9yGzSnE/VILAmY_B74A.s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

fs/libfs.c: In function 'memory_read_from_io_buffer':
fs/libfs.c:829:2: error: implicit declaration of function 'memcpy_fromio' [=
-Werror=3Dimplicit-function-declaration]
  829 |  memcpy_fromio(to, from + pos, count);
      |  ^~~~~~~~~~~~~

Caused by commit

  08c07cefb304 ("ACPI: sysfs: copy ACPI data using io memory copying")

Missing include of linux/io.h?

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/uI9yGzSnE/VILAmY_B74A.s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5wgdQACgkQAVBC80lX
0Gy2hwgAiw8PNpH6t1aX/qvZYVwXeQcVvh3qg/M/0zjpt8zM2latl9NaOetsEa82
5JvnSwiC41FGcyea03Ur9i/5QOTipKysdZOcBoP1DKKvvzV3c+sgkykYa6bEg+qI
/qOcDsnIzpRQ6O5o54OUyaQC3VJygqTN8apdsyyMYn/vV6iXb+mzhy4NlBmUbMd5
Juu9y9zG1BxMenhDjQgsTpdFGc9WBw6H9Gmsi0L/zLdLBhILkzpnpWcjv3I+cmMB
qvpKNSxGbhxLjhrS6gYQulfo+kTh/z5Opz1eCMAQiqlkxBvYIKuDYImXcqdYJpjT
cNdBpMDJK8P7rieoNJvLuGiKF8jzOg==
=jLTP
-----END PGP SIGNATURE-----

--Sig_/uI9yGzSnE/VILAmY_B74A.s--
