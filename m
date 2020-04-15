Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1831AB45B
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 01:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgDOXlV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 19:41:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbgDOXlS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 19:41:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 492f4n3gRtz9sR4;
        Thu, 16 Apr 2020 09:41:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586994074;
        bh=oeZ9gMG1RZkj/Ml/LW78VGxuOlGHcfmS1Gzdw5qrXBw=;
        h=Date:From:To:Cc:Subject:From;
        b=dhvdhRBNRzE0ih0zosUwQoTwKkM/wM0tPVXNPX5rtZIDNmgaZKVkDPRmarvltjfaF
         j1HXSKRYaEVMl8cNZ8G9flyrJDzRxzT8dp2dSG4a2Xbe00pZFNzk6MkTE07Wav8pT/
         kJM4fynz1XoDQYGQ+UYtu58P03aTAV5rXo047OopmkFdkn+r7Qd7UKO61/RVfZbeyv
         nVyGgnLYnSjAl/FGbCM1FUZ56131tmcyxDHipgtagXB4QaN7LoLJhl7pr19QsuexH8
         cw5FLgHb7i6zJoOtMlzsoNQ7rlXklgWpIwK6BY/BSgdwONtUF/7WDzcIXEXQWfVl35
         bEAKZhWOL7aNg==
Date:   Thu, 16 Apr 2020 09:41:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>
Subject: linux-next: Fixes tags needs some work in the sound-asoc tree
Message-ID: <20200416094111.3f37623f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/exYr7II/YnkQw91A8LUO2bA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/exYr7II/YnkQw91A8LUO2bA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  101001652ee7 ("ASoC: SOF: topology: fix: handle DAI widget connections pr=
operly with multiple CPU DAI's")

Fixes tag

  Fixes: 4a7e26a4d833 ("ASoC: SOF: topology: connect dai widget to all

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: c59aca98c912 ("ASoC: SOF: topology: connect dai widget to all cpu-da=
is")

Also, please do not split Fixes tags over more than one line and keep
all the commit message tags together at the end of the commit message.

In commit

  cb0312f61c3e ("ASoC: SOF: imx: fix undefined reference issue")

Fixes tag

  Fixes: f9ad75468453 ("ASoC: SOF: imx: fix reverse CONFIG_SND_SOC_SOF_OF

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

Mark, since you don't seem to rebase your branches, please start pushing
back on these before they are committed to your tree (especially the
non existent SHA1s).

--=20
Cheers,
Stephen Rothwell

--Sig_/exYr7II/YnkQw91A8LUO2bA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6Xm5cACgkQAVBC80lX
0GyqdAgAhzEdqL4qnFxi3YnKTTnTI0YthCBQisbj0vAHHIRkGL0I5+OM4OfjAWNP
1jgL8/MyM7nLeHOorUrD1OlfXEdTQu5YmWPvkIhOtZ/06V9CnPxQcq1MCFcTXzI3
hV3i4UKoHnE8msFQ0NQHlpO7YVaPbDWRuQmJmuvvP3XA8N6sG7lvDmGLqZEDt2iv
d+WAsqCBguSmgkeUiphNW7tHKPI4ymbGVSBrdDJqUDljtlRlJ5dxSic/XeF47lxw
d8IL8K8StiPRjzwpzF8YlnF3s/KiCcr4NyG9UgDn6W731zlD+JqLvtWrOFQjTHjG
Pq7jeZNxihX4KOcxmgPinA108fBFug==
=gKqn
-----END PGP SIGNATURE-----

--Sig_/exYr7II/YnkQw91A8LUO2bA--
