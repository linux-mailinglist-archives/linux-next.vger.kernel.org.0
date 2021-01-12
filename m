Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A462F278B
	for <lists+linux-next@lfdr.de>; Tue, 12 Jan 2021 06:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbhALFKT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 00:10:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbhALFKS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 00:10:18 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C8FC061575;
        Mon, 11 Jan 2021 21:09:38 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFJXZ336lz9sVm;
        Tue, 12 Jan 2021 16:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610428175;
        bh=rwlZ10/1V1y+LvGnEVYXyRjmG89W2iFf8yjXUW3PI2E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bUXUpulX7XneiDfLeAtJ2ODvWHqLycEF02Szu1w6IgHLlqQgb9w5cjnBmyKUI2StV
         WhkNdKV/n0YkjY1wplWuBjBSPzmsQODWH7Fbv6wBqtFdXjpsz6F1yMUsD6KbSg2CFj
         Uc3xPK9jr8Cjsdnqz6Yzfweuy+9HFawNq0oLRTcNVuVBiCFmlXjEhTfqVuFF1VcPfk
         r7yJ9F+rfj+AVRtk+AO2XmD/yv3iu8IjVZqS2S7ousCExx1MtJi04ZySk2BLYEq3bE
         2K2o9Z7rp0JQ4u9C8vRE8c840O9Isb1ZOlRe0rhen+gclaGn6Xaqz/CavIfi4ZCmXz
         bpwhXDwdBnCxg==
Date:   Tue, 12 Jan 2021 16:09:30 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chao Yu <yuchao0@huawei.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
        Chao Yu <chao@kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Message-ID: <20210112160930.7074bdf2@canb.auug.org.au>
In-Reply-To: <5918c348-666a-ee41-3891-ddcf500c464b@huawei.com>
References: <20210107141158.312835d8@canb.auug.org.au>
        <3f921b3d-e8f2-e010-0f6b-76596e29e997@huawei.com>
        <20210111073354.6ec0bbb5@canb.auug.org.au>
        <20210110163534.24481e1e@lwn.net>
        <5918c348-666a-ee41-3891-ddcf500c464b@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mz0faqE98I/xqnczcYSQfUt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Mz0faqE98I/xqnczcYSQfUt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chao,

On Mon, 11 Jan 2021 15:54:19 +0800 Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2021/1/11 7:35, Jonathan Corbet wrote:
> > On Mon, 11 Jan 2021 07:33:54 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >  =20
> >> On Thu, 7 Jan 2021 19:28:19 +0800 Chao Yu <yuchao0@huawei.com> wrote: =
=20
> >>>
> >>> On 2021/1/7 11:11, Stephen Rothwell wrote: =20
> >>>>
> >>>> After merging the f2fs tree, today's linux-next build (htmldocs) pro=
duced
> >>>> this warning:
> >>>>
> >>>> Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Inline emphasi=
s start-string without end-string. =20
> >>>
> >>> IIUC, should I remove "/*" and "*/" for newly added entry in sysfs-fs=
-f2fs? =20
> >>
> >> Sorry, I don't know.  Cc'ing Jon. > =20
> > Removing the comment markers would make the warning go away, but won't
> > lead to a satisfactory rendering in HTML.  If you want that too, make t=
he
> > table look like the others immediately above it in the same file. =20
>=20
> Copied, thanks for your reminder.
>=20
> I've fixed it and resent the patch:
>=20
> https://lore.kernel.org/linux-f2fs-devel/20210111075017.82370-1-yuchao0@h=
uawei.com/T/#u

I am now getting the following::

Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Malformed table.
Text in column margin in table line 15.

=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
value  sb status macro       description
0x1    SBI_IS_DIRTY          dirty flag for checkpoint
0x2    SBI_IS_CLOSE          specify unmounting
0x4    SBI_NEED_FSCK         need fsck.f2fs to fix
0x8    SBI_POR_DOING         recovery is doing or not
0x10   SBI_NEED_SB_WRITE     need to recover superblock
0x20   SBI_NEED_CP           need to checkpoint
0x40   SBI_IS_SHUTDOWN       shutdown by ioctl
0x80   SBI_IS_RECOVERED      recovered orphan/data
0x100  SBI_CP_DISABLED       CP was disabled last mount
0x200  SBI_CP_DISABLED_QUICK CP was disabled quickly
0x400  SBI_QUOTA_NEED_FLUSH  need to flush quota info in CP
0x800  SBI_QUOTA_SKIP_FLUSH  skip flushing quota in current CP
0x1000 SBI_QUOTA_NEED_REPAIR quota file may be corrupted
0x2000 SBI_IS_RESIZEFS       resizefs is in process
=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Cheers,
Stephen Rothwell

--Sig_/Mz0faqE98I/xqnczcYSQfUt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/9LwoACgkQAVBC80lX
0GyXMAf/fBSn4IalakkOY41v7sPCmEbSGidjpnyu/1YvCBTSx0rLGNZkl5F7XLUI
omhxN6e052NxtmNpfyxNJu9FsU2aHX6QwnQv3ucZ55o6kbHtaRLIuJpoMpmjAug0
jPVjloyYGTB887ark2Jv//ITSHkc2Pg+ev8ZpsgywdHF+hO4YznPai7xEZEtHJSV
Mu+MxqWzJUTCumTXfpN+8ODEM7/rL4nO3NIeqEklTXVe6fC03q8AZi1pGew2JlVd
tPHKJSV+BuVXxYg+Q6TzmMlgxvRhp3ydMSHNUWUgdS6cDj9h27GohSsbUh6RHV48
8nzfS4eY0rZ+hYn+Y+Oo++flkAUjAg==
=7awJ
-----END PGP SIGNATURE-----

--Sig_/Mz0faqE98I/xqnczcYSQfUt--
