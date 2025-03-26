Return-Path: <linux-next+bounces-6009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEFA70E59
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 02:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 747A93BC31C
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 01:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AEB1F94A;
	Wed, 26 Mar 2025 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqxNjC59"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F332FB2;
	Wed, 26 Mar 2025 01:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742951525; cv=none; b=RemMK7j62Ce1nO20t+Rcz798aSDJNCgw6EAK/1nJg4twtBrRxYbgJ+O0LaD207eqor3QeQIzaamfpl++06NJikQrs57OfvLlcaQREd/Y06WAiWqWp0c/cpqS4OoqJViCZsWZN2jcHSWPcgKa3rRUx1y3PS/oL0X98ycdWkJLndE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742951525; c=relaxed/simple;
	bh=5B3m/r3LBGvod7z2QUOF0YaQsi2bcbwV048kE0Sr3wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjpMNEpFk++MUeWNazgqWnOrWt1uOryNfDASrDsmOu+hE7Mi92dqXEKen2VhB0fgUjAyBiJiFH85zKtyG09x2BRxH5j9LKGjQQqgyEXJOybfGt6+3gjIdb2hkKWmHGCqZji1Ouiu/FH76vg7e07rOE8asqLR6PRgYMdpYYM6IB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqxNjC59; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432D0C4CEE4;
	Wed, 26 Mar 2025 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742951525;
	bh=5B3m/r3LBGvod7z2QUOF0YaQsi2bcbwV048kE0Sr3wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqxNjC592tDzYqoDQQ/MWopqJNgaVvcFTrMsHeWWkbz39u37oICzPuv80XAy0Sdn0
	 Fm1+KiWHIesOgMopvxHvkIevKVxCj5vX5uoxpiCL7LU2Yf1PlT5H6as2YmlZJ5DDUW
	 ufYw2kAXmPxbf933jj5oKcmr3QMpXsg1+7+I7x6cDJpJaiU+KxTy1/pIzPgyX1VPLD
	 4fZpjDg/8nN1miaycVt6zQJs5nQC0pRgeuzqT4oElg2ZRWJlMFx6H8RJcjlbQcW/V9
	 OdGoIIJ0k7it9MOc9nlzNsjqAfOmoKM/5O8dAaYk1/jhFXcEYr20nXEMHblP/VUV6Y
	 9FxRRs2r71aEA==
Date: Tue, 25 Mar 2025 18:12:02 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip-fixes tree
Message-ID: <duad4gwchwb6732j6vbh75x6k6cvq5lgxvpm3y3btzy746cmo6@uealeonsqeha>
References: <20250326103854.309e3c60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326103854.309e3c60@canb.auug.org.au>

On Wed, Mar 26, 2025 at 10:38:54AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from builtin-check.c:16:
> In function 'save_argv',
>     inlined from 'objtool_run' at builtin-check.c:296:2:
> tools/objtool/include/objtool/warn.h:47:17: error: '%s' directive argument is null [-Werror=format-overflow=]
>    47 |                 "%s%s%s: objtool: " format "\n",        \
>       |                 ^~~~~~~~~~~~~~~~~~~
> tools/objtool/include/objtool/warn.h:92:9: note: in expansion of macro 'WARN'
>    92 |         WARN("%s: " format " failed: %s", __func__, ##__VA_ARGS__, strerror(errno))
>       |         ^~~~
> builtin-check.c:241:25: note: in expansion of macro 'WARN_GLIBC'
>   241 |                         WARN_GLIBC("strdup(%s)", orig_argv[i]);
>       |                         ^~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused (or exposed?) by commit
> 
>   c5995abe1547 ("objtool: Improve error handling")
> 
> I have used the tip-fixes tree from next-20250325 for today.

Thanks, I'll fix this up.  With my GCC 14.2.1 I get the same error with
that commit, but for some reason the error goes away with the next
commit.

-- 
Josh

