Return-Path: <linux-next+bounces-3284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 189B994E419
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 02:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72F91F21E4A
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 00:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA778480;
	Mon, 12 Aug 2024 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCuyvqzF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F2847A;
	Mon, 12 Aug 2024 00:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723424094; cv=none; b=NHVnPmmcJ3D/c5dShLj/pra6DQ48kWLV2RMs0JouMCAXkyNM4xygu+FpOtWL9ufU42Rsb7xvBK48hnRor9+n0l9tFPC0hbsMT2wSDxDXb8FWnBaK/yPzQuVwOEYNJeeOeWv8cZtbY4vRgMsGIUV0z3DR7veD0NDZ66ibmNUd2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723424094; c=relaxed/simple;
	bh=9vCm2QQLHHc8gdTjjYZ4IeMay+XY9rlqzzCnFkWnrdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g20z+Npv06ecEwX5qX4ubzYRWk0wv1tk2/N0A6eDVB69xf4Ouk3dAap06N3iYPz6hM8+vKRgS6y2akjWeHCCdCNEmmv3ixyz3mL+6d4KLsHPyeiIvsd/igTGsGQGS1k12cfu6DMnJlJWtcaRGr4Gf82rADCkkLnXJwO0Oq1M22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCuyvqzF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E952C4AF0F;
	Mon, 12 Aug 2024 00:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723424094;
	bh=9vCm2QQLHHc8gdTjjYZ4IeMay+XY9rlqzzCnFkWnrdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oCuyvqzF6sLPVv2ay/iIzSUG3olpK66YAZBHhvIOnJuERDhEIYo2Q83q+6cAQVEfa
	 5hRagXFcQt4V8bTkXzkUwoNi7tm7LZvo171WUW/sfcd5vZgfCoK8oeevLPRX1J9VIL
	 ee+iOMhQOxmWAYfnW+FpBLQVKjdBrk46ocW1sImLhoafbhxhvIkuXWcBKD0w4W2jiW
	 JZgQX1GApsqGAuXQF40ITXcIB7hRrHlhA/jkZJ7ukeCXK5BhqBddQqPjkMHo4JW+dr
	 xxkR2hKfnPABGaEiVltj1ojTx1UTC27GfnoEFRC5hNvFHkPnV0rcgETNQlBcxyDwzM
	 znB/tbh3jLTiQ==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-260dde65a68so2443222fac.2;
        Sun, 11 Aug 2024 17:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqqn3k2zEQbCxoxlKLhCGPvoZDNGQTyHYtXdxhj8upUnCtfu3dmM0JVLAgz2KT/a5X9hOiqrbADfK/0FQVaGq9883np79pJNGZhBsr4FP8uBCwjmLCDnfqMDE+DPJGq8XHIxIw91C6BQ==
X-Gm-Message-State: AOJu0Ywrn/KQaXm2dCGNe/Z6SRL0cf8DQPuKVOa4+RDJWcUrlqRkCJAa
	nGPBzkrMNBbKMAjQnKqL0SkpSIZdd2g5McHcOL3RgVzN2kGYVIfw3fa8doVIq90LrY/X0SNlFFN
	gwKxhh+t8S+MeB/Pio8tVErE7RCo=
X-Google-Smtp-Source: AGHT+IE1n0UODjeHKp3o7Zh8H9n0F1A9E7rYuDnukX4P94N3SBkMA21DF7WmgMN4HJVgVLhVB9HrtlE82TPI1INDbcw=
X-Received: by 2002:a05:6870:e313:b0:25e:1532:fa93 with SMTP id
 586e51a60fabf-26c62c68e93mr9048602fac.15.1723424093537; Sun, 11 Aug 2024
 17:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812081046.369bbba5@canb.auug.org.au>
In-Reply-To: <20240812081046.369bbba5@canb.auug.org.au>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 12 Aug 2024 09:54:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_HNrckYs7R=ObghAovsA=o1ZynV3JwY0Czn2Bd_KGv1w@mail.gmail.com>
Message-ID: <CAKYAXd_HNrckYs7R=ObghAovsA=o1ZynV3JwY0Czn2Bd_KGv1w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the exfat tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Dongliang Cui <dongliang.cui@unisoc.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Yuezhang Mo <Yuezhang.Mo@sony.com>, 
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 8=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 7:10, S=
tephen Rothwell <sfr@canb.auug.org.au>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:
>
> Hi all,
>
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
>
>   fs/exfat/inode.c
>
> between commits:
>
>   3e491faa7648 ("exfat: do not fallback to buffered write")
>   98ad7b9012b5 ("exfat: Implement sops->shutdown and ioctl")
>
> from the exfat tree and commits:
>
>   a225800f322a ("fs: Convert aops->write_end to take a folio")
>   1da86618bdce ("fs: Convert aops->write_begin to take a folio")
>
> from the vfs-brauner tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
Thanks for your work, Looks good to me:)
I'll send an exfat PR after making sure it doesn't conflict with these patc=
hes.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc fs/exfat/inode.c
> index 7d43a0942911,05f0e07b01d0..000000000000
> --- a/fs/exfat/inode.c
> +++ b/fs/exfat/inode.c
> @@@ -428,11 -452,7 +428,10 @@@ static int exfat_write_begin(struct fil
>   {
>         int ret;
>
>  +      if (unlikely(exfat_forced_shutdown(mapping->host->i_sb)))
>  +              return -EIO;
>  +
> -       *pagep =3D NULL;
> -       ret =3D block_write_begin(mapping, pos, len, pagep, exfat_get_blo=
ck);
> +       ret =3D block_write_begin(mapping, pos, len, foliop, exfat_get_bl=
ock);
>
>         if (ret < 0)
>                 exfat_write_failed(mapping, pos+len);
> @@@ -448,7 -468,15 +447,7 @@@ static int exfat_write_end(struct file
>         struct exfat_inode_info *ei =3D EXFAT_I(inode);
>         int err;
>
> -       err =3D generic_write_end(file, mapping, pos, len, copied, pagep,=
 fsdata);
> +       err =3D generic_write_end(file, mapping, pos, len, copied, folio,=
 fsdata);
>  -
>  -      if (ei->i_size_aligned < i_size_read(inode)) {
>  -              exfat_fs_error(inode->i_sb,
>  -                      "invalid size(size(%llu) > aligned(%llu)\n",
>  -                      i_size_read(inode), ei->i_size_aligned);
>  -              return -EIO;
>  -      }
>  -
>         if (err < len)
>                 exfat_write_failed(mapping, pos+len);
>

