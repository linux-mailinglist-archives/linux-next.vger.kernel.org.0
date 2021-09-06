Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B30D40211C
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 23:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231256AbhIFVgd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 17:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhIFVgd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 17:36:33 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0800AC061575;
        Mon,  6 Sep 2021 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630964123;
        bh=OO7bEylt85aCRb3IKIQJkBPGUeUYX3CyVtXC/ZX5kKI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EjGpv5c03M9+TJNJMyJcFUcxJs699rmXANUyfC9ecfee+om47koovUbRQfwnE1nCK
         sv8P/0mm0w6bgv0zuG6phu/a1C7s1SPfFqEDBOGSjMVRYeLP6G/aLP8c8FH8Z4Jfel
         /nvPDR7lv0r4ADQh0dmsgx2Y9Uy9plOcZAQEWvYgMzZVhkjGM6D2sn0+vJ5WpkPm5C
         8eNGYRBo6uenbkFqCT7RXe9kIVm4Vk6IjA4b0RMiQT6yzSWshJ/+ZbfudcTSeVtkqe
         xrEj3sD/Gmdy/1HAp/MajDD+6g1oR9rVfZ0rnjsA7cJQKnYGYydnmp6Ic3cMReGP+J
         CdA3kAT8CcVPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H3MBg04QSz9sf8;
        Tue,  7 Sep 2021 07:35:22 +1000 (AEST)
Date:   Tue, 7 Sep 2021 07:35:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 folio tree
Message-ID: <20210907073522.0388f184@canb.auug.org.au>
In-Reply-To: <CAJuCfpFMzpfR2LQ3saFk=vNfzbnKDG9ToOOVzFu5O3adniROHA@mail.gmail.com>
References: <20210721163118.3ca01b57@canb.auug.org.au>
        <20210906144807.4db0790f@canb.auug.org.au>
        <YTYFm1Ca8LHvrlyq@casper.infradead.org>
        <CAJuCfpFMzpfR2LQ3saFk=vNfzbnKDG9ToOOVzFu5O3adniROHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VWz=/x7zyDc0ccpCk._uI2p";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VWz=/x7zyDc0ccpCk._uI2p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Suren,

On Mon, 6 Sep 2021 09:56:14 -0700 Suren Baghdasaryan <surenb@google.com> wr=
ote:
>
> If dropping my patch (1f4c6a1cf274 ("mm, memcg: inline
> mem_cgroup_{charge/uncharge} to improve disabled memcg config")) helps
> in resolving this, feel free to do that and I'll redo it after folios
> are merged.

That commit is now

  2c8d8f97ae22 ("mm, memcg: inline mem_cgroup_{charge/uncharge} to improve =
disabled memcg config")

and is merged in Linus' tree already.
--=20
Cheers,
Stephen Rothwell

--Sig_/VWz=/x7zyDc0ccpCk._uI2p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE2iZoACgkQAVBC80lX
0GxvBggAphwvWb+asetIeaOBo7Ovyau2Uk2G9WHX55pplIvMWTxRF+dEUH3oRUHd
5rQYWymMngfyn+/VTAj0WDJkyOJ6734sQQpEcRnFrkuAKdQG7i3soV3D188mRXYA
wRnT31Z3meaybpVmEckfd+SCEyV4rddr98IkJieLltQR41mQw6DtbD0HrFlBFb1+
JDuQd1UFums7/w67W9hmH6gTnFd6CZTs7EjOrYVBB30d7ls4dFjrgdjQIiXkg0bI
vZrzmBEcA8utxqQLJUjg6EyletzXtSd0/HkG0UmzjE4Pq7Z6pbk3VEdbNOwWfaPg
OWqQxAckIIDAlE0n/RgDDh2tWdIJ/g==
=lZxs
-----END PGP SIGNATURE-----

--Sig_/VWz=/x7zyDc0ccpCk._uI2p--
