Return-Path: <linux-next+bounces-221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AC2803B13
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 18:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A3B280FE8
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 17:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D4D28DD2;
	Mon,  4 Dec 2023 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsT0xkdP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF82171D9
	for <linux-next@vger.kernel.org>; Mon,  4 Dec 2023 17:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D4FC433C8;
	Mon,  4 Dec 2023 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701709392;
	bh=Pv3VYEkqIQLnSP8xafFSEbNXHalrpqZF41HTmyx/BUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FsT0xkdPXwslVEvkh776LXBEI7/HNwK2VGemBa3xaaWGrtQ0DPd0mVA3SvldUA+6a
	 YMamvcIbquAMtlhfBAO9og1jAFc9xvcEZ0FyZdZdT/8W3UDpKUk3Wnjn23xCX0wOCt
	 aC1wDIzv2U+Ihk46lP7NgYV9DDRjJApAnT67Qn+4k2Sj9IGuFH9S9TGm1bcGuqzYIA
	 mi9Z/BEquIOSi5hhk9ndwBgTwe/+YvNi8phIR86WQhGwXdjmPJ259aAcbbJLPBMjJA
	 oilm5DADTpOWrVW3BBxffs8jH6Bac/5014NKSkuU7ns0uIKprirmaoJHcIgr0a27D1
	 1g+Whq4qKAAnA==
From: SeongJae Park <sj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	SeongJae Park <sj@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm tree
Date: Mon,  4 Dec 2023 17:03:10 +0000
Message-Id: <20231204170310.61209-1-sj@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204155442.1243c74e@canb.auug.org.au>
References: 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Stephen,

On 2023-12-04T15:54:42+11:00 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/damon.h:201: warning: Function parameter or member 'get_score=
> _arg' not described in 'damos_quota'
> 
> Introduced by commit
> 
>   99b36eab9c05 ("mm/damon/core: implement goal-oriented feedback-driven quo=
> ta auto-tuning")

Thank you for letting me know this.  I just sent a patch for this:
https://lore.kernel.org/damon/20231204170106.60992-1-sj@kernel.org


Thanks,
SJ

[...]

