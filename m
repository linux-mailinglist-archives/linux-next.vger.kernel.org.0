Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C513577D6
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 00:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhDGWit (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 18:38:49 -0400
Received: from ozlabs.org ([203.11.71.1]:42145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229449AbhDGWit (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 7 Apr 2021 18:38:49 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FFznn2jcJz9sPf;
        Thu,  8 Apr 2021 08:38:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617835117;
        bh=GLfpV8xEdZPIt8FbEWYgmNWiNnbuZSPJgayKLkTMwAQ=;
        h=Date:From:To:Cc:Subject:From;
        b=FRwZcKERbNh61M327RHQmw6Tw2S5UWxBgIEB+d7+EiJoT+ccT1k7NFjgUXGbFPtt2
         EVwxjU74+OV9xS4jdFqGFaa5ALq7v3m+GRsj58sIT9ClLgM+a7T3VcxlXqnJy/pRol
         5yNEZCZkHOUS/3Y5xzwP1TXDZbT02YkxvLbvDpW5XxaZCI7Y+3u0uP9w9AJJpQcM6+
         75bNmrqMTJaYR+z7sgXs2P+da1cCGX94heAg/29nSC7oR8caDT10ZOVlPW3pM8LUT+
         P+bijSaCMHZp8nmCgReJApV+wkrhHrVVf4H5WkmgS6wsZQh0VqVu1I/K/ogIyEUnLs
         d7dKb66lwXJhw==
Date:   Thu, 8 Apr 2021 08:38:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20210408083836.39c4063a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5Xd=2vVsFS.l91hXittWDoJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/5Xd=2vVsFS.l91hXittWDoJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fa26d0c778b4 ("ACPI: processor: Fix build when CONFIG_ACPI_PROCESSOR=3Dm")

Fixes tag

  Fixes: 8cdddd182bd7 ("CPI: processor: Fix CPU0 wakeup in acpi_idle_play_d=
ead()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/5Xd=2vVsFS.l91hXittWDoJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBuNGwACgkQAVBC80lX
0GyoGQgAgdYTTrsiTCTkkCevms5td/tWbnLVNuWHpfM22NzbmBvFhe28wLf3DhVR
ymmcfbeM28pd+JIFAWT7dn+obj7xg1Gn9APXmoKPW7FfjgtCdBACazm18mMOpwNz
PSogBkMN6iqUibcjf+9/s03pq6ClugdN8gWr14pPX8VH7rh1MgjnDgzNbmQwFihI
YEK80IhHmGFapNaREuQuMpwRApZMGnh2RZblOIT+3FCiu2exSIK6lGguRZF7hOK7
afEde69YWf6gP4zLoMawePeplT8XT77T3GWUbbYs/iWgZgSJ1nI/22NlkMYtRU9s
zJHWTpg4d56uso/aC/OTw7e9xWUwfg==
=Foln
-----END PGP SIGNATURE-----

--Sig_/5Xd=2vVsFS.l91hXittWDoJ--
