Return-Path: <linux-next+bounces-4931-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A059EA6BC
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 04:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CC6287B2F
	for <lists+linux-next@lfdr.de>; Tue, 10 Dec 2024 03:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254251D5CFB;
	Tue, 10 Dec 2024 03:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2Vs7hnr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB30E1D14EC;
	Tue, 10 Dec 2024 03:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801874; cv=none; b=gg8GCBKG6oZseQkt3AN1Td0DHwTnXJ81xOfyMQwQs+4+rzzRIM1wEx9gRs1vv+lU3SfM6FrEU1VIEK/jhbQ+j0ZDiQJFIH0vJbM3/EUpZ1xDfevdFEu9cj1Yz8iNlNEHlDRYecfDa1NtwYPYXXUu/layvj2UvAWMX6M5XDBC/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801874; c=relaxed/simple;
	bh=Ki67ZJiOR/Di1+l/yo5qIiBh6ewMblr0rhfP+7nCGGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FdfrUFOoq4AEjkSDvmoKfG34COwPQaV2xeesB+TjulTLFYEwOVLZ6TeOETxBj7Qur9l4NdQe82yq7UIeVHj6XGWMumMKUDMXtKg9yAlDYuwMifGDKuOMCL+hj/Kim8MnhOTnBlNU/jOFMWFiCoTf561Jf+3egZM+zIhIiUYDhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2Vs7hnr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1920C4CEDE;
	Tue, 10 Dec 2024 03:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733801873;
	bh=Ki67ZJiOR/Di1+l/yo5qIiBh6ewMblr0rhfP+7nCGGM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2Vs7hnrdNPhzYBow4mVqrSjDizhA99tEhwoNCMPdFc8N6m5GHevk7rPSPHx/OPoF
	 Y2cZNakCnqcpK6USD0X/ifl1tskohgbdnSfOvPfwnRyepS+6o8jd3jkoc9xORMFhDD
	 sYKqLI4TEj32Qaxtr5/L8q68BMdSief007kBUov6EgJvI3NT6eNF7zCp7P7utZ2bn5
	 evkjrKZ4q7BPU94yHwSHucwK64JqJrqKMOHcnUM4eudmDcT5AZna0H6UxZqfDUHx3t
	 eLlS4PKvzBjyKJpI+iaea0Hwo009IPcsoIYkF2QFMwB0YwPV4dnqAtf/itZCOMBtQI
	 rqCw0edXzaYjQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Suren Baghdasaryan <surenb@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Date: Mon,  9 Dec 2024 19:37:51 -0800
Message-Id: <20241210033751.42239-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209182557.8794e5b886e4ca91994ed0d7@linux-foundation.org>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 9 Dec 2024 18:25:57 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 9 Dec 2024 17:08:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the mm tree, today's linux-next build (powerpc allyesconfig)
> > failed like this:
> > 
> > In file included from mm/damon/vaddr.c:736:
> > mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
> > mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> >    92 | }
> >       | ^
> > 
> > Presumably caused by commit
> > 
> >   062111898568 ("mm: move per-vma lock into vm_area_struct")
> > 
> 
> How about this?
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm/damon/tests/vaddr-kunit.h: reduce stack consumption
> Date: Mon Dec  9 06:20:01 PM PST 2024
> 
> After "mm: move per-vma lock into vm_area_struct" we're hitting
> 
> mm/damon/tests/vaddr-kunit.h: In function 'damon_test_three_regions_in_vmas':
> mm/damon/tests/vaddr-kunit.h:92:1: error: the frame size of 3280 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> 
> Fix by moving all those vmas off the stack.
> 
> 
> Closes: https://lkml.kernel.org/r/20241209170829.11311e70@canb.auug.org.au
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: SeongJae Park <sj@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Reviewed-by: SeongJae Park <sj@kernel.org>

Thank you for this quick fix, Andrew.

> ---
> 
>  mm/damon/tests/vaddr-kunit.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/mm/damon/tests/vaddr-kunit.h~mm-damon-tests-vaddr-kunith-reduce-stack-consumption
> +++ a/mm/damon/tests/vaddr-kunit.h
> @@ -68,7 +68,7 @@ static void damon_test_three_regions_in_
>  	static struct mm_struct mm;
>  	struct damon_addr_range regions[3] = {0};
>  	/* 10-20-25, 200-210-220, 300-305, 307-330 */
> -	struct vm_area_struct vmas[] = {
> +	static const struct vm_area_struct vmas[] = {
>  		(struct vm_area_struct) {.vm_start = 10, .vm_end = 20},
>  		(struct vm_area_struct) {.vm_start = 20, .vm_end = 25},
>  		(struct vm_area_struct) {.vm_start = 200, .vm_end = 210},
> _


Thanks,
SJ

