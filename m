Return-Path: <linux-next+bounces-5661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD8A509FB
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 19:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2900F3A3A27
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 18:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6581D1C863D;
	Wed,  5 Mar 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWQbRJaN"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0721A840E;
	Wed,  5 Mar 2025 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741199313; cv=none; b=UnPZgyDZ8NJJ2Nv9fbTyZKDyTHx7UROSxn5urMijp6+Z+0bciRO78plMFkTm8/Zccr9uaH+jG5zHKOSlbnajisKk3Wij3VBIsG4VcoylEJaz77Tifx52vBoPmTuq/v6eVm7uKHYf9q8VdMkmyj1HULjmv8fqrMoi9R8ZAuZiqUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741199313; c=relaxed/simple;
	bh=QEyYKf/y4uJB60uwfNfehebuMGGLy43YFw7A8AAnOHQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tRVlk6s6GZd01TQLEQ6ak0gH6mNcEMIJ+qjLP6AhWDrbzCA0IRijMp6B9ovWrTBH6HNxjuJOudRd64VaLR3zhxxEoQ7CqebZSSLTnTPYyLQrEeeRblvRSvvxQQA519SnwGJbPtwJluTOaXIv098YIN52smCtqZzZW18L9KKOLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWQbRJaN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804FAC4CED1;
	Wed,  5 Mar 2025 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741199311;
	bh=QEyYKf/y4uJB60uwfNfehebuMGGLy43YFw7A8AAnOHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWQbRJaNrdxy3IfAiBC9Xod1ZczhfpGqiR1tuW61SBqKO0Qs4HgefJ0CAkKlTYSR4
	 TDGfDME12O0Fen2Da01GtiisEnB/r79L9CPABaSW6STJwRznzVsYnxVQFlF5MGD8vE
	 te8Zkysnucmx7idHYyfnUSuhDdrTEyLZ6NyY9OvR3RXwaFFxnAKAMasTZs/Or1KuhN
	 CMvFozX9RCq59FAaNRlyaZ1flTssMEvyeRok/r+WgMoNvRpxmJUsTcA9gkc5gxFv9j
	 VI+mbzNg4R4j+TET/7/oZsk2k5MQWw+W1iReQZrkqjw6KQt1fYy3QsNEcWuZHf9x/2
	 /lrgLQltGUpWQ==
From: SeongJae Park <sj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Date: Wed,  5 Mar 2025 10:28:29 -0800
Message-Id: <20250305182829.56154-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305203312.6f30e9c2@canb.auug.org.au>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Stephen,

On Wed, 5 Mar 2025 20:33:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/mm/damon/design.rst:342: WARNING: undefined label: 'damon_design_region_based_sample' [ref.ref]
> 
> Introduced by commit
> 
>   8a2e41c7ecfd ("Docs/mm/damon/design: document for intervals auto-tuning")

Thank you for this kind report!  Just posted a fix:
https://lore.kernel.org/20250305182744.56125-1-sj@kernel.org


Thanks,
SJ

> 
> -- 
> Cheers,
> Stephen Rothwell
> 

