Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D1A86CF6
	for <lists+linux-next@lfdr.de>; Fri,  9 Aug 2019 00:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390340AbfHHWMP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 18:12:15 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54840 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390169AbfHHWMP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 18:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pARZA3ohxUG2TFTyA7TlH8jLh4Oscb64NF12pQDdV/g=; b=K6nxPDmuEi5RmSoqdhxi1li7A
        y+lyQoxKx/iF/bl7WnAxbFkdpgRwepj7hji24AgLO2CLa1NNWSpOldj727IK3VY9cuvTvNXd+ZH/4
        4gXLlvHkW9+Tjig3Tx1ht3qR9KVtmgcjVb8xU5wD3tn6Vvwrjhi71/iC4xAecEozGEHoU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvqdn-0004Cj-LW; Thu, 08 Aug 2019 22:12:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 673842742BDD; Thu,  8 Aug 2019 23:12:10 +0100 (BST)
Date:   Thu, 8 Aug 2019 23:12:10 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sound-asoc
 tree
Message-ID: <20190808221210.GO3795@sirena.co.uk>
References: <20190809074325.65a72962@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="E+IgQzR66AIOcbjA"
Content-Disposition: inline
In-Reply-To: <20190809074325.65a72962@canb.auug.org.au>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--E+IgQzR66AIOcbjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 07:43:25AM +1000, Stephen Rothwell wrote:

> Commit

>   c42d8cbee4c7 ("Merge branches from Takashi to ease Skylake development.=
")

> is missing a Signed-off-by from its author and committer.

> Despite what the commit message says, this is not a merge commit.

Ugh, that's a git bug - there was a conflict resolution and rather when
I resolved it it seems to have completely thrown away the fact that
there was a merge. =20

--E+IgQzR66AIOcbjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1MnjkACgkQJNaLcl1U
h9AAlgf+Ix8ug5eNSrx1p4/j6TcNb5tTbq5IBAT+XRO0oGUuLtBuT4iusOWFz+4D
iNVl4NI+mg4u8ASC9emv3C4ql2Eeg0T18zJ9BKRvtLzbtVh69w9crzkV7NlTwmcw
KA6UD0o9GAh34aJYSyr6RqXE3k70wPIdJKF9XzyfSA6wRewP6LEHJ9enK8BeTvMX
ljntdAYwd9wj2zypPbyKrKOa7mZDFYNURNCTo+leZGyH6djpvrgIFtp+b+5F2y6n
3nK7geW0KP+otBz1JJ539u+W1noGhbtQsRMPJUUda36EugvLtGQQeThRvEBf446Z
EqXPnbv00ZzNZdwPxQdLKSwAPXbbag==
=piES
-----END PGP SIGNATURE-----

--E+IgQzR66AIOcbjA--
