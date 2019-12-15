Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C65F11FBA0
	for <lists+linux-next@lfdr.de>; Sun, 15 Dec 2019 23:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfLOWDv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Dec 2019 17:03:51 -0500
Received: from ozlabs.org ([203.11.71.1]:60089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726232AbfLOWDv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Dec 2019 17:03:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47bdhf6PTbz9sPW;
        Mon, 16 Dec 2019 09:03:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576447427;
        bh=LKOQjoyP/DytLKa5tScoJIiXOC4BgSHniwnQS2sOOw4=;
        h=Date:From:To:Cc:Subject:From;
        b=Y2GvNnd74mbrIdjVwvleyccdLLN72P7Ul47lLnlWHCJgp0YJwHWMoKbQgtWqkR4AL
         g+gXQbhzXqipsXkySi6M9zZ17pFtCZyQ/ps6tD36zFFJ7PUuEzWRP7IQLRjWO1KIFc
         AdMbLs5qdxwS7BVCvHTIns3rx0Ipxal2yAeOJpAelz3MvMSlNpIrE4f+B+NMkjx+Os
         /fEXrbe11Lmbo6BQZMz32+pWEfQGwbx+W3TpBxdQhWSZ3m7CQHxcuH1tCO5R3fb3Sj
         t/lc598AhhrMufR8jf8NCqTz8uqfA43CNUWURii2UFV+bQApiIpP9iaGFvwdEefn9x
         QDP+8e5cV7H0w==
Date:   Mon, 16 Dec 2019 09:03:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
Subject: linux-next: build failure after merge of the mediatek tree
Message-ID: <20191216090337.4b4cfb42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2rdamvqKBDcBqSxPN4w/jiD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2rdamvqKBDcBqSxPN4w/jiD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mediatek tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/soc/mediatek/mtk-scpsys.c:773:4: error: 'const struct scp_domain_da=
ta' has no member named 'subsys_clk_prefix'
  773 |   .subsys_clk_prefix =3D "isp",
      |    ^~~~~~~~~~~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:773:24: warning: initialization of 'unsig=
ned int' from 'char *' makes integer from pointer without a cast [-Wint-con=
version]
  773 |   .subsys_clk_prefix =3D "isp",
      |                        ^~~~~
