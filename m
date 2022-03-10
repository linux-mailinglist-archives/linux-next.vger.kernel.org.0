Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3CF4D535A
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 22:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbiCJVFD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 16:05:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242715AbiCJVFC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 16:05:02 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6ADDDCE1B
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 13:03:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KF1kw5zFcz4xLT;
        Fri, 11 Mar 2022 08:03:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1646946233;
        bh=WjS64k/5nIJEomE4uOpfqLbT2TOj2K/I79lBnMcKxRM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U39kb5aLCbfdbeFYIMKd3EIuZpzZ+0/KO6R5tAnOHbvJg70+RU7em3/QV0wespQrV
         DUcGiWS4Zm3Dimr6hfub4HbLx03dGS7CmS9GS0GigJx3UbDEyxtk4E+vuzeXYzWl0C
         PkPH51n/W7YJ4vcZF3tZwnFTc00b+wkvepqVUn5Zd+VnGLpXkUiIz4vk8lY+hA2QGW
         O1jnbjk22QGgVh5OuzysQH071Z+PD0IDffhAl9af9VTvVBOCU+pr7nkBhl84ntbYAg
         2aab65tyrty8+SVl+GwdbTn53KR52bQ8tfB9Qo8DeOKBIK2VOb5ivTW0/dGShHO8BC
         C5J2VugqkzQ4w==
Date:   Fri, 11 Mar 2022 08:03:50 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Upcoming merge conflict between s390 and kvm / kvms390 trees
Message-ID: <20220311080350.4869503e@canb.auug.org.au>
In-Reply-To: <your-ad-here.call-01646935602-ext-2264@work.hours>
References: <your-ad-here.call-01646935602-ext-2264@work.hours>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oYC6f90n6j=4.hX9Bzqt7+W";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oYC6f90n6j=4.hX9Bzqt7+W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vasily,

On Thu, 10 Mar 2022 19:06:42 +0100 Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> updating s390 tree for linux-next today I had to include a change
> which is already present in kvm tree:
>=20
> 1a82f6ab2365 ("s390/uaccess: Add copy_from/to_user_key functions")
>=20
> it will get conflicts in arch/s390/lib/uaccess.c with the changes from
> s390 tree now:
>=20
> 432b1cc78e98 ("s390/uaccess: Add copy_from/to_user_key functions")
> 4efd417f298b ("s390: raise minimum supported machine generation to z10")
> 731efc9613ee ("s390: convert ".insn" encoding to instruction names")
>=20
> please simply take the version from s390 tree (removing bunch of code from
> arch/s390/lib/uaccess.c file).
>=20
> So that with regular order of merges (s390/for-next comes before kvm/next)
> kvm/next merge will not bring any new changes to arch/s390/lib/uaccess.c
>=20
> cat Next/merge.log | grep -i 'Merge .*\(kvm\|s390\)' | grep -v arm
> $ git merge -m Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux=
/kernel/git/s390/linux.git s390-fixes/fixes
> $ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/virt=
/kvm/kvm.git kvm-fixes/master
> $ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/kvms390/linux.git kvms390-fixes/master
> $ git merge -m Merge branch 'for-next' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/s390/linux.git s390/for-next
> $ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/virt/k=
vm/kvm.git kvm/next
> $ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/linux/=
kernel/git/kvms390/linux.git kvms390/next
>=20
> Thank you

Thanks for the heads up.  I will do as you suggest.

--=20
Cheers,
Stephen Rothwell

--Sig_/oYC6f90n6j=4.hX9Bzqt7+W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIqZ7YACgkQAVBC80lX
0GxrWwgAhHWq4IjuAYYN3LHaJms7PRQYJCbSvLAS5GuLIGf/9aRjrJ3U+Xc5PfMm
V1+LNvSQA8gH9VwMTAcpwr9krFX8F+uGd2bPLocJbJphq2SjrvH3rnSAEA4PcgQq
Dl67sT+YktAJiDzL2PvXxFEGOWKd+Z4PCkMpX4vdx1oCGpJcVWQx1qWh+xjsYKpf
uwPvS2T0WcfxpVspihXTyE8X2p4sSJIF93T7qdxwvgWUR/5ired+4m0YSmdGe8KH
tCrhfXzV624VV4C7SV6xDYyi+01u4W6nFDJFg6+KwNkplOFizCJsFNsU7G1U6u1T
Ot4voxv6Nhf75WSdG46rf+ueJHoHiw==
=yonw
-----END PGP SIGNATURE-----

--Sig_/oYC6f90n6j=4.hX9Bzqt7+W--
