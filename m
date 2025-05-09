Return-Path: <linux-next+bounces-6632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEAAB0AD9
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C844E48AB
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 06:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C943626D4E6;
	Fri,  9 May 2025 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SbjZWSwG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23526C3B3;
	Fri,  9 May 2025 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773229; cv=none; b=mDTYEgkstveU9h8rJQ0rlFFQrN4V1u0llcmX7dFyhTsDgZInHPzKJG+CR49lMMwGJeMzHk7u4H8rDApHPkGES1M0I6L7l0ttt0Oc72bBd6Bu/w/bFVUgj2nnDoKOKZBFdrlEO37Fl4mEij/YNsZZduOfhLj7jdvhv3FWMzJzk2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773229; c=relaxed/simple;
	bh=VAVgoQl2U2IebMSkTiOFsK4gBAhO21IJ7egf6460huI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PgnVBYH+sf5E6yOVTKIjL7N0xM6lQ4bdKHo4eJ+tgZCV5bY54BobjAppk6ur9uLGVW+9+g6aKMhjN9x8zorifDeKs2xOXx8k4PavuT7/r5E66ribHYqe6tsLSZkljXNWQnfVWVP8obNWARVgftLk0dLSapiUtglJbeS0HG7Z8IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SbjZWSwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C77C4CEE4;
	Fri,  9 May 2025 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746773229;
	bh=VAVgoQl2U2IebMSkTiOFsK4gBAhO21IJ7egf6460huI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SbjZWSwGeWkRE3ThywJ3VriYbBBs8il4Sqw+H2DFmykKmr5EvZAktTnkO0LvQVW3O
	 suKV6S73vho12d+a1P1He1qSMr+92lZAb8QyCdVZMBGdbgvgXVL37yNpGV/Jwd4508
	 TPbTphynf8COc4sHnr8PXvE8Q8DuXtnLCSoc3Nzt0yorOoNqnkFrOPUtA67lDWMpMs
	 eAz4xUOcmmLl8z+CwQg+EPzJfo/d3FRxNWbblloMclRxXbpLRwPMW68vkS0pxwWcxT
	 ivHCPp/WzkC1cLkQlMphN8b2kwM/m356gxhFQ5tTyMRG2a9P5PZtXWEluKhrcVsryD
	 zRSilfAMAIG8Q==
Date: Fri, 9 May 2025 08:47:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Akira Yokosawa
 <akiyks@gmail.com>, <corbet@lwn.net>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250509084704.08d1a65b@foz.lan>
In-Reply-To: <681d504bd126c_1229d62941f@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250508184839.656af8f6@canb.auug.org.au>
	<3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
	<20250508222531.0e7fab9c@canb.auug.org.au>
	<681d504bd126c_1229d62941f@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 8 May 2025 17:46:03 -0700
Dan Williams <dan.j.williams@intel.com> escreveu:

> Stephen Rothwell wrote:
> > Hi Akira,
> > 
> > On Thu, 8 May 2025 19:54:08 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:  
> > >
> > > Please try:
> > > 
> > >   make O="$HOME/next/htmldocs" KERNELDOC=scripts/kernel-doc.pl htmldocs
> > > 
> > > , assuming your $HOME/next/next is the top of kernel source.
> > > 
> > > I'm suspecting that the conflict resolution done in
> > > c84724f2137f ("Merge branch 'for-6.16/tsm-mr' into tsm-next")
> > > ended up in mismatching path names given to "kernel-doc::" somewhere.
> > > 
> > > Looks like recent conversion of the kernel-doc script into python
> > > has changed the behavior in such error conditions.
> > > With the perl version, you'll see a couple of:
> > > 
> > >     Error: Cannot open file <...>/linux/drivers/virt/coco/tsm-mr.c
> > > 
> > > , but the doc build should complete.  
> > 
> > OK, so, yes, the build completes.  I get the following message
> > (multiple similar ones):
> > 
> > WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export -export-file drivers/misc/mei/bus.c drivers/misc/mei/bus.c' processing failed with: [Errno 2] No such file or directory: 'scripts/kernel-doc.pl'
> > 
> > So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
> > 
> > I got these (new) messages:
> > 
> > Error: Cannot open file drivers/virt/coco/tsm-mr.c
> > Error: Cannot open file drivers/virt/coco/tsm-mr.c
> > WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
> > 
> > (and a few other innocuous ones)

The same messages can be seen if we don't use Sphinx logger facility,
using the default Python logging class instead:

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b713a2c4a615..914ebfe2080b 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -311,7 +311,7 @@ def setup_kfiles(app):
     if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
         print("Using Python kernel-doc")
         out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
+        kfiles = KernelFiles(out_style=out_style)
     else:
         print(f"Using {kerneldoc_bin}")

Somehow, Sphinx is sending such messages to /dev/null if we don't use V=1.

I'll see if I can discover why Sphinx is doing that.

Thanks,
Mauro

