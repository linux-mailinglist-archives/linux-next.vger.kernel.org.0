Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F1A1B514C
	for <lists+linux-next@lfdr.de>; Thu, 23 Apr 2020 02:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbgDWAbG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Apr 2020 20:31:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39547 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgDWAbG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Apr 2020 20:31:06 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 496ys30GbJz9sSc;
        Thu, 23 Apr 2020 10:31:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587601864;
        bh=UHUv817hjErmI8Kp+Xk31dEJLk6fwvwdT6MslTcRF4s=;
        h=Date:From:To:Cc:Subject:From;
        b=fXWumdawnsh6cVY6U5QJXesvD7Csa9T4DFNtDM9Myld4EwmhgPCtpeC97rw5oXp9l
         LyYYPK3Y3J+hV0aP4jyUwEuHJFGV8t1r5Kn5NkGyvaBSh03T5QqUNPckt3y2VONSay
         jRrwXYEoHKXnkV3TeesD9tI9qAEc6sXQsybeT/Ikh+kfSIRerxXhQsMNqmrJ+M1nbn
         Z+78NtwKt7dp+5sc7DW7dDEGpG6JfaHA7Vq+TRRQCiDI7a5UeJlrfflxT5qbLYTVXl
         c7RrP3KcWx8U8Q66Hq6yD/I1p2CJjx5IAL5svR0njzxXLafD93epWvTeCGfJ5/5Wqq
         RvLwlYiJbzetw==
Date:   Thu, 23 Apr 2020 10:31:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paulo Alcantara <pc@cjr.nz>, Aurelien Aptel <aaptel@suse.com>,
        Ronnie Sahlberg <lsahlber@redhat.com>
Subject: linux-next: build failure after merge of the cifs tree
Message-ID: <20200423103101.0d416eb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/n2uuqLtGjfvdVydf.w_cdJU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/n2uuqLtGjfvdVydf.w_cdJU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cifs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/cifs/connect.c: In function 'cifs_find_tcon':
fs/cifs/connect.c:3378:45: error: 'struct cifs_tcon' has no member named 'd=
fs_path'
 3378 |   if (!match_tcon(tcon, volume_info) || tcon->dfs_path)
      |                                             ^~

Caused by commit

  f73409e5babd ("cifs: do not share tcons with DFS")

# CONFIG_CIFS_DFS_UPCALL is not set

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/n2uuqLtGjfvdVydf.w_cdJU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6g4cUACgkQAVBC80lX
0GwrnQgAkzPK+CDasBQ+GgXMr03z4msIJY8uqddNYwZV4O9ISJ6YPJ7fuAdC89Fr
V05Df13g12U0MZPZp5xeL05Ju303rhKmsFaeh+r9+7ynvZt8wK8wMX24caQXWGAg
B6NsdELs/6DbccETPBtSemyltP/gN/JuKqBa9LDyf0ArpJz9thsZrEPavKMUFS8p
cDDuj5L6jzprPfEoHSWxtB/Hdoa2g5EC50rQjdjA4+s6srgcJgeaYeDP1RxNshGd
RLN40RgDP4aEiuPXSOQG4K1a4lJwt7JTxe7hyNIp76wHZaKsQnYEO0fbul4Joqd9
ecBPeyx5mp25ckKwnjO21bdOE2NQ0Q==
=a0M0
-----END PGP SIGNATURE-----

--Sig_/n2uuqLtGjfvdVydf.w_cdJU--
