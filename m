Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723E324AD08
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 04:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHTCgP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 22:36:15 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36327 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgHTCgN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Aug 2020 22:36:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX80R5lnrz9sRN;
        Thu, 20 Aug 2020 12:36:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597890971;
        bh=vULF1V6e0f1yAmziZlk663aZWqAbdESm0QzRgsSJSXg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=q9GkWeLnxRMya8G/Fbwsb/rU3kXcaVyIudfMZ/PFBaH5yRw/Mg1mQMb3XfPlkRK3x
         VvLmQ+0DYOAFyoGgN7H6qMBumPcO2J7ZjonRaq3FuGs/B6G7rVMCQOn0/a6M9cFKL+
         1qtjLnXKLu7XOx1pHG5+Y/tUXvYpaTiHILM5Fa5wFVCbKKbYFgl2Wtd3Fcoac+OPe0
         wy0m/sOHRKlQd5eLgequXO5ndbzg9562Svw8wqqWFKL+3JdVj3Fd7JroqRSNnUMuT2
         U1m+g67y1b3y9C3g3fKjZt4nS/LdsiXf2PoGPM8Sb0JZ5iS1DrjPiwILLU18kmRffg
         VqWDLhKtz8j8Q==
Date:   Thu, 20 Aug 2020 12:36:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Stephen Smalley <stephen.smalley.work@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>,
        Ondrej Mosnacek <omosnace@redhat.com>, rgb@redhat.com,
        Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        YueHaibing <yuehaibing@huawei.com>, jeffv@google.com,
        Kent Overstreet <kent.overstreet@gmail.com>
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
Message-ID: <20200820123606.772691e0@canb.auug.org.au>
In-Reply-To: <CAHC9VhTR7b_p3rdiQ8q07OMoY3fXgU4kH=bH5URVgVS6kH5r5g@mail.gmail.com>
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
        <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com>
        <CAHp75Vf_3cb51UPXqiPspo4pa5AhU7xTvwAk6Z2+FtzNfmogDA@mail.gmail.com>
        <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com>
        <20200820083111.46e81b4c@canb.auug.org.au>
        <CAHC9VhTR7b_p3rdiQ8q07OMoY3fXgU4kH=bH5URVgVS6kH5r5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hvV3_WwiiS1IDDfSXsR+NWi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hvV3_WwiiS1IDDfSXsR+NWi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 19 Aug 2020 21:21:29 -0400 Paul Moore <paul@paul-moore.com> wrote:
>
> On Wed, Aug 19, 2020 at 6:31 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> FYI, I just merged that patch into the selinux/next tree.

Thanks, I will drop my copy from my tree tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/hvV3_WwiiS1IDDfSXsR+NWi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl894ZYACgkQAVBC80lX
0Gz5GAf8DJ3zLB6L2nDSdO6q6Dthrh1QZ3leXhW3V6v5RczxX/z/1zakE14IfcfK
U7vftIP+pQ/CNhnuMzeiWvVWI5flz6ZoZyr1cq+5qfqJ/8LaYXPqLIYUNjqpzn/y
lSdBgJxlnfqk91HRB1fnRY7/7CaOMH6UZB409OsFte03QAqBGjOnsvgDObtCCbz9
9+HWRiJjXGbzi+d/76CUUyzQdWI0V85dLbyuNZwqMg3rHR0eWmuj/ndBv0+Yk3XV
wsjp9NkjqULzaCdtK/PJpnLWzNsO0TXin28W3M2y31XMa+MrWgkjY5HwemmiDtaJ
5DRF7usTn/0O1ZYJKj1ZM8f1sGeT/w==
=frR/
-----END PGP SIGNATURE-----

--Sig_/hvV3_WwiiS1IDDfSXsR+NWi--
