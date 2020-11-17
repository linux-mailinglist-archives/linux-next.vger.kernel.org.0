Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C182B5AAA
	for <lists+linux-next@lfdr.de>; Tue, 17 Nov 2020 09:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgKQIEv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Nov 2020 03:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgKQIEv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2020 03:04:51 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C42C0613CF;
        Tue, 17 Nov 2020 00:04:51 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CZz4b48q5z9sPB;
        Tue, 17 Nov 2020 19:04:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605600288;
        bh=NjL8hIMNpCvvdKt+wRji+N9A9xxFSIKxFlC7GA1f5Ok=;
        h=Date:From:To:Cc:Subject:From;
        b=kjRmzsZflfhF7KGOmmE21huOZ0iy5T0Y1SW2PQckDGN7sf5UaMcfQ7s8SV/lJyvTA
         wDer8o8W/sLAqA2Ys5ti4oRvEdxJB5EDEWdpXc89kA35GAHpyF25UegD0DJTiIvQb6
         l5PcFp7bgsPY3Gf4N15NLgry/XZUWt2Nb6hdUppLfXwO+axuoTHVc2kVD4JW6mReW1
         qS8O4crbgcP2KHHWfg/8r3MizLLZ9aZWxbUAbhe601sUph/2Iy9sNOYlv4kuRIfcI6
         hpld+CEjOZpg+aCxdXlIYTcdbfImKPcz5/VJPU7dQQWm7ekbjBT4rxGH6t3qWmkMNm
         DOjZCZs1VP+Jg==
Date:   Tue, 17 Nov 2020 19:04:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20201117190446.62d7cab3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qgxPS.LulgcZXu/TAltTBbZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qgxPS.LulgcZXu/TAltTBbZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cf7f34777a5b ("media: vim2m: Register video device after setting up inter=
nals")

Fixes tag

  Fixes: commit 96d8eab5d0a1 ("V4L/DVB: [v5,2/2] v4l: Add a mem-to-mem vide=
obuf framework test device")

has these problem(s):

  - leading word 'commit' unexpected

In commit

  eff5ce02e170 ("media: venus: put dummy vote on video-mem path after last =
session release")

Fixes tag

  Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes: tags over more than one line. (And the second
line of *above* the first :-()

In commit

  e44fb034b032 ("media: venus: core: vote with average bandwidth and peak b=
andwidth as zero")

Fixes tag

  Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes: tags over more than one line. (And the second
line of *above* the first :-()

In commit

  9e8efdb57879 ("media: venus: core: vote for video-mem path")

Fixes tag

  Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes: tags over more than one line. (And the second
line of *above* the first :-()

In commit

  21926d466e3a ("media: venus: core: change clk enable and disable order in=
 resume and suspend")

Fixes tag

  Fixes: 07f8f22a33a9e ("media: venus: core: remove CNOC voting while device

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes: tags over more than one line. (And the second
line of *above* the first :-()

--=20
Cheers,
Stephen Rothwell

--Sig_/qgxPS.LulgcZXu/TAltTBbZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+zhB4ACgkQAVBC80lX
0Gx6UwgAoJtXX1lrTSMPD4ZYLlbg7Fdkv4hA2gbtZ+iiJLI+HK9BmF+jCd4Boe6d
DCO9THOLMSoaWEsuzyu7NortdcM6qteAcJeJAxvUIzgUpXsK4JWAt37Y64CQpsDP
3mfuZeP3XByrCJyaZ7N7tOLDZ6zYuc+VDNmz5pKLPSyr0CaSt6WCywv0OUKLqCt6
eQyJoMuaWUTlLAvdEoNCVjfGlZtB9i3bIVm2DZEP44ebFj+gjm/g3Xq/JQ73YXiG
ZwBw350xkheZaiyyud1KCAR418/MeIzruYMyuICoeRule4vsh8QhkaiuzAUBfIHL
bcCBCNCw3wFPUJE+sBQ2i8Ze/FEi0w==
=uhor
-----END PGP SIGNATURE-----

--Sig_/qgxPS.LulgcZXu/TAltTBbZ--
