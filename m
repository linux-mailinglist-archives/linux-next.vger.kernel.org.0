Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98A222FF82
	for <lists+linux-next@lfdr.de>; Tue, 28 Jul 2020 04:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgG1CV4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 22:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgG1CV4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 22:21:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A99C061794;
        Mon, 27 Jul 2020 19:21:55 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BG0md2Jm1z9sRW;
        Tue, 28 Jul 2020 12:21:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595902914;
        bh=nfrzytzibpbBRKo0fiL93fU+1sogFMuht34aTf1uoTA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XuOd101QIaTsN7AHtL8ziBfKkk/hShVxOPCQdP5h4ngI91q6io0AdTiC2xaLafKj6
         5hwbrBVvGs9J6nTAGNm+IkMdfhFoIC7t37m3h2UBokHSlGplOkYtIzBzxLbH5r2jVc
         jT/+AQD5zM/SxEA1YS4q90w/N/C7mgfHpvJdEdOcUyqvc/E4BrUX8fdoAgwGBrQJ2C
         eFNGIr2I5SiBvrDGE37UBw/XnRjn/qBWiNwnxzURPRxVhFoFqy8CoTDcCp9YHurv3y
         uRjHM2aUtP6BsyiICofJeyjqEUc4fXLVD/uHASUBEzd2GtJBPcNIgjhj84Nu2er7at
         7AzpCk9a0AItg==
Date:   Tue, 28 Jul 2020 12:21:52 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the printk tree
Message-ID: <20200728122152.384a57d0@canb.auug.org.au>
In-Reply-To: <20200728015119.GA11428@gondor.apana.org.au>
References: <20200728114927.4590731f@canb.auug.org.au>
        <20200728015119.GA11428@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A2kUx_+7frIlU2WQN2.BnaQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A2kUx_+7frIlU2WQN2.BnaQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Tue, 28 Jul 2020 11:51:19 +1000 Herbert Xu <herbert@gondor.apana.org.au>=
 wrote:
>
> This patch depends on two patches in the tips tree.  I presume
> this build test was done without the tips tree, right?

Of course it was ...

Each tree merged into linux-next should really be standalone (in case
e.g. Linus does not take the other tree).  So to do what you want, you
need those other 2 commits to be in a separate branch that both the tip
tree and the printk tree can merge.
--=20
Cheers,
Stephen Rothwell

--Sig_/A2kUx_+7frIlU2WQN2.BnaQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8fi8AACgkQAVBC80lX
0Gx3Bwf/Rlr96rZSVFUEHoJuMrRV0GaMYS+tpWTx6clXrg5GZ5aq4JLYKDWO/t48
5AWaxhhTEtRrZQROf3APsjKWVAZ2Y9ov/PB41nRzRiNg0hmCcYt9frqmnGeV1Lf7
4ojeC20kXfKIZm3MpqJYyBeSRr4T86LAyhONn5Rt56zBVB99td/WjhzD+EDy+BQp
hrDolR2a5t1ixzfwfTTzndWNdleKAMfPMbOfFIAdj2XQeOHDec+ivvSsoSq+l1lC
bexGyW1eWHYH2nJqE9qDYtbT7UhbqSnNcOtzybhyru/mV0LL/FjOF2rL7hoCgFIa
7ANwgsz/xrs80bie5hN7PbTy1hsMjg==
=hTIn
-----END PGP SIGNATURE-----

--Sig_/A2kUx_+7frIlU2WQN2.BnaQ--
