Return-Path: <linux-next+bounces-3771-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99806975EA7
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 03:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CE8D1F232B1
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 01:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A1D22094;
	Thu, 12 Sep 2024 01:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/x/IqfD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2920D3C24;
	Thu, 12 Sep 2024 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726105833; cv=none; b=HluRq2uIDUQuuuxyrcNWTJdCR7XdF3qZx9Wu3+SNOxpfBCKW8IBfjtcAU65qus2hcGK10yTj/UfxVMaVccY76rW+XAXT9/lIcW/9RG3s5AzQGUz9qph97jumHDDltslgm5eKl8W4cpYcqpRP7nB+ExfK4AKe7OCPbIbHcmrf1nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726105833; c=relaxed/simple;
	bh=9OVqqAv6azPMpQbxz5bBWG47JD8uqRQOMbjn4mGcBcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAJu+wnyjEB+deVsG2MQpXU6u+4OIUldtoLfCSDiqveJ9nEqDiKrvND+mOSlSV21mjhfKwXghBwGUvamr0Sjjfm3fJXg7AStAvWet6/ZR1XvNxRGl+INYXm0alxFPhzh0AyqxYgElkp54Zj7Xsl0YjUD7n96EKF3t1U3ghKIUA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/x/IqfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33058C4CEC5;
	Thu, 12 Sep 2024 01:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726105832;
	bh=9OVqqAv6azPMpQbxz5bBWG47JD8uqRQOMbjn4mGcBcI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G/x/IqfDAS7YhHrh7/Som2V2v9TIhFh602Mojlt5UUhfa5czPnOYbk+EFXvvJtUJc
	 ZiS3JrOLbvq3X8bga8h4ej/I2I/yqt89JpAPD/EvsE4OLBcNzMY++dinxUki2ml7fK
	 EcvIkJ/dvpCZ4P0NHgjh86hoWYG5bjmN/xEVkjSEvK3N0Ezx6Dp+QAB+K97d9w7IG+
	 mfKGOrNqMqxauUgzgra45WlPnD/oFHer2rzvIJDMvFouNk9MsFXT+2M10oMdbVhvMJ
	 ZRNAz2zAwis+4dF3uadek9ilUFyKusyd4HLPO5NXxRVgkPLFe6tvR1n/ks1bFzVGqP
	 U/0xQATTDHZoQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53654e2ed93so525852e87.0;
        Wed, 11 Sep 2024 18:50:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuKnWqRubbT6w6tX8Lzxz8GehG44PUhyAEeZu36tFZHBaCJduOqprFeADA1jeYutOQO32PwTRxZamR4N8=@vger.kernel.org, AJvYcCXqhVyD7fu2H3IGaGqmeYBgObILC/mCgvhEqXhILmbsOp9BCR65Vtq7vVtUgjz+Le82ABgPKdOY1Qxqsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1+HHw/Wr1meHCZnjAZC1OH6Cy5gALqU/4bCQhYKgoq4eRmjR
	+xm55Pcn1tlEmvfISt3t7VV8vtEm7WcEizgN4gYXVNUHuD0wfvOIEJVuMwHY9Tkkw7EqhyW+Jiw
	of3BIWqDaKW+6Am3rdizBRXHroLM=
X-Google-Smtp-Source: AGHT+IFex/jQ4IJlZS+WQhG16wf7bTblOsEqF8t6ad154optg/TouEhO8MVfuPocfrp4cIs2w79gCCnVgtNQ8QN7mqM=
X-Received: by 2002:a05:6512:b03:b0:536:53c2:8179 with SMTP id
 2adb3069b0e04-53678feb22dmr651075e87.37.1726105830863; Wed, 11 Sep 2024
 18:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911101810.1d5dde08@canb.auug.org.au> <CAK7LNASLc=ik9QdX4K_XuN=cg+1VcUBk-y5EnQEtOG+qOWaY=Q@mail.gmail.com>
 <ZuGZNLHkUm+MOYpk@oracle.com>
In-Reply-To: <ZuGZNLHkUm+MOYpk@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 Sep 2024 10:49:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTS9mk7q4Z1f7W+z4WOGT_hfOY87_Xe1=Sw99fyoMj4g@mail.gmail.com>
Message-ID: <CAK7LNAQTS9mk7q4Z1f7W+z4WOGT_hfOY87_Xe1=Sw99fyoMj4g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 10:21=E2=80=AFPM Kris Van Hees <kris.van.hees@oracl=
e.com> wrote:
>
> On Wed, Sep 11, 2024 at 06:38:19PM +0900, Masahiro Yamada wrote:
> > On Wed, Sep 11, 2024 at 9:18???AM Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the kbuild tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > make[3]: *** Deleting file 'modules.builtin.ranges'
> > > /bin/sh: 1: scripts/generate_builtin_ranges.awk: not found
> > > make[3]: *** [scripts/Makefile.vmlinux:47: modules.builtin.ranges] Er=
ror 127
> > > make[2]: *** [Makefile:1157: vmlinux] Error 2
> > > make[2]: *** Waiting for unfinished jobs....
> > > make[1]: *** [Makefile:224: __sub-make] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > > Command exited with non-zero status 2
> > >
> > > Caused by commit
> > >
> > >   04b15cdd611a ("kbuild: generate offset range data for builtin modul=
es")
> > >
> > > I do not have gawk installed - I do have mawk installed (as awk).  Do=
es
> > > this script actually need gawk, or will just plain awk suffice?
>
> The scripts does need gawk because other flavours like mawk do not have t=
he
> features that the scripts depend on.
>
> > >
> > > I have installed gawk.
> > >
> >
> >
> > This is what I was worried about.
> >
> > As Documentation/process/changes.rst was modified in that commit,
> > it specifically requires GNU AWK.
> >
> > Anyway, you were able to fix the build error
> > by installing /usr/bin/gawk.
> >
> > If a distro installs gawk somewhere else,
> > (/usr/local/bin/gawk, for example), it is a problem.
> > The shebang "#!/usr/bin/gawk -f" will not work.
> > "#!/usr/bin/env gawk -f" will not work either.
> >
> > More people may start complaining about it.
>
> For the generator script, passing it as a script explicitly to gawk would
> work because then the regular PATH search will apply, i.e.
>
>         gawk -f scripts/generate_builtin_ranges.awk <args>
>
> The scripts/verify_builtin_ranges.awk script can be invoked the same way,
> or simply as an executable script if gawk is installed in the standard pl=
ace.
>
>
> Other utilities that are executed during the kernel build seem to depend
> on being found using the PATH, so perhaps changing the recipe in the make=
file
> to use gawk -f <script> <args> would be an acceptable solution?
>
>         Kris


I think it is better.


--=20
Best Regards
Masahiro Yamada

