Return-Path: <linux-next+bounces-3376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06C9592AA
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 04:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ACA8B24967
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 02:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8ADA52F6F;
	Wed, 21 Aug 2024 02:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UI4sPctu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AD1C683;
	Wed, 21 Aug 2024 02:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724206561; cv=none; b=ACCh2zWeBLiL4/QPN5IP0Jp1+TePp4M8Dm1RLmhVqzoo968UJqU7Ra3rsnB8c/Q+jeVpqEgcOPOsbjohFcNpx/1Vpr5UzF7LYnMRS1192PqeONfslI9HUzoFa7TXyZHNqoEMG8NxTfVPSGd12GeW9IiLnAs/lWR9hjxHUQNQMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724206561; c=relaxed/simple;
	bh=fSku+PxmrGmebMAQ9AkONE7EqIrAkyF3tZeCfvKkMyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVvftg8O8gFNQqBz0ipwK1Tu2dbQNrUEqeyBRGXd0RBRFZRJc3TW0CkZ2Yr9+7HvS0XZ/dqd7Qa9Eko6cNg+1NJbqA8LRTqyWhKV10DMNMLCO8NT588Gmca5FQjAZAjo0aaaBhX/yaUJ5fAV019QFEaTcrT5J8iDwGFhEt9AnzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UI4sPctu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A03C4AF0B;
	Wed, 21 Aug 2024 02:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724206561;
	bh=fSku+PxmrGmebMAQ9AkONE7EqIrAkyF3tZeCfvKkMyc=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=UI4sPctuNgXEoAuSKoQ755pEpHnwa96m+/w7zMWGN+z2qTjRsimbWBDlJTHGDB/16
	 ElHYKqUhNNLj71LpLj3Z1AsNg1aLgGMNsDR6aUXydfu1Y7nQ47AqrNzQRQmNMzl6O+
	 yM+QBzfLRwEl+/VPFc35pNjANMg7lTaDx+cifq+cEsBv37CR75DFnrVa0Zrm9pWWJf
	 pTYpgcJafDKla/wNuVNa3GauZREAmsbQU29gnntsG3uZioe9I3XS3K0sTcm2IS01bv
	 gh79X6J9556TTWLe2B8xfF+Cv5KB4YBxaq/8wIl9uZWl6vlQFSjXPK7g3Q8ffK00Es
	 YQ5Dv2Tmy3HSw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A5359CE08FF; Tue, 20 Aug 2024 19:16:00 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:16:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: matthew.brost@intel.com
Cc: tj@kernel.org, jiangshanlai@gmail.com, sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: [BUG bisected] sysfs: cannot create duplicate filename
 '/devices/virtual/workqueue/scsi_tmf_1073822488'
Message-ID: <8d443293-2020-42d9-b5b1-1348f551648f@paulmck-laptop>
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

Running rcutorture scenario TREE01 on next-20240820 on a dual-socket x86
system (and for that matter on my laptop) got me this warning during boot:

sysfs: cannot create duplicate filename '/devices/virtual/workqueue/scsi_tmf_1073822488'

The number at the end varies from run to run.

Bisection landed here:

b188c57af2b5 ("workqueue: Split alloc_workqueue into internal function and lockdep init")

My reproducer is to run this at the top of the Linux-kernel file tree:

tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "2*TREE01" --trust-make

Reverting this commit on top of next-20240820 gets me clean runs.

I cannot see how the patch would make this happen, but then again,
I don't know this code at all well.

Thoughts?

						Thanx, Paul

