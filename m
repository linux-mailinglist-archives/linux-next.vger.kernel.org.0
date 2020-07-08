Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6448D2194BD
	for <lists+linux-next@lfdr.de>; Thu,  9 Jul 2020 01:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgGHX6G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 19:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHX6G (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 19:58:06 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F99EC061A0B;
        Wed,  8 Jul 2020 16:58:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2GTR2SSHz9s1x;
        Thu,  9 Jul 2020 09:58:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594252683;
        bh=aACpkRZuaA4Csy55/by9u4B8Fn5cLKtpvLyatcv1DCM=;
        h=Date:From:To:Cc:Subject:From;
        b=thXBgxs7lVVyW8KbxVCoxDWGsYAecAw5PBuFKgeGib3nChAS0B+DHaSEiwVctYQCq
         rpYgVTY7AANEmu7pooQXXLMiUYqq3eWpFhiW7FzUUxkXAHoJqbdQnSNxFMhNZRuAnX
         urpzRQZPDQYHBQ/iUpa13D4u0EsqFVPZ9Y9vNooPDD4d6IQNIeio6Sey/KzFsAMGdX
         ef+1PBgjQJiH/gN97CzOKfpyweoVsF6J8LAZGPEJgkF5XA4HShOL0hxYsLFBVlvxlI
         i8Oz6sODV5aYMEQdSiwuM7IT2Z9SVrAauXpJwCtei3pZYDvMWgkM3XXh/M2FHVVYSp
         PGiPz+y3hUmuQ==
Date:   Thu, 9 Jul 2020 09:58:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the scmi tree
Message-ID: <20200709095802.43bdd86a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4o0/i.NRMjkWQoYcn4vR2CB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4o0/i.NRMjkWQoYcn4vR2CB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/clk/clk-scmi.c: In function 'scmi_clk_ops_init':
drivers/clk/clk-scmi.c:126:39: error: expected ';' before 'max_rate'
  126 |   min_rate =3D sclk->info->list.rates[0]
      |                                       ^
      |                                       ;
  127 |   max_rate =3D sclk->info->list.rates[num_rates - 1];
      |   ~~~~~~~~                            =20

Caused by commit

  2a3dd29cd558 ("clk: scmi: Fix min and max rate when registering clocks wi=
th discrete rates")

I have used the scmi tree from next-20200708 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4o0/i.NRMjkWQoYcn4vR2CB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8GXYoACgkQAVBC80lX
0GwC/gf/ZnyVJS4u2ZWoojdpy+8fluzcdSaYlBgQTu0TO5WURShmMK3iPK40xx5/
aJGqh/YdP5iolU+VsrSkAvVwM2SxHr4480b7sMMnb9CowNFkcDmnUEGdcpK8Gv6b
7dZgLReeTJ99CrrStMT4trvDGqmNg6MjPQYR27ghib4HY8EfUKqlXmCAy5jcoBTA
O+t0PXFNqsOeLxOBZgU7y6EVWfQnG9PbqQoyG2Zurt+/w2dD0uZy5axJUJ8B1gy8
U1xYH5LnOez5G86PGgEDy6FpzhPzHbvBgkuKmLqQIPw1mwfpiTRHU4TEnaj1HRrC
yWDcuh1DKN6p6rlcwUCrBVQSwUDbPQ==
=/YsI
-----END PGP SIGNATURE-----

--Sig_/4o0/i.NRMjkWQoYcn4vR2CB--
