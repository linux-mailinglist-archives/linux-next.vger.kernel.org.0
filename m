Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9868635521B
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 13:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbhDFL3w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 07:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbhDFL3w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 07:29:52 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C38C06174A;
        Tue,  6 Apr 2021 04:29:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FF50N1fWQz9sRK;
        Tue,  6 Apr 2021 21:29:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617708581;
        bh=G5FZ98R4fey2S1dGj4/abcLMMGcg1sMzqpv1R+DDjPw=;
        h=Date:From:To:Cc:Subject:From;
        b=pTy+lUGTgymAJ1h0y3FSdLSa9CMfriuobwt2KHfNp6KLNRylkMKlPdcjJ+pKaS2wA
         qcod8YWTFrvHOOCHAyz/DwHeGyBOl1V4i4Y/RIT0jEMRy9Ze6v3c/2+0unCJNtSC/g
         o/cpSOSmuLTHqbClfCH08ZbB5cdgJWla2Np2PGIbSNuWLRfEvkqYq6vY1zAqSswFnQ
         iMKz1eiGd1jokLX9z04nRPszIaalb+xTAOuq828CctKpKOphdInCT0lEsS/T5pyLrD
         lPMqkA881HUiJOZjpXv0yTgNMi7QBgd8/clmBtBr3AQn8FZyFE1Z2AZor5T8IgruLn
         CS8V00sNVp2eQ==
Date:   Tue, 6 Apr 2021 21:29:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Tejun Heo <tj@kernel.org>, Wang Qing <wangqing@vivo.com>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Message-ID: <20210406212939.3853c648@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/..ajPmjgIO31L/PW0=7Sj51";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/..ajPmjgIO31L/PW0=7Sj51
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/watchdog.c

between commit:

  89e28ce60cb6 ("workqueue/watchdog: Make unbound workqueues aware of touch=
_softlockup_watchdog() 84;0;0c84;0;0c There are two workqueue-specific watc=
hdog timestamps:")

(pity about that commit subject)

from Linus' tree and commit:

  3dd2b5b9c268 ("watchdog/softlockup: report the overall time of softlockup=
s")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/watchdog.c
index 107bc38b1945,090b6bc4de79..000000000000
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@@ -278,10 -290,9 +290,10 @@@ void touch_all_softlockup_watchdogs(voi
  	 * update as well, the only side effect might be a cycle delay for
  	 * the softlockup check.
  	 */
 -	for_each_cpu(cpu, &watchdog_allowed_mask)
 +	for_each_cpu(cpu, &watchdog_allowed_mask) {
- 		per_cpu(watchdog_touch_ts, cpu) =3D SOFTLOCKUP_RESET;
+ 		per_cpu(watchdog_report_ts, cpu) =3D SOFTLOCKUP_DELAY_REPORT;
 -	wq_watchdog_touch(-1);
 +		wq_watchdog_touch(cpu);
 +	}
  }
 =20
  void touch_softlockup_watchdog_sync(void)

--Sig_/..ajPmjgIO31L/PW0=7Sj51
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBsRiMACgkQAVBC80lX
0GzOxgf9FTIX5om8IMI/Qz+J6JxUpd3mfcrOEps/Mlky8t16qxSljuXOGTz6ktmH
/z3KGUE4dNMfFzKbKMQLDOIBOfhfbZ+w6YTxHtdSx59CPP7INTj+WAPObPHt/UKo
iohSgDtMtBU1hVpmKhRrZabx8ky7sW9r0hN68T3tib5QVkv6jqGLInHKV8IQiXvj
ltGNnd405KlKOgO3Tugz+G6eJ+AusgTNCQBkjovILDQ/d+unY56pIBT5fQ08QZ0f
j2rZ/z9RBW3AGIPav9BmJZZTJc65PdbvmVopDwnjiC7xvBm1IEsXg+vHMv3EA+i1
BZi5tncPaZkSLIzSINVVYDAgDSfliQ==
=yZuv
-----END PGP SIGNATURE-----

--Sig_/..ajPmjgIO31L/PW0=7Sj51--
