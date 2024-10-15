Return-Path: <linux-next+bounces-4275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF799F4DB
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 20:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BE5E284864
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 18:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6E91FAF1C;
	Tue, 15 Oct 2024 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVSqUn4X"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF3A1F76C6;
	Tue, 15 Oct 2024 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729015812; cv=none; b=DHQYGz+AA4ws1PVoHtUnSmKLV+Aq7dt5vFkc5ZwikrdjqNyqJdbi6z+HdBWVpwaV00CU6XWvju6JZ8CChP+xLl+nymDUSU8/10LcjhilmF/AETHdUQNa3K0NZXkxK+H+7pDDIMXLc+swLrzvT6AGa0gT200AL5uncRjlo4iH4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729015812; c=relaxed/simple;
	bh=DvACX1hbAClk9eDVjTABaTJteslXYwpTOMT3IXrqXik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BbgyVQdLwWQOXhzWw4ANTiEuLpJBHTtwC8h9OVfZ1c8O1LCvRzExlzrhLQ8vOMxhKKUIk9KKO9wbsI+J34IqzUoEZ5WZSmX1xrX/TMbUCGzH+ECvB8Gi5o5eYdc5LkpYBScfdHrbVLkLlFv4RUGeVLyIQqE/ejdExxitrVUS1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVSqUn4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0C7C4CEC6;
	Tue, 15 Oct 2024 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729015811;
	bh=DvACX1hbAClk9eDVjTABaTJteslXYwpTOMT3IXrqXik=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=DVSqUn4XeXj3HL6QV05PSjEdpVY2E9n03lCQO6Kxhs+1UJIScvCAxjGzGpUYDvs/R
	 O9mZXKlHNuBevcKOmDvCpCp2Q81ZEAqHqkXfRjJyxdZ6e0fyGW2r50pChnE3hCYJzF
	 ZJMz1wXI1bzkhbQUk2u7RcSE0pBrEaoRydvFll/hxuCEEuLji7DCfm/9Vapi8TPAPZ
	 w4i1X30K/p/rTxr69R/AI9mMnVYj1PlId3X1tjo+UYEhIrZIgneRxeTMaYzmbqbKht
	 ea8F1616Y/D0bi82cn1X048wMylVZb50DURYGHX08A30TbKg/DZ0J0eC4e92DhUtTJ
	 gaE9YuDqqRxvg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 44687CE098E; Tue, 15 Oct 2024 11:10:11 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:10:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: dmitry.torokhov@gmail.com
Cc: bentiss@kernel.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, linux-toolchains@vger.kernel.org,
	jpoimboe@kernel.org
Subject: [BUG] -next objtool build failure (bisected)
Message-ID: <fe8c909e-bf02-4466-b3eb-0a4747df32e3@paulmck-laptop>
Reply-To: paulmck@kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

The next-20241011 release gets me build errors like the following:

	vmlinux.o: warning: objtool: fetch_item() falls through to next function

Bisection leads me here:

	61595012f280 ("HID: simplify code in fetch_item()")

This diff looks inoffensive to me, but I get this error on this commit
and not on its predecessor.

This build failure happens on quite a few different kernel configurations.
I bisected using this particular reproducer:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --buildonly --configs SRCU-T

Thoughts?

							Thanx, Paul

