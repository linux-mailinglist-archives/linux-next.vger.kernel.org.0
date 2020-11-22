Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3508A2BC4EB
	for <lists+linux-next@lfdr.de>; Sun, 22 Nov 2020 11:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgKVKIO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Nov 2020 05:08:14 -0500
Received: from ozlabs.org ([203.11.71.1]:60053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgKVKIN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Nov 2020 05:08:13 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cf5Zg5NMYz9s1l;
        Sun, 22 Nov 2020 21:08:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606039691;
        bh=KUpv1To3odVlfYu3tycoSBgGJTUnXVD5vVmS9OKND3U=;
        h=Date:From:To:Cc:Subject:From;
        b=afPaUp504mGrEIqkJSwWs94WZVNqciuUO5nBcMrhNq17N333tSlVrPf0oVkljKYcd
         gvSz3SL1bHXnEa+4StOQox+ZUeVCQsx3crRvvdGu86QNwXNkluIxSWxVDq1yIq1LQa
         yUK4eRSoykdfjUBeZzxkn6umtIgBdeUniMTIirrhqxyovFElzcTDwUmEaNrfAH8N6a
         E+EQ6nkcdHSCSKkLB2BU8jY3qNMR3uoRr9KcElvZ+NPE02mWVgaknHvnDCr7ew5Wf8
         1kCEXQMRqnr417wIAS/bZoktOnu/ZWedfW44oOSKR/dkFwzzqgJqzOPyscjfxMoB28
         TdjTAryq8JdzA==
Date:   Sun, 22 Nov 2020 21:08:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20201122210810.7024172e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wzmxE4k7ml=8hQBpQyM609y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wzmxE4k7ml=8hQBpQyM609y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ca3bd09a3a49 ("rcu: Allow rcu_irq_enter_check_tick() from NMI")

is missing a Signed-off-by from its author.

Commit

  00dc4fd2297c ("tools/rcutorture: Make identify_qemu_vcpus() independent o=
f local language")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/wzmxE4k7ml=8hQBpQyM609y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+6OIoACgkQAVBC80lX
0GyRoAf/a/CV0wESia3kMRj3RfaM6AnYSrmlMYQLEcBIz8I+Vcq+vvUhKp4ff4TA
5MOMp9/ySNrDb+SoefdaNMbJx+AAeif7RnP4uueCq5x39XR7lhBTELn+3tQG+bFg
R08/3fW2vmyO1A7CgEHZdRfowSgoNShKsh/C7/6re169DGiYljhGZLk2RCMwe+oV
uGSbkIkSgHSxcOvOqZA8oekJpC2zAhpmjEiEIsmEMbOKZfb43nwR1GpE6bNfSH/6
6xPosSaNBI9u9h5ISS/+KD2IjVFqJ38p7ngtOKNqrOSoOA35UGDQef56Jk4Ruoey
3Ctj8q1Vcu7moEI4gGiXKTKpD2yFnQ==
=O6tm
-----END PGP SIGNATURE-----

--Sig_/wzmxE4k7ml=8hQBpQyM609y--
