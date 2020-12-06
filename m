Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 064462D076B
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 22:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgLFVkE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 16:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgLFVkD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2020 16:40:03 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D652C0613D0;
        Sun,  6 Dec 2020 13:39:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cq0Fj12T7z9s0b;
        Mon,  7 Dec 2020 08:39:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607290761;
        bh=Rs0BgyK6iRiZjCnwfVYB84MTWnPpL5Ji5eHc2PDiwPc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cC1UEFIxUiddNISxIePHxsHDG+dGibvSyddR5FnTt3kDaax6OZj7KvVFwTlSMA16i
         E12kPlZLb7yz9czL15i91iHakrI7NRKCMA45UQcHa+PZr7v75eqdLXNHtTgwPz4yDZ
         nvLfQZ7YF7pJ4RvaSSBdoGzAUSeuXoaSm+fvWN9yRRqDt+oI6ZHU7mrS0b6MnfsKLk
         H79i6jTD8/FVof3dAReVZn8jwYDtXALby2xMEqWZiOuBT2KVj/pMXAHDMX5pNxtGgK
         EsoJNaalsyDBIbsQjmSPX1lvYvXKIEXh573GS5ShzHl23LXSF8j8SEToXg3VwYsRGY
         +nXIt02Ia6BqA==
Date:   Mon, 7 Dec 2020 08:39:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20201207083920.2f64f4dc@canb.auug.org.au>
In-Reply-To: <20201204192032.GA1437@paulmck-ThinkPad-P72>
References: <20201204192526.0b38fb02@canb.auug.org.au>
        <20201204192032.GA1437@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+w=skvRSarInYA9c=UDkO/4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+w=skvRSarInYA9c=UDkO/4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Fri, 4 Dec 2020 11:20:32 -0800 "Paul E. McKenney" <paulmck@kernel.org> w=
rote:
>
> Does the following patch fix things?  (Sigh.  It won't apply on the
> rcu/next that you used.  Or even on this moment's dev branch.  I will
> fold it in with attribution and update.  But just to show you what my
> thought is.)

Sorry I didn't get the chance to test your patch, but it seems to make
sense.  I notice that you have added this to the rcu tree for today, so
I guess we will see :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/+w=skvRSarInYA9c=UDkO/4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/NT4gACgkQAVBC80lX
0Gxm1Qf/a/YWDMvY0CAnpbunpBiJZdnkFToLgQxMGbcQrqzN+nIEbxjNm9W5Bqzd
2dF4oj3GjilQkDxLphqw4bLFYzkbGb/NCJiTPoRFlDDVKZNNNunxK5EPOQO4ZpVH
uod7wnjLm9fxUaeFZNz3n1LTBs74nzJU91vbjz8f2kFSGXe5KDjuDdBOBJAElOc8
nqGN9Beao0N+UQvUVTp0CTNdrFNPat72S3WT8UvlT8aJXaVuiCSL0USLmsE5beqH
jmhDGZm6PiiwqBZfztjEBeao8VMIfdC0eJ7bjRdXQVWDaDGhDXMpjHaZBn7gBbUg
fyhbRdtiaokLZ6xP1cS5yPMsfa/sKQ==
=u58/
-----END PGP SIGNATURE-----

--Sig_/+w=skvRSarInYA9c=UDkO/4--
