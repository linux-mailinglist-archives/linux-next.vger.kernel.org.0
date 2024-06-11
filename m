Return-Path: <linux-next+bounces-2516-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7F90468E
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 23:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC698287F6F
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 21:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD6A15532C;
	Tue, 11 Jun 2024 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A+fWh2No"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5919155326;
	Tue, 11 Jun 2024 21:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718143094; cv=none; b=k8p1b7879FhNmu1NzcQTnv1Sd1j+8Agkz9za9cD/bN3oxRa2bHt3+VNe27Np86oOC2GTjEmO3uyuupDbe3ktxod97YqgcrZEqbA9LPRs/jg4braXwERi1Z9QoMvcHcBCfTTzetlXHICv9utdrUre2RJbz84shhRuw0AhbbYpxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718143094; c=relaxed/simple;
	bh=i8A1mOycYyictUdBs+EwE+ZgRyUWuOpePSI78v8mLvg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jG4YihowqO9vVtgOBNqU/vc4+n/Z83QR1mTy9GLxPINeD+2LxoLpYwsFxrpJP5eGV274vpZtM4Ye9sBl/gkSXDlH996JU4M+7aSBeEDDurrdOXMwsBT4B5c0bljznBvXbjD0+ypyZ7/yQv8Y4gfbPplaok7Tx5JkukwPa7T+vrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A+fWh2No; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317E7C3277B;
	Tue, 11 Jun 2024 21:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718143093;
	bh=i8A1mOycYyictUdBs+EwE+ZgRyUWuOpePSI78v8mLvg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A+fWh2NoqZJJjVj4fF8rg8QvC7jIwkPH3GPIzAtW4ssRWajQi3GaVnamgGR1BYEVn
	 cVViqJai3utb7cHuak+09Z7G6YuaPUdNxt49CNOWyj2P43nhTbg9Xe6ZUYzEP1dMGf
	 zLhOBSS8MVtbIXknYv43KQKCFSipBD6FCUoC4JXE=
Date: Tue, 11 Jun 2024 14:58:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Message-Id: <20240611145812.6eb6e9936388c862c168d349@linux-foundation.org>
In-Reply-To: <b189d815-998b-4dfd-ba89-218ff51313f8@linux.alibaba.com>
References: <20240606132353.0db5479d@canb.auug.org.au>
	<b189d815-998b-4dfd-ba89-218ff51313f8@linux.alibaba.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Jun 2024 13:01:50 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> 
> 
> On 2024/6/6 11:23, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the mm tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/admin-guide/mm/transhuge.rst:342: ERROR: Unexpected indentation.
> > 
> > Introduced by commit
> > 
> >    716119bee914 ("mm: shmem: add multi-size THP sysfs interface for anonymous shmem")
> > 
> > from the mm-unstable branch of the mm tree.
> > 
> 
> Thanks for reporting.
> 
> Andrew, could you help to fold below changes into this serires, which 
> can fix the htmldocs building error? Thanks.
> 
> ...
>
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -338,6 +338,7 @@ and its value for each mTHP is essentially 
> consistent with the global setting.
>   An 'inherit' option is added to ensure compatibility with these global 
> settings.
>   Conversely, the options 'force' and 'deny' are dropped, which are 
> rather testing
>   artifacts from the old ages.
> +
>   always
>       Attempt to allocate <size> huge pages every time we need a new page;

That's rather whitespace mangled, but I fixed it.  I also added

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-fix
Date: Tue Jun 11 02:56:34 PM PDT 2024

reflow transhuge.rst addition to 80 cols

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Documentation/admin-guide/mm/transhuge.rst |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

--- a/Documentation/admin-guide/mm/transhuge.rst~mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-fix
+++ a/Documentation/admin-guide/mm/transhuge.rst
@@ -332,12 +332,13 @@ deny
 force
     Force the huge option on for all - very useful for testing;
 
-Shmem can also use "multi-size THP" (mTHP) by adding a new sysfs knob to control
-mTHP allocation: '/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/shmem_enabled',
-and its value for each mTHP is essentially consistent with the global setting.
-An 'inherit' option is added to ensure compatibility with these global settings.
-Conversely, the options 'force' and 'deny' are dropped, which are rather testing
-artifacts from the old ages.
+Shmem can also use "multi-size THP" (mTHP) by adding a new sysfs knob to
+control mTHP allocation:
+'/sys/kernel/mm/transparent_hugepage/hugepages-<size>kB/shmem_enabled',
+and its value for each mTHP is essentially consistent with the global
+setting.  An 'inherit' option is added to ensure compatibility with these
+global settings.  Conversely, the options 'force' and 'deny' are dropped,
+which are rather testing artifacts from the old ages.
 
 always
     Attempt to allocate <size> huge pages every time we need a new page;
_


