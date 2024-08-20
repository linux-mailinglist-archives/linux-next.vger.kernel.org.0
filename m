Return-Path: <linux-next+bounces-3357-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B955F957A82
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 02:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7670B283F79
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 00:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3F1A927;
	Tue, 20 Aug 2024 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bpC6fL3o"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F308F48;
	Tue, 20 Aug 2024 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724114038; cv=none; b=k0Jeh7e48xNLanRuuVSKshYhM1nC7tQdNy5ne4NLyow7V4X/iohsfetrlXvMHKdkdiU9jPSJbIO15ZRYREW9m+U0c7FjsxRdu9c7TwcUPwnlkB/jKRDtiHHYsG8UBAz/rzgFE58Z0L0Y7JIazQ9MOVUeZBqoZuhyAxUwrj5XmZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724114038; c=relaxed/simple;
	bh=g00JGiH0JG0j/R44VeHoKyBRwYRPXo+pdBTVlLnmgq8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fCCPYvr8tvZ3CHU0l4CZ/PFqZxxkspvFYI1udXWefxuth3gqbzWMlcwB+Ks3dVhk6/z+4FHVBnZEKXMwRV6FdSWTgb6aB8KMZ5PmfDYsmgLLJFwu03Eds7nohZ/eC8nW3TxTUAgEbxVyJLWNdgQzBYC8snTTFbMRMYfeJFjkYrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bpC6fL3o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99A8C32782;
	Tue, 20 Aug 2024 00:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1724114037;
	bh=g00JGiH0JG0j/R44VeHoKyBRwYRPXo+pdBTVlLnmgq8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bpC6fL3oSpWqteku+rrE9sdGkpxY8CdxvOCi52PeCCzxv+ovyZkTrkLHC2vabPtLJ
	 lg3WViUFL7GNbnu4jD7b0AjPRmDVVtgCvkVsKD7sbvaJcASYvLTcR0ZCfNopMSoxC6
	 0SWYDzguyWshm3pzdVryT8djmUreaWswLkeXac78=
Date: Mon, 19 Aug 2024 17:33:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: gaoxu <gaoxu2@honor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:?= linux-next: Signed-off-by
 missing for commit in the mm tree
Message-Id: <20240819173357.425eef9ab459dd02f8d051d4@linux-foundation.org>
In-Reply-To: <8097d6e2573246f089906db6633e7958@honor.com>
References: <20240819080327.171fabbe@canb.auug.org.au>
	<8097d6e2573246f089906db6633e7958@honor.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Aug 2024 03:56:04 +0000 gaoxu <gaoxu2@honor.com> wrote:

> > 
> > Hi all,
> > 
> > Commit
> > 
> >   ccbb07b2a3a7 ("mm: add lazyfree folio to lru tail")
> > 
> > is missing a Signed-off-by from its author.
> > 
> > Actually the Author is "gaoxu <gaoxu2@honor.com>" while the Signed-off-by
> > is "gao xu <gaoxu2@hihonor.com>".
> I apologize for the mistake. Are there any remedial measures?
> I will be more careful next time.

Well, which address should we use?

