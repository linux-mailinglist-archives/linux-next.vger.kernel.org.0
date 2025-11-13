Return-Path: <linux-next+bounces-8953-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D6C56DF6
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 11:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 274763504FF
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 10:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8295D3321D0;
	Thu, 13 Nov 2025 10:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY+ij6gj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3434728F50F;
	Thu, 13 Nov 2025 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763029938; cv=none; b=rTRuq7RAwI3Z54tSoz0x9tOkwXyNjAw2Zi32OxrWrAw3qNiJCF5ZmZ4Aw4ASDSqu8Y0TQbkELoZRQxIyn7YI/vugmeGbWj4cBnm7hFYY7Lz9xVSaNz/+ZTMMyvGLvMzHpfoMXw94CrdeaaE5oWTs/8DKLWrGc6a2WRMuTnvMb5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763029938; c=relaxed/simple;
	bh=rzQRzMV84eL/oNhjimgWmcz2G2gYLLXRgqsUf8Av7UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTh1AZjd7GL9GYhAcj+I9kvZK5jMo7p8VTXSy7lUNIAQ6h/ROXEVFr5CBVXG1szfwomhK3+e9SdExEBtc00ssPF96CLt7tBV/BtbB/ZcOQNSElZoeQdpfj36XKFt494WeHJ0U6p0bLRysCch3jnB0tY8H81jlu/ZR3TGXUERPeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY+ij6gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700A8C4CEF8;
	Thu, 13 Nov 2025 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763029937;
	bh=rzQRzMV84eL/oNhjimgWmcz2G2gYLLXRgqsUf8Av7UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY+ij6gjk2MOzq45DACcChDRmLhMu6yLYhiNM34vb/ji0Iwap6oV6LwWF4zusGPQC
	 OV6AJfINjsLkmidL7AnURhpk8RJFs8Z1nfU9p9aPI8RhYlejWwqKN7I+LOz9PDxM5e
	 2pOV7pbIc19yCY6rPIMS2DSK/0JOJvQKToDdwrJEbQiZNlWkHZEOdiHv1WAropbXqF
	 W08v0TU6Azgj49g1y0xE2SQBHFRYeK87+WIe1rge9yX+EhXTOX4SWsuO15E6+h8JmJ
	 AGNeH7bRA3fU3eVv8iYpmM9IMOIAEUjqyhrnlN7XxbERriM1liWNUAvMYJVpyKvXgI
	 SeZ+QpTpgP1JA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vJUch-0000000B42f-1x90;
	Thu, 13 Nov 2025 11:32:15 +0100
Date: Thu, 13 Nov 2025 11:32:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jason Wang <jasowang@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-ID: <dskdc44um6l6sw43uazfpzmsv4tkesog7sro22qkvzxyflvurt@pwhb3rs44ga7>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
 <20251113031422-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113031422-mutt-send-email-mst@kernel.org>
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

On Thu, Nov 13, 2025 at 03:49:27AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 13, 2025 at 12:55:37PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next build (htmldocs) produced these warnings:
> > 
> > WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
> > WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
> > WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
> > 
> > Introduced by commit
> > 
> >   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
> > 
> > but is probably a bug in our scripts as those lines above have "Returns:"
> > in them, not "Return:".
> > 
> > These have turned up now since a bug was fixed that was repressing a
> > lot of warnings.
> 
> Indeed. But the rest of header says Returns ... without : so I will just
> fix this one to do the same. I also fixed other issues in the comments
> in this header while I was at it. Will post shortly.

That's the best approach. We could instead change the new section detection
regex to accept just one space at most:

    diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
    index f7dbb0868367..bab0ec3abe31 100644
    --- a/scripts/lib/kdoc/kdoc_parser.py
    +++ b/scripts/lib/kdoc/kdoc_parser.py
    @@ -46,7 +46,7 @@ doc_decl = doc_com + KernRe(r'(\w+)', cache=False)
     known_section_names = 'description|context|returns?|notes?|examples?'
     known_sections = KernRe(known_section_names, flags = re.I)
     doc_sect = doc_com + \
    -    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
    +    KernRe(r'\s?(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
                flags=re.I, cache=False)
 
     doc_content = doc_com_body + KernRe(r'(.*)', cache=False)

(patch not tested)

But, if we do so, someone has to check if this won't cause regressions
elsewhere. I'm almost sure a change like that will break something...

Thanks,
Mauro

