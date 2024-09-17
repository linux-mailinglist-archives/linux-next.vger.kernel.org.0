Return-Path: <linux-next+bounces-3889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF697AB8E
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 08:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 092C2B230D4
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 06:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E70871750;
	Tue, 17 Sep 2024 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbvRvvMm"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBD49659;
	Tue, 17 Sep 2024 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726555486; cv=none; b=tr5+VnYxRwdaetQaqFhMvhMiTbaH5TgqSITh9wVAl/2QMW2viu4nbeVIHBKcYVYfNqnnYbPS+fb8uY+gcUzCoaEYYnFVW92HPxE/W9Jkov6adRelHt3oVQX4ZW0Jm9Sod+qDqXwk8xvXnCdZnrBRxbiL1G6VPHCuIwgeJd/aE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726555486; c=relaxed/simple;
	bh=+6GqA2+hjnu34vSZ91mKx9fpbLmZt1a3K8pNBKABCfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAlbx+BMVBMfn3DKWpar6fXh/r3GH9a3RtvloWyJ+2c7kVxTOwVQKXLH3iUakv3bbjeS9mJJsll9tHUBV0VIZ3ZAWlXEBygfCX08tdXuVjIkaV/Sj84011wU+HzPSGJKyPSGdWE/epv3kqxYX2EFSLtLGLeW/A5/Td4ozgLXYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbvRvvMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA70C4CECE;
	Tue, 17 Sep 2024 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726555486;
	bh=+6GqA2+hjnu34vSZ91mKx9fpbLmZt1a3K8pNBKABCfk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lbvRvvMmuv/vH7xefXsq5G4dBqpF90x4NMR+q75EJg64uc94d8O5m8U9LDTb2S8ZT
	 obUhOgGc5dhdr9wmFGxKUuZqRfpWENdmpOvAG5oyxwjKP3drNvw9Ev+UqalMGl0tFE
	 vhnbm2QT26Z3gCUvWGT4uM2zEdZv0OwHRAYuqTRomwHm2Oo3OwBmFT8ymzmc4qjT1q
	 H57mMC9uzsUgKtO9PaPly5SCyb1VY1reZmt93q4JzI8Euq4gbdIYAIp/vuckrhQvZ7
	 39II+WC2vL3aaB+vcmY0luzvR/kRjR7mKOGB6gTxJMKxvz7D4VQphC/Xe6THZNB3fu
	 cf4FMDuBE9wKA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277f35c01f5so2467497fac.0;
        Mon, 16 Sep 2024 23:44:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/9Ppct830H/LSxxuyFrus5uyu1WWRRGT57m/p8qZ8rYpjFKlZwNnyMZQMU7lGVUpAQ9Cv0ZTbrAdkFjc=@vger.kernel.org, AJvYcCXnH2voaLFUz6y/IdPg7ZhlXq4t8PJy0+zQtjLTjgkBrL9rKIPCdl12Azh001ki/Z56zLI4ugdHPEcNNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8gdxhTHDgvwjnGZ1hpj0TQhm4YBvxXPF/PrRC07OaSiIN2q27
	dPD7cPw/TINifIV6QRBbu92TPaVOWanEN8FDSX6parGtHxB5iIue5GhoGamYL9jgmgRPHC7Sjpp
	Tz1Rd5v6HYEJD9N0EQYoM14fwNIs=
X-Google-Smtp-Source: AGHT+IEUouC04wtEehX/wd0N2zZg9SVR09fPMC8mvRZvkirtgGgStDEWKcJEOoLUA6n9GETEdqbezqtFFfUC4nU/aaM=
X-Received: by 2002:a05:6870:7083:b0:278:50:89fd with SMTP id
 586e51a60fabf-27c3f2ba226mr12053144fac.13.1726555485370; Mon, 16 Sep 2024
 23:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812081046.369bbba5@canb.auug.org.au> <20240917082219.736ce016@canb.auug.org.au>
In-Reply-To: <20240917082219.736ce016@canb.auug.org.au>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Sep 2024 15:44:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_2tMwcdOq_04aESV3dK4sBuG2Fbpv9fvmzkgu4mHkApw@mail.gmail.com>
Message-ID: <CAKYAXd_2tMwcdOq_04aESV3dK4sBuG2Fbpv9fvmzkgu4mHkApw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Dongliang Cui <dongliang.cui@unisoc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Yuezhang Mo <Yuezhang.Mo@sony.com>, 
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 7:22=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
Hi Stephen,
>
> On Mon, 12 Aug 2024 08:10:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the vfs-brauner tree got a conflict in:
> >
> >   fs/exfat/inode.c
> >
> > between commits:
> >
> >   3e491faa7648 ("exfat: do not fallback to buffered write")
> >   98ad7b9012b5 ("exfat: Implement sops->shutdown and ioctl")
> >
> > from the exfat tree and commits:
> >
> >   a225800f322a ("fs: Convert aops->write_end to take a folio")
> >   1da86618bdce ("fs: Convert aops->write_begin to take a folio")
> >
> > from the vfs-brauner tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc fs/exfat/inode.c
> > index 7d43a0942911,05f0e07b01d0..000000000000
> > --- a/fs/exfat/inode.c
> > +++ b/fs/exfat/inode.c
> > @@@ -428,11 -452,7 +428,10 @@@ static int exfat_write_begin(struct fil
> >   {
> >       int ret;
> >
> >  +    if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
> >  +            return -EIO;
> >  +
> > -     *pagep =3D NULL;
> > -     ret =3D block_write_begin(mapping, pos, len, pagep, exfat_get_blo=
ck);
> > +     ret =3D block_write_begin(mapping, pos, len, foliop, exfat_get_bl=
ock);
> >
> >       if (ret < 0)
> >               exfat_write_failed(mapping, pos+len);
> > @@@ -448,7 -468,15 +447,7 @@@ static int exfat_write_end(struct file
> >       struct exfat_inode_info *ei =3D EXFAT_I(inode);
> >       int err;
> >
> > -     err =3D generic_write_end(file, mapping, pos, len, copied, pagep,=
 fsdata);
> > +     err =3D generic_write_end(file, mapping, pos, len, copied, folio,=
 fsdata);
> >  -
> >  -    if (ei->i_size_aligned < i_size_read(inode)) {
> >  -            exfat_fs_error(inode->i_sb,
> >  -                    "invalid size(size(%llu) > aligned(%llu)\n",
> >  -                    i_size_read(inode), ei->i_size_aligned);
> >  -            return -EIO;
> >  -    }
> >  -
> >       if (err < len)
> >               exfat_write_failed(mapping, pos+len);
> >
>
> This is now a conflict between the exfat tree and Linus' tree.
I have updated the exfat tree now. There will be no more conflicts.
Please remove your temporary fixes.
Thank you!
>
> --
> Cheers,
> Stephen Rothwell

