Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DEC27DC26
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 00:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbgI2WhU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 18:37:20 -0400
Received: from ozlabs.org ([203.11.71.1]:41799 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728115AbgI2WhU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Sep 2020 18:37:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C1Dly0QK4z9sSC;
        Wed, 30 Sep 2020 08:37:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601419038;
        bh=nDdaIRopVsSYUNHCgPGV+F5lWyZ/fWHdmVjmcga+npk=;
        h=Date:From:To:Cc:Subject:From;
        b=NVPeeF/NqzF9A/S4Z6l29k6BX6+A+u1o26L2EIaeWWazZBMGPVnWI+JVL4h2vaiS/
         UYNTLRUoB3bA/TZi/X4LmsFLucGwPrxShx639ysURs0ItyIiNDM9GhjIYNwV90qJxf
         MYM/Y5V6mT0ltLHOJsLOwOzhBKyxN7vVk0BfdZOolhJpHw4C616xHSvbIHD5yJdMJ+
         S2OUiPHxxSQbFquJ4C4IUiti+Ooe/jVtS5SuWIidRPo+F8DQcwUAJ3wvY26vrp5tZ2
         63dfQyVCQiEfrQ6bMQ5D9xZjaFbWZyKpwqLUsUskImh7EFF5y6bTEgCSwfTs3tX8L8
         ytqG7fLVpRWuA==
Date:   Wed, 30 Sep 2020 08:37:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200930083717.0b8e7139@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oacCE8=l1=kxsO5mqTcKXtJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oacCE8=l1=kxsO5mqTcKXtJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5f5f44ca646f ("EXP Revert "KVM: Check the allocation of pv cpu mask"")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/oacCE8=l1=kxsO5mqTcKXtJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9ztx0ACgkQAVBC80lX
0Gw/8wf+P/qSTg4ieSwdOg5Qsd95khiApajkFQ6m0uWf8Ts5Q7E3M7q5VyPOnJmG
YVZX77deefFluvtyi+pY7Q7Pa1c2mHCXLAsDbQhuhbeheg5Wy6c7fsAqgRUhuIH0
KAauoZ/dB/3c0hGe8Itp7SEth7pAJUwcvNc+glm/a/X8Xi7f7MGuBo/Uckqy5rt8
x0WKgvMMRV2VtNG6Y4/whByHWIDDfaLPjbP6YyJkoLXlj6KrvPGjkK0n+IPb0MCQ
eohN5qJ5uGTFd4kvglVw9W+1lZ0eoqU6wIm3FekcAJkiaH9AEhhmIBQT9G9k+vGD
P4aDUSOceK72wQP5U95Vlg9q6vuubA==
=toNR
-----END PGP SIGNATURE-----

--Sig_/oacCE8=l1=kxsO5mqTcKXtJ--
