Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B599345B3CD
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 06:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232084AbhKXFZ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 00:25:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhKXFZ4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 00:25:56 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA403C061574;
        Tue, 23 Nov 2021 21:22:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzTsw4MG9z4xYy;
        Wed, 24 Nov 2021 16:22:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637731364;
        bh=RcrvZSDl4hVgzRv5xCp0h88bT84jO2E73xbqpctcgE0=;
        h=Date:From:To:Cc:Subject:From;
        b=F1zFPcpDXYKi4FJTZ9D9JNlK4QiO/WqXf5q1Gie5+mBtuOf9voDvCxdIvp8dObXDe
         nHwAnKyhKmRpgAMswcT8ArQKufCD/WUYcjDCprYStFF+m+KzERLOIYBMUkiwyfKXjn
         r0REscCfJuYSr+X5+l9tE/hJriXMrHMtMgqu71ErU5uitVip3XeCc/wmXT5UHNYuRt
         AjonwgLGhcdSX2QOdghWXH6NhlZyrvm/sleUUfyD1zE0YvQtC6M+ZzGpy3OZ/Q28Vo
         0qzJEkOrXizevc2qldwB4N1i1Om/Wy+leV59LL1FecBzcN+BOOX6UQ3PEmFexV1syA
         EWpPnXI7z7ftw==
Date:   Wed, 24 Nov 2021 16:22:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Denis Pauk <pauk.denis@gmail.com>,
        Ed Brindley <kernel@maidavale.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the hwmon-staging tree
Message-ID: <20211124162243.7db9ad02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0qSBwfzk1oGwxle.CwKBLBS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0qSBwfzk1oGwxle.CwKBLBS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/hwmon/asus_wmi_sensors.rst:33: WARNING: Unexpected indentatio=
n.
Documentation/hwmon/asus_wmi_sensors.rst:68: WARNING: Unexpected indentatio=
n.
Documentation/hwmon/asus_wmi_sensors.rst:76: WARNING: Block quote ends with=
out a blank line; unexpected unindent.

Introduced by commit

  9d07e54a25b8 ("hwmon: (asus_wmi_sensors) Support X370 Asus WMI.")

--=20
Cheers,
Stephen Rothwell

--Sig_/0qSBwfzk1oGwxle.CwKBLBS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGdzCMACgkQAVBC80lX
0GxCZAgAmip4G6SrceCeRguU8kpQftJ1XKr+ZGZCecCEx9JXkZpHCaPleC9shHMN
sFUQVldG1GBBW1oOroPVIYvtUE4aYxH1Lyh1ra+PkfwYgBnNGnA5EkgU5B1tMzoO
iUziFjEuNdXCCa0P6SWhipNZSsaJcaWYuatG2Pm7zhgFy1am77FqCHz0h92xw5rD
6VTwvF6BYm5DUJMUph92alqEAkt/gYQd8/lKValkB19k2kBHjJzNkSE1XIJEiobD
OVLsFpXRhpV3JXDlbXHFNddT176TC/CJwQZgrGxHzoKnqoITXOmMA4nnx0NOFCWf
ScC9vO7CM++Ky+f1+a/rmgIlfhZtSw==
=LO+C
-----END PGP SIGNATURE-----

--Sig_/0qSBwfzk1oGwxle.CwKBLBS--
