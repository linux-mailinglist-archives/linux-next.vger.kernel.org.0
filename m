Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04998DE4A6
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 08:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbfJUGiE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 02:38:04 -0400
Received: from ozlabs.org ([203.11.71.1]:39725 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfJUGiD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 02:38:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xRlq5DRJz9sCJ;
        Mon, 21 Oct 2019 17:37:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571639881;
        bh=XktV3NlRSHiniUdNWuVIgg4Y59blnoGaitX8xTsoFPw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NA7CNWgz/Sr/K7AhTHQxZw/x94WWBM3xvAu7SeFNCWTGtR8a0Y70Nk+dWS+VVBZli
         5/JKKJfSA/lmCuP4jZyltrOHZu4C9pCmq23ffVBTQ8Z4G9pc/8NkWz9UY7MrgJcSGL
         0r2Bx0bQLh6wCePDanHlrNcRNI5RZA1VpGE50TL9/dRyA/uTwMDJXaaSwe5BGMAdbz
         btShCcjFB8ew5hHwWE5WmlxyLucqZhHdcsL51cGDbUDvxNCq5gYaGbQ1Kk+CyGpyHs
         F071vOmRS/U2o60Wd8/HoWRuqYuXNR5v00Mdwom3g5ZQvX8lw4iE14t6Qr8k4Phjel
         v77USXyUsC0EA==
Date:   Mon, 21 Oct 2019 17:37:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20191021173758.5f983161@canb.auug.org.au>
In-Reply-To: <20191021055141.GA2973@gmail.com>
References: <20191021131342.404551d7@canb.auug.org.au>
        <20191021055141.GA2973@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/We7Ci/A68c1HZU=ORjDfR+T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/We7Ci/A68c1HZU=ORjDfR+T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

On Mon, 21 Oct 2019 07:51:41 +0200 Ingo Molnar <mingo@kernel.org> wrote:
>
> Hm, that was a weird merge mishap - sorry about that, should go away in=20
> the next -next iteration.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/We7Ci/A68c1HZU=ORjDfR+T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2tUkYACgkQAVBC80lX
0GxRCAf+J6WGy0DQlHkobo27pdA3C5KvPNDauRIAHFWnTD1ybED8d7prz5E8N7ou
C1GgCSE8mxxyI/iwJGgnNtOy0NnESo4DiQF7eO4dGg+XcUWheOEkCYq+Qq08IuoK
KF/8e0soj2I0CoEBuBws3tmv9E2+HX9QLXlupXNLYH00b9MbDjzrNZOu79tlswk8
65l5bCVj8V6YkcQgz81OrDoq5ycPQdBRrTj4A/FkBKuw6lgypVC6gFVWOjnSRMHl
pbBsWC+TMtSj26C90MiLn81v0fFWMVHOQ4XYS42BSlVu3uUHbLstHau4GhVz5DLA
bbB9Ho/hEgcQgPC22YhLsvYYcEz2rA==
=/69l
-----END PGP SIGNATURE-----

--Sig_/We7Ci/A68c1HZU=ORjDfR+T--
