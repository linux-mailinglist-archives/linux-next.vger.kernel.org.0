Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD1A899C0
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 11:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfHLJWE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 05:22:04 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727023AbfHLJWE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 05:22:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466VjP4FBJz9sN1;
        Mon, 12 Aug 2019 19:22:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565601721;
        bh=Ts0BS2lBSwZD9i7w2vfUNt/uLevPqGYZiTJy11OCM8Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f4g55UqEoW8DKaZ58XlQAJMv7FNQhR238Ww/42Jej3QMJQ2AfqeDjfjWEtokCamIr
         jyfZVVw2XNO0k9JKt4AOLlePbFRvKH/Jy9vO9s5kQTSJpYZ2ARetXIGogM98TVeXlE
         q4LkUnDnUjOz2iBM8dWT0HhA/4nY0hMooWCnXCBals9p5s1m+LXvXqAggVWNmgNjQv
         Ix848O6njUDUOZ5bOlCPlh3mtcg5djozcih/TDc51MIhTbA68E1P10PWN9QnSPalWI
         iAo/toEFEpftD/bW7N5X8Gc1oE+uuAvCulid3cq4xxDppQV9vnp7doBDm6fJZkBpc0
         BsnlQx2rJkOTg==
Date:   Mon, 12 Aug 2019 19:21:47 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Message-ID: <20190812192147.5dd41ab7@canb.auug.org.au>
In-Reply-To: <CAK8P3a0eOyD2iTFeLC1J95WMAwyzBJJ0S5nOb+Z_y9nUy=8=qg@mail.gmail.com>
References: <20190812171411.31ec6ae3@canb.auug.org.au>
        <CAK8P3a0eOyD2iTFeLC1J95WMAwyzBJJ0S5nOb+Z_y9nUy=8=qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2ntkKCQ=Lv/uHWV.m3yc27U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2ntkKCQ=Lv/uHWV.m3yc27U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Mon, 12 Aug 2019 11:14:08 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
>
> The warning is valid, I will send a fix.

Thanks.

> I have never seen this message though, I guess the build system just intr=
oduced
> a check for this? I don't see where this would come from in next-20190809
> (only checking with grep, not actually trying to build right now).

Yeah, we had a version of this a week or so ago and it has come back
today (I haven't done today's release yet).

--=20
Cheers,
Stephen Rothwell

--Sig_/2ntkKCQ=Lv/uHWV.m3yc27U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1RL6sACgkQAVBC80lX
0GzU5ggAiWC5r5/x0iURbEy6t17fpXwyQ/WYtWPEDodz6X9XlXdEf+DegSXS3zKI
gVpTfq0i4rUmZS4CQ98PcGPgz5eKG2KEtI+oty6yZjXb3ePL5Dtmzx16/76SkW1X
JH37O2s9nWAKshQRMaTMHcTh70hZE+tD38uhL55Yt1QxZeanD65pmfL4c0YpGr1I
ROPhf3sO5MqOe3KzKO3g8s9Dyf/y5PxGkbWzuiH+VdrWg/IBU82pv3nn0s88r2U/
Wveq7M4CbSuaw8MCd3KAOD55ak5E/ldjrJVvfOtKlVhlpue4+b2qkCMYQX+9rCnJ
F/6a44PPxJtUFb/Jps0prGzyWpS49w==
=Jn29
-----END PGP SIGNATURE-----

--Sig_/2ntkKCQ=Lv/uHWV.m3yc27U--