drivers/soc/mediatek/mtk-scpsys.c:773:24: note: (near initialization for 's=
cp_domain_data_mt6765[3].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:774:4: error: 'const struct scp_domain_da=
ta' has no member named 'bp_table'
  774 |   .bp_table =3D {
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:775:4: error: implicit declaration of fun=
ction 'BUS_PROT' [-Werror=3Dimplicit-function-declaration]
  775 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:775:13: error: 'IFR_TYPE' undeclared here=
 (not in a function)
  775 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
      |             ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:777:13: error: 'SMI_TYPE' undeclared here=
 (not in a function)
  777 |    BUS_PROT(SMI_TYPE, 0x3C4, 0x3C8, 0, 0x3C0,
      |             ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:787:4: error: 'const struct scp_domain_da=
ta' has no member named 'basic_clk_id'
  787 |   .basic_clk_id =3D {"mm"},
      |    ^~~~~~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:787:3: warning: braces around scalar init=
ializer
  787 |   .basic_clk_id =3D {"mm"},
      |   ^
drivers/soc/mediatek/mtk-scpsys.c:787:3: note: (near initialization for 'sc=
p_domain_data_mt6765[1].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:787:20: warning: initialization of 'u32' =
{aka 'unsigned int'} from 'char *' makes integer from pointer without a cas=
t [-Wint-conversion]
  787 |   .basic_clk_id =3D {"mm"},
      |                    ^~~~
drivers/soc/mediatek/mtk-scpsys.c:787:20: note: (near initialization for 's=
cp_domain_data_mt6765[1].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:788:4: error: 'const struct scp_domain_da=
ta' has no member named 'subsys_clk_prefix'
  788 |   .subsys_clk_prefix =3D "mm",
      |    ^~~~~~~~~~~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:788:24: error: cannot initialize array of=
 'enum clk_id' from a string literal with type array of 'char'
  788 |   .subsys_clk_prefix =3D "mm",
      |                        ^~~~
drivers/soc/mediatek/mtk-scpsys.c:788:24: note: (near initialization for 's=
cp_domain_data_mt6765[1].clk_id')
drivers/soc/mediatek/mtk-scpsys.c:789:4: error: 'const struct scp_domain_da=
ta' has no member named 'bp_table'
  789 |   .bp_table =3D {
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:789:3: warning: braces around scalar init=
ializer
  789 |   .bp_table =3D {
      |   ^
drivers/soc/mediatek/mtk-scpsys.c:789:3: note: (near initialization for 'sc=
p_domain_data_mt6765[1].caps')
drivers/soc/mediatek/mtk-scpsys.c:792:4: warning: excess elements in scalar=
 initializer
  792 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:792:4: note: (near initialization for 'sc=
p_domain_data_mt6765[1].caps')
drivers/soc/mediatek/mtk-scpsys.c:794:4: warning: excess elements in scalar=
 initializer
  794 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:794:4: note: (near initialization for 'sc=
p_domain_data_mt6765[1].caps')
drivers/soc/mediatek/mtk-scpsys.c:804:4: error: 'const struct scp_domain_da=
ta' has no member named 'bp_table'
  804 |   .bp_table =3D {
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:804:3: warning: braces around scalar init=
ializer
  804 |   .bp_table =3D {
      |   ^
drivers/soc/mediatek/mtk-scpsys.c:804:3: note: (near initialization for 'sc=
p_domain_data_mt6765[0].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:807:4: warning: excess elements in scalar=
 initializer
  807 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:807:4: note: (near initialization for 'sc=
p_domain_data_mt6765[0].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:809:4: warning: excess elements in scalar=
 initializer
  809 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:809:4: note: (near initialization for 'sc=
p_domain_data_mt6765[0].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:819:4: error: 'const struct scp_domain_da=
ta' has no member named 'basic_clk_id'
  819 |   .basic_clk_id =3D {"mfg"},
      |    ^~~~~~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:819:3: warning: braces around scalar init=
ializer
  819 |   .basic_clk_id =3D {"mfg"},
      |   ^
drivers/soc/mediatek/mtk-scpsys.c:819:3: note: (near initialization for 'sc=
p_domain_data_mt6765[2].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:819:20: warning: initialization of 'u32' =
{aka 'unsigned int'} from 'char *' makes integer from pointer without a cas=
t [-Wint-conversion]
  819 |   .basic_clk_id =3D {"mfg"},
      |                    ^~~~~
drivers/soc/mediatek/mtk-scpsys.c:819:20: note: (near initialization for 's=
cp_domain_data_mt6765[2].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:827:4: error: 'const struct scp_domain_da=
ta' has no member named 'bp_table'
  827 |   .bp_table =3D {
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:827:3: warning: braces around scalar init=
ializer
  827 |   .bp_table =3D {
      |   ^
drivers/soc/mediatek/mtk-scpsys.c:827:3: note: (near initialization for 'sc=
p_domain_data_mt6765[4].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:830:4: warning: excess elements in scalar=
 initializer
  830 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
      |    ^~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:830:4: note: (near initialization for 'sc=
p_domain_data_mt6765[4].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:840:4: error: 'const struct scp_domain_da=
ta' has no member named 'subsys_clk_prefix'
  840 |   .subsys_clk_prefix =3D "cam",
      |    ^~~~~~~~~~~~~~~~~
drivers/soc/mediatek/mtk-scpsys.c:840:24: warning: initialization of 'unsig=
ned int' from 'char *' makes integer from pointer without a cast [-Wint-con=
version]
  840 |   .subsys_clk_prefix =3D "cam",
      |                        ^~~~~
drivers/soc/mediatek/mtk-scpsys.c:840:24: note: (near initialization for 's=
cp_domain_data_mt6765[6].bus_prot_mask')
drivers/soc/mediatek/mtk-scpsys.c:841:4: error: 'const struct scp_domain_da=
ta' has no member named 'bp_table'
  841 |   .bp_table =3D {
      |    ^~~~~~~~

Caused by commit

  3742fd77013f ("soc: mediatek: add MT6765 scpsys and subdomain support")

I have used the mediatek tree from next-20191213 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2rdamvqKBDcBqSxPN4w/jiD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl32rbkACgkQAVBC80lX
0GyYJggAobtbP+e+RQMr+snhsxsaJfFeBH/qaT/4329nxAD7LvUVDxSfx7EshPnj
1Jqu7RZDLD5s/q/zuO5UDGzjAkl12W2LUVLuC8rJwxSudzMFsJqH1iKanlAdJ1QW
gxnuYcCrF+rna2jnFwQykrHqf8KddKr73+nzXpiZ4qgk0vlnfs2Oh5L6PGUvuBSM
IstKR5284NKoqQkr80JvGjYPLQKfkraldwDgXChWkM9qsO+tV1BXS3aChOk5X5RW
DDv+3Tu7bwNWBbYxOaoIGg8KFWr13oYUHYW9hlZ6dyoO+XIPTVkirWyYYHDf0Tui
lFa19+h7Wo+toATEAaot+fL4wYBl9g==
=ODgc
-----END PGP SIGNATURE-----

--Sig_/2rdamvqKBDcBqSxPN4w/jiD--
