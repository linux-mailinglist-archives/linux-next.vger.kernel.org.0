Return-Path: <linux-next+bounces-5004-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1C9F7BA6
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 13:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D099188E65A
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 12:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E62224AF7;
	Thu, 19 Dec 2024 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKIQc6FS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD01621D58E;
	Thu, 19 Dec 2024 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612007; cv=none; b=fu60cfKUwaBP6bpu6neczVjXHu9hha80C26LCtZcLxtt5uJTRDdo4qvPdZhDE11AVIG6PfMcetKs4CQ6G00tTw3+rssIJebicj+lnwxq3xwxPCM9Erz0GtobOwIgLj6fKXo0dDwc/+BdPGX4HPAbqFqnfEkHMY/UGe+DiTswEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612007; c=relaxed/simple;
	bh=vAeh6cNL9PvY1oz9xuKWI9WJmIOZj0lQaglVhx8H4rE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RWiosUpXKTMxfQ8rVZ8/90gPcBkEcoV+oGgFpSU3MQfKhS97TZobZ1Vv3kzV+Q3S/8XcY4OtDXxtOVCfMxBPCieX3WvG0itd3HETJog73u82C3RaPd9CWDtbjWz5F2rgQAOyL9amEx3yMtSl8QKSAL8NAH3EVuOEPlowwwjJPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKIQc6FS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09FDC4CECE;
	Thu, 19 Dec 2024 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734612007;
	bh=vAeh6cNL9PvY1oz9xuKWI9WJmIOZj0lQaglVhx8H4rE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jKIQc6FS8w5Ol2Pt9kNTAK+ERmu8m4z+Fb1VoRzscO7A7HGtbkL0rRdntv/Fr6/t5
	 NFbb4UhhiGgR9CpZZZVtlIMghYfwymmVUg6o+tUveBNOUqdAZxw0rpR9JoBw7x/L6n
	 csbQwgPDcJUEIm+/bXPxKSMkJVyhMLY79yNM8W6hGq8MLTYM+0DuXbsTWa5qUceVIm
	 Gf77NPgaCSGSAVVDqydGE9kGoTfNgqvmsaN09/ptRc1d9zGBVj+E8tQSD64nCEP7It
	 JCH9ubK4vhLH+uLlLV2XXJc6kxWBrBlsHjj7dJ5V79zxW7ANlN/1b1P/IyG6xgEd7g
	 DkpKqcuBz0fhQ==
Message-ID: <fb6ada81454134c8a37aec7cef17b7c068ebdf85.camel@kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
From: Jeff Layton <jlayton@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Brauner
	 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Thu, 19 Dec 2024 07:40:05 -0500
In-Reply-To: <20241219173156.7dce2f07@canb.auug.org.au>
References: <20241211143701.5cfc95a7@canb.auug.org.au>
	 <20241219173156.7dce2f07@canb.auug.org.au>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-12-19 at 17:31 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 11 Dec 2024 14:37:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > allyesconfig) produced these warnings:
> >=20
> > samples/vfs/mountinfo.c: In function 'show_propagation':
> > samples/vfs/mountinfo.c:104:36: warning: format '%llu' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >   104 |                 printf(" shared:%llu", sm->mnt_peer_group);
> >       |                                 ~~~^   ~~~~~~~~~~~~~~~~~~
> >       |                                    |     |
> >       |                                    |     __u64 {aka long unsign=
ed int}
> >       |                                    long long unsigned int
> >       |                                 %lu
> > samples/vfs/mountinfo.c:106:36: warning: format '%llu' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >   106 |                 printf(" master:%llu", sm->mnt_master);
> >       |                                 ~~~^   ~~~~~~~~~~~~~~
> >       |                                    |     |
> >       |                                    |     __u64 {aka long unsign=
ed int}
> >       |                                    long long unsigned int
> >       |                                 %lu
> > samples/vfs/mountinfo.c:108:52: warning: format '%llu' expects argument=
 of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >   108 |                         printf(" propagate_from:%llu", sm->prop=
agate_from);
> >       |                                                 ~~~^   ~~~~~~~~=
~~~~~~~~~~
> >       |                                                    |     |
> >       |                                                    |     __u64 =
{aka long unsigned int}
> >       |                                                    long long un=
signed int
> >       |                                                 %lu
> > samples/vfs/mountinfo.c: In function 'dump_mountinfo':
> > samples/vfs/mountinfo.c:144:42: warning: format '%llx' expects argument=
 of type 'long long unsigned int', but argument 4 has type '__u64' {aka 'lo=
ng unsigned int'} [-Wformat=3D]
> >   144 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id=
, buf->mnt_parent_id);
> >       |                                       ~~~^                     =
  ~~~~~~~~~~~~~~~~~~
