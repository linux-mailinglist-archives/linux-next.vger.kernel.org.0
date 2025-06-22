Return-Path: <linux-next+bounces-7198-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58679AE32FE
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 01:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EBAE188AD83
	for <lists+linux-next@lfdr.de>; Sun, 22 Jun 2025 23:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD5019DF60;
	Sun, 22 Jun 2025 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="TOq4+f1G"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CEB130E58;
	Sun, 22 Jun 2025 23:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750634958; cv=none; b=KjCAztOlKVl2yitqEKfskEWRp2JZ2kZbIsAWX7C+5qgBcd8/4Nt8ROzUvRG+yabq8uYw9qCQhb4giPdhJTSQfMoZ0WWGLIyGW5WKnePUxc3ZUTK6JqbujhnNx3YxEJowXiE821ALC3aYNkOhMPgxxw4zmGEiWldlVm+m4IXPxCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750634958; c=relaxed/simple;
	bh=utef2ijBgl6MqBj1W8ynsNdT601dtQuJ6jqVXcsMwrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VaR/AfaTJ2V1v5a2q1zAS5v6MS8xmT/tqaXvlLK+7WE+a35krC1Iqhiw61IP3h/8xjhSTq7j1GzYOZnnG94nLvJDXcwGNOjNaoRzQZDjut56IKQjWvG95zxnpnx/tCY9YxaQ+9wb7WkJ5XPNWiyS9R1zWW6Lo9NLQz4mH+wyJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=TOq4+f1G; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BLTDFCMmA7PLyZaXCasScMe0cVZwvQg8HDFH/FOFRrE=; b=TOq4+f1GoiaGpUp1U99sLa/zOR
	TcKyezF5U+jjoYY1NmInatBn+wi0L4xIDSWTBB9ewWggxT5q0ZjtDcVN9POjFtYg4bE8UHY/wKL2X
	mKftjuDin4tNkar7xo7p0oGGxzjLD077AM/FoeKqSyWpvSHw+DLAHA9x6rM1vmTzh+dSNVfhSOOU0
	8C1ilOfgiaclBzc6SgJnQlVFVmQgIScE1nTb+ggMl/QzMbLykvSQIHl6Yi6JD5WroTNcm0mJUwgX9
	Qruep7z+8rulQLIlAH3kvQYDjXoNNZ1lf10mCbZD5zt6CtYqZh8TCWPMNTUFWl4852Oxtduo0wquL
	52B2X7MA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTU7d-00000001Iud-1qx4;
	Sun, 22 Jun 2025 23:29:13 +0000
Date: Mon, 23 Jun 2025 00:29:13 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-fixes tree
Message-ID: <20250622232913.GZ1880847@ZenIV>
References: <20250623091250.2a3a399b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623091250.2a3a399b@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jun 23, 2025 at 09:12:50AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   Documentation/filesystems/porting.rst
> 
> between commit:
> 
>   2e7072350656 ("replace collect_mounts()/drop_collected_mounts() with safer variant")
> 
> from the vfs-fixes tree and commits:
> 
>   05fb0e666495 ("new helper: set_default_d_op()")
>   691fb82ca6cc ("make d_set_d_op() static")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry - should've folded that into #for-next.

