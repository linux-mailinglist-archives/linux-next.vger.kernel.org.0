Return-Path: <linux-next+bounces-8962-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C13C5A42E
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4A96354F3D
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 22:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8F13164C2;
	Thu, 13 Nov 2025 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhyR41Vr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4E2FF66C;
	Thu, 13 Nov 2025 22:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071300; cv=none; b=l+5c3ZEdSAy+VICwAr+IiMGnXL4tTYsgr46NvTY74O8Ul6HlrS0tvC2Fdv63QRaRsuEY0E9weo1sUQzs4Txf4nhtPs2LQehB3izBluCVWx+AYGAcIeU0qNbgfIweQT8ijjNlNZ7bKrfP0RHTpkM2iIZvXoHpr7cZOFhQSvMjWVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071300; c=relaxed/simple;
	bh=opE3PlteAjsyL0ySQLD8rTEc2QdGCFM1PsScKDsP04U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S59TBAi9jG+xvnfsmoFMxAjsrOin9rhT++jguZ8JrO/9k6/yYqmwdsCgN7LBhHdqkzoBnB9ysvj/MCu3/IGudTvt4JybaqrFNfTY2cz389K8XWp4mdOhyUweIa727a37w9Qek9MBlrJ6M2BZfPXWVrwD6xt6+46kVjv0lj7TBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhyR41Vr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704BEC19423;
	Thu, 13 Nov 2025 22:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763071300;
	bh=opE3PlteAjsyL0ySQLD8rTEc2QdGCFM1PsScKDsP04U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZhyR41VrZE/uUi6XMt/Cfz/jF4aWeq85VbdWKLugCS0yJLt7PFaB384mSrszsMD7L
	 3ExLvrnGCwF1hPofQGzAlILzgYxVtN5AZLueDCus/043Zo9exSxE8DDNdyHNE7WOnf
	 4RS5bRgG7ajH1cDYiysaz2mr/eMorDndOm1pqnOFiLTS2Jjn3YFbMrYxxwLraDcIk5
	 Zay9bzrprG6N8m8dGukFCG2WKKeu3szmH5gK25BJAPNyiHgzk3FFmAM+uCPJJ9Q20S
	 I3lEX5kAp5K136+V6PHCCxGN8FY49LoooPtUd4BrlvvjYBvxVsTypRXkPEQRx5sQas
	 jFjTPpftAfJqg==
Date: Thu, 13 Nov 2025 23:01:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Jason Wang <jasowang@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of Linus' tree
Message-ID: <20251113230135.43408a2d@foz.lan>
In-Reply-To: <87zf8psxz4.fsf@trenco.lwn.net>
References: <20251113125537.0d08e5ce@canb.auug.org.au>
	<20251113091604.0a02f3bc@foz.lan>
	<87zf8psxz4.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 13 Nov 2025 09:23:27 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Thu, 13 Nov 2025 12:55:37 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> >  
> >> Hi all,
> >> 
> >> Today's linux-next build (htmldocs) produced these warnings:
> >> 
> >> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:174 duplicate section name 'Return'
> >> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:184 duplicate section name 'Return'
> >> WARNING: /home/sfr/kernels/next/next/include/linux/virtio_config.h:190 duplicate section name 'Return'
> >> 
> >> Introduced by commit
> >> 
> >>   bee8c7c24b73 ("virtio: introduce map ops in virtio core")
> >> 
> >> but is probably a bug in our scripts as those lines above have "Returns:"
> >> in them, not "Return:".  
> >
> > It is not a mistake. What happens is that, when kernel-doc detects
> > something like:
> >
> > 	/**
> > ...
> > 	 * return: something
> > ...
> > 	 *    returns: else
> > ...
> > 	 */
> >
> > we have a duplicated section.  
> 
> This seems like something we should be able to fix...will try to find
> some time to look into it...

It is easy to fix, but it may break some things:


	$ git grep -l -E "\* \s+returns?:"
	drivers/edac/i5000_edac.c
	drivers/edac/i5400_edac.c
	drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
	drivers/gpu/drm/ingenic/ingenic-ipu.c
	drivers/misc/sgi-gru/grufault.c
	drivers/net/wireless/marvell/libertas/cmd.c
	drivers/net/wireless/marvell/libertas/firmware.c
	drivers/net/wireless/marvell/libertas/if_usb.c
	drivers/net/wireless/marvell/libertas/main.c
	drivers/pci/rom.c
	drivers/scsi/qla2xxx/qla_edif.c
	drivers/tty/moxa.c

And this is only for "return" section. There are also other places
where sections have more than one space. For instance, on 219
files, we have:

	$ git grep -l -E "\* \s+@\w+:"|wc -l
	219

like here:

	drivers/ata/sata_mv.c-/**
	drivers/ata/sata_mv.c- *      mv_print_info - Dump key info to kernel log for perusal.
	drivers/ata/sata_mv.c: *      @host: ATA host to print info about
	drivers/ata/sata_mv.c- *
	drivers/ata/sata_mv.c- *      FIXME: complete this.


So, before changing the regex:

	known_section_names = 'description|context|returns?|notes?|examples?'
	known_sections = KernRe(known_section_names, flags = re.I)
	doc_sect = doc_com + \
-	    KernRe(r'\s*(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
+	    KernRe(r'\s?(@[.\w]+|@\.\.\.|' + known_section_names + r')\s*:([^:].*)?$',
	           flags=re.I, cache=False)

to accept only a single space or no spaces, we need to change kernel-doc
markups on lots of files.

Ok, an alternative would be to identify the indentation, but this could
also be problematic.

Thanks,
Mauro

