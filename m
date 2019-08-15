Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4388E904
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 12:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfHOK3j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 06:29:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbfHOK3j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 06:29:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468N405y8Yz9sN1;
        Thu, 15 Aug 2019 20:29:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565864977;
        bh=3A3hYpt/qBcAAQpmoH6zo0en2T61HontwzLWaXjB1j8=;
        h=Date:From:To:Cc:Subject:From;
        b=cQQ0B5V7QKoAHCzIJKwCqp2o5g/7WoHybh/guSDVqwlNlDgXayzeDYzpbu1kg0W+N
         ln4EpR1DbwxtkO9qjFwH+J6N86/XYCFinwww6DSogepS30WA7FY5IQDlS+2DE/rfEV
         HRcuNe5IqQC65IlDN5qh9kVIA3YnhQEV3ZNLKbWG1y9G/lM7p7hK9KbpErjugHOMj9
         PImSpeOaY/nwJzAVVaHMoKDnPIchpyKD0Wvoc2g+T+e3bwNbF8Ck85LZCs89VyRWBc
         7HaN4uGdJs4cTTDGehE9PC1hFFrXQ1O/nDvu+pUF3eqGvE0yd+pn4C1SZR61HVpnFp
         uQ7xNAAh4VZEg==
Date:   Thu, 15 Aug 2019 20:29:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
Message-ID: <20190815202934.1fb36c38@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3m=+M9rcvWTHUOqUP+gvXHE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3m=+M9rcvWTHUOqUP+gvXHE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cff1191553d9 ("scsi: qla2xxx: cleanup trace buffer initialization")

Fixes tag

  Fixes: ad0a0b01f088 ("scsi: qla2xxx: Fix Firmware dump size for Extended

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please don't split Fixes tags over more than one line.

Fixes tag

  Fixes: (a28d9e4ef997 "scsi: qla2xxx: Add support for multiple fwdump

has these problem(s):

  - No SHA1 recognised

--=20
Cheers,
Stephen Rothwell

--Sig_/3m=+M9rcvWTHUOqUP+gvXHE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1VNA4ACgkQAVBC80lX
0Gx3Gwf/Z4fGcttI1SECLXV2bXZI1iynp5wi4+YTkY2Z4FAHwmYVDEXfbSUSJ1tZ
I2lZpm6JXSj4pQXTgxonOzljKhjLZBWMiz3bSQkJvIuaUXq1/Jo/ElNBzbEv3kpM
ntegWMI0w1NvlFm3S4+i4xSF9IkqScMBLbLc7IVm54e3hnhhLldRwhd3q5bsRM6l
T4jMaIsIWDFxQxKpGIvx+wCKGaVZyGR7o4MbSWbQTfme2vR0GDp0cAFqUHYpCfiF
eidBE8q1PqU/B2DMFiqjbWwTY0kNU0Ba89ibWCX/bCZMCAezTTSAtgiyAu7E8spk
c/g9LM6bS2RMV5yQDvx5vRt7jTOYZw==
=V7pz
-----END PGP SIGNATURE-----

--Sig_/3m=+M9rcvWTHUOqUP+gvXHE--
