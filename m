Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62161BD08C
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 01:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgD1XWB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 19:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726181AbgD1XWB (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 19:22:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FACC03C1AC;
        Tue, 28 Apr 2020 16:22:00 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Bd2Y3fX2z9sSG;
        Wed, 29 Apr 2020 09:21:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588116117;
        bh=ZBQZ70IVNtIsyM3Fb+ANegyNEK1zfaoFq4NXJJWI390=;
        h=Date:From:To:Cc:Subject:From;
        b=m3O9Ac1/jFj0XdDA/ELs+GUMyWetHtnX/LzpdnIAMkU9AgzA56keGwcF9wXEfYlL3
         fAH/9yoj9kAoXKulHXWjPWpKoK+s9v5pf/Koc7mjS7mEzNJaNl2yy7jtvZ88eHBQN/
         9Z0+H4EAZhZR4RSpEEnXCvekl52mwNcXjdSUBcW+XaOX/E27YuBGpDs9hUnWW/1KtP
         Cct2/+0diIdvoLhcVzz+ugoXXuaxRlu7oh7Smv1A/qCh2Q3LbyKdQfUBqKbQ1U0oj9
         8ww1VpJSsdWfIfMcSp2gvSPwfYno3BQJLOjg94hZKdB5yE6QKow0rEObFx6cGDW98+
         Ai5z6aVEht4QA==
Date:   Wed, 29 Apr 2020 09:21:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: linux-next: build warning after merge of the scsi-fixes tree
Message-ID: <20200429092154.35958687@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z_24ddm1Dy_+MBU73fB4v_X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z_24ddm1Dy_+MBU73fB4v_X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-fixes tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_remove':
drivers/scsi/ibmvscsi/ibmvscsi.c:2323:16: warning: unused variable 'flags' =
[-Wunused-variable]
 2323 |  unsigned long flags;
      |                ^~~~~

Introduced by commit

  5b77d181bee1 ("scsi: ibmvscsi: Fix WARN_ON during event pool release")

--=20
Cheers,
Stephen Rothwell

--Sig_/z_24ddm1Dy_+MBU73fB4v_X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6oupIACgkQAVBC80lX
0GyjZgf/VPECcQ0svkuvTHGTJslNGOplzTHkkRBXq5RxCfHNxx+DC+pgrSxxcM6S
GWXY1AOHEygcdYrCFoI9AaLHYmANZFhr23c5d0Owv4wQ3urpbHDG2fN2M3POUZ0m
qIE4bEKi5QJcZhdH43tjOVFT7IIaPqzVojGFnG2Z8R2omhhqlKr252WqNa0+aBWj
WUn7lalmRaHrCXTsYz4lrJ/LlFBJJJVglxyVjo9+7XDJXSzTwXQmoCTkWDdYPj/1
VfvdZtSnsgZN2S5eY7NCujmVEbyWFDGR16WRRYezpMLKyduf12+S1ikodiNzLx1M
okT62BaoHyXTTLNTq6L+2fJuRo34RQ==
=zzgx
-----END PGP SIGNATURE-----

--Sig_/z_24ddm1Dy_+MBU73fB4v_X--
