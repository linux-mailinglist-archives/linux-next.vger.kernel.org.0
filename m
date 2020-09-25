Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4A1277F19
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 06:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgIYEkR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 00:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgIYEkR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 00:40:17 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC124C0613CE;
        Thu, 24 Sep 2020 21:40:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByK325pZCz9sSn;
        Fri, 25 Sep 2020 14:40:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601008814;
        bh=0LJn+ZOotUkF8eO1MNB+VO6AmEuzjV8InnLcwwEFRbM=;
        h=Date:From:To:Cc:Subject:From;
        b=Ehdw5pX8DACOU6+GabU7JcKL2AaYu9OA50otmlHsTjmmm9HMnCk+CpoBNVFDCFsBN
         N6Ehzr+xO6ntA/6KBJvD1Pb2XaQrM546gJheiCrB9Q8616io8w6rrCLBmER+QW306/
         RCk2mkMFJ9H5lVNLAITam9Lb0r20b43NZiGkarYfP+UU1oWT72nkrmSwwsgxjkqFaF
         WXkrbENImaykMRwPhUmnE2Y2Ej0VA/tsg0JGvnTikExhwNc29SrkARPO08RLqQyOT5
         LxuzBUiL0i19g7KnmdFJ+joJvUR/akOxLagxwseGx1unQo9Gd3os8E1rC1wwhguBAW
         2T4c+JtBMu0pw==
Date:   Fri, 25 Sep 2020 14:40:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Amey Narkhede <ameynarkhede03@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the mmc tree
Message-ID: <20200925144012.7487daf8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P0dDIYkmzS9/I97xb.l.3Ar";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P0dDIYkmzS9/I97xb.l.3Ar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/mmc/host/davinci_mmc.c: In function 'mmc_davinci_set_ios':
drivers/mmc/host/davinci_mmc.c:696:19: error: 'mmc' redeclared as different=
 kind of symbol
  696 |  struct mmc_host *mmc =3D mmc_from_priv(host);
      |                   ^~~
drivers/mmc/host/davinci_mmc.c:691:50: note: previous definition of 'mmc' w=
as here
  691 | static void mmc_davinci_set_ios(struct mmc_host *mmc, struct mmc_io=
s *ios)
      |                                 ~~~~~~~~~~~~~~~~~^~~

Caused by commit

  359c6349a771 ("mmc: davinci: Drop pointer to mmc_host from mmc_davinci_ho=
st")

I have used the mmc tree from next-20200924 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/P0dDIYkmzS9/I97xb.l.3Ar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tdKwACgkQAVBC80lX
0GxqkQf/Rr+MaaUh3csApsKEGaU158p8vDtbB4XnAw1+at38kA7sJSKH2fYcHuFw
jkRWQm2+wZIlMw2s52CZO7RoyniBcDlQmofDenu1cvQDRpzE5WjjUotST7lBcy9z
0duwp6Ne9vrqDQWq581JpB1vTtUZjLD03u2aWa1rTkAfE8umXjAh8zuq8w4o9oVP
l7y7g4fhnE+O5XrmgbMZxQhV3olk737eLJ1POjY1Jjv3WsLuAGfsxIDQiujuGRL1
hDzdYPQ7iRTJFvABnRR3HbTeDDqCTK6KXjoiYcylCDFb7CUBUZ4HlSHIjDV3C7yN
eSeiYyrxOcX4ChgY9xPaABADl/Uq+g==
=q9sT
-----END PGP SIGNATURE-----

--Sig_/P0dDIYkmzS9/I97xb.l.3Ar--
