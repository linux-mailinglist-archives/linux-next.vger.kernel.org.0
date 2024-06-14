Return-Path: <linux-next+bounces-2551-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB74908080
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 03:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2085C1C21476
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 01:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB85158D75;
	Fri, 14 Jun 2024 01:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HB4EC0v9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE992F25;
	Fri, 14 Jun 2024 01:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718327274; cv=none; b=WzHtMweS3RyFMNjwoIXkwoXgUGaAjbeS9KtqU3jRYM0GkXcu+u++CPPkc+4cFgV5Z6EpU5cUi2KSMeDrqBUViZWvywLi6IXouBZDE25LUVn/Mrje9qTXTBNKnoqqNIEWy3CnsOwmI9iHF3+jDR03AzonKx7phWigR4QWgfZnJgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718327274; c=relaxed/simple;
	bh=GwS7Y56Lx+fE/+Y9/JVAXhP3402AVgK8FgY1QgvObb8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ADUjArzAOR/X01c7dN/Pf6DNPd8EVozrxoo9NJ+lMe+p1uiwyePXoxHTqjO9LWFP4rx+WY4PKX8v/RzSn8CcQOcbjXJMtr2o30lsr32qzAPEl4IJnX8yEOiQ257EhFbIwhnembdBGmbMMqqeI/iQPE+9OX3TgFvb1wbmja6kSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HB4EC0v9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DCAC2BBFC;
	Fri, 14 Jun 2024 01:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718327273;
	bh=GwS7Y56Lx+fE/+Y9/JVAXhP3402AVgK8FgY1QgvObb8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HB4EC0v9hTVYXkIe3354UyWHM3bLX7Cu5VMpybrzLJ0EDJVGrNSx7Mumr9qWwoWKZ
	 QF4jyLQoatMECNM/tb0cRo21UFz93wzZx2H2f9o4WIZW95ITenBozy0Z4SjT24fBX6
	 Z2hcf9QdyW2KYFhgBvdhy690qSOMfP4+xLVzmH73DpSxgUsOh9WvGz3198OMdR8Yfd
	 6jxw5Itn1xOYuLsFYsNPhLPJXDdyLfZj/aOcnvUDAWvOkok+b8LOiWN4g1EL0B3Yms
	 g4d5pvVElCT4LAjDnyFBV25cvudTzX1ST3y6LVt7M5ih64z8o8dE48mxYheLFy3Q1g
	 60g2NjjFf4nWw==
Date: Fri, 14 Jun 2024 10:07:48 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Olsa <olsajiri@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Christian =?UTF-8?B?R8O2dHRzY2hl?=
 <cgzones@googlemail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Mark
 Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 vfs-brauner tree
Message-Id: <20240614100748.fcaa7efe6debea3801682ba1@kernel.org>
In-Reply-To: <20240614090523.246f48e4@canb.auug.org.au>
References: <20240613114243.2a50059b@canb.auug.org.au>
	<ZmqaytbJ0r0EXO8d@krava>
	<20240614090523.246f48e4@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 09:05:23 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jiri,
> 
> [Cc'd Mark Brown and Michael Ellerman just in case they decide to do
> linux-next releases whil I am away.]
> 
> On Thu, 13 Jun 2024 09:07:54 +0200 Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > On Thu, Jun 13, 2024 at 11:42:43AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the ftrace tree got conflicts in:
> > > 
> > >   arch/x86/entry/syscalls/syscall_64.tbl
> > >   include/uapi/asm-generic/unistd.h
> > > 
> > > between commit:
> > > 
> > >   e6873349f700 ("fs/xattr: add *at family syscalls")
> > > 
> > > from the vfs-brauner tree and commit:
> > > 
> > >   190fec72df4a ("uprobe: Wire up uretprobe system call")
> > > 
> > > from the ftrace tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > > 
> > > diff --cc arch/x86/entry/syscalls/syscall_64.tbl
> > > index 26af003921d2,6452c2ec469a..000000000000
> > > --- a/arch/x86/entry/syscalls/syscall_64.tbl
> > > +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> > > @@@ -385,10 -384,7 +385,11 @@@
> > >   460	common	lsm_set_self_attr	sys_lsm_set_self_attr
> > >   461	common	lsm_list_modules	sys_lsm_list_modules
> > >   462 	common  mseal			sys_mseal
> > >  -463	64	uretprobe		sys_uretprobe
> > >  +463	common	setxattrat		sys_setxattrat
> > >  +464	common	getxattrat		sys_getxattrat
> > >  +465	common	listxattrat		sys_listxattrat
> > >  +466	common	removexattrat		sys_removexattrat
> > > ++467	64	uretprobe		sys_uretprobe
> > >   
> > >   #
> > >   # Due to a historical design error, certain syscalls are numbered differently
> > > diff --cc include/uapi/asm-generic/unistd.h
> > > index 5b8dab0b934e,2378f88d5ad4..000000000000
> > > --- a/include/uapi/asm-generic/unistd.h
> > > +++ b/include/uapi/asm-generic/unistd.h
> > > @@@ -845,17 -845,11 +845,20 @@@ __SYSCALL(__NR_lsm_list_modules, sys_ls
> > >   #define __NR_mseal 462
> > >   __SYSCALL(__NR_mseal, sys_mseal)
> > >   
> > >  -#define __NR_uretprobe 463
> > >  +#define __NR_setxattrat 463
> > >  +__SYSCALL(__NR_setxattrat, sys_setxattrat)
> > >  +#define __NR_getxattrat 464
> > >  +__SYSCALL(__NR_getxattrat, sys_getxattrat)
> > >  +#define __NR_listxattrat 465
> > >  +__SYSCALL(__NR_listxattrat, sys_listxattrat)
> > >  +#define __NR_removexattrat 466
> > >  +__SYSCALL(__NR_removexattrat, sys_removexattrat)
> > >  +
> > > ++#define __NR_uretprobe 467
> > > + __SYSCALL(__NR_uretprobe, sys_uretprobe)  
> > 
> > hi,
> > we need one more change in tests (below), otherwise lgtm
> > I can send formal patch for you if needed, plz let me know
> > 
> > thanks,
> > jirka
> > 
> > 
> > ---
> > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > index c8517c8f5313..bd8c75b620c2 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > @@ -216,7 +216,7 @@ static void test_uretprobe_regs_change(void)
> >  }
> >  
> >  #ifndef __NR_uretprobe
> > -#define __NR_uretprobe 463
> > +#define __NR_uretprobe 467
> >  #endif
> >  
> >  __naked unsigned long uretprobe_syscall_call_1(void)
> 
> Or you could change __NR_uretprobe in the patch set to 467, then this
> will become just a conflict and not a renumbering.

OK, Jiri, can you send it to me. I will update probes/for-next.

Thank you,


> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

