Return-Path: <linux-next+bounces-9676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFDBD251ED
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 15:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CF8B301E1A6
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8C93A1A36;
	Thu, 15 Jan 2026 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="OFzmBG6T"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87730E824;
	Thu, 15 Jan 2026 14:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488991; cv=none; b=t7gdOAoprVeJmHcsHKT6R2Pw7XSfKqUcklFWU3tLgOd+YHSGW/pF9NvS2XbT8QOWD6eXqVsEbYsp6pf2HX6Ekf0u+5JQxm4JwtTF8R+JbTWc7L/lLMMGVjy0E6yigcH/BztfIAn8ToGvWNdrKmx4MYkQFlI9oixgD1UBkEySPYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488991; c=relaxed/simple;
	bh=ZryEFmFkDBf2oaSBxz21vI2DAyEz9SITbuQSSjVIVd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnAcFxFD7oLuTIu5h3J2CZfygRh+1CHqfQ+FhOle7xFPJh4sMhvdyHYSTBsOR1FoS989pCMFxRx8g1CK7vcFpvbMsGAXxMigc0v5lu3oGDa36S2wcCrObuIVsGzV1MQ3fSbLxD3WZ3vKUsMssFNm60LaD+UwDj3TXK/Rc9L92Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=OFzmBG6T; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fT3ggyjkdqM30zNOB+/wjBlmBd0XFYiEz6BxLVhCKfs=; b=OFzmBG6T5/4Jl+lqGXFt8HDgTt
	SlwwFQM0AEgN8JwG8XsL1RyergCGctVTgsBpjJ8xdPCOPPUi/tKnQar9EA/sfaXE/gRSnsPnQxQa3
	3sYzCiVNd43UKKteB2zdX4O29rZ7BZp723YzYKfJPAqlKni3+0Ij7shCl6GWfWHUPDMkheIEO7H++
	8n7ufexzI6j6zbnel69NSEhBd6+cTnWzSnj3HHtAgcYAi7H6FSwJVVendV7CBp9YNyYRkPoA+ga64
	8hoB56Rs4Jh5OQmacBcD8LsvabZ/d+QSlcjD9RwQGxtvC2jnQ8PPalZzDaNLVSea57r58XgFpR+0A
	ltwW6eYQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vgOnK-00000002B1k-3eab;
	Thu, 15 Jan 2026 14:57:54 +0000
Date: Thu, 15 Jan 2026 14:57:54 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20260115145754.GZ3634291@ZenIV>
References: <20260115140132.6e0c05a0@canb.auug.org.au>
 <20260115031053.GY3634291@ZenIV>
 <20260115150458.4ad09c28@canb.auug.org.au>
 <20260115092834.05f3bf66@foz.lan>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092834.05f3bf66@foz.lan>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jan 15, 2026 at 09:28:34AM +0100, Mauro Carvalho Chehab wrote:

> 1) Split it (and similar cases) into: 
> 
> 	"filename_link() and filename_renameat2()" 
> 
>    which would give sphinx automarkup the opportunity to create
>    cross references
> 
>    (my preference)

The final state right now is (admittedly sloppy)

  do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}() are gone; filename_...()
  counterparts replace those.  The difference is that the former used to consume
  filename references; the latter do not.

Sure, the entire note can be split in 7 notes differing only in the names
of removed function and its replacement, but it feels wrong ;-/

