Return-Path: <linux-next+bounces-5265-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B417AA16C30
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 13:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FB3188651B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 12:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2FC1DF993;
	Mon, 20 Jan 2025 12:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9jX/u0L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39E1DF73A;
	Mon, 20 Jan 2025 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737375311; cv=none; b=TMQNpC/Lvx6nxZc5S1HF8CjMGbJHRx1SEgHdjc0rurSF3hdLE/LxEJA8vtnaWifFRZw3Zs2pW/qxHBsHZZnqT2H65ZDYbN5E+z/96iQ5kP64aGk3dg/SkKGrno2UiHfL6HrlVyPCV/7zKpJkVNHu3UNxw+nCvOOyMimdCbBmPaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737375311; c=relaxed/simple;
	bh=4tCdrs3SoTTf3oKXyRqBYmtSH6OBdDpDIYeYiystD74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZbyLgjb1Ac4WxHD6XwuBtKH9lTYDOFma6Tr/K+OD/YkjdK3WUxQIVH8Ey9EygrhU6/+mX29v0DvWEIvIr7jpfYPinCjBVKuWySaXyL/Ex5uElzY2iu62gd/acYbSVqjI98i6ZzAkj5aVZ/w6bsyk0A1uXDZYu3lW0NC1GW0C+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9jX/u0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E11CC4CEE0;
	Mon, 20 Jan 2025 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737375311;
	bh=4tCdrs3SoTTf3oKXyRqBYmtSH6OBdDpDIYeYiystD74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9jX/u0LI6VJY0tuMKupCPrU5tTR6JE5EnvTe15wR6cnxg5c4qoFQKxtenVgARhqh
	 7TLlpzXtu9R47t4L7gDt9o+GioGm/0Hf7Zez6wJWvcTkVwXY7au5xxizjUGxofuOBc
	 56yGmgqxPV9XEbV6/1e8xnM+XZcP8JJ33WRwtCQQ2UVy6G64l4up7l7Go+qAtAVYTC
	 StjC6Lp0+kSLESp/CE9knK7VrRdcvCIie37iIhExmpq4L594BdEl1GCFAzWym1ktge
	 4mzma9YZKrNqnX/DcrWo2ImgO2x+7PsW+e9ndr/qEFjjJk7TqsjkjoVLypVpG/xAFJ
	 578FXmGLBcAgg==
Date: Mon, 20 Jan 2025 13:15:07 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250120-juror-halme-dc19277bc465@brauner>
References: <20241213152724.589b38d8@canb.auug.org.au>
 <20241219173235.6600d08a@canb.auug.org.au>
 <20250114164812.2bfb505a@canb.auug.org.au>
 <20250120192504.4a1965a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120192504.4a1965a0@canb.auug.org.au>

On Mon, Jan 20, 2025 at 07:25:04PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 14 Jan 2025 16:48:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 19 Dec 2024 17:32:35 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Fri, 13 Dec 2024 15:27:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
> > > >
> > > > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > > > allyesconfig) produced these warnings:
> > > > 
> > > > samples/vfs/test-list-all-mounts.c: In function 'main':
> > > > samples/vfs/test-list-all-mounts.c:175:58: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   175 |         printf("Listing %u mounts for mount namespace %llu\n",
> > > >       |                                                       ~~~^
> > > >       |                                                          |
> > > >       |                                                          long long unsigned int
> > > >       |                                                       %lu
> > > >   176 |                info.nr_mounts, info.mnt_ns_id);
> > > >       |                                ~~~~~~~~~~~~~~             
> > > >       |                                    |
> > > >       |                                    __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:186:83: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   186 |                         printf("Finished listing %u mounts for mount namespace %llu\n\n",
> > > >       |                                                                                ~~~^
> > > >       |                                                                                   |
> > > >       |                                                                                   long long unsigned int
> > > >       |                                                                                %lu
> > > >   187 |                                info.nr_mounts, info.mnt_ns_id);
> > > >       |                                                ~~~~~~~~~~~~~~                      
> > > >       |                                                    |
> > > >       |                                                    __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:199:74: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   199 |                         printf("Listing %u mounts for mount namespace %llu\n",
> > > >       |                                                                       ~~~^
> > > >       |                                                                          |
> > > >       |                                                                          long long unsigned int
> > > >       |                                                                       %lu
> > > >   200 |                                info.nr_mounts, info.mnt_ns_id);
> > > >       |                                                ~~~~~~~~~~~~~~             
> > > >       |                                                    |
> > > >       |                                                    __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:218:64: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   218 |                                 printf("Failed to statmount(%llu) in mount namespace(%llu)\n",
> > > >       |                                                             ~~~^
> > > >       |                                                                |
> > > >       |                                                                long long unsigned int
> > > >       |                                                             %lu
> > > >   219 |                                        last_mnt_id, info.mnt_ns_id);
> > > >       |                                        ~~~~~~~~~~~              
> > > >       |                                        |
> > > >       |                                        __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:218:89: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   218 |                                 printf("Failed to statmount(%llu) in mount namespace(%llu)\n",
> > > >       |                                                                                      ~~~^
> > > >       |                                                                                         |
> > > >       |                                                                                         long long unsigned int
> > > >       |                                                                                      %lu
> > > >   219 |                                        last_mnt_id, info.mnt_ns_id);
> > > >       |                                                     ~~~~~~~~~~~~~~                       
> > > >       |                                                         |
> > > >       |                                                         __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:223:47: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> > > >       |                                            ~~~^
> > > >       |                                               |
> > > >       |                                               long long unsigned int
> > > >       |                                            %lu
> > > >   224 |                                stmnt->mnt_id,
> > > >       |                                ~~~~~~~~~~~~~   
> > > >       |                                     |
> > > >       |                                     __u64 {aka long unsigned int}
> > > > samples/vfs/test-list-all-mounts.c:223:69: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> > > >   223 |                         printf("mnt_id:\t\t%llu\nmnt_parent_id:\t%llu\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n\n",
> > > >       |                                                                  ~~~^
> > > >       |                                                                     |
> > > >       |                                                                     long long unsigned int
> > > >       |                                                                  %lu
> > > >   224 |                                stmnt->mnt_id,
> > > >   225 |                                stmnt->mnt_parent_id,
> > > >       |                                ~~~~~~~~~~~~~~~~~~~~                  
> > > >       |                                     |
> > > >       |                                     __u64 {aka long unsigned int}
> > > > 
> > > > Introduced by commit
> > > > 
> > > >   7b1da09dc088 ("samples: add test-list-all-mounts")    
> > > 
> > > I am still seeing these warnings.  
> > 
> > Still there ...
> 
> Ping?

Thanks for the reminder.
This is now fixed.

