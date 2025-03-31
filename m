Return-Path: <linux-next+bounces-6110-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C95A76BA6
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 18:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C7567A3D9D
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 16:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 029231DF75A;
	Mon, 31 Mar 2025 16:11:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3786347;
	Mon, 31 Mar 2025 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437494; cv=none; b=e1NnT4ma/OcBNxwa8Vbvf6Ujyq6vSKcIzrb2n/vHVJlgyBUlCG0Ffq4IL6USgFZVdrMLsP+1BciWHpa5zFDWo8Cz3fjh2TFh/wLBJfiL3YttqXIoytVU9KhuDrziZunLwtwbKrb6GGfS1YJ6BcVXPcpZniqSBNx+Rfyi/Hq/D8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437494; c=relaxed/simple;
	bh=l4CHbklxbYqOg+OFujNPFIz9TuNiAtK+mRkWfCDd8cM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLmXC1IkHc89LNqWQakIq7mz8ibWrii/OChfSRQETnxBVmOIp3a6fASAMvfWJlp2M/XCL7y9eewpMwqMyUNZmTPEFzaM408rLq1kWxnx7ZPHomZj+3zXAYlbxJA4KAvTZU414w3r2XvrtiIOvf6nFlpGrW0pXp0jFsLdHK14xRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EA5C4CEE3;
	Mon, 31 Mar 2025 16:11:33 +0000 (UTC)
Date: Mon, 31 Mar 2025 12:12:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uday Shankar <ushankar@purestorage.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the kbuild
 tree
Message-ID: <20250331121231.64ce87c0@gandalf.local.home>
In-Reply-To: <20250331105708.331ec145@canb.auug.org.au>
References: <20250324164111.20c92791@canb.auug.org.au>
	<20250331105708.331ec145@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Mar 2025 10:57:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > I fixed it up (I just removed the file) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.  
> 
> This is now a conflict between the kbuild tree and Linus' tree.

Thanks. It's a trivial conflict as the file is simply deleted. The change
to that file should just be dropped.

That script has been broken for years and nobody complained about it.

-- Steve

