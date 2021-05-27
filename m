Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277ED39258D
	for <lists+linux-next@lfdr.de>; Thu, 27 May 2021 05:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhE0DtQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 May 2021 23:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhE0DtQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 May 2021 23:49:16 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD05C061574;
        Wed, 26 May 2021 20:47:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FrDKl2zqxz9s5R;
        Thu, 27 May 2021 13:47:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622087259;
        bh=ixOj/LyZCZMg93j45320uMBGWVbjkfJAHTyx6wEnEoY=;
        h=Date:From:To:Cc:Subject:From;
        b=PtSBzP8LAyLgURC7LChKKniaGDL15DAGhdEoJwOQ9D1zBlSBskrBk86z57rLb2wpK
         yRcBV5K6d4Vv4qjNhJxyTDTvXDrgFlQLhtsJc14Lk6c5w93tGzPKupYNQI5IUkn7lf
         HzchIZrqjzvysf3vx7SZYUMRwIYOk8TE29NrRwME0HcK6zQDEoCge14iP7OsCwaVp3
         NVolOqsn4wd9iem4dxVoivdpu4bGJR6CLC5DEkBnkV4IAw0Ko7Fc+bm+UqGu3hn3DA
         nITnUbtF2BXwNz6m+DkjlCayFRzWVaOvVLU42a0uqZ6/pjhnH7L6qho0HWCWiqTKgP
         vvHntmll/0HWQ==
Date:   Thu, 27 May 2021 13:47:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Hannes Reinecke <hare@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <20210527134736.4522317c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eRVKyPqF.AUjTejTlthFLUd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eRVKyPqF.AUjTejTlthFLUd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/scsi/pcmcia/nsp_cs.c: In function 'nsp_queuecommand_lck':
drivers/scsi/pcmcia/nsp_cs.c:224:22: error: 'CHECK_CONDITION' undeclared (f=
irst use in this function)
  224 |  SCpnt->SCp.Status =3D CHECK_CONDITION;
      |                      ^~~~~~~~~~~~~~~

Caused by commit

  57de15221f92 ("scsi: core: Drop obsolete Linux-specific SCSI status codes=
")

I have used the scsi-mkp tree from next-20210526 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/eRVKyPqF.AUjTejTlthFLUd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCvFlgACgkQAVBC80lX
0GzzWwgAiiT/okXGGqbkZaNHBXnhLywNC/MlabC0KiDYs8R0C4RmRZeC8Xxz3uBG
DZB1DRUQaXVXpkdsPDw1U3MWVBFFKhh0vo8q0cT1dOMGVlRoxTiuI5YwhxUIBzr0
uAGI80NqYAKIL5GUq7ru/3DRhqfRQ0UCzaU3F459aimzzZc6kVwfGLIfWkev2S8m
R/HdJ+gjFXfhDU1s5kSGy6MulSHgTrrOk0zZw4yKpsJ/Gff533lqAUw1WkUGUxv3
tV8ySMs1SF4x46uLT5E0EPyt3m+MeNFivvM3OlLrIA/KuzBZanUtUBH9lMYEdWQo
YLdK3GoI+ioJovdPgdyuXtiqWuz1Hg==
=z/0R
-----END PGP SIGNATURE-----

--Sig_/eRVKyPqF.AUjTejTlthFLUd--
