Return-Path: <linux-next+bounces-6843-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF93ABCE8C
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 07:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CBCB17396F
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 05:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6404425A324;
	Tue, 20 May 2025 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja5L5m00"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF422586DA;
	Tue, 20 May 2025 05:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718288; cv=none; b=uAENToKVYAkJ2dqlKhyW3MUNhGLM7AVcOIUGpPJu5Gy59N1Q4l9MuaIkJefppC/eftOSkt3d5QNVaKKdzoURf7/eTkpwR9zwhE+ZC9ibeWudF42x3hVKF5m+5vu7wvO9lNvz+kLXEujcLGu+G04qtYFwvlcuU0POJywxk5Qlops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718288; c=relaxed/simple;
	bh=OrqWqVbHMBaQcVZbyMHHjIxGK11IeojfsmseI5SvOdM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lusCQ+xhdZRNOtopGR6OWIx9lR2Qr5qenP73tTtyZVfT5JuxfKLHkeAKM5gTzVNigsHF6Cwni4UpXa3isiPa6YXQ/bnzx9oQ1jH7OG4U5IM63hAMf1sWqaoUVKFrEJgOr+NLgQbZcjXk/P+p3kaT1b+tcplNSfUxjKFJ1mqt5VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja5L5m00; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0132C4CEEA;
	Tue, 20 May 2025 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747718287;
	bh=OrqWqVbHMBaQcVZbyMHHjIxGK11IeojfsmseI5SvOdM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ja5L5m00WDnN8qX7Xgzk5vPXDYNPjZ6rupaon8K8oBNiQ6uBucqk9O2iC3MpyMmsr
	 XekO0sD8NfPmPelx3juwVqSoy7dtsqugUi18uXOSN1bJN66he39aozOoMfl6jC4Sl3
	 Z7wUuDKEBwCrYiPzRIeJM/BNMf1zQy4WiNbWphw66WvkT4OkDedxrvHpa2GNXVtPFE
	 eX76vyYGWxK/uRn3twKhnwthT+oicgeVTKK4NVV5z3Jq1N9Af6RAGVd6AkPwp530YG
	 1D7FV/Ngk2gY3eo7TbEcUNUVgUjpZ9IokPsFIMYLBAeH2cF7/H7ats6FzmEdDTqx4F
	 PkQM2MYnjptBg==
Date: Tue, 20 May 2025 07:18:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-doc@vger.kernel.org
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250520071802.5700d42f@foz.lan>
In-Reply-To: <0a6cbe7b-814b-407c-ac1c-96ab7b787d88@infradead.org>
References: <20250508184839.656af8f6@canb.auug.org.au>
	<3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
	<20250508222531.0e7fab9c@canb.auug.org.au>
	<20250508143911.5d7a77d4@foz.lan>
	<879b49f5-7350-48e8-a84e-2c580a5b0ca8@gmail.com>
	<0a6cbe7b-814b-407c-ac1c-96ab7b787d88@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 May 2025 12:33:03 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 5/14/25 7:33 PM, Akira Yokosawa wrote:
