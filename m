Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C344B1128E1
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2019 11:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbfLDKIy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Dec 2019 05:08:54 -0500
Received: from ozlabs.org ([203.11.71.1]:49463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfLDKIy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Dec 2019 05:08:54 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47SZLm3vv0z9sPJ;
        Wed,  4 Dec 2019 21:08:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1575454131;
        bh=xnBjDSr0aSFVeB7maxwFPpkGfOtz3BGCfA4g+lvQdxU=;
        h=Date:From:To:Cc:Subject:From;
        b=Yd8WukcXSECKwdjb2Z71Ixl9wSMNnzOZKyH1Iwrev/qnnb9keNJl+EhY3ghPINILi
         XxnHrZWBE20aZXnffp1nyMRqn8lJ8Xtr0Dc7QBaLkY/PmW5OTF6ddg98nYBbDMy9on
         nItgAMk6jpLdI/Wv4vOkJgtAafikedAy8r3KrOk32GwVetJhZ+YfDGlzj53hchxLTV
         uKypy1N8cpT+qCskd7uMCRR4oQyKvyLwg0Vp3gmPUd/bjxHOXVlaICN4cjM7x/VSFC
         W17sMf/t0K34WM2aTTqJxbibXImDbYRrKkFpm24IiQ6o+GgwnLve2s3CZd+nMoEJLQ
         MdvB+pk9ozxgA==
Date:   Wed, 4 Dec 2019 21:08:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20191204210808.7d34299e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iVrY7I571Rjc10A=Y9W93ll";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iVrY7I571Rjc10A=Y9W93ll
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  38ebd8d11924 ("x86/ftrace: Mark ftrace_modify_code_direct() __ref")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/iVrY7I571Rjc10A=Y9W93ll
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3nhYgACgkQAVBC80lX
0Gz4aQf/QJ3ZxJNsJ3lwNSdE1Tn+eR6P4S2t2pOav2lk9jA50AVp5dcp0GEx/hmC
fGQPoSaKI49qZwM5HGQAs8uNuatbN3QvRbtiZ5zdSPQJ71h1juw1DGXiHHUNgTSY
Mo7BQ0iAsxfkOLgBPN2P83lfDRLbgiMFJDiUrMKCIfNeOk2Cimg1+Nmm2CO+00vP
5tbDfkyGP29LiHpyCTFScPgB+EKNtO9HNQ6mgpVke2TRYYAq2uwZWxfuEgq9tWwZ
ARbRCg0m/Ui3X3ae+r8m9xP+w0GIr2Y/qtnWQlKD1cP9lNbmbP+zHPhEZGSHz2Mn
h2GjgmT6+g1CJtVVhOvQvjbGsh7juQ==
=/MfH
-----END PGP SIGNATURE-----

--Sig_/iVrY7I571Rjc10A=Y9W93ll--
