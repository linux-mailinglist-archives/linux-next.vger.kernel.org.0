Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC3511C020
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 23:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfLKWun (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 17:50:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60031 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbfLKWun (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 17:50:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47YBwc16DNz9sP6;
        Thu, 12 Dec 2019 09:50:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576104640;
        bh=pQEWo5nmTzCkaZ4PlrWd7fpWflTlm/IgljPiEi4JfOE=;
        h=Date:From:To:Cc:Subject:From;
        b=n7/37nEY2a1/ribIDMBlerheVbx+9ucJI8gwm0Eq7J77KOOjXiFIBNYxVEW24EWv4
         sUXZ8FY0xJTmWJ2vgyaRTFkFEKrNxKibbkB40enTGrDXkCMxtcj/LlgP8ia6nhTfrj
         zlETJKKh4FtNz3123XWZKOnz6toazEuyKrZQkkYlXnzPgSyNbrs89AsAWbzCPErYIg
         tzNg+J+NG35JH0/NjCUT/9y4phlaqkjAdTd3/zkTITF8bo2UGLeTiGViNyQ30qL8qU
         +JadA3mbHYybgSZ7sBOmJgb1cKoEPyBYjsaq30Kq2GHWE0FyL6zNrVwsRmkcpy/JPf
         2mF7MKZRRL44w==
Date:   Thu, 12 Dec 2019 09:50:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: linux-next: build failure after merge of the thermal tree
Message-ID: <20191212095020.523c1fbd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MQpQLpN+idyvXG0dyITdbze";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MQpQLpN+idyvXG0dyITdbze
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/thermal/qoriq_thermal.c: In function 'qoriq_tmu_probe':
drivers/thermal/qoriq_thermal.c:247:20: error: 'SZ_4K' undeclared (first us=
e in this function)
  247 |   .max_register  =3D SZ_4K,
      |                    ^~~~~

Caused by commit

  c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")

I have used the thermal tree from next-20191211 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/MQpQLpN+idyvXG0dyITdbze
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3xcqwACgkQAVBC80lX
0GzRAggAhFdWcOVRvWwSQ5DgU5J9PAq8induFZFLzpYkl0qdGlYcFQ19R/oNCk2E
fFhXov042+oZk0KuKWSAsXVJKI8vlBI3VA7FZTdAbWR0ilXgfbY2LP6PPDlrSuSW
HG23iTC6v0o6fvylsP8RNpV967W9sOi9ZlvB7xqTFCHT49rqH2pKn+hg//J8gzEC
69gLPItcdjUL4MDqz36QJiMCk4Tsema6Udl1u1+xlYIyDex33+/Qjh1mMxpwC6vH
/cO49xKxZVJnIPSew37rMKb6lDsqzDTnNNdSJcuVa1qsWIHaYaTTbDj9GTyjT9Oc
yInUxPxgujmObphYMAuWjjfrl5ngkg==
=2Ll7
-----END PGP SIGNATURE-----

--Sig_/MQpQLpN+idyvXG0dyITdbze--
