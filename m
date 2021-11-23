Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823A8459CED
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 08:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbhKWHox (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 02:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbhKWHox (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 02:44:53 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1693C061574;
        Mon, 22 Nov 2021 23:41:45 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hyx0l1Kcfz4xbC;
        Tue, 23 Nov 2021 18:41:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637653303;
        bh=Ocy7eV4gtjzL1bRMCe/X7KRCYA2YFplfTlGvKoXE0vc=;
        h=Date:From:To:Cc:Subject:From;
        b=TfqE6Of8KBWSGeL3g8bldYD6AmSLGHf/fkThOrDRgMuMSQq6NC5YBv3+Chkw4ndS7
         iwxTsUj0tRJMpZPHNV2xG8nmpStmjte3QQ24fMduoedCYZKq6oaLSCbiwxwI+H73Cz
         GWdltKmnpcFq6aE/LKsLuXx44F5VdfXhZs5cdn3WkQsRyz8vZEK+cCZ1GXLBGEG/kg
         Nq4zfvo6IpsvZR9KOFDRQ2AW/8a3FsnG6yB9aa7dY9heM7v18PCVpkPwb6rBQxUR5A
         kdkHk/r5fncGploFXkFYpXyiEaPxxavASogeSOEqTx57tOoz2PG+iLs8PZkZlVotOa
         JxUtoq30ayWDg==
Date:   Tue, 23 Nov 2021 18:41:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        <heiko.carstens@de.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the regulator tree
Message-ID: <20211123184142.50ff56c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lz1Q7W8G6JaEtDANAvQFqr=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lz1Q7W8G6JaEtDANAvQFqr=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (s390
allmodconfig) failed like this:

include/linux/mfd/rohm-generic.h:93:12: error: 'rohm_regulator_set_voltage_=
sel_restricted' defined but not used [-Werror=3Dunused-function]
cc1: all warnings being treated as errors

Caused by commit

  8b6e88555971 ("regulator: rohm-regulator: add helper for restricted volta=
ge setting")

--=20
Cheers,
Stephen Rothwell

--Sig_/lz1Q7W8G6JaEtDANAvQFqr=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGcmzYACgkQAVBC80lX
0GzRXwgAkihzkBrCFKAcXr9YHlVXR9KZk0XD3FMQn6SlzU/n8Xi11JBE8d5OWVO9
/JBk1dyv/BlK5CWISgdGmz9TGRewGYQ+BOZWYkBE/BPLI96AJJKdA7cMGt0OJllQ
1gaxySRtRTcjta0al5Ru3/qWVLkZKZNAcZQbZrbnHk94G1TaQKdZFahwQaRAD6bo
CFEVKWCnEaHo955cjYl3XXZVRTgyDNVoUBBtxt5xXvB6iAkwfbSd1ahNCoKliEgz
5cRT2rqMQdYREp1Je/g+r8eUw9ygFmfjGVphbT59pLEkYpG3kB2aX3hpwMk0wn9t
63NVFW0J/JgnkoO9Z9ADCIHiP156ug==
=VitT
-----END PGP SIGNATURE-----

--Sig_/lz1Q7W8G6JaEtDANAvQFqr=--
