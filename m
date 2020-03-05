Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B57417A245
	for <lists+linux-next@lfdr.de>; Thu,  5 Mar 2020 10:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgCEJeB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Mar 2020 04:34:01 -0500
Received: from ozlabs.org ([203.11.71.1]:37949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgCEJeB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 5 Mar 2020 04:34:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y5D658rdz9sPg;
        Thu,  5 Mar 2020 20:33:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583400839;
        bh=0VNV0vcRlSNoebDfMcN1IfFTAHR24zqhJXQME3nFPck=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dBIKgr3G8RXKFx5zbWL1ChjyJtRat+8eo1d9KcybZdtaGBMz5RCCDdKLE04xj8cYC
         4pz+cVbI2CNDJMaLwKUsNWYvngiqMHSbx1qcO3QF7ZI5y0juH1Un3u7uYOn8E3QOFY
         RYxzhmq95aD+tkYsysjgsjRs8Zxh/nYBhQY6YYHVt7aiAoub6YhzthOF2Ko852IM6l
         u6kC+tDyT+FviTkF2WmRR6PPcVtjrsG/MSuJUZYzSD6e2o1TsDJV+z/7sGwaS9j6CW
         hOgNFxbi30NsfV1TtYQJKfrksRVuNCM71QywxDoh65t5lQEllWB2Z/Xe8T3FkhBKx1
         mfgH0b/mDPdnQ==
Date:   Thu, 5 Mar 2020 20:33:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Walter Wu <walter-zh.wu@mediatek.com>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200305203356.307c0a18@canb.auug.org.au>
In-Reply-To: <1583398476.17146.6.camel@mtksdccf07>
References: <20200305163743.7128c251@canb.auug.org.au>
        <1583398476.17146.6.camel@mtksdccf07>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vs3T5M5K+OJMDk5rszPkr5S";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vs3T5M5K+OJMDk5rszPkr5S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Walter,

On Thu, 5 Mar 2020 16:54:36 +0800 Walter Wu <walter-zh.wu@mediatek.com> wro=
te:
>
> I'm sorry for the build warning, it doesn't generate in our local
> environment(arm64/x86_64). Would you tell me what toolchains can
> reproduce it?

I am using a PowerPC LE hosted x86_64 gcc v9.2.1 (Debian cross compiler).

$ /usr/bin/x86_64-linux-gnu-gcc --version
x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130

--=20
Cheers,
Stephen Rothwell

--Sig_/vs3T5M5K+OJMDk5rszPkr5S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5gx4UACgkQAVBC80lX
0Gw8BQgAjSdyOpTjhzBm5yJfu5c8Yrc2F7VT6ZOM5TSPPHHiLhr38Yy+VcLzFf+N
GuDIUJ1oiVsXmLrR/VGyu8/IK4HRe+niva2hvQdYT3ewcxJGD9FuXcIcLA70oOeU
yNbH1QEeejpHJ89i+ceAO29G6EL1+6o765j4Ky9NOGOlEl1DWBNBOQGeTKa/8M3H
q9TlaWhzhnlrjbZfjp2t/GZqTMZmUYSINijFj/X3VCswNK3WZIGmJ+MK+FE1Yvr9
SCmevgyiBNhBkHgLVDoVOV8cJQapWqfZLThBAH8kDT0N5c1SmwVo9OnLN/xNePrt
V+akoU3CRdpf8ad95DfOXCWALYwjvw==
=6mz4
-----END PGP SIGNATURE-----

--Sig_/vs3T5M5K+OJMDk5rszPkr5S--
