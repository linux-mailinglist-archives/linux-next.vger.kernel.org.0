Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C752B174BA1
	for <lists+linux-next@lfdr.de>; Sun,  1 Mar 2020 06:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgCAFqG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Mar 2020 00:46:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47627 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgCAFqG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Mar 2020 00:46:06 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48VXLz2scSz9sPR;
        Sun,  1 Mar 2020 16:46:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583041563;
        bh=/pXB+eLcTxLdMyzw/DPfjwnN01pePmwjNBZiT+yKci0=;
        h=Date:From:To:Cc:Subject:From;
        b=O9J2j+ctd/9vmauwBsInQjq98gTONbPQulyu60jvAe7dSWdTMPnqlji192P5bTcMm
         PwiviOKBkKWviP0+iYMqmjQ24O/s5XGPdl1Ny/yDSyt9atjl9IaUbqguEJcHz21GkR
         4o2zk8p/ekOO2RBcr3A2IcwRyelS+juPx01DtWJWEgJMW+gVgrmRMuohO4fzgngn9t
         WHGvant36f6wOWSMNZ0I8bPM1WS1GhQrUvTukhC4WzZxK1gQyOrjqZoaVBOtqA3drX
         IWzDqvrbmCyGrKVpXBmR664wXZYLd0IxoJtEUF9ssrvBFKRUwjicImsIzbEG/Zhjh2
         jZyvPROispblQ==
Date:   Sun, 1 Mar 2020 16:45:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20200301164559.6148189e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gl3ARaOVCMcihYwEU/sJb3o";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gl3ARaOVCMcihYwEU/sJb3o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ac5bf39e3968 ("ASoC: soc-dapm: don't use rtd->cpu_dai on for_each_rtd_cpu=
_dai()")

Fixes tag

  Fixes: commit de6214a33633d ("ASoC: Add multiple CPU DAI support in DAPM")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/gl3ARaOVCMcihYwEU/sJb3o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5bTBcACgkQAVBC80lX
0GwUxAf/RI6yNzSxRh8dxBD/Xbxto9XiEoPjRa4LHZTsDPimtEWItw44hEHHCWhN
nbArrVXl/DcIABkIVCTC+qaaOkqfPwZtc6mK8m0K44mLUM1Y26Se3jhNidsyCMlN
AI3I/g3ilCgJCLqwAJ8Sg5DOj+B+3/ltHieGcYMrd2G6G8WwByMQ8nri6n54+XMY
PWrNjFkIyfspqguSM8Q+gO8r9qHhKEuLdDTEfXspJDQqBlHNmx93M9rYdf1Mz6Op
C+LADpmwBOhiWEKGjwEK3LaBaiJlcRBciBlHhG13KUH6KWZBVRgsHDAYgWV5EtGk
7J80OqG5tbtFWpYPllYaBBh1+VS4LQ==
=WXTJ
-----END PGP SIGNATURE-----

--Sig_/gl3ARaOVCMcihYwEU/sJb3o--
