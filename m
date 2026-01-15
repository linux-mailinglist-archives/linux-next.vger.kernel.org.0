Return-Path: <linux-next+bounces-9666-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE5D223F4
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 04:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56988300ACEA
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 03:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C49623815B;
	Thu, 15 Jan 2026 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="inp4gGxQ"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D1286416;
	Thu, 15 Jan 2026 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768446569; cv=none; b=ThokpaKm9Yu1GPFln/1Br7rtqcmn2Re2oh+chCBUKW2xEwv3N+VtALu3hfaFiEGxytF1SkUqZgfNyKU1Nnj0e0GnZ4UUhL5lVwVXTdfHPt27bopTSZ5dE+jJ/+CoDeEimKT5HpWgpZLfpf9HR3FFL8JXKPokuFpj9dzILzY16xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768446569; c=relaxed/simple;
	bh=JE9cU2LzusJj/oZIUHZ9XxnYw2KtldTmnjKtiHkwhSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogwp8LsI/o9UlooHtLz8vrN+i9OV8rC9U5XfpheCSD57n9F4quAOIHT/eDuljBZMXWRsldb9FApauJDwt24fmnOuSIcib5Vkw3PVWrxVlQVM3xcERaZlNKY9LYW0gbsV2aCdhxg8hVrFRtFCWVKFhcjZGohhJxs37WXb2aoCpxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=inp4gGxQ; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ksym1g+gGBE8mXwI5HX3eHvz4/J90jASHV28iccgfBg=; b=inp4gGxQbD9Ck7Bgb4jqnd5gge
	yh/aw0HGi67ylOgWjYpP+4YTorj/cyckqcj5keAHut6H16MOGaS/1jbYwV26EtU8o++sleCTdQlV5
	v5hDZf64WHpvAZpzsji3Bw/c6/T882PvnStDoXHDxGLNzTc/MFOGF6aFJ9Eu0wti/UIp49Ku/bDpu
	M/TBsivpYrDiYOWbW0xyB9Ft+6u5QyBuvIur/iQXtVnl2BIXfH3Vyn3wzzq8w3YjMcNfv70ZWrV/2
	TmkXFgLe+AfJfLc4ztpGtu8K8wGMpcVqxrGRoNKRlHz++6uDUaMbC3cPSAOvlZQ4ZpUZ6d1XyNeeP
	ua/GQ7Pg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vgDl7-00000000ld9-3UdM;
	Thu, 15 Jan 2026 03:10:53 +0000
Date: Thu, 15 Jan 2026 03:10:53 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20260115031053.GY3634291@ZenIV>
References: <20260115140132.6e0c05a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115140132.6e0c05a0@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jan 15, 2026 at 02:01:32PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/filesystems/porting.rst:1348: ERROR: Unknown target name: "filename". [docutils]
> 
> Introduced by commit
> 
>   7335480a8461 ("non-consuming variant of do_linkat()")

Egads...  That's from "filename_{link,renameat2}()" in there (there's also
"do_{link,renameat2}()" earlier in the same line, but that didn't produce
a warning.

Any suggestions re better way to spell it for .rst?

