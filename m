Return-Path: <linux-next+bounces-3726-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02779972C80
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 10:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 351D21C243A9
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 08:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D756816F27E;
	Tue, 10 Sep 2024 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DybY21wc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE344339AC;
	Tue, 10 Sep 2024 08:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725958244; cv=none; b=FeaCEpq1DGwY/ba1gbDRsZJLzIuhLRwnGMQH/QsKXsKjSuooyFnXqi1GCP8mk+tuJ242ky7DGP3nmhxRP63X3tpCaX0rRMBvYw+5naXZLvU8AAEX+nENSEM0V/znlH5NSo2cIBlWX+6RgUQfXMfYQN89M+ujq5yv7SzFYaKUXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725958244; c=relaxed/simple;
	bh=PoOA4aLcmMYYdk6KAOA4VWkUJRMSrYk0W7LLh9nwMwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZ67r4WUTedxdMZVd6SvTs/ryioRK7D/qh48bMlmh+K4dKg3xXb4naBXlpdIpj+aT457fQYWC1hNbD29Qik5YZ73xfhU83/buFtYgj3OBYPWQFCyooNAuTohXGfmapHQ+ZauXaf1/XUb6nHSwsbDjwGMT4EDEFSBh/+RwXi9sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DybY21wc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB09C4CEC3;
	Tue, 10 Sep 2024 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725958244;
	bh=PoOA4aLcmMYYdk6KAOA4VWkUJRMSrYk0W7LLh9nwMwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DybY21wcbfKZWCZUlbLkJYW5NuLelHC4gbGP/wUuHqcRZreQcAaCp+mZrdf7fcRr2
	 TK6PoFcPiT+JaG5xsC5xO/by7XLBf2i58v+5HEl1gg5tV5a0YtyYYNHWVoZcHvuQlT
	 QjkOFPEtHIEDXA7628HPKwnwT/UAEZgp4kAiAOD08pAhyWh5HPz+5s/yz08Oht455+
	 S6x6qK6Qq32WJD1ep/z2yso+4akw3DR3OBf9KsKoh8bXxehe155ujczDtw7pe6HvAy
	 uRLsTh6/krXWQW2hFeNuULvymG+2LVzoNL66W3izktAjHS5E4npl3DngybMgA4A9GY
	 Vg7SUdfchj1yw==
Date: Tue, 10 Sep 2024 10:50:39 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
References: <20240903092745.370fc0c6@canb.auug.org.au>
 <20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
 <20240905105809.6585eec2@canb.auug.org.au>
 <20240910102332.4f171bde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910102332.4f171bde@canb.auug.org.au>

On Tue, Sep 10, 2024 at 10:23:32AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 5 Sep 2024 10:58:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Tue, 3 Sep 2024 12:41:08 +1000 Aleksa Sarai <cyphar@cyphar.com> wrote:
> > >
> > > On 2024-09-03, Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > > Hi all,
> > > > 
> > > > After merging the vfs-brauner tree, today's linux-next build (native perf)
> > > > failed like this:
> > > > 
> > > > In file included from trace/beauty/fs_at_flags.c:21:
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: error: initialized field overwritten [-Werror=override-init]
> > > >    10 |         [ilog2(0x0001) + 1] = "RENAME_NOREPLACE",
> > > >       |                               ^~~~~~~~~~~~~~~~~~
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:10:31: note: (near initialization for 'fs_at_flags[1]')
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: error: initialized field overwritten [-Werror=override-init]
> > > >    14 |         [ilog2(0x200) + 1] = "HANDLE_FID",
> > > >       |                              ^~~~~~~~~~~~
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:14:30: note: (near initialization for 'fs_at_flags[10]')
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: error: initialized field overwritten [-Werror=override-init]
> > > >    15 |         [ilog2(0x001) + 1] = "HANDLE_MNT_ID_UNIQUE",
> > > >       |                              ^~~~~~~~~~~~~~~~~~~~~~
> > > > perf/trace/beauty/generated/fs_at_flags_array.c:15:30: note: (near initialization for 'fs_at_flags[1]')
> > > > 
> > > > Caused by commit
> > > > 
> > > >   34cf40849654 ("uapi: explain how per-syscall AT_* flags should be allocated")
> > > > 
> > > > I have used the vfs-brauner tree from next-20240902 for today.    
> > > 
> > > Ah okay, the overlapping flag definitions in the copied over fcntl.h are
> > > causing issues. We could just drop that part of the patch, or (since the
> > > new flags aren't handled by perf/trace/beauty) we could just do
> > > something simple like:
> > > 
> > > diff --git a/tools/perf/trace/beauty/fs_at_flags.sh b/tools/perf/trace/beauty/fs_at_flags.sh
> > > index 456f59addf74..930384029599 100755
> > > --- a/tools/perf/trace/beauty/fs_at_flags.sh
> > > +++ b/tools/perf/trace/beauty/fs_at_flags.sh
> > > @@ -13,9 +13,13 @@ printf "static const char *fs_at_flags[] = {\n"
> > >  regex='^[[:space:]]*#[[:space:]]*define[[:space:]]+AT_([^_]+[[:alnum:]_]+)[[:space:]]+(0x[[:xdigit:]]+)[[:space:]]*.*'
> > >  # AT_EACCESS is only meaningful to faccessat, so we will special case it there...
> > >  # AT_STATX_SYNC_TYPE is not a bit, its a mask of AT_STATX_SYNC_AS_STAT, AT_STATX_FORCE_SYNC and AT_STATX_DONT_SYNC
> > > +# AT_RENAME_* flags are just aliases of RENAME_* flags and we don't need to include them.
> > > +# AT_HANDLE_* flags are only meaningful for name_to_handle_at, which we don't support.
> > >  grep -E $regex ${linux_fcntl} | \
> > >         grep -v AT_EACCESS | \
> > >         grep -v AT_STATX_SYNC_TYPE | \
> > > +       grep -Ev "AT_RENAME_(NOREPLACE|EXCHANGE|WHITEOUT)" | \
> > > +       grep -Ev "AT_HANDLE_(FID|MNT_ID_UNIQUE)" | \
> > >         sed -r "s/$regex/\2 \1/g"       | \
> > >         xargs printf "\t[ilog2(%s) + 1] = \"%s\",\n"
> > >  printf "};\n"  
> > 
> > I have applied that by hand for today.  Please submit it and get it
> > applied.
> 
> I am still applying this build fix patch.

That's weird as I removed everything that touches tools/ from that
commit as the tools/ repository is updated after uapi changes
separately. That's what I've been told multiple times. I can add this
change but it feels odd.

