Return-Path: <linux-next+bounces-4929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB539EA514
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 03:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42BDE283524
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 02:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD814166F1B;
	Tue, 10 Dec 2024 02:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iQ7C8HtA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EBD155308;
	Tue, 10 Dec 2024 02:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733797558; cv=none; b=Wn0eUEo9lsu7muA++dOTTMsRt/Y5mpYc0QXKkfSl0PS8bYzhVU7iN7Nf9pXDU+amfWNi589eOmxfXzvByvnj3wP2nIlKT4r+BkVtOctdsv4tgnpJe/vo1sLIwAC++LfWfhwrzb6bairufqaUVFL11OjS5RNgHZfG2r+xK5Nsw5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733797558; c=relaxed/simple;
	bh=vrmMGZ0rLWOX1HqgYVdWR06cM7mrtTkRHR/8XO3AgSU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IYPxD1eZq2QZoIEtBry4BqC+wu5+R6ax0duwY2aCjSJkZpskEcc6Et5LdGmtIqc2NlFj7LOpIYc6Sb/BWcXNc+OLHfQWRQxzkhIeYJjSVcNXAjjTHBq+cnacpdymz2KFBYY8I+dLKDnNR4kQscEWQ9psnojGnCVJthV350sEyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iQ7C8HtA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A0EC4CED1;
	Tue, 10 Dec 2024 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733797557;
	bh=vrmMGZ0rLWOX1HqgYVdWR06cM7mrtTkRHR/8XO3AgSU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iQ7C8HtAzngyAoej1wcnrdv1021FAE6v+JEh8PE4vTzRSH6GOvJ1EIlrus3tPKrVT
	 S3SyATmAOScJ+L6qsj0+QsC8YAf52LPGIPs4dykn+7ROADsRhsfSBdNGQlQN/Znq4/
	 xts+hsodSvqWjhLm+b7kaaLNoEB5HQ9k+nBVbrKA=
Date: Mon, 9 Dec 2024 18:25:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Suren Baghdasaryan <surenb@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, SeongJae Park <sj@kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
In-Reply-To: <20241209170829.11311e70@canb.auug.org.au>
References: <20241209170829.11311e70@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Dec 2024 17:08:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (powerpc allyesconfig)
> failed like this:
> 
> In file included from mm/damon/vaddr.c:736:
> mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
> mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>    92 | }
>       | ^
> 
> Presumably caused by commit
> 
>   062111898568 ("mm: move per-vma lock into vm_area_struct")
> 

How about this?


From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm/damon/tests/vaddr-kunit.h: reduce stack consumption
Date: Mon Dec  9 06:20:01 PM PST 2024

After "mm: move per-vma lock into vm_area_struct" we're hitting

mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]

Fix by moving all those vmas off the stack.


Closes: https://lkml.kernel.org/r/20241209170829.11311e70@canb.auug.org.au
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: SeongJae Park <sj@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/damon/tests/vaddr-kunit.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/damon/tests/vaddr-kunit.h~mm-damon-tests-vaddr-kunith-reduce-stack-consumption
+++ a/mm/damon/tests/vaddr-kunit.h
@@ -68,7 +68,7 @@ static void damon_test_three_regions_in_
 	static struct mm_struct mm;
 	struct damon_addr_range regions[3] = {0};
 	/* 10-20-25, 200-210-220, 300-305, 307-330 */
-	struct vm_area_struct vmas[] = {
+	static const struct vm_area_struct vmas[] = {
 		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
 		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
 		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
_


