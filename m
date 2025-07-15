Return-Path: <linux-next+bounces-7559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF7B06653
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 20:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E261AA18A4
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 18:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677142BE057;
	Tue, 15 Jul 2025 18:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooPxqfr7"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B5254AEC;
	Tue, 15 Jul 2025 18:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605650; cv=none; b=QobP1wTrqE1xu4DHdosgqJfTqBckZ2Crc3G+LZRWrsEXFi4e0kdPgjRKcpRpOVQFYUpD/yBg+EnDsSrMTzKHQbuFcqgLR6tdIjE3NVNTQa8ZTWLXy0fKIFOwUl1D32z5yC8MayRGS+Eq7DpxCIKN2/cLMeYed6NG64/7m5mpeI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605650; c=relaxed/simple;
	bh=0jzfzycBzO8EVinIYR6sILBmsvzxui9VIyDZ/QUGcpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j4jN7QljwkcOFcYxQ81gQQGlENr/rufZV2tipgdsU0chSony0HW2f6I8p+Po16vLrEzHBNp5t/c+HNA9kE77lsey1I13KYzFQnFj+0wCGREu8D8sZ8qYJumt7cxv2sIZNPtPkJjC0qjTWcIbKbWRTWE4q/gd0maG0mauAhq9Om4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooPxqfr7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45D1C4CEE3;
	Tue, 15 Jul 2025 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752605649;
	bh=0jzfzycBzO8EVinIYR6sILBmsvzxui9VIyDZ/QUGcpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooPxqfr76h7wmrbUN3jU5oDMt2q2agFbDCpLbDlSBnEQtYBaWt6wHt2PvkRoU8lIY
	 l4b/IaqbLn8bjkIDXywSHjUL9hyfos3qkwQC8SMSRiGtuiIgLNEXbLpwTgKdyDQUwv
	 n2KEmsNjFMr/xNRhpvI1/hBqg+QPdu0S6vCakufSa4tWKQy3ihiMOi60ZuaU4Ao4k/
	 MYso3ltL6RL9qdPRfkWBKZp67ML+E8SRfidj34Ccax5FVguHe17rmHyViRVfDTe+J5
	 Hr1x+l96tBM5cbLVekrXZyU6wSmmUy1gTCANqBHeBudwp771nqWa6w7OxKytcwsgzy
	 AMhgA7FfJzaqg==
From: SeongJae Park <sj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Date: Tue, 15 Jul 2025 11:54:06 -0700
Message-Id: <20250715185406.89199-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715185549.264260b8@canb.auug.org.au>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Stephen,

On Tue, 15 Jul 2025 18:55:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/damon.h:629: warning: Function parameter or struct member 'cleanup_target' not described in 'damon_operations'
> include/linux/damon.h:794: warning: Excess struct member 'callback' description in 'damon_ctx'
> 
> Introduced by commits
> 
>   dff2bc66ec7b ("mm/damon/core: remove damon_callback")
>   769bd386e490 ("mm/damon/core: add cleanup_target() ops callback")

Thank you for reporting, Stephen!  I just sent fixes:
https://lore.kernel.org/20250712204650.155988-1-sj@kernel.org


Thanks,
SJ

[...]

