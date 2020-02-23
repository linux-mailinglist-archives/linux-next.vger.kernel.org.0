Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435AE169A8F
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2020 23:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBWW5n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 Feb 2020 17:57:43 -0500
Received: from ozlabs.org ([203.11.71.1]:40645 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBWW5n (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Feb 2020 17:57:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48QgZX5MqBz9sPK;
        Mon, 24 Feb 2020 09:57:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582498661;
        bh=LppL+zXZRR2RuhQS03WEqjQ0MvrZBZ5ftT7jLArX0HM=;
        h=Date:From:To:Cc:Subject:From;
        b=QMxlKZL5SMNgeYr1fC5K47g4QzSQTbXzK1e3bQC+d01c+ToTdZvf9oqk1FnuIY4eA
         9JR6uCMr54YSWM+ODObpBE1U2M5g3qhqlLYR7XRLDW8M8N8bxwos4Bq4xasNn5zlv2
         Mi4qRMiFHg7/04j0vrk2sIXUzpvcxMGZIgpzf3AINrYJV2uC6+xVfHVspJ7v7B6SSO
         UtbmJ73KPvOnzj+FSNvUHAenvDVcdGadAnAFXkOuEn4vO7fFgScB2Dt7ZcrqS51asp
         wIiIuikcRmg8ts25Q+ojhVQgQOuQkmBxjnA8yTv7Venqsoe0uub8ctf8ns0lWuW4RB
         eEK1kuYt7UT5w==
Date:   Mon, 24 Feb 2020 09:57:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: linux-next: build warning after merge of the btrfs tree
Message-ID: <20200224095735.179fe582@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WdbFw7dQ_vZSuSPEsU.Is2+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WdbFw7dQ_vZSuSPEsU.Is2+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/btrfs/check-integrity.c: In function 'btrfsic_process_superblock_dev_mir=
ror':
fs/btrfs/check-integrity.c:916:9: warning: 'ret' may be used uninitialized =
in this function [-Wmaybe-uninitialized]
  916 |  return ret;
      |         ^~~

Introduced by commit

  5a03d907a555 ("btrfs: remove buffer_heads form super block mirror integri=
ty checking")

I think this is not a false positive since ret is only assigned is a
"goto out" is executed.

--=20
Cheers,
Stephen Rothwell

--Sig_/WdbFw7dQ_vZSuSPEsU.Is2+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5TA18ACgkQAVBC80lX
0Gx5agf/d0Hry+sKl9Q/OHWk/1gcc9n15hs6Rv9+T+aZEpJW8/C4t0NUrwvv7cl4
rr1KpTbt6MGjD64VenbOQdXheZOoKm5WJNgkDPw5sW7IFFFFWuj7baKmieCPnxnY
KamOAx04UUtgRGbTzupmeDnRP88/GDq8attPIil1jPAAmjUTCMuW/pOczKZPuPcn
7ok82GcTVDhs1XKhwsINnStusA5/Zd99UUxf7Txc6O8CZL/KnorAM6qJwZMfRXOn
X0QS9eFUfy1n+scxoNTyZDwxy/qgZs8Dnc5z0yBZROr/nxbNTfpmvAc8jEJzLEer
8uqr2bH9BHUK88MpdjGhTAx9SoiIvg==
=4uJh
-----END PGP SIGNATURE-----

--Sig_/WdbFw7dQ_vZSuSPEsU.Is2+--
