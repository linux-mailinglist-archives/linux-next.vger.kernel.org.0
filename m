Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AEE24A968
	for <lists+linux-next@lfdr.de>; Thu, 20 Aug 2020 00:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHSWbS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 18:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgHSWbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 18:31:18 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 323F7C061757;
        Wed, 19 Aug 2020 15:31:18 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BX2Yq62c3z9sRK;
        Thu, 20 Aug 2020 08:31:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597876276;
        bh=e1BaWobOG9FFy0YvLbBCR/TOCh+GM9IhmHC6JY0ZZpw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a6jgQbps4JbjB8nQ07bCO3tJJQh7vajvN5rsqaRXj2idfEDYojZfx834oMezdUhBG
         j8R1NH/Kg/Jrj1JnbPADcoi4s+xX6x4PJmm/Erst5v7WXx+3dQCA+ABMIaLBqgy9Hp
         us3Bx4TpUAHFBwz4Cqm5Sdq8cy1qo3vPSfKDRVt1T1OjqnkcAN6tsQYKr05PhMT3VO
         XWMRTcOi1yiyMnJOhuThstHyA37n9Um57oP1E4RlawR8AhB9Anew94Wtl5dLtGhGEL
         pX08S3Tpwaw/Phh3nJL0RYjRvXMbgkXLPk2XNj7pSegLu7vpwMBVChON1N6wHjIdSU
         e/TXAWceJB03g==
Date:   Thu, 20 Aug 2020 08:31:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Stephen Smalley <stephen.smalley.work@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        X86 ML <x86@kernel.org>, selinux@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        paul@paul-moore.com, Stephen Smalley <sds@tycho.nsa.gov>,
        Eric Paris <eparis@parisplace.org>, omosnace@redhat.com,
        rgb@redhat.com, Kees Cook <keescook@chromium.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        YueHaibing <yuehaibing@huawei.com>, jeffv@google.com,
        Kent Overstreet <kent.overstreet@gmail.com>
Subject: Re: Linux-next: Kernel panic - not syncing: Fatal exception in
 interrupt - RIP: 0010:security_port_sid
Message-ID: <20200820083111.46e81b4c@canb.auug.org.au>
In-Reply-To: <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com>
References: <CA+G9fYvdAUWHw7SUF6Da1bgDJ2Q=59nJLovrxz8Ke74DSFnG1g@mail.gmail.com>
        <543834b1-9e7e-187d-4f98-e8484362105b@gmail.com>
        <CAHp75Vf_3cb51UPXqiPspo4pa5AhU7xTvwAk6Z2+FtzNfmogDA@mail.gmail.com>
        <fdffd8f2-ea67-4bfd-f75b-9ffd56dfbbde@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f0p.4TsNKii6.9fLa1W2MTL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/f0p.4TsNKii6.9fLa1W2MTL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 19 Aug 2020 11:12:44 -0400 Stephen Smalley <stephen.smalley.work@gm=
ail.com> wrote:
>
> Fix can be found at:https://patchwork.kernel.org/patch/11724203/=20
> <https://patchwork.kernel.org/patch/11724203/>

Thanks.

I will add that to the selinux tree merge in linux-next until it turns
up in the tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/f0p.4TsNKii6.9fLa1W2MTL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl89qC8ACgkQAVBC80lX
0Gy6VAgAjdE0ErSHLB+UXfirQt0T/YP/oftROZXZxsKCsVjh1Z9xozJ05/s7j+bG
b5RjoVr0vtLav/p/zmx4cSXoc9xx0z/7mNhcLrwfQ8CnyQhEvPY5mBwnyvPkqVZj
stt+mlKmwRL+zQKxxnJuQ8hRlOPWY49a0w4rNFx+1XsL4UvESSKJYMicd6tGVZMN
/Z0CTS8BtiM7PkKnwQh2UtGuT/JSlSl4nGkYbQUyLoJf7u65U8FR7YJNgkvAvEG2
VZJzC4oG3BhJBlSlKJ2FXX2um1cFmfnlukJrBECdZohk7Xo6exRVvatCE0cHDUDw
JQdIsqn2BQv76CQ+Z4n/iby/6dlejA==
=BgvK
-----END PGP SIGNATURE-----

--Sig_/f0p.4TsNKii6.9fLa1W2MTL--
