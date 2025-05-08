Return-Path: <linux-next+bounces-6613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AADAAFA2E
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 14:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2DBF3ABBD0
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CC122652D;
	Thu,  8 May 2025 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENSPlNFG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094B14A4C7;
	Thu,  8 May 2025 12:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707957; cv=none; b=QKApn6teBjzSUg/IYPtY0kO4LfYuM2FwSswvtNaJCDT7JoCDlhgKIMlLzXc+r9QhpY9KBDkubNmbUgtxHrFVDNC/6PTlsymcdN+vsFLTjqM84oPl68VN6ZRgGoedh3MNkV1V2uywgsQOM+FJ9kLpztWyunfXIGaQaEWZkwxMYvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707957; c=relaxed/simple;
	bh=yKAu21jnIWb30Zvv6QPim5NX6VPtSD2kMpmuoH171UA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb2a2vhi8u2Bi3dASDPHEosTO9VSJVu+zmAQ3M4wEUYDvf7KfF7eQcjrdpQV8JrYJUpsgsD/HpjKx1JRRMCdwNFFCU7k8V07cxe/6H6u+BtMKUW8A7D0qLGIeFf6tbwuce7L2z7XA5O+W4kvzM1IeO6nXyAChuT2szmDcRHGAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENSPlNFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494A9C4CEE7;
	Thu,  8 May 2025 12:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746707955;
	bh=yKAu21jnIWb30Zvv6QPim5NX6VPtSD2kMpmuoH171UA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ENSPlNFGhlLNeYIx/HNHxW/3w6rYH+UglSqxqRYP7Adj/v642XJtz8BVfJpDGugoi
	 tweWAl30imBO/qIPGCbZFH7wfLptIWNlj5uwMBbOMqScdmsQVxdHhyhnwcxxTBzvGW
	 tZ4zrYby/5nViOnaruv2s8QAZI8quv8WSDJx1lEdV23k1W3o440wI7bHDZYHU4KN00
	 JuPNrZPTzgzuRAqcQggi61lcDgH+HSJ07uBnC0c3FdqC5ntPkHsBMCwfYYFqkxQtVt
	 ocYquFilcdvGvUy5UVcg1PpMSJ9VNVgtoSI66xHJcN3FRQ1IwNqgSI6AAEpYUrHdKd
	 85fR+UdCwRV3g==
Date: Thu, 8 May 2025 14:39:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Akira Yokosawa <akiyks@gmail.com>, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Dan Williams
 <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250508143911.5d7a77d4@foz.lan>
In-Reply-To: <20250508222531.0e7fab9c@canb.auug.org.au>
References: <20250508184839.656af8f6@canb.auug.org.au>
	<3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
	<20250508222531.0e7fab9c@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 8 May 2025 22:25:31 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Akira,
> 
> On Thu, 8 May 2025 19:54:08 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> >
> > Please try:
> > 
> >   make O="$HOME/next/htmldocs" KERNELDOC=scripts/kernel-doc.pl htmldocs
> > 
> > , assuming your $HOME/next/next is the top of kernel source.
> > 
> > I'm suspecting that the conflict resolution done in
> > c84724f2137f ("Merge branch 'for-6.16/tsm-mr' into tsm-next")
> > ended up in mismatching path names given to "kernel-doc::" somewhere.
> > 
> > Looks like recent conversion of the kernel-doc script into python
> > has changed the behavior in such error conditions.
> > With the perl version, you'll see a couple of:
> > 
> >     Error: Cannot open file <...>/linux/drivers/virt/coco/tsm-mr.c
> > 
> > , but the doc build should complete.  
> 
> OK, so, yes, the build completes.  I get the following message
> (multiple similar ones):
> 
> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export -export-file drivers/misc/mei/bus.c drivers/misc/mei/bus.c' processing failed with: [Errno 2] No such file or directory: 'scripts/kernel-doc.pl'
> 
> So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
> 
> I got these (new) messages:
> 
> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
> 
> (and a few other innocuous ones)
> 
> So your guess is good.
> 
> It would be nice to have the Python kernel-doc fixed as well as the
> devsec-tsm tree.

With regards to kernel-doc, failing to build if a file is missing
is the right thing to do. As kernel-doc is now fully an Sphinx extension,
it now signalizes to Sphinx that the build has failed. 

Yet, it should have produced some warnings. Maybe we need to specify a
different log level with Sphinx to make it happen. I'll double check it
and send a fix later on to kernel-doc.

Thanks,
Mauro

