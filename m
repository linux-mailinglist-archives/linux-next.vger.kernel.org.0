Return-Path: <linux-next+bounces-7243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFDAE74DD
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 04:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E2E0189D14D
	for <lists+linux-next@lfdr.de>; Wed, 25 Jun 2025 02:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1123F1B4F08;
	Wed, 25 Jun 2025 02:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="CnOd6SZj"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210ED2AC17;
	Wed, 25 Jun 2025 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750819044; cv=none; b=jMG0eb0aDHEM5zGMxvvA1hs7D7FcYqw6zC3gEcyBp/wyG+zXqghHOA3z45tfkBAOV8721NDT0d0JYU4VtqfuiaBNo0AEZQudSjkB03cklK6KaDuXxeN++LVbVBLdF+277dVicpvpswaHUlTLxH2JY1yrPVNO9mvZHVpnn7q+RA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750819044; c=relaxed/simple;
	bh=K67LheYzvfJeD4dF/ot/Pvq7d3TFcePL9VCg7/uSnTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoIHoyT+5yo32bLJarR8A9ZLg8tE7nyi8gK2rU1LtfyMXNakoPHdHQyFv/BStQJs2rYbkclxHfTsL31mNIUXRH3iJEy3eydXGGV6maKHf9iNqy+ercAviw3hjZmLnzUITggCZm+4BWZAMW0bfU8rZ3htb+b9dr+2PPLVsEB4Lo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=CnOd6SZj; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rqdiXPMp2cCZSzMYKz+fTDt95MkpX14yzmKxaTtfagc=; b=CnOd6SZjlKDH10EClk+YDu+/UE
	uFxhv4nYEcO4e4VEhuXheYASfadHQIODVXD7w0u/sBrSv/aRpM//xyG+mFqRlCWu17qZwUA7cSfEW
	+A6Yw0vGDi4QS27SQWRkftk3085L0htvf4LRsLsMSIh94hnC9q0BTMLLBddxY5YHCToS7181KrWPF
	/DpUanmVAQ+2v/4AJc2LTvmg83GeSBd9Tq2xBYRMKQT/Jw3Qy1OOO+UAhl3vJjh2zeQkffrouWMjf
	OOQp6N8i01vG+w553OUOn1ZnVhn6EqZ6aug7BwcKhBeEHcsItME6jm2tiDt9KPx9kVnx619yW2QIM
	O8+a4oPg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUG0l-00000007lhZ-1a0j;
	Wed, 25 Jun 2025 02:37:19 +0000
Date: Wed, 25 Jun 2025 03:37:19 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Moore <paul@paul-moore.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the selinux tree
Message-ID: <20250625023719.GR1880847@ZenIV>
References: <20250625123559.1c5f4fdd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625123559.1c5f4fdd@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Wed, Jun 25, 2025 at 12:35:59PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the vfs tree as a different commit
> (but the same patch):
> 
>   ee79ba39b3d6 ("selinux: don't bother with selinuxfs_info_free() on failures")
> 
> This is commit
> 
>   7e7cf464ce53 ("selinuxfs_fill_super(): don't bother with selinuxfs_info_free() on failures")
> 
> in the vfs tree.

Already gone from the vfs tree.

