Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD0D23D3E8
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 00:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgHEW1r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 18:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHEW1r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 18:27:47 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3964C061574;
        Wed,  5 Aug 2020 15:27:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMR8B4NV4z9sTM;
        Thu,  6 Aug 2020 08:27:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596666459;
        bh=H1q7O14vu9zhIhL/tHyQXAvQU555EVFOoWuAexg7pyQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eo+YwzPc6VIgTyNKoK/068zdkNxNdRelrLdxSqcVdAt9RuJPdog5dmV8EMGHupyjE
         grgkBYPKlEnBMuB0hH+k87V6FEQdhza/ssRfT3p5LbpILZg9I5UlRoNEDQXFDucCiG
         djhiJs6G1jo/hdkozU2rlI4DTqXNf0LWMFKHzGVtwwecmk2Ok7RXrf6TEG+FuRlbnY
         l4tzUggdrxlkh+f93JExEJmobZ6hv5/UYszPiYSxd4uikQ2sokl35RjmGHnEpQJdTG
         9R5ziXptnHIYkvSwLXZoLeraFktcO/39plytpg0E+Ppyt5Fz+pEAyrROYbjWtURdj0
         wBTxD7zrL4YFg==
Date:   Thu, 6 Aug 2020 08:27:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the seccomp tree with the kselftest
 tree
Message-ID: <20200806082737.44f4594b@canb.auug.org.au>
In-Reply-To: <0300764c-a9cf-bdef-57aa-afc0e59d8c17@linuxfoundation.org>
References: <20200720155917.607fff9b@canb.auug.org.au>
        <20200805154511.698d76d0@canb.auug.org.au>
        <0300764c-a9cf-bdef-57aa-afc0e59d8c17@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZRTwqCiW1vXJ/0U_fCPCwbE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZRTwqCiW1vXJ/0U_fCPCwbE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Wed, 5 Aug 2020 16:24:04 -0600 Shuah Khan <skhan@linuxfoundation.org> wr=
ote:
>
> This is sorted out. I added a note to my pull request.

Thanks for letting me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZRTwqCiW1vXJ/0U_fCPCwbE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rMlkACgkQAVBC80lX
0Gxw/gf/fWJvPq4fO83nMC18QNBOjxcrII3czTqDLK1t1YPN2DM7YUXkocN5PKKi
guNJOAEcJzH7SmreNi4TX+/kNeKPbxppLFabKlis4if5qN0dXBdzGmCGzF7Clbup
ojs1sH1Q7JA1xThd3Drr83EVYv6O4HSyoAMeqa4YVSqkB+jaY0YrqgZb0nOsEfpY
Ksp7qkOY+yBQL4l2q56OGK66LUM7UC8m9xlKWTX45xu2CSdblvyPO/XsEUuAzNk4
v6nWbh6MoP0Xchr7h9HomS9iwjNHB29ugwuj1ogdfpXpxHjyqL/cNcCjWo1rUeIr
pnc3C7Y2+Kr3auU4KaXCeGYONMK5Ag==
=nBro
-----END PGP SIGNATURE-----

--Sig_/ZRTwqCiW1vXJ/0U_fCPCwbE--
