Return-Path: <linux-next+bounces-8154-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9392B3E4B9
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 15:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C294D481DC1
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 13:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B1D1E9B35;
	Mon,  1 Sep 2025 13:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOUTVRra"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBAE1DF25C;
	Mon,  1 Sep 2025 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733015; cv=none; b=GgYrztkezHVTvlhIpAMwxuYump7928EHApnylWofUkCqLxfuJ1WJzQJ+kVI/Lq/EfUemV45KfyBrAXposECXNSDuS4NN2NpboO/JHcd4xFJDy6OXv9nelHihgcV4foBux8ig5fAEQQ2kKlm0xrR0s977sBKHVTTCXwJmN5I3AF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733015; c=relaxed/simple;
	bh=nR7+kAKF5KJstorEaPJqFmYX42eS8u36evhmxiXlQsk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/zxmGMg8iAwl7x6ujAvy+t0T8SahPLvIUNwqN0c/snSp81kxXoEyghvNuK0ndWQLcO89FxSlOLlTXBo37dfFUhTOOXV50kMMmXYfX+YOG1NwKD4YBobtqL2OAF3DsMqISGmZDGyYrcI5vNDGW0Xn/s8hgy8Ryh3k+xsn23jEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOUTVRra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA96C4CEF0;
	Mon,  1 Sep 2025 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756733014;
	bh=nR7+kAKF5KJstorEaPJqFmYX42eS8u36evhmxiXlQsk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hOUTVRragP7Z4sfxaFWH4iTGLYVpGtx3ZgRel7LuT5XOtw1oR8XZRLMtD2M8pPeWP
	 Zc1eF+tY5tYt1Ng5FOxBdYAC7m5VuYnUtffC/3J6uETPDV5tzTc26qQnzcpaZXWx3e
	 aCVZMw7SVLKUOHvMaeGvQsnG14qIAv6qZtd9rFQ9l4q5ldTlEQgyYywwyFqbeybmOT
	 KrWV0OBpZbBwO4Tywr+F/nQ6cl1TAQGGqspK+xx33BmYBJ4XH0R5IHZ1y0x2127tuC
	 BwoR+DNNtNLQqvET68LbAp7wWnIKDXBiMMZaItl9m0zCoflSdH+6kURQ8vtm0bcuPX
	 EyipPqUtZWNjQ==
Date: Mon, 1 Sep 2025 15:23:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the jc_docs tree
Message-ID: <20250901152330.0b64e07a@foz.lan>
In-Reply-To: <20250901142639.4de35a11@canb.auug.org.au>
References: <20250901142639.4de35a11@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 1 Sep 2025 14:26:39 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi all,
> 
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> failed like this:
> 
> $ make O="$HOME/htmldocs/htmldocs" htmldocs
> make[1]: Entering directory '/home/sfr/htmldocs/htmldocs'
> Python version: 3.13.7
> Docutils version: 0.21.2
> Using alabaster theme
> Using Python kernel-doc
> 
> Sphinx parallel build error:
> FileNotFoundError: [Errno 2] No such file or directory: '/home/sfr/htmldocs/htmldocs/include/uapi/linux/videodev2.h'
> make[3]: *** [/home/sfr/kernels/next/next/Documentation/Makefile:109: htmldocs] Error 2
> 
> Presumably caused by commit
> 
>   8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
> 
> I have reverted commits
> 
>   aebcc3009ed5 ("docs: sphinx: drop parse-headers.pl")
>   8a298579cdfc ("scripts: sphinx-build-wrapper: get rid of uapi/media Makefile")
> 
> for today.

Thanks for reporting it!

Just sent a fix:

https://lore.kernel.org/all/da91980ce42f31730dc982920167b2757b9d2769.1756732363.git.mchehab+huawei@kernel.org/

Regards,
Mauro

