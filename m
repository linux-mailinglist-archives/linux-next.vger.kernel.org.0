Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89274E6AFD
	for <lists+linux-next@lfdr.de>; Fri, 25 Mar 2022 00:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345891AbiCXXGV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Mar 2022 19:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353518AbiCXXGU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Mar 2022 19:06:20 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F7FBB097
        for <linux-next@vger.kernel.org>; Thu, 24 Mar 2022 16:04:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KPglx6j3Qz4xMW;
        Fri, 25 Mar 2022 10:04:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1648163086;
        bh=v2ReNkZ0KssWQooQaUKY2Jgb/EZ8/cRivPCRZhGZSBA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rLl0aMpz2xP1cq2GfmEpze/BdcBTk8yqjvOgQ9Zz9o0nSd1kzhcWH3Kl/maUQzoPL
         HL6qwRQAp/VShFYrFT+lUmG/LvzXmKRfz5Tp2V/dsTlwCapaG34n1eRkLwdAabfKmf
         h8e7HVyKwxdXH5RBmUJyj9PqBsO6y+dz+MhiRCkjYANExafsNIpSODZ4oLMVq9VidX
         HBbxM6Af1vyZWlaVDBd4cQ7yiUDEFAnchoHIING9YhXnho7rh2heGxNNRmHMcHDQmG
         Xqtj1JNmNy6N5AO7JzSfEHkS+pcQc0eUNubaDd3Wyf3oYjRsiIttxAJjGVZOaKFbO5
         rT9zR/XMeWVig==
Date:   Fri, 25 Mar 2022 10:04:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vasily Gorbik <gor@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Upcoming merge conflict between s390 and kvm / kvms390 trees
Message-ID: <20220325100445.5e285f3a@canb.auug.org.au>
In-Reply-To: <20220311080350.4869503e@canb.auug.org.au>
References: <your-ad-here.call-01646935602-ext-2264@work.hours>
        <20220311080350.4869503e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/39qi93CkVC=g/VWIHn8AM84";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/39qi93CkVC=g/VWIHn8AM84
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Mar 2022 08:03:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 10 Mar 2022 19:06:42 +0100 Vasily Gorbik <gor@linux.ibm.com> wrot=
e:
> >
> > updating s390 tree for linux-next today I had to include a change
> > which is already present in kvm tree:
> >=20
> > 1a82f6ab2365 ("s390/uaccess: Add copy_from/to_user_key functions")
> >=20
> > it will get conflicts in arch/s390/lib/uaccess.c with the changes from
> > s390 tree now:
> >=20
> > 432b1cc78e98 ("s390/uaccess: Add copy_from/to_user_key functions")
> > 4efd417f298b ("s390: raise minimum supported machine generation to z10")
> > 731efc9613ee ("s390: convert ".insn" encoding to instruction names")
> >=20
> > please simply take the version from s390 tree (removing bunch of code f=
rom
> > arch/s390/lib/uaccess.c file).
> >=20
> > So that with regular order of merges (s390/for-next comes before kvm/ne=
xt)
> > kvm/next merge will not bring any new changes to arch/s390/lib/uaccess.c
> >=20
> > cat Next/merge.log | grep -i 'Merge .*\(kvm\|s390\)' | grep -v arm
> > $ git merge -m Merge branch 'fixes' of git://git.kernel.org/pub/scm/lin=
ux/kernel/git/s390/linux.git s390-fixes/fixes
> > $ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/vi=
rt/kvm/kvm.git kvm-fixes/master
> > $ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/kvms390/linux.git kvms390-fixes/master
> > $ git merge -m Merge branch 'for-next' of git://git.kernel.org/pub/scm/=
linux/kernel/git/s390/linux.git s390/for-next
> > $ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/virt=
/kvm/kvm.git kvm/next
> > $ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/kvms390/linux.git kvms390/next
> >=20
> > Thank you =20
>=20
> Thanks for the heads up.  I will do as you suggest.

This is now a conflict between the s390 tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/39qi93CkVC=g/VWIHn8AM84
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmI8+Q0ACgkQAVBC80lX
0GwFWgf8D8JMBMTw+s94Ntmo1TLeCjfSeRuYMCCW+uJh762I/zLGuJzUJyX92HKj
drqZHgw2/8N7VpaWZ4rBRT5T2wT9Cf5s01b0BuF9N/4HQnwdywcNF7Sv6Z+EF2w/
/EXQQyLC0DwdjZF60p/AxxHPvEw9y/Xf3cZTMUtGnwf3LfRKWj8dzi2NjKtNwP3R
jTGPXmmWc9LTdEgc6jQBCVG0TJ5dzqX69kPENxa5bGmtNU4jmdJjB/orWGfdEd9b
8LEAXQSix7Ba12+gwxOxaUAcoACVRkDWXMF/DSSgQKHi2rMpOfqlX404S1g+AV6B
Xng3avnYD2aMrEQToOrDyhRR08zzQA==
=SKlR
-----END PGP SIGNATURE-----

--Sig_/39qi93CkVC=g/VWIHn8AM84--
