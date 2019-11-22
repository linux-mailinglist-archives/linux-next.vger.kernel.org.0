Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6AD1105F5A
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 05:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKVE7p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 23:59:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58531 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbfKVE7o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Nov 2019 23:59:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47K43f0jp7z9s7T;
        Fri, 22 Nov 2019 15:59:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574398782;
        bh=/9aWctGEpOTxg/csjPWRD2wl/ozxrX0MWY+BOFCiLX0=;
        h=Date:From:To:Cc:Subject:From;
        b=ALGnErN5RbxFnlzV9PA1o8rbJZXdShL6agk3ICuOYlYejq/Gyr04/zw5IRlnlmJZJ
         JaqMnzLy0jQxLE440+/dEpp/1M3Kss+AnAJVv42bqQRQ7CBJVemToHFysxCQR5UcIo
         Z6OGGSb3Ns0XeHdqZTvGT2pz1IkM/boGw1bzb3j3k+lv8Aod0xgIYUE8gg8k+iws4C
         3IszkUQscTmTHpAl9gHaI47vCGDMgmamoarzgP+RKXV6GGdSnAby4OVKNVlM733iS3
         orA3HE8SIqbexbcdWV8SjJc3Kfqx/G8Q34JtqORGr6YcPC45RLqhMh202jVpVWCk3h
         UOcZCEnTINPkQ==
Date:   Fri, 22 Nov 2019 15:59:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>
Subject: linux-next: build failure after merge of the devfreq tree
Message-ID: <20191122155941.4c8e3bd1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jMq8buoSd3=6uu9kib9Xt7d";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jMq8buoSd3=6uu9kib9Xt7d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the devfreq tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "__arm_smccc_smc" [drivers/devfreq/imx8m-ddrc.ko] undefined!

Caused by commit

  1fcfb874236e ("PM / devfreq: Add dynamic scaling for imx8m ddr controller=
")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jMq8buoSd3=6uu9kib9Xt7d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3Xaz0ACgkQAVBC80lX
0GwYZAf/cR6U04dLE6DHQ2RCDuy8CyOhnmOqmzbvdHBO+jFaaDBBDsyfj9gXweTP
fMwJyAFMCKUSIYbdRTjWYvErWdvaCDZIipmQaWh6C8SudijbfHdS0vM0lOji2huj
23qgkJmjB004JiQWfvf72Xe/+Dq8od+WQaItcoykoFXUNEDOKJ9fip6EgMhUdSQk
UofRhIT19HBEy/A8dX9012FL+MP5plYM5qdW0jbISAUnQ1yFlhh2jW/Fdz7rs4jw
kbQsXZl/FKHfsj/ZiP0ElzpKgWxq7BLy0LSEDl5rrsLxdLBt5a0tsmPfY/VDiZIb
M95enANBoLm5/ruT6yUuc3+Bnhk2WA==
=3raV
-----END PGP SIGNATURE-----

--Sig_/jMq8buoSd3=6uu9kib9Xt7d--
