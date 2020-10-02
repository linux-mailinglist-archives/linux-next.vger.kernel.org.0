Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13742280C9C
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 06:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725926AbgJBEON (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 00:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgJBEOM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 2 Oct 2020 00:14:12 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78CAC0613D0;
        Thu,  1 Oct 2020 21:14:12 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2c7j2vkvz9s1t;
        Fri,  2 Oct 2020 14:14:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601612050;
        bh=0/+2nupUiN67dV2lwVOISuKUHiRzvhXj4XJwmbQN6Nw=;
        h=Date:From:To:Cc:Subject:From;
        b=Rc1NvyTVqHQD6G0o1d2Lb6fnKm4FI9osxebJK93RVm0X1xgBVNyvU9jUiRaxxELQV
         17W75NyKcII56ARD9mgPhbO611L+VZPb1UixlpYAV6cKi4Vm71nuk1mgVXoIrSi1l1
         qHodI89Viosjc0S0nuFey6IEsLWbQMZ0160rhbk4lkRvqtN131D/x8F7j2whdugb9k
         mLezm+LLjnOEgF4bzb6navUIrs1I18Cgrs7UrlkpIbEC517owd+5cWTbY2tHJJI9n1
         hU76Nigyb2ORM+6pz2JRCTpnvlbyxcKHgD0+1hpi7srzw/xUrECoBQOJstYHoFE2b+
         dRy2Ty7R9UAiQ==
Date:   Fri, 2 Oct 2020 14:14:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20201002141407.55733454@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZA+zvDXHWwl3ep5TJT=05x+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZA+zvDXHWwl3ep5TJT=05x+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

sound/soc/fsl/fsl_spdif.c: In function 'fsl_spdif_probe':
sound/soc/fsl/fsl_spdif.c:1255:22: warning: unused variable 'np' [-Wunused-=
variable]
 1255 |  struct device_node *np =3D pdev->dev.of_node;
      |                      ^~

Introduced by commit

  601fd3a7d849 ("ASoC: fsl_spdif: Fix unnecessary check in fsl_spdif_probe(=
)")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZA+zvDXHWwl3ep5TJT=05x+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl92qQ8ACgkQAVBC80lX
0Gy1BQf6AvjElut4Ek42dnMMzVCdghtmAP6I8njdp6GFdk95doaUlenRaEkD4Wpk
Sa3JQPCwK9U2hUwJEP3ES43oTzuV4EAJgdn6y9i41cceqcq1UlsyOmani0cEonPi
IIHY0K/66RNEF3CUgmJYRkFQTtMUXwm84lsKmDBhjfvPEPLWNzYD5XbUhZ2jBaKT
LPYdjn/z3+H3oeww2yCYsYF/ef826lgdCAxoQnouf5NYyFj2RQrhfkOfGbDbbkuk
vVZIpmn/jFawqxaJVN88+Vh6k26ETOgFfm/HBDjqleOD9wpNDOZhFt9hinblBkaD
vAWPTkZW5OBvBDXA+RuCSKEhCd/soQ==
=XxLM
-----END PGP SIGNATURE-----

--Sig_/ZA+zvDXHWwl3ep5TJT=05x+--