> >       |                                          |                     =
     |
> >       |                                          long long unsigned int=
     __u64 {aka long unsigned int}
> >       |                                       %lx
> >=20
> > Introduced by commits
> >=20
> >   0c8f746452aa ("samples: add a mountinfo program to demonstrate statmo=
unt()/listmount()")
> >   ee8c840a4a35 ("samples: fix missing nodiratime option and handle prop=
agate_from correctly")
> >=20
> > I am not sure why these warnings only turned up today.
>=20
> I am still seeing these warnings.

I'm not sure how to fix this the right way.

The problem seems to be a discrepancy in the __u64 type between arches.
Changing these in a way that would make PPC happy causes these warnings
on x86_64:

   gcc -Wp,-MMD,./.mountinfo.d -Wall -Wmissing-prototypes -Wstrict-prototyp=
es -O2 -fomit-frame-pointer -std=3Dgnu11  -m64 -I usr/include  -m64   -o mo=
untinfo mountinfo.c =20
mountinfo.c: In function =E2=80=98show_propagation=E2=80=99:
mountinfo.c:104:35: warning: format =E2=80=98%lu=E2=80=99 expects argument =
of type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type =E2=80=
=98__u64=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-Wformat=
=3D]
  104 |                 printf(" shared:%lu", sm->mnt_peer_group);
      |                                 ~~^   ~~~~~~~~~~~~~~~~~~
      |                                   |     |
      |                                   |     __u64 {aka long long unsign=
ed int}
      |                                   long unsigned int
      |                                 %llu
mountinfo.c:106:35: warning: format =E2=80=98%lu=E2=80=99 expects argument =
of type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type =E2=80=
=98__u64=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-Wformat=
=3D]
  106 |                 printf(" master:%lu", sm->mnt_master);
      |                                 ~~^   ~~~~~~~~~~~~~~
      |                                   |     |
      |                                   |     __u64 {aka long long unsign=
ed int}
      |                                   long unsigned int
      |                                 %llu
mountinfo.c:108:51: warning: format =E2=80=98%lu=E2=80=99 expects argument =
of type =E2=80=98long unsigned int=E2=80=99, but argument 2 has type =E2=80=
=98__u64=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-Wformat=
=3D]
  108 |                         printf(" propagate_from:%lu", sm->propagate=
_from);
      |                                                 ~~^   ~~~~~~~~~~~~~=
~~~~~
      |                                                   |     |
      |                                                   |     __u64 {aka =
long long unsigned int}
      |                                                   long unsigned int
      |                                                 %llu
mountinfo.c: In function =E2=80=98dump_mountinfo=E2=80=99:
mountinfo.c:144:41: warning: format =E2=80=98%lx=E2=80=99 expects argument =
of type =E2=80=98long unsigned int=E2=80=99, but argument 4 has type =E2=80=
=98__u64=E2=80=99 {aka =E2=80=98long long unsigned int=E2=80=99} [-Wformat=
=3D]
  144 |                 printf("0x%lx 0x%lx 0x%lx ", mnt_ns_id, mnt_id, buf=
->mnt_parent_id);
      |                                       ~~^                       ~~~=
~~~~~~~~~~~~~~~
      |                                         |                          =
|
      |                                         long unsigned int          =
__u64 {aka long long unsigned int}
      |                                       %llx


What format specifier should we be using that would make both arches happy?

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>

