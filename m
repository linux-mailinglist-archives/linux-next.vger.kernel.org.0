Return-Path: <linux-next+bounces-3936-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BDD97D6C2
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53D261F252E2
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 14:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17FC17BB13;
	Fri, 20 Sep 2024 14:19:13 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4605482CD;
	Fri, 20 Sep 2024 14:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726841953; cv=none; b=grJLgePhxGS1U8QSaPjwjGeWRCmjKUAhGbYiJBEYQ5k0ST5VP92RGDqfJmIdqHuhtzkXCN4JjkbFsyNaNYQnKcRnKuJ3DpJntfAoDRolzOcMi4d6fJS7qflFLXeeTgybMUZXX+1ZL9z/FAyHvmQKUmXRPyHJLjyTOb1RA7mNbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726841953; c=relaxed/simple;
	bh=ta2107TOM+y4zD2f/LP8En/FMWYImz6hpl3lVk6uBjs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VryUoDsuY4t2ANI2tNmD5c90c/cvBfGtFgAqBiYjMVBVwTdS3pY166pbjQeOVGD+/NG0x09KVxLkL2nxqpU9nO8V7+WNLQv8R5itRg5bor3U2m6WBUqyW7YN7FqCVPap3aEu05fX++w5CYY2xZ8NguXVwAtuVYgOGSXWd3qr35I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0C6C4CEC3;
	Fri, 20 Sep 2024 14:19:11 +0000 (UTC)
Date: Fri, 20 Sep 2024 10:19:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ftrace tree
Message-ID: <20240920101907.05b3a10b@rorschach.local.home>
In-Reply-To: <20240919072849.09486807@canb.auug.org.au>
References: <20240919072849.09486807@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Sep 2024 07:28:49 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Commit
> 
>   ca088d067ebd ("uprobes: make trace_uprobe->nhit counter a per-CPU one")
> 
> is missing a Signed-off-by from its committer.
> 

Masami, can you fix this?

-- Steve

