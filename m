Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A726540D338
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 08:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhIPG3H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 02:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhIPG3H (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 02:29:07 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7E9C061574;
        Wed, 15 Sep 2021 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631773663;
        bh=bvom7APVYwgVJizV4SnppAwqleRnHlURWBJYrycELTY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=n7+IIrKLRoDTiSDwWZfoBE1DKz0rhNnGbtW8hb7UrXEGWIXyp3tmQBmR+Oc4zkfqZ
         W4CUyvb5g9/uGJEfuRfCQMfbIp6Ep2FC5oiNwhZT/R8kjgRiqruEP89s9Y3pR0Q0Xo
         clU0Uw7bbBSwCA3byRPgNFJynKn5Ns2BgFFRePY1+etixv/to3huaIGF45C43Uh0FA
         JnRZugf+dphCH7EzAuRm9Wg6U7DjkgHdK+LmF4/+QvfknqMqiuT5FkTXOGcUV5xU6e
         ix0EOJIXuU1PTkAlQLMzbSMUZc0q9ZxclqfIWow6pA1cA8r8JH+qm6jXEQL5kt/U6n
         3LCnHK0vO/smg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H96Zk57d8z9sW8;
        Thu, 16 Sep 2021 16:27:41 +1000 (AEST)
Date:   Thu, 16 Sep 2021 16:27:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Improvement suggestion for creation of next [Was: linux-next:
 manual merge of the dmaengine tree with the driver-core tree]
Message-ID: <20210916162740.3327df56@canb.auug.org.au>
In-Reply-To: <20210728071014.dkdvqmiw2lma6ooa@pengutronix.de>
References: <20210723155354.082a62d8@canb.auug.org.au>
        <20210728071014.dkdvqmiw2lma6ooa@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Haa0oEpn914_9eS/W_KnBeE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Haa0oEpn914_9eS/W_KnBeE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

[Sorry this took so long]

On Wed, 28 Jul 2021 09:10:14 +0200 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@p=
engutronix.de> wrote:
>
> I intended to take a look at the resolution that Vinod pushed in his
> tree. To find his tree and the right branch my approach in such a
> situation is usually:
>=20
> 	uwe@taurus:~/gsrc/linux$ git name-rev d9e5481fca74
> 	d9e5481fca74 tags/next-20210722~22^2~2
>=20
> so it was merged in tags/next-20210722~22, looking at that I see:
>=20
> 	uwe@taurus:~/gsrc/linux$ git show tags/next-20210722~22
> 	commit 65da974af6a0d913cde0cf59f517322bceac24a7
> 	...
> 	    Merge remote-tracking branch 'dmaengine/next'
>=20
> and then I have to lookup what dmaengine/next means in next-20210722:
>=20
> 	uwe@taurus:~/gsrc/linux$ git show next-20210722 | grep dmaen
> 	...
> 	+dmaengine	git	git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaen=
gine.git#next
> 	...
>=20
> You could save me the last step if you used
>=20
> 	git pull dmaengine next
>=20
> instead of
>=20
> 	git merge dmaengine/next
>=20
> because then the commit message of tags/next-20210722~22 would be:
>=20
> 	Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/vko=
ul/dmaengine.git
>=20
> which is much more useful than
>=20
> 	Merge remote-tracking branch 'dmaengine/next'
>=20
> . Otherwise the result should be the same (apart from fetching the
> changes a tad later maybe).

Thanks for the feed back.

I prefer to fetch all the trees (and run my checking scripts across
them independently of the merge/build cycle.  However, I have improved
the merge commit messages (I think).  Please check out today's
linux-next.  I have decided to remove the SHA1 from the message, as you
can see that from what is merged anyway.

Let me know if this is better for you.

--=20
Cheers,
Stephen Rothwell

--Sig_/Haa0oEpn914_9eS/W_KnBeE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFC49wACgkQAVBC80lX
0GxkzQf/dU7Qxk8D4z+zo10wKh5U4X9bxOWYRqTQQqavLKxDkGhAvfnIV1uzUwnx
FvBjEmX+29b422pfB6LkQ8U5V9UhMHjIslfio5GO+Nta85nT1JQ7c8zdnxYYcBZq
gE/eNABfNNf5hVILNY/YAwh3Ly7aoY6Kh77A6kbFtGobyxVD9pv/3rQxvcJSgP4Z
H9hf6AZoIyq9jaAg7lp91zdXlVK578AQvvy0BQ8L4aRPbi+kxCclAhl7DL5ULt2M
3RPpSj91HGitrE3G1SsyvQ587JV8Y5ALd04ysXmqlocHX01Ruey5NiB1+N2UaDSu
7wvWfBR1EonpS3LtTikiugKurfshjQ==
=c4n7
-----END PGP SIGNATURE-----

--Sig_/Haa0oEpn914_9eS/W_KnBeE--