> > [+CC linux-doc]
> > 
> > Hi,
> > 
> > On Thu, 8 May 2025 14:39:11 +0200, Mauro Carvalho Chehab wrote:  
> >> Em Thu, 8 May 2025 22:25:31 +1000
> >> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:  
> > [...]
> >   
> >>>
> >>> So, I used "KERNELDOC=$(pwd)/scripts/kernel-doc.pl" and tried again.
> >>>
> >>> I got these (new) messages:
> >>>
> >>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> >>> Error: Cannot open file drivers/virt/coco/tsm-mr.c
> >>> WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export drivers/virt/coco/tsm-mr.c' failed with return code 2
> >>>
> >>> (and a few other innocuous ones)
> >>>
> >>> So your guess is good.
> >>>
> >>> It would be nice to have the Python kernel-doc fixed as well as the
> >>> devsec-tsm tree.  
> >>
> >> With regards to kernel-doc, failing to build if a file is missing
> >> is the right thing to do.  
> > 
> > Mauro, I don't agree here.
> > 
> > With the perl version of kernel-doc, a typo in a file path doesn't cause
> > a fatal error of docs build.
> > 
> > kernel-doc as python class libs ends up in a fatal error.
> > 
> > Here is a log of such a fatal error (on top of current docs-next with
> > intentional typo made in a pathname in one of .. kernel-doc::
> > 
> > -----------------------------------------------------------------
> > Sphinx parallel build error!
> > 
> > Versions
> > ========
> > 
> > * Platform:         linux; (Linux-6.8.0-59-generic-x86_64-with-glibc2.39)
> > * Python version:   3.12.3 (CPython)
> > * Sphinx version:   8.2.3
> > * Docutils version: 0.21.2
> > * Jinja2 version:   3.1.6
> > * Pygments version: 2.19.1
> > 
> > Last Messages
> > =============
> > 
> >     userspace-api/gpio/gpio-get-chipinfo-ioctl .. userspace-api/media/dvb/dmx-fclose
> > 
> > 
> >     reading sources... [ 90%]
> >     userspace-api/media/dvb/dmx-fopen .. userspace-api/media/mediactl/media-controller-model
> > 
> > 
> >     reading sources... [ 92%]
> >     userspace-api/media/mediactl/media-func-close .. userspace-api/media/v4l/diff-v4l
> > 
> > Loaded Extensions
> > =================
> > 
> > * sphinx.ext.mathjax (8.2.3)
> > * alabaster (1.0.0)
> > * sphinxcontrib.applehelp (2.0.0)
> > * sphinxcontrib.devhelp (2.0.0)
> > * sphinxcontrib.htmlhelp (2.1.0)
> > * sphinxcontrib.serializinghtml (2.0.0)
> > * sphinxcontrib.qthelp (2.0.0)
> > * kerneldoc (1.0)
> > * rstFlatTable (1.0)
> > * kernel_include (1.0)
> > * kfigure (1.0.0)
> > * sphinx.ext.ifconfig (8.2.3)
> > * automarkup (unknown version)
> > * maintainers_include (1.0)
> > * sphinx.ext.autosectionlabel (8.2.3)
> > * kernel_abi (1.0)
> > * kernel_feat (1.0)
> > * translations (unknown version)
> > * sphinx.ext.imgmath (8.2.3)
> > 
> > Traceback
> > =========
> > 
> >       File "/<...>/sphinx-8.2.3/lib/python3.12/site-packages/sphinx/util/parallel.py", line 137, in _join_one
> >         raise SphinxParallelError(*result)
> >     sphinx.errors.SphinxParallelError: KeyError: '/<...>/lib/bitmap-bad.c'
> > 
> > 
> > The full traceback has been saved in:
> > /tmp/sphinx-err-8jzxndsr.log
> > 
> > To report this error to the developers, please open an issue at <https://github.com/sphinx-doc/sphinx/issues/>. Thanks!
> > Please also report this if it was a user error, so that a better error message can be provided next time.
> > make[3]: *** [/<...>/Documentation/Makefile:123: htmldocs] Error 2
> > make[2]: *** [/<...>/Makefile:1806: htmldocs] Error 2
> > make[1]: *** [/<...>/Makefile:248: __sub-make] Error 2
> > make[1]: Leaving directory '/<...>/my-output'
> > make: *** [Makefile:248: __sub-make] Error 2
> > 
> > -----------------------------------------------------------------
> > 
> > This would surprise innocent devs who are kindly willing to test docs build.
> > 
> > I think you need to tame its behavior and make it emit a proper warning and
> > continue building docs in case of such predictable user errors.  
> 
> Totally agree.

I also agree. 

The main difference between calling kernel-doc via a shell script or
via a Python class is that now errors flow via Sphinx logger class,
so they are subject to Sphinx filtering rules.

I double-checked: the logs are produced, and you can see them with "V=1",
but Sphinx is hiding them, perhaps because of some options passed through
sphinx-build call, or because they require them to have certain types.

A quick workaround would be to not use Sphinx logger anymore (see
enclosed). It has a side effect, though: we lose control of setting
it via V= variable, which is not good.

I'd like to test some other approaches before, but I was at Embedded
Recipes last week, without enough time to work on a proper solution.

Jon,

If you think we need something in place quickly, feel free to merge
it. Otherwise, I'll seek for another approach along the week.

Regards,
Mauro

[PATCH] docs: kerneldoc.py: don't use Sphinx logger

Unfortunately, currently Sphinx logger is suppressing too much, not
allowing warnings to be displayed. Disable it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b713a2c4a615..687121300291 100644
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
 

