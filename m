Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53603333B00
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 12:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhCJLE4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 06:04:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbhCJLE1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 06:04:27 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D10C06174A;
        Wed, 10 Mar 2021 03:04:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DwTjf3Kjrz9sRN;
        Wed, 10 Mar 2021 22:04:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615374263;
        bh=M0R5BtxmG5VRwgjoqYn5Zqjv+QrYkDel5v1EO2fbjgs=;
        h=Date:From:To:Cc:Subject:From;
        b=RmipunGXJcIyh9fppxQMRU/171Oh1qAhHH0AuTlfolwoDAffKm2BXLKtXURsVnRRH
         afLLPQV6UK7GteBQWTr4Vyjksw877xfo8lLx9pMFG5fgBCNUcqG5iLZtl/oexhiDM2
         mBSqmUtNrLeVdYE9ipnJb6zTup1Vx1V9qj5vW3+ojtfI+d+aa0sXByvmAVO8VHItDJ
         oI5e1HR4NzDfRyCRr1JM1vzDaaKdTxoAxc36jHQ3DdVm1YIMMP72iKYZjIK9HGN26v
         CYF4MWXLBUZTCWk0LdxaPAqIWy048sDXDMqyeiajf18DlFWzmGDgJ/JqwlxA66O/mP
         INFj/zDdmqYYg==
Date:   Wed, 10 Mar 2021 22:04:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Oded Gabbay <ogabbay@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the
 char-misc.current tree
Message-ID: <20210310220404.086c426c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ceLJ4TPO8vpJzyiH1XEt0Y7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ceLJ4TPO8vpJzyiH1XEt0Y7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  15097e9338ed ("habanalabs: fix debugfs address translation")
  ffd123fe8397 ("habanalabs: Disable file operations after device is remove=
d")
  27ac5aada024 ("habanalabs: Call put_pid() when releasing control device")
  16db6b532fa4 ("habanalabs: mark hl_eq_inc_ptr() as static")

are missing a Signed-off-by from their committer.

Sorry, Greg, one of the hazards of rebasing :-( (which I know I asked
you to do).  I guess what should have happened is that the habanalabs
branch should have been rebased onto v5.12-rc2 by its commiter and then
you should have pulled that into your rebased tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ceLJ4TPO8vpJzyiH1XEt0Y7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBIp6QACgkQAVBC80lX
0GwYTAf/dGknWD0LYZEr/keHY+WTI/bvDyi5ucMAEVNmO8XQsm6lk3qimT3yFIrZ
An2O9f6iyumWg6/IhYyx8mqMsoXUaW+cpRA3Ao82VjgVUtmBrXHpDqi6aP0eNkjE
9kAoRuYL0Gzak53l95FdPIOGHC9vApVFsv9vRw5NyUm51m4WrhyrpA6gUh9Sr+9d
b5vrc7zo8VLLwBdc/AsSyT9VFANjCDBlB25nBmmuiqMLiWALMOEbGnLZRuNWWHmN
LkXgqsw3gCUt7v1WYtoCHc2IqoeCKQfdkEupg+b5kiwtO6OVnYECvJTTLeE+Sr9y
0SkpY3SuRATNEcPyYpzchueyH8mxJw==
=rdYG
-----END PGP SIGNATURE-----

--Sig_/ceLJ4TPO8vpJzyiH1XEt0Y7--
