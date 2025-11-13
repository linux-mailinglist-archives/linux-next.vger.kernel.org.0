Return-Path: <linux-next+bounces-8951-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E729AC563FA
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 09:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB4E63B62A5
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 08:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5F4325488;
	Thu, 13 Nov 2025 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzoyXe3i"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C9B2857FC;
	Thu, 13 Nov 2025 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021769; cv=none; b=aRe6HeXHRiwXFQLheJAjqWhzZP+onk/z6tdodUwzLii6jY8ycD+MCypC7xnxrh91bCE2hbaPpnHsFKZWLv11VSbq4ohCJuA/oH7POOZkhA5ka9XM2GzjLtJNAPU5SIYqjUZo8R8X3FAMlK/aa6jtDHKk603k0MR6p6qUyKV77ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021769; c=relaxed/simple;
	bh=xHII4kaV5Ac0Nsi6t6sb1osgqOjFd+XeNQg+bEWMCdI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rdxYZapZUX8kvrchCLepP1AdW4M+6L0EMIRMFtN5Huc1DCXeg7q5cUYaPqbY8V9+TNl8raJLC8W4AZzpd3dfXc/EFm64V5JfkFJMDnql6C1jfQNSCMg8V4C1J87KDjEaEuOLDXV8ZGtjgdb6sttLqjZGW19zjKcQj16M4s8yrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzoyXe3i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A66C113D0;
	Thu, 13 Nov 2025 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763021769;
	bh=xHII4kaV5Ac0Nsi6t6sb1osgqOjFd+XeNQg+bEWMCdI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fzoyXe3ideJkqXzUmB3mi3TPLsYLArz+SLJnjsgDNqdcRbLwKHR0AiemKwsIRazDk
	 XjK3NdCRijaQo1e99GUl1HnNDG/WJzMF0PHjumnI0g3loUyrNMV+by0ZXm+RehxSLe
	 ywb3TTwkB8LqrDJ5aGJKxsfYs1XqEl2OSjzSfQKeFruxRzqjcyYWWejAKYKriZQclH
	 O2Fy+FrswG0WKHdGl7H4+8A+uoYIlUv9OfVM/ycShEol7+3tBoy2PeBFvRXHAxebfC
	 rTRoFWumwoSCuDzxP+t44dMpIQof1RUgKW7LtDRBiqKE4SjECfDo6hNmYI8PWeEg7+
	 4KFL+jov8/xlg==
Date: Thu, 13 Nov 2025 09:16:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jason Wang <jasowang@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-ID: <20251113091604.0a02f3bc@foz.lan>
In-Reply-To: <20251113125537.0d08e5ce@canb.auug.org.au>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Nov 2025 12:55:37 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> Today's linux-next build (htmldocs) produced these warnings:
> 
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
> 
> Introduced by commit
> 
>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
> 
> but is probably a bug in our scripts as those lines above have "Returns:"
> in them, not "Return:".

It is not a mistake. What happens is that, when kernel-doc detects
something like:

	/**
...
	 * return: something
...
	 *    returns: else
...
	 */

we have a duplicated section. The regular expression that pick sections
is:

	known_section_names = 'description|context|returns?|notes?|examples?'
	known_sections = KernRe(known_section_names, flags = re.I)
	doc_sect = doc_com + \
	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
	           flags=re.I, cache=False)

So, basically, it seeks, inside a kernel-doc comment, in case-insensitive
mode, for:

	"\sreturns?:"

In this specific case, virtio_map_ops is using this pattern multiple
times:

	/**
	 * struct virtio_map_ops - operations for mapping buffer for a virtio device
	 * Note: For transport that has its own mapping logic it must
	 * implements all of the operations
	 * @map_page: map a buffer to the device
	 *      map: metadata for performing mapping
	 *      page: the page that will be mapped by the device
	 *      offset: the offset in the page for a buffer
	 *      size: the buffer size
	 *      dir: mapping direction
	 *      attrs: mapping attributes
	 *      Returns: the mapped address
(first occurrence)
	...
	 * @alloc: alloc a coherent buffer mapping
	 *      map: metadata for performing mapping
	 *      size: the size of the buffer
	 *      map_handle: the mapping address to sync
	 *      gfp: allocation flag (GFP_XXX)
	 *      Returns: virtual address of the allocated buffer
(second occurrence, others follow)

As result, it strips "returns" from members output:

	  **Members**

	  ``map_page``
	    map a buffer to the device
	    map: metadata for performing mapping
	    page: the page that will be mapped by the device
	    offset: the offset in the page for a buffer
	    size: the buffer size
	    dir: mapping direction
	    attrs: mapping attributes

	  ``unmap_page``
	...


And creates a return section with each returns: appended:

	**Return**

	the mapped address

	virtual address of the allocated buffer

	whether the buffer needs synchronization

	the maximum buffer size that can be mapped

which is not what it is expected. Such behavior is there since the Perl
version (and the warning), but a patch for the old version disabled
such warning by default (probably because it was too verbose on that
time).

Btw, if you see struct virtio_config_ops, there instead of "Returns: foo"
they use "Returns foo", which produces the desired output:

	  **Members**
...
	  ``generation``
	    config generation counter (optional)
	    vdev: the virtio_device
	    Returns the config generation counter


So, probably the quickest fix would be do to:

	sed s,Returns:,Returns, -i include/linux/virtio_config.h

> These have turned up now since a bug was fixed that was repressing a
> lot of warnings.

The change actually disabled the warning-suppression logic that
was ported from the Perl script, where a lot of real problems at the
kernel-doc markup were ignored. E.g. those command line arguments:

  -Wreturn, --wreturn   Warns about the lack of a return markup on functions.
  -Wshort-desc, -Wshort-description, --wshort-desc
                        Warns if initial short description is missing
  -Wcontents-before-sections, --wcontents-before-sections
                        
                        Warns if there are contents before sections (deprecated).
                        
                        This option is kept just for backward-compatibility, but it does nothing,
                        neither here nor at the original Perl script.
  -Wall, --wall         Enable all types of warnings

are now ignored, so it outputs as if -Wall was passed to it.


Thanks,
Mauro

