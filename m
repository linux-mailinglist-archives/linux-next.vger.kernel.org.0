Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFDEE176862
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 00:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgCBXmf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 18:42:35 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbgCBXmf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 18:42:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48WcBb4vhTz9sSG;
        Tue,  3 Mar 2020 10:42:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583192553;
        bh=EMV2RIhXT1qcKJvmz8MZ9k1xFEfE96bVhk+RcPQAa4Y=;
        h=Date:From:To:Cc:Subject:From;
        b=ahsns2BOV/cJplB+GU35NEkwIXlstiWuy4P468nm94WUPpfZHUiPReas8kZcV7m4H
         Rkt2bLq9TRNdfizut6xwiEoucSFIG2AhYm8zrR55wwwFY91PCPMxY+XgBTu2KEFW/D
         eotH5mbLQYLYWUV81unPZoPQhplATKtuClfHj4E/UYmOpH+VxdO2CG8lzps82iAq14
         fPo2waFvUmIiLL9SNu34QVp7awx0OewzSS06DZb+bR4VMK4LltN9aGGTv1fbWvmHOf
         Sx8OJxyi97HH+o1LyNek0AmVuYTMqhZrLvc1IuF0pF+TgcTrZL744ovnVWDTOD9H7r
         0Oz0AZDrex0Iw==
Date:   Tue, 3 Mar 2020 10:42:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: linux-next: build warning after merge of the thermal tree
Message-ID: <20200303104223.73222b9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ab3Fk/hXAl/HSy+pEijU/ma";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ab3Fk/hXAl/HSy+pEijU/ma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

In file included from drivers/hwmon/hwmon.c:22:
include/linux/thermal.h:382:12: warning: 'thermal_zone_of_get_sensor_id' de=
fined but not used [-Wunused-function]
  382 | static int thermal_zone_of_get_sensor_id(struct device_node *tz_np,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

and many more the same ...

Introduced by commit

  0629521dc9c9 ("thermal: of-thermal: add API for getting sensor ID from DT=
")

Missing "inline" in the !defined(CONFIG_THERMAL_OF) update.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ab3Fk/hXAl/HSy+pEijU/ma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5dmd8ACgkQAVBC80lX
0GzHeAgAloSOvzXzmYIj+wnsqfknHJhHZSFdzRG+tG225sYspoHQHqx/iMtSr6v4
35uXNRcwEY98wZMmZ+Q4pNqd3qoYgZmxRp2yz2RxacKXb637DUDHiGy0jZfwxcjl
uIaatF2TORowleYAh+bPZ/FRXd4QKACD0LU8KAvyeP7ACRxPCB+1L2qc9CdktiOc
MA4OJMy3leigRpfL+YRH3WcxgYlNkJH778jQrYRG+pGt+yl8My68bOodJxH63p09
2EYh3RoJgKiR75Lm+wHolUwggj1aHA31beTyXARxdIZ8pE4HHP8Gm9jqCfUoGZSY
e9PgTgy8s7beeP7qEZZxqcc3AUtA4Q==
=4esK
-----END PGP SIGNATURE-----

--Sig_/Ab3Fk/hXAl/HSy+pEijU/ma--
