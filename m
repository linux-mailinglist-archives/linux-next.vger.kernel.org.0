Return-Path: <linux-next+bounces-9690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DD459D37AE1
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 18:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94D9F30101E0
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 17:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750A9395DAC;
	Fri, 16 Jan 2026 17:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="P6xat0hp"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D295325739;
	Fri, 16 Jan 2026 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768586080; cv=none; b=gtMjCvEDG1L81fN2pLVsWP456uf2CoXfL6aoud8AiddJiXC0YsiVTzzOz8AA5EQepam46WdLMgirhZGD+OSAKREYmZcxklJ8zHiG9HZjIBoyAtLig+uKySMhYKqhuaG/ExNuT/HpuAOPQsUnGh/Maff+5ck45YH7j/qU/zSZu+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768586080; c=relaxed/simple;
	bh=rxQs3AzoZ/8YwJv1Z2/PWks1eKPuYgztfC+KFC17IaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TClJwFmEVB02LWerCduBAVVtcY7Inl1i0WU+AD198UeLwYjKyhCqiWNjEBSwnjL7Aq4vWZjQvb9H5H06h3IG4LxYZ0L1ZoeYQt+0xTnHQT2+T56Dp8EXKrSrXevhf/fdVoZwzgca0jmH3eHiT/Fa12oYHXw/WNMDnkNqyDSP2S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=P6xat0hp; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eDumNZMO0iMgg21fWHALN+B4CnX+ppnm7m1/grDM+JU=; b=P6xat0hptRCfKBnSsMOHf6JNEc
	4i7On6/c/rFAoPkg0+US1uBmmtfb0N/JQKJsso2cyytd/h7mTPoEonR25AzY09C1Z00m6cBT6lip9
	KCvEEkfgXrJuDotJmsO+pn9v0q/YL+WerdcBs63pCMpS904V/asYQZ9aYQmleV2fViDzJu4TTm6k6
	ozJtn8+fTdo82fJ9XnYTyuaXGWJBoQzyo1R7pQRPMFAxX4jRPM36qqHeBjFEpAxSFtdnsMWWae+6E
	Wylve3iFNQjAL2/myA5nRIEspW2cr90Yv18weUn5Yy7nHS350PF5ygNX//hvNFheTCi+aVuP+jyRB
	q4vIB9Ew==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vgo3K-00000004MlS-0BMh;
	Fri, 16 Jan 2026 17:56:06 +0000
Date: Fri, 16 Jan 2026 17:56:06 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20260116175606.GB3634291@ZenIV>
References: <20260115140132.6e0c05a0@canb.auug.org.au>
 <20260115031053.GY3634291@ZenIV>
 <20260115150458.4ad09c28@canb.auug.org.au>
 <20260115092834.05f3bf66@foz.lan>
 <20260115145754.GZ3634291@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115145754.GZ3634291@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Jan 15, 2026 at 02:57:54PM +0000, Al Viro wrote:
> On Thu, Jan 15, 2026 at 09:28:34AM +0100, Mauro Carvalho Chehab wrote:
> 
> > 1) Split it (and similar cases) into: 
> > 
> > 	"filename_link() and filename_renameat2()" 
> > 
> >    which would give sphinx automarkup the opportunity to create
> >    cross references
> > 
> >    (my preference)
> 
> The final state right now is (admittedly sloppy)
> 
>   do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}() are gone; filename_...()
>   counterparts replace those.  The difference is that the former used to consume
>   filename references; the latter do not.
> 
> Sure, the entire note can be split in 7 notes differing only in the names
> of removed function and its replacement, but it feels wrong ;-/

Updated variant pushed out; hopefully it's more palatable now...

