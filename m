Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DE543ABAF
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 07:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234956AbhJZFbS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 01:31:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54083 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234973AbhJZFbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 01:31:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdgNP37FTz4xZ0;
        Tue, 26 Oct 2021 16:28:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635226133;
        bh=RzOCz8t//eY3WBBt/Q2VQ4bujj4hzgTfQaAKiUK8dIY=;
        h=Date:From:To:Cc:Subject:From;
        b=UIhs6eMGOWgIjR51ebx8fHJ4rIaYslOQ1nwtw9vb4sNSk6DYuv45WfaiP+vbRRdyj
         +NPJI2U0ni2yo7Mgt+F8PcoBfP3vMENtJfaQcOXzGgx13+lMqFo+YFAfiR7QpfoGxv
         Cyk2Z1xrs6nnsI8V+MO+fkYZBsq8yMyd5GF6RoSTVAGhlNEzNgWjNpxnrAYLTRi290
         qwFPiJ9DbDpJYAecQq+QdogK8iq15MuXDD5O7gxRBB/HQwTpHHHiao0crYNcqPems7
         pj4qlVrxz/BO+/MVTr+791kxobvcun03J0wpL5UxcxdK19vlgeM97oG5wjLNyXQ1RX
         gpCgdk4UugNlA==
Date:   Tue, 26 Oct 2021 16:28:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kartik K <kkartik@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20211026162852.6cf2a2aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0usf5CXkVzaQ34cnSwP0rri";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0usf5CXkVzaQ34cnSwP0rri
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_get_group=
':
drivers/pinctrl/tegra/pinctrl-tegra.c:293:12: warning: return discards 'con=
st' qualifier from pointer target type [-Wdiscarded-qualifiers]
  293 |     return &pmx->soc->groups[group];
      |            ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra.c:282:25: warning: unused variable 'g' =
[-Wunused-variable]
  282 |  struct tegra_pingroup *g;
      |                         ^
drivers/pinctrl/tegra/pinctrl-tegra.c: In function 'tegra_pinctrl_gpio_disa=
ble_free':
drivers/pinctrl/tegra/pinctrl-tegra.c:341:10: error: 'return' with a value,=
 in function returning void [-Werror=3Dreturn-type]
  341 |   return -EINVAL;
      |          ^
drivers/pinctrl/tegra/pinctrl-tegra.c:327:13: note: declared here
  327 | static void tegra_pinctrl_gpio_disable_free(struct pinctrl_dev *pct=
ldev,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  a42c7d95d29e ("pinctrl: tegra: Use correct offset for pin group")

I have used the pinctrl tree from next-20211025 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/0usf5CXkVzaQ34cnSwP0rri
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3khQACgkQAVBC80lX
0GwvYwf/QHCJrub+Jw7x9aQw7aK2L3IjZx4+zGjHZlFelvHQ0uc99VY3Wd4Gelw3
Pbj0Ju7wFEfWlkNf7kCSrQk1q4Hlz0SSx03w79e8U7wPyUUFMj5A+4sI+fLWWMg6
yypwmxLPz2pZNJkeN3O3c1SaHuMXKoQAUPo/aMi/qly0GP4Y89SHJvRjBI/59DVu
PErGi7HWn7BnwNoqG7rF6Z665yGQc1JrpoAkDz/mnVKLdbfm7TV9SJtm8Ys0uaqe
5uSrYmMTjnVzm1IOu4nrT5kfpo+ppgeDoM3tm1PMlS0UO0v11KNDOcICcJaxW7Y7
6+XAuQ9nwzdRW59moz7rMsZEtodJ/Q==
=i54f
-----END PGP SIGNATURE-----

--Sig_/0usf5CXkVzaQ34cnSwP0rri--
