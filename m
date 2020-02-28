Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4AA172DC0
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 01:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730155AbgB1A71 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 19:59:27 -0500
Received: from ozlabs.org ([203.11.71.1]:41333 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729984AbgB1A71 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Feb 2020 19:59:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48TB5924hGz9sNg;
        Fri, 28 Feb 2020 11:59:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582851565;
        bh=sbrHA+2CLAAtQ546tfdv1f9Yijrk5msDUuMBBWHSsTE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PDTK2fj1cMUCzo0og3kK/58AHggyBDys5BdI234IQAr2gqjhh1HlhyX1DzhCeBlg4
         v6T7xFrieSFG7eC+YsYACBp8ykWf7Sy70xfkkB/VlZGhrIX53a+iShFJCDOrZdCV06
         DYXJ5sdD/nxC6cDSO4d9P1NWMevqAqQCTL7JPo8Y4b6GjX41/yASfpVffHTvShM5IF
         SkgcStAZ4xVzKXMFQrdZ1OSXC+gGBKQSN3jtlQ1vhz2AiC34PNWdK3tcC8ztNeSYtJ
         MPrKkYO4vjX/0YMppQmyf/aqpIoGOw9gGHkBbbZdHUDg3435Xic3/Ml5baEax7srhU
         wICO23OUlrmpg==
Date:   Fri, 28 Feb 2020 11:59:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arjun Roy <arjunroy@google.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Soheil Hassas Yeganeh <soheil@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200228115923.1d697cff@canb.auug.org.au>
In-Reply-To: <CAOFY-A0an+H=aP6vANr17rrv7v5F99azi4UVaYNTAcpRSRsHUA@mail.gmail.com>
References: <20200227151143.6a6edaf9@canb.auug.org.au>
        <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
        <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
        <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
        <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
        <CAOFY-A0icFrzHibVrUu04JaiBBqNoNoEDYVjHGi4eMgDT1Z2KQ@mail.gmail.com>
        <20200228082831.0149e354@canb.auug.org.au>
        <CAOFY-A0an+H=aP6vANr17rrv7v5F99azi4UVaYNTAcpRSRsHUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S3k1cQyv/vm1HYzF+t3B6KV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S3k1cQyv/vm1HYzF+t3B6KV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arjun,

On Thu, 27 Feb 2020 16:34:48 -0800 Arjun Roy <arjunroy@google.com> wrote:
>
> Agreed on sparc64; I think the sparc32 patch ought to be reverted,
> though (since pte_index may be meaningless to it).

Agreed.

I will replace the sparc32 patch with your new ones in today's
linux-next.

--=20
Cheers,
Stephen Rothwell

--Sig_/S3k1cQyv/vm1HYzF+t3B6KV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5YZesACgkQAVBC80lX
0GykyQf/Vh8WCiepSShXyOJjy2Ie+TwWFyLca+s9G+S0xaXktDBvLbGnNXzGhlQw
tdUieRmtvq7aGrXEwT49KBdCqY5uv/Ya0bycVIk3go0vN9GNgidWWnz9/km5G9no
+C6Ksm8mPx3scTJVtInwV0WeB7czxgmJBOzoKh+gq1Tqr5GdxUdfGB9z/Uhi3/41
+8CdbxlT2N/4e7btmr+wBj/ldysPTIuN0SeprZqe13uIRwypPN6jgLZIn0XE+HOf
edh/T2OZBNHjnQrJkMEjEH1X3qspvgG++T3LDtT5EQVAMAn+KHcEEPhD/VB9w8+n
SWRFv2hwemAhJ4X1OBSNXv5drsTEhA==
=fMwu
-----END PGP SIGNATURE-----

--Sig_/S3k1cQyv/vm1HYzF+t3B6KV--
