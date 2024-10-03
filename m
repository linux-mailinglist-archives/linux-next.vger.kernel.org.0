Return-Path: <linux-next+bounces-4078-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2C98EC14
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 11:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8CD5B22B07
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 09:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC11B1422C7;
	Thu,  3 Oct 2024 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jr+FwCPc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9015F13D509;
	Thu,  3 Oct 2024 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727946674; cv=none; b=T+D6Xup6qxin4Dfg/RPaWa5JYH7RUCq+xNSnYR1bJTBd2bhVo80wkrMzpW4FnFxS33Wb3HeQ8xfrTKZE3H9G9LIDlLxZeBj0aeO03V60QvV4j0VOQEX4ATnJbXCZA1L8PcQPDmxggwqL5pQt1U6eUNSIUWl5MWOZjyFzcr2gb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727946674; c=relaxed/simple;
	bh=Yuj4ftHQERaqRceheio1O3fO2msiqxszbRLhAk0gE/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFB0wPaIrdfHM6z8DyLj5t4B4CrzWbSQLgw2TKBF2/i3WYb/ByVmAkc/qtrOSCPW2/8aIHAkdrKWFHCZd37PlkjYd3skbR+Im0pj23v1yOH3CxLiCnby4igEqalz/3kM7aXvJkUeqn2UE/FJX1w6zrNz8rYZT5y1JoK2lOsr4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jr+FwCPc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A5CC4CEC7;
	Thu,  3 Oct 2024 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727946674;
	bh=Yuj4ftHQERaqRceheio1O3fO2msiqxszbRLhAk0gE/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jr+FwCPcNpUa+TkLnPMrSaJ+HuqCJcw/i1UcOjUAh4P2puC06JdLi6yxL2dkRDE49
	 /GpNO1p+KF49dDo7KusuCUChmPbDpucJ8qTvN98e2CepnS3+U9N+1aP9Qu5/1DwSrW
	 v2DBvWzaJ9fT0dbkxxR3FEaRpFp2vUMP8WiwxoBhsbyoBCiR7uZ2v/IYT6BlvbHSgs
	 1uwgaKFjNcKIgN5Ir9pic7dHgEo9TJ7C7iLV3vexcqkejjVc8KbAjK56vsRoRT6ezx
	 HkJmMKmLwO8VR01Hcjrl5hDNOoJbL7cLvpbAZMk39/s/AjpudyW+cNYzVGPE+sL8Vn
	 2OEWNAd1eO3VA==
Date: Thu, 3 Oct 2024 11:11:10 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241003-wacklig-gewonnen-131cc564566d@brauner>
References: <20240906182906.54527fbf@canb.auug.org.au>
 <20240918152425.3105d1d1@canb.auug.org.au>
 <20241003084503.47f857c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241003084503.47f857c4@canb.auug.org.au>

On Thu, Oct 03, 2024 at 08:45:03AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 18 Sep 2024 15:24:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Fri, 6 Sep 2024 18:29:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> > > produced this warning:
> > > 
> > > Error: Cannot open file /home/sfr/next/next/fs/netfs/io.c
> > > 
> > > Introduced by commit
> > > 
> > >   550bc501ff91 ("netfs: Remove fs/netfs/io.c")
> > > 
> > > $ git grep -w fs/netfs/io.c
> > > Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io.c  
> > 
> > That commit is now in Linus' tree, but I am still getting this warning.
> 
> I am still seeing that warning.

Pushed new branches now. I didn't do that yesterday.

