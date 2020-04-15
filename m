Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7263C1A8FCB
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 02:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733064AbgDOAl7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 20:41:59 -0400
Received: from ozlabs.org ([203.11.71.1]:57177 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407875AbgDOAl5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 20:41:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4923TH2cB1z9sSY;
        Wed, 15 Apr 2020 10:41:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586911315;
        bh=YCQs4D/1ffbtCfeQTC2X8n7ede9jqhp8QvNGcZGM7sY=;
        h=Date:From:To:Cc:Subject:From;
        b=oQme/iRvULpKR6Iv+nqc4b3O6NkgIFjo1W8CD0J5I1blYbGGHM4RZKy8z0oNz+WpD
         jUP+aQM9lQnuEc9ZAFwT1jBP1hbmgylXkGwUMH9Hg/8sdbklUqI+y5ao9/B99b1xLx
         eXyYLjlXJZnOVxvvA+U262vwRdTaxCCGZfACGu+kxk9fBgUHoqTNwdeYchWRV7ezqY
         3FdRh9Kan9r8ZHSfXn4SyAYxjAg4UdL0ZRx+A1RuIf41WZJMbcjWK153vvTqDu6D7d
         YbnFl+YN7Toj7IHcw2Pb76mdEuCewhwzYDQAoiZyxO6usyRJMR1F5RSyHVK/3VDiPg
         oEg2T8V6CndQQ==
Date:   Wed, 15 Apr 2020 10:41:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        John Stultz <john.stultz@linaro.org>
Subject: linux-next: build failure after merge of the qcom tree
Message-ID: <20200415104152.4d770116@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UZ9OH947PRX/GBK88ze_euv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UZ9OH947PRX/GBK88ze_euv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/soc/qcom/rpmh-rsc.c: In function '__tcs_buffer_write':
drivers/soc/qcom/rpmh-rsc.c:484:3: error: implicit declaration of function =
'trace_rpmh_send_msg_rcuidle'; did you mean 'trace_rpmh_send_msg_enabled'? =
[-Werror=3Dimplicit-function-declaration]
  484 |   trace_rpmh_send_msg_rcuidle(drv, tcs_id, j, msgid, cmd);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |   trace_rpmh_send_msg_enabled
cc1: some warnings being treated as errors

I don't know why this error only started happening today.  However
reverting commit

  1d3c6f86fd3f ("soc: qcom: rpmh: Allow RPMH driver to be loaded as a modul=
e")

fixes the build, so I have done that for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/UZ9OH947PRX/GBK88ze_euv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WWFAACgkQAVBC80lX
0GyX1Af/fmI7b/x9bvJ+29FVgeWTU5CeyFt0vCCc1Tp1YcjsrXHGykbzP24X4q/w
+kv3U9xEmX/n958gT5tegEvSH9ZPioCm2Pv+RfEN/TyrqSHYUseNMX5Dfa4AUP9X
5+E38t2MUSby7q+n/S0udhQIpxRZ7/6MR4cfh3NhOPX6+oYY+gYxU/ebiSiNuai9
0b46LVhna9IzTe9vP7Fzzf72jHq2XelQEy5iMMJHKLpal19G7jNKRD0Hc1qBuGeV
nwIxF0I5vUKOZCbPPHP5KuJUmSOVCoqpAg+ObUxkcj2nFz97oeE1NuAGU8/BKa/V
1UBPakmo6VwN9sQ+qwo0jkZGEJ19Tw==
=H4El
-----END PGP SIGNATURE-----

--Sig_/UZ9OH947PRX/GBK88ze_euv--
