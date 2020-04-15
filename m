Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF61A8FB2
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 02:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634590AbgDOAZo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 20:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634579AbgDOAZl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2020 20:25:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E571C061A0C;
        Tue, 14 Apr 2020 17:25:41 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49236T6ZnHz9sSb;
        Wed, 15 Apr 2020 10:25:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586910338;
        bh=qhFWqW1CR0ePWpwKboDaoh7JgvndLEK5GfBFo3TMwxw=;
        h=Date:From:To:Cc:Subject:From;
        b=rHL8J35GgNmkjjDLq/oyYjJPXUPGeVNuLZY5kUNBiTPWaou6zlOS1zsJOksjZWAo4
         7Wl+NNY6GQm0WoNGrr9NOTISvwMQgAq+R3YWE30ZsE2Y6kwRVjX/vVCaF9R176lsVT
         AdUAcXEoaeZJLEhPpQXdCBiPFhhkIg5DEoxj/JwuJ+lrEzc8hlo96ltqwtNFd7o6IR
         VHQX/srZLRZ/V2FO93gGUAHKKn2p3nyW6wttCp2xIiV3lG3vVTn5YPJYWja//pob6T
         sgSyBcnRWfmF/As/N6HPJ9UDmfgpg2kOOc58bj5vxOD4z0Qm44IemuzmtxhSYHiFke
         FI+f7Pzmn3yDg==
Date:   Wed, 15 Apr 2020 10:25:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: linux-next: build warning after merge of the qcom tree
Message-ID: <20200415102534.6d22a377@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yZV4m0qmvjCiGoHcQRP==75";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yZV4m0qmvjCiGoHcQRP==75
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/soc/qcom/cmd-db.c: In function 'cmd_db_debugfs_dump':
drivers/soc/qcom/cmd-db.c:281:30: warning: field width specifier '*' expect=
s argument of type 'int', but argument 4 has type 'long unsigned int' [-Wfo=
rmat=3D]
  281 |    seq_printf(seq, "0x%08x: %*pEp", le32_to_cpu(ent->addr),
      |                             ~^~
      |                              |
      |                              int
  282 |        sizeof(ent->id), ent->id);
      |        ~~~~~~~~~~~~~~~       =20
      |        |
      |        long unsigned int

Introduced by commit

  d6815c5c43d4 ("soc: qcom: cmd-db: Add debugfs dumping file")

--=20
Cheers,
Stephen Rothwell

--Sig_/yZV4m0qmvjCiGoHcQRP==75
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WVH4ACgkQAVBC80lX
0GypXAf+NNmRAj3H9F2gfKHML5Ldwz+yZfFBLqS++APFcdZ9/MOvf07r7iic0mrF
h1J4L/v33SfjkAMohh7Em549NoiaznK6hWculX57LdsP5+y7Xf14xXlV+0qWf70v
nVdAwbvg1WpuJUtZvIBKAcChVfWDe9QqWtavOcucKv7lJkyAPwGsO7SPUr5rwkTY
oTyBv9IL0/Aqt7c+MVialaO3THPKsfgsKXh2sm2J4k8QMOU0/JpVTnHCXy/YFMt0
PjUDKADKiu0W2NN3uWAmKBRFVkuGUb6vYJ3bZCx9HQJq04sxDkNVrtQcMBoFTovQ
4KSB6ormOHo6iVtlw5GPxx8L3aR8Qw==
=NanG
-----END PGP SIGNATURE-----

--Sig_/yZV4m0qmvjCiGoHcQRP==75--
