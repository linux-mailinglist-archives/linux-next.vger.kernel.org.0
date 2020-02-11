Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C882159BF3
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 23:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbgBKWKi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 Feb 2020 17:10:38 -0500
Received: from ozlabs.org ([203.11.71.1]:52471 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgBKWKi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Feb 2020 17:10:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HH5l4F5Zz9sP7;
        Wed, 12 Feb 2020 09:10:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581459035;
        bh=Dr0xxLn39dedMpKaNvhAU5gACpir80RsihGYKjZ3Tjs=;
        h=Date:From:To:Cc:Subject:From;
        b=CncI3Edg7u+wORMgie7PUBjmfwr/3sHavtDmLriAb3JumUowOI5OqNnn70GYsrl6T
         Hv2pm3RLftEErAnt3V630n4aejWv1yjxDVHBUp2gxtWtu9r2QRshmHHix2pe2VoHtr
         9+abtNo8law4JHWUiSrN3nB3GsQ3pB/SdJ2zmnkYuOYzibUGZk9aKMpgWdidxiiRpq
         5Vxcj4Yhm6g5xRtT8DJBCtpUmYc3QXKLMR6tQ4xBBZ5+fC8u+CBVCsC1oUGw1ZeU+j
         nqMYY5ISzWBVayV6FraTPgmuTicOWREAJl5BhcwOsbp4PEbrFv8h05f84ciRSnnvMC
         SlJ2JT7v4m5YQ==
Date:   Wed, 12 Feb 2020 09:10:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: linux-next: build warning after merge of the btrfs tree
Message-ID: <20200212091028.718ca6dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oVBlPMaZa.OWXMy_9UTwBAR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oVBlPMaZa.OWXMy_9UTwBAR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/btrfs/volumes.c: In function 'btrfs_scratch_superblocks':
fs/btrfs/volumes.c:7338:3: warning: ignoring return value of 'write_one_pag=
e', declared with attribute warn_unused_result [-Wunused-result]
 7338 |   write_one_page(page);
      |   ^~~~~~~~~~~~~~~~~~~~

Introduced by commit

  d19ec014a46b ("btrfs: use the page-cache for super block reading")

--=20
Cheers,
Stephen Rothwell

--Sig_/oVBlPMaZa.OWXMy_9UTwBAR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5DJlQACgkQAVBC80lX
0GydCQf9G7svO/es8Fnp872Ion2c01UCumtSN8FBdKv2DdYnrQXz/lC8EJuTjKDL
e74AiQSULPR16estXzu/En1wV5tbIBMVv8E55tJ7oBrFkVCEm+e8UvEQbhMjB/mk
sdSc2ZK09UhLDmIbkvknWnYw4v5wWOy/Hy+GNo1kLIRp3wo2R1Ez4IPDz530pWTa
FEgRrvgJlpgdAGc4SI1rYcRfB/fWcTQnyzmrPx0OMlbBkZOUQDlxZTuTtER+nZhJ
XcoawJWgDlv5L/WEIgwFMc82dJQwkSD+auhHVTpw5OioMVr3tMCRLBllZd+8d6S5
rG4aKh3UsBhT7AM1IuPj9Dhh4bFFMg==
=c4cO
-----END PGP SIGNATURE-----

--Sig_/oVBlPMaZa.OWXMy_9UTwBAR--
