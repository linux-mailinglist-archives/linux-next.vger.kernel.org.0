Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B951E3917
	for <lists+linux-next@lfdr.de>; Wed, 27 May 2020 08:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbgE0GZV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 02:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbgE0GZV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 02:25:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B96C061A0F;
        Tue, 26 May 2020 23:25:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49X1641W3sz9sRW;
        Wed, 27 May 2020 16:25:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590560717;
        bh=CdUsS2K/IPQiDVrykPnjzfm8UmUE6yiFxKN08iKhnbc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Rfk83HhhjITs8B+MhYNXmlo+Zb6meazvmGYhkcWepSqGmNZyznRjujMgBxlkLzMqK
         s0OKgLdYOxb50Qc/+ENGFRrIOYmb7ccG8Sv+Cj8JF+fiUx47kyQoDn9+8rqjdHdB5Q
         rchbfT6kazdPw09aNryozv0BndMKN8pDkMN780AI38WCz8xYgcrnQ8FirTHPT1ukS9
         vLuQh7h828rUm/h41K7I8tXjYzfrIKRcfrcQCJEeQhpj8w3Ihvw9j313ZLW06Gf9/p
         1BP8XvRWHZ4FTg2fnUvJtaZyXkMx9tMRleYQVf8HcHaa3MHWgRNZNHe5nv9OqCJr0i
         SozyR03xhHqRQ==
Date:   Wed, 27 May 2020 16:25:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-xfs <linux-xfs@vger.kernel.org>,
        syzbot <syzbot+792dec47d693ccdc05a0@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: linux-next build error (8)
Message-ID: <20200527162514.404ae1da@canb.auug.org.au>
In-Reply-To: <CACT4Y+ZFsQq65jZDRKA1rQs-GM9cyFu9Cn6y=kbx21mCryBqqA@mail.gmail.com>
References: <000000000000ae2ab305a123f146@google.com>
        <3e1a0d59-4959-6250-9f81-3d6f75687c73@I-love.SAKURA.ne.jp>
        <CACT4Y+ap21MXTjR3wF+3NhxEtgnKSm09tMsUnbKy2_EKEgh0kg@mail.gmail.com>
        <20200527093302.16539593@canb.auug.org.au>
        <CACT4Y+ZFsQq65jZDRKA1rQs-GM9cyFu9Cn6y=kbx21mCryBqqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ha=RT5VzzjoM_cuSOs3yIHt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ha=RT5VzzjoM_cuSOs3yIHt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Wed, 27 May 2020 07:41:15 +0200 Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, May 27, 2020 at 1:33 AM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > What version of linux-next is this?  There was a problem last week with
> > some changes in the tip tree that caused large memory usage. =20
>=20
> Hi Stephen,
>=20
> Detailed info about each syzbot crash is always available over the
> dashboard link:

Thanks.  As others have said, this has been taken care of - the
problematic commits were dropped from next-2020522 and the fixes
appeared in next-20200525.

--=20
Cheers,
Stephen Rothwell

--Sig_/ha=RT5VzzjoM_cuSOs3yIHt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7OB8oACgkQAVBC80lX
0GxsUgf/edUJyANj0eA2w/JoWb1NWg7zb7QKwf8XfGv0dVVtr8K1vvLy6o4Lrby4
WujyCRdxWZ++DUCN9HLL0kjOKOPv/ixLMkAepjDjL8OzfeR2JNPwE5zng5W68SZK
guBuIRzmUCqYlc9BHFecVDLyCIYrJL+m3Cb/hNRzRMVKmfLOm6j7oBswWHb2zzqO
8xNqTEeimvZlcQ2k1SlNRNynTpUEQM82HXcFk4jY9y7/qGBibBaeKmkK1wHSaBYR
TjyYXwn+4T2d7Bxcyj64NjYoktTnpFiRsi+Ml7NlxBRC2Wd8FqNvplxUfDFnHgmf
60B+1CkcNIq0m/rHqwPs/rxVQeTWbw==
=zzTY
-----END PGP SIGNATURE-----

--Sig_/ha=RT5VzzjoM_cuSOs3yIHt--
