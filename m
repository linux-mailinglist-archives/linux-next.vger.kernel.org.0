Return-Path: <linux-next+bounces-3730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5239739CD
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 16:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C1E6281B47
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 14:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF3118785A;
	Tue, 10 Sep 2024 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NE5PFkSg"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FAB2AEF1;
	Tue, 10 Sep 2024 14:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725978398; cv=none; b=QMFGrJVgPgrJeTjg1zDwxCCmYRiQSwMMfQkKmSMmpFpIj424FN7pZ0Wmka1ZwAZzGPst6qWbYcz1dbJY0IZ/7iQOE/GgTwW9IxdIQ/O620+mtMX7CPMXj5SyelfiNRRtysTTthHmJwcCF2maRSkRnj21KbDqtJXXnTJP5uPX8Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725978398; c=relaxed/simple;
	bh=bBMl6pToiyNWX9sPH1obZQpz1aQJ4vu4Oq4rq3zpz5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQDFIc9RXo5F2d2RnidyTEy9qBcTPDZsBRW10hMm1LdBiXiYiv0blqu915hG/rH3vllQIVxHKcY1/5SR+PMqOUhnEGIr1jLui0Nkeatvv5ZtXvWn9BV6hCYJ1SzsjOP6XL1BEtXQmYbPn143xWCYJdfiw8v6r6rho3/jfoJsG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NE5PFkSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676E7C4CEC3;
	Tue, 10 Sep 2024 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725978397;
	bh=bBMl6pToiyNWX9sPH1obZQpz1aQJ4vu4Oq4rq3zpz5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE5PFkSgtNA9rSEz9WqsvePNC7KS/8r8TBDWgNqmzUho4apQePRUaZZqNeRGsxL1W
	 HQCncAecmSIPF07JtvHh7PV0nFrWcVNDBsGq0KFoAK2+ONyQbbG611KrnnhexV/v0Z
	 Hsnit4oCLt/6M5DYTK2C6qQZGQEdsGAayRwXvCV3/+1rmWv5o8v9TXf7YUjCpeAN/O
	 CAd6EVYM8FqsIAG8RdgOKjw73qoifbLBfBWhwvmQKlMHxz1HaIyi+Ln1Q9bNc7O+HA
	 Mx4a0D8sY5730J3oMv1MHIoRgJ8bxH4llgW7gHnxEv//ju6chf3BcQspy7uSNcCdWa
	 3x4ROtAagBWJg==
Date: Tue, 10 Sep 2024 11:26:35 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <ZuBXG5FEPF0HnMcq@x1>
References: <20240903092745.370fc0c6@canb.auug.org.au>
 <20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
 <20240905105809.6585eec2@canb.auug.org.au>
 <20240910102332.4f171bde@canb.auug.org.au>
 <20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>

On Tue, Sep 10, 2024 at 10:50:39AM +0200, Christian Brauner wrote:
> On Tue, Sep 10, 2024 at 10:23:32AM GMT, Stephen Rothwell wrote:
> > On Thu, 5 Sep 2024 10:58:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > On Tue, 3 Sep 2024 12:41:08 +1000 Aleksa Sarai <cyphar@cyphar.com> wrote:
> > > > On 2024-09-03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > > > After merging the vfs-brauner tree, today's linux-next build (native perf)
> > > > > failed like this:

> > > > > In file included from trace/beauty/fs_at_flags.c:21:
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initialized field overwritten [-Werror=override-init]
> > > > >    10 |         [ilog2(0x0001) + 1] = "RENAME_NOREPLACE",
> > > > >       |                               ^~~~~~~~~~~~~~~~~~
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near initialization for 'fs_at_flags[1]')
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initialized field overwritten [-Werror=override-init]
> > > > >    14 |         [ilog2(0x200) + 1] = "HANDLE_FID",
> > > > >       |                              ^~~~~~~~~~~~
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near initialization for 'fs_at_flags[10]')
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initialized field overwritten [-Werror=override-init]
> > > > >    15 |         [ilog2(0x001) + 1] = "HANDLE_MNT_ID_UNIQUE",
> > > > >       |                              ^~~~~~~~~~~~~~~~~~~~~~
> > > > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near initialization for 'fs_at_flags[1]')

> > > > > Caused by commit

> > > > >   34cf40849654 ("uapi: explain how per-syscall AT_* flags should be allocated")

> > > > > I have used the vfs-brauner tree from next-20240902 for today.    

> > > > Ah okay, the overlapping flag definitions in the copied over fcntl.h are
> > > > causing issues. We could just drop that part of the patch, or (since the
> > > > new flags aren't handled by perf/trace/beauty) we could just do
> > > > something simple like:

> > > > diff --git a/tools/perf/trace/beauty/fs_at_flags.sh b/tools/perf/trace/beauty/fs_at_flags.sh
> > > > index 456f59addf74..930384029599 100755
> > > > --- a/tools/perf/trace/beauty/fs_at_flags.sh
> > > > +++ b/tools/perf/trace/beauty/fs_at_flags.sh
> > > > @@ -13,9 +13,13 @@ printf "static const char *fs_at_flags[] = {\n"
> > > >  regex='^[[:space:]]*#[[:space:]]*define[[:space:]]+AT_([^_]+[[:alnum:]_]+)[[:space:]]+(0x[[:xdigit:]]+)[[:space:]]*.*'
> > > >  # AT_EACCESS is only meaningful to faccessat, so we will special case it there...
> > > >  # AT_STATX_SYNC_TYPE is not a bit, its a mask of AT_STATX_SYNC_AS_STAT, AT_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC
> > > > +# AT_RENAME_* flags are just aliases of RENAME_* flags and we don't need to include them.
> > > > +# AT_HANDLE_* flags are only meaningful for name_to_handle_at, which we don't support.
> > > >  grep -E $regex ${linux_fcntl} | \
> > > >         grep -v AT_EACCESS | \
> > > >         grep -v AT_STATX_SYNC_TYPE | \
> > > > +       grep -Ev "AT_RENAME_(NOREPLACE|EXCHANGE|WHITEOUT)" | \
> > > > +       grep -Ev "AT_HANDLE_(FID|MNT_ID_UNIQUE)" | \
> > > >         sed -r "s/$regex/\2 \1/g"       | \
> > > >         xargs printf "\t[ilog2(%s) + 1] = \"%s\",\n"
> > > >  printf "};\n"  

> > > I have applied that by hand for today.  Please submit it and get it
> > > applied.

> > I am still applying this build fix patch.

> That's weird as I removed everything that touches tools/ from that
> commit as the tools/ repository is updated after uapi changes
> separately. That's what I've been told multiple times. I can add this
> change but it feels odd.

Right, that is the usual workflow, tools/ should not put any burden on
kernel development, we need to make these trace/beauty more resilient,
i.e. if it can't be built then just emit a warning and continue without
that specific table (generated by
tools/perf/trace/beauty/fs_at_flags.sh).

Which I'll try to do after LPC, making notes here, so, in this specific
case here, please add this change as having perf not building on next is
inconvenient and since the change to make it resilient will take time to
get implemented, doing it now via the kernel developer seems the
sensible thing to do, sorry for the incovenience :-\

- Arnaldo

