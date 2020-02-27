Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1BFA172A1C
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 22:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgB0V2f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 16:28:35 -0500
Received: from ozlabs.org ([203.11.71.1]:39085 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgB0V2e (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Feb 2020 16:28:34 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48T5Pr3cNzz9sPR;
        Fri, 28 Feb 2020 08:28:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582838912;
        bh=nXSN1koXK+6mAq87pw+AALZqEuZuWcyWNKqK3Ey9Axc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SzDvbWxDXsBs9XF/ZpT737qQy6/3IDLYneOY0Lg4j4MlLgVCmL1uIElDbEA+0Nj3M
         L/SPV2nbwv6BwZlqU9YiqL3tVYyA28o+K1XakEnDej1dI0hCS4N5KgoWn4t9dxGPaU
         in/siZS9wzw7Q89GUi3TZbmiVg7ioNYR7Id1/qSbfUWdREjeggNJqbqNy09dt3UYfs
         sQjRzN6Zf87xj+wmm2pEwmWdfI2/YFk5l9oAHUuLcQ6yYjsa9/4gb7K6vgKg43bc0C
         hhlYJglM3qgfzYFbQ3jFh3ar5V9QRcDEcv6c4P1c5OrQepFzKSdLFLS8gPljG18LH9
         IiYNyZuTd/Q4g==
Date:   Fri, 28 Feb 2020 08:28:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arjun Roy <arjunroy@google.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Soheil Hassas Yeganeh <soheil@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200228082831.0149e354@canb.auug.org.au>
In-Reply-To: <CAOFY-A0icFrzHibVrUu04JaiBBqNoNoEDYVjHGi4eMgDT1Z2KQ@mail.gmail.com>
References: <20200227151143.6a6edaf9@canb.auug.org.au>
        <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
        <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
        <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
        <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
        <CAOFY-A0icFrzHibVrUu04JaiBBqNoNoEDYVjHGi4eMgDT1Z2KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wmu=7kQ6aLkW+46snFgtlP9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wmu=7kQ6aLkW+46snFgtlP9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arjun,

On Thu, 27 Feb 2020 10:50:51 -0800 Arjun Roy <arjunroy@google.com> wrote:
>
> On Thu, Feb 27, 2020 at 9:57 AM Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
>=20
> Sounds good, thanks. I'll cook up a patch and send it along.

You will need to keep the sparc64 patch to correct pte_index in this case.

--=20
Cheers,
Stephen Rothwell

--Sig_/Wmu=7kQ6aLkW+46snFgtlP9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5YNH8ACgkQAVBC80lX
0Gzm9wgAlNlkMgPRjVySUGWq4WWA+dVqPrGZP5EKlv/j8A1d+TDcwueX5YaMYuIF
6rZlMKGGlIaoa3dzqSPDWGcICNPNxX2t2EELYXBMg6TUTaJcbb5QXxX69walA1qr
d3qxqDN0e6YEw/PwVaBChQu+WnpWufOhRx4NQcxILITnGX/foRpqOqIi04LqeXSl
dLj2oAbB+uHRlwopd/Rk5qxMV8SCEpFYEwfh85rd7RrXCqxm4z3CKelhGRUYPrEp
rwNioabUaE2Q4TC3duHthkJmwA6JWBKlbtqpqXppx8ztPBVQnSo2f/LRfBjc+wc1
MrLYtVgN5+7mcdPeR0hJR6lBohefjA==
=g3+y
-----END PGP SIGNATURE-----

--Sig_/Wmu=7kQ6aLkW+46snFgtlP9--
