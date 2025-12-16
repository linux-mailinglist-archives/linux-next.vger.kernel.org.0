Return-Path: <linux-next+bounces-9433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB61CC53DC
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 22:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EF3F304392A
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 21:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA1E3271F4;
	Tue, 16 Dec 2025 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SQPLeddY"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2652C3276;
	Tue, 16 Dec 2025 21:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765921368; cv=none; b=GnqSZMNsHCgTbioFMCXKioZKh7toAw71DJS40C47AkxKOCNIwbjgw6l1+NeMbNPomjbyE9MEC1E9bRVc0XlgaToVIj/hP6f/CfR134yzEbq4y8+EyyunM+LxpSmbZ9LBDJjDc5K1/OkPhFJNblJgY7AC+Q7NLC2vqPNWuRjXWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765921368; c=relaxed/simple;
	bh=+YiGSKG4CYREq9oFBx3QSQPYDtO+NRjycgIIOWqUvtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBs/uEDVawoe4DWyeyZDDHNh5NEGxNLm1wfr0P3Y2jn2veZb6ta9hL3B8PkT1e/p8MeNCWaauX1GUaU4a6HbEtO2tIGG5shVNue+04ws++oBg5Vq5Ggp06Rz12KEdz9wb4etYUaZYwBmqoLHGskLjXweX5PmjaxDkrtXfZFCzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SQPLeddY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+YiGSKG4CYREq9oFBx3QSQPYDtO+NRjycgIIOWqUvtY=; b=SQPLeddYfb8Il6pOVGNj/c32db
	vFxz9Nhy1LXZbgu580WLrUqp5OHMY+6AlTI1z1omlh/47+aDqpTu021s6Rou1Ttbr1U0wzjgkDadK
	nTIxaCL9aWl8EHEmipTddK0U1rMIh23zpefuxYHpX6HXdemGZJ9bgqhOjD/5W5ZTYhJ+Q4V/4e1Io
	w1uR7TdvWcPSF6033W5GCZrhjPIHDWISM9CKl4w8LOojgMyELUaDuMeFJLiWhW8RN4xkR14+ZRL24
	7HrkhZczcymxej0B6VPOXRlPafyfbTJKVRJzZ1ec1TOv4JsNn9paoF/OzSwx96bh9vgvgxUvessbm
	AShkA04Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcoR-00000003ovL-0cFL;
	Tue, 16 Dec 2025 21:42:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id ACD0430029E; Tue, 16 Dec 2025 22:42:29 +0100 (CET)
Date: Tue, 16 Dec 2025 22:42:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Tejun Heo <tj@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Ingo Molnar <mingo@kernel.org>, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, void@manifault.com,
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: error: implicit =?utf-8?Q?declaration_?=
 =?utf-8?B?b2YgZnVuY3Rpb24g4oCYcnFfbW9kaWZpZWRfY2xlYXLigJkgKHdhcyBbUEFU?=
 =?utf-8?Q?CH_5=2F5=5D_sched?= =?utf-8?Q?=3A?= Rework
 sched_class::wakeup_preempt() and rq_modified_*())
Message-ID: <20251216214229.GR3911114@noisy.programming.kicks-ass.net>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
 <aT-0zW7vOrJv6pA6@gmail.com>
 <20251215115121.GA505816@ax162>
 <fdf21e40-b504-4122-a072-2c546b1f8237@leemhuis.info>
 <aUGnpH-WAneT-4RE@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUGnpH-WAneT-4RE@slm.duckdns.org>

On Tue, Dec 16, 2025 at 08:40:36AM -1000, Tejun Heo wrote:

> Ingo, Peter, I can pull tip and resolve this from sched_ext side too but it
> would probably be cleaner to resolve from tip side?

Yeah, I'll fix it up tomorrow morning if Ingo hasn't yet. Sorry for the
mess.

