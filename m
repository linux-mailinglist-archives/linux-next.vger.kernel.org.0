Return-Path: <linux-next+bounces-5739-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAEFA5C26E
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 14:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C00616FED6
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 13:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B846F199237;
	Tue, 11 Mar 2025 13:22:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B95B74BED;
	Tue, 11 Mar 2025 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699350; cv=none; b=pUgUjv0kXU+KF5dysvJ/6Yz74ViR3PCSP9Wa2bJnd6yiuPNW0mZ1ovoh4BQYla7rSPAjle3CyLKOJkPMCYSCcH1tXwM77wHumAwSNBllLZWilAu3rYZZaZHAkyZhQr3yWUfHJsK+462KVWtAfJhAbnUZeEmqrHR7AlHU8QmB11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699350; c=relaxed/simple;
	bh=WguRmOB8IXWeKyTiumivP2L8VdW68o5oI2d4pEwwHKk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X5k37AMZJsjIU1L8sQOaA5V2uBi7EKw6c9BW/7wJ6q7UQNZPKcBjlYdGL5JgDDIdTFREIBbRj5LIZc5TU742jE/B2X2kL+0WW0pprmz3g4of2zEPU4BkzUJ8uOY3goRvdS5VrDryQgdpJMSdbmVCk+nUfgLAE9JcqNGkzd8fNlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770C6C4CEE9;
	Tue, 11 Mar 2025 13:22:28 +0000 (UTC)
Date: Tue, 11 Mar 2025 09:22:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20250311092224.33e3873d@batman.local.home>
In-Reply-To: <20250311162730.2762bbd0@canb.auug.org.au>
References: <20250311162730.2762bbd0@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Mar 2025 16:27:30 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Yep, this was already reported. I'm currently testing this patch, and
will be pushing to my next branch after it finishes the tests.

  https://lore.kernel.org/linux-trace-kernel/20250308123649.1330e9ca@batman.local.home/

-- Steve

