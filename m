Return-Path: <linux-next+bounces-5501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01641A3BB2A
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 11:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE397166E34
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD6F1D5142;
	Wed, 19 Feb 2025 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgtNZMkb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000C1CCB40;
	Wed, 19 Feb 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959503; cv=none; b=dbKBrw7OnWnbMt0mHKoW9N21meY/YOe+rKghK8AABSZA1xr0PKq109Xjotin+R2+j2BSPaLda79Yzj+0q63qGUKJ2GwxRNquo1mSLBdgHJu2qad2Vu4dbVZui9jrWgxafG3kEDq0Hbq5P2YZ/yyuopEK47kCQ4fI6Bf6cSKp71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959503; c=relaxed/simple;
	bh=q3sSmMA+TzF2loONrEp0YWdCAMJpcHANiEkcbVEA7YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCwkhh4a1XxJBk8UGFQMahTsJWsAfzjZSM+pmiq6INMA49ABGm53kx4Jb59SRjlWC6t367RCKBmUrRI9FSPDz/apoD9JtGC0d9qGk6Qkmi+l89lPNQlWFvnNzdzQy45q8zYJSrfKMs5lh/Aqcze7LvuCKDogU3Xm3SM/8uDXLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgtNZMkb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F61FC4CED1;
	Wed, 19 Feb 2025 10:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739959502;
	bh=q3sSmMA+TzF2loONrEp0YWdCAMJpcHANiEkcbVEA7YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qgtNZMkb+04rvKGz6+bmbeeDb1CVPjDEUJPCJEyDXrm1RVe1utdqGOjIE7OLYwwwZ
	 9SKdVFGiB48B2lU/NTUyoxSg0EGeHiTriJR50e82wQB8W4RyYkeM1TFOGPt5AqyB8E
	 3Ec/is8Qykc5zer3EtIMjYjg8zMDw3bLsywVwxTKauTOVqkQsOFlXfvjRdJPjDJePJ
	 7J80/S6wCCxHCnEl+vy1xbJE4kT49mnj9r8lQKrAi0ibU6luaBElHIKFw55VmIG0W5
	 MNExlH1Eozwfdr41KKLWUG0WVCJHLsTZFZRNJeelSzvapXnp+ThE8BpFUK61in+l+b
	 4kUHWwxRYycrQ==
Date: Wed, 19 Feb 2025 11:04:58 +0100
From: Christian Brauner <brauner@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, NeilBrown <neilb@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250219-frappierend-rannten-2ae9c14117ea@brauner>
References: <20250219153444.0046e433@canb.auug.org.au>
 <Z7WaNWHRkqt2rFGA@archie.me>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z7WaNWHRkqt2rFGA@archie.me>

On Wed, Feb 19, 2025 at 03:45:41PM +0700, Bagas Sanjaya wrote:
> On Wed, Feb 19, 2025 at 03:34:44PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > Documentation/filesystems/porting.rst:1173: ERROR: Unexpected indentation. [docutils]
> > 
> > Introduced by commit
> > 
> >   20c2c1baa9ab ("VFS: add common error checks to lookup_one_qstr_excl()")
> > 
> 
> Separating the bullet list should suffice (plus s/recommend/recommended/
> for consistency with the rest of docs):
> 
> ---- >8 ----
> diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
> index 3b6622fbd66be9..cfac50a7258db6 100644
> --- a/Documentation/filesystems/porting.rst
> +++ b/Documentation/filesystems/porting.rst
> @@ -1166,10 +1166,11 @@ kern_path_locked() and user_path_locked() no longer return a negative
>  dentry so this doesn't need to be checked.  If the name cannot be found,
>  ERR_PTR(-ENOENT) is returned.
>  
> -** recommend**
> +** recommended**
>  
>  lookup_one_qstr_excl() is changed to return errors in more cases, so
> -these conditions don't require explicit checks.
> +these conditions don't require explicit checks:
> +
>   - if LOOKUP_CREATE is NOT given, then the dentry won't be negative,
>     ERR_PTR(-ENOENT) is returned instead
>   - if LOOKUP_EXCL IS given, then the dentry won't be positive,
> 
> Let me know if I should send the formal patch.

No, I'll fix it in-tree and fold it.
Thanks.

