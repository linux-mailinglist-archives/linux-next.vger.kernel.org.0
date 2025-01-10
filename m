Return-Path: <linux-next+bounces-5146-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CFEA08ED0
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 12:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C5F3A996F
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2456B205AA8;
	Fri, 10 Jan 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkWRxhL4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB661AA1F6;
	Fri, 10 Jan 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736507289; cv=none; b=TXvUx9+uB9vJPzWa+De2IlkD1kCZr5PwA6IVITDv3kiW5R1AOTZKpn4m3HaJtuIWz4YtZ+0exN7aZ5N58iYg7AFNO0ggtyDFUJEOe5Cy26imr53cuS4V9/fD6fuWBpgGmPQNpeR0a9MM/uDubSYf9QsjDxAvODliCqLaqItYyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736507289; c=relaxed/simple;
	bh=NsOsM1gIUOc1kHCpBQKyDj3khzhWkTChTn7RoJ4bO8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbHg3IQztWawH9wYc4KRxLwA/+SYqZAlOmaPDUCQR0bpdhRm8NnEMLlj+00Y386sfIP7+TK5+RZjne3dpSTXQnYDCFBUfHg8cSVhW4N4fOpGMYp3u9fi84dSV8EkB4oTDt8ms2QdIeMBflhGq7wwSrWO1o1PGqSeQ4hD6rXStgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkWRxhL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729E5C4CED6;
	Fri, 10 Jan 2025 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736507288;
	bh=NsOsM1gIUOc1kHCpBQKyDj3khzhWkTChTn7RoJ4bO8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkWRxhL4l1Be0do2TKEukF3sRKgItwIHLbaeSZuMaMxDYkrREmqIej3ZGM2z9TLOO
	 fdOv96IgM5YG1qrwBfpnVaPFW8qiSpCYBQ06DSuzUNFeF3SGDNFhzs2RHM/yWeevuS
	 TtuX5+tbxaCrf/VLSUlnGaZYfB6v5trIGMYTo7nrYEnNsKr+VpQPVNm7ZJTA51NGvo
	 Da2T3wlHLdsF6aNlR/DGGsjlgNo9lsr0EfiaErBLaZEQ79VJmmDXgBSw7FZXuuEPvi
	 cuq450jzu6BIvGd+9vadKLWSWGA4cEcCNWJlfdvGH5OKJR06h0W/lScSTAbHl/bv1U
	 3Q5K1IwVmlruQ==
Date: Fri, 10 Jan 2025 12:08:04 +0100
From: Christian Brauner <brauner@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20250110-siedler-karnickel-d6a5e3904c9c@brauner>
References: <20250106101038.65f9b810@canb.auug.org.au>
 <20250106191417.0f7707a0ecbf1a386ef60538@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106191417.0f7707a0ecbf1a386ef60538@linux-foundation.org>

On Mon, Jan 06, 2025 at 07:14:17PM -0800, Andrew Morton wrote:
> On Mon, 6 Jan 2025 10:10:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > The following commits are also in the mm-hotfixes and mm trees as
> > different commits (but the same patches):
> > 
> >   15858da53542 ("selftests: coredump: Add stackdump test")
> >   ab251dacfbae ("fs/proc: do_task_stat: Fix ESP not readable during coredump")
> > 
> > These are commits
> > 
> >   1e0ad4a1359b ("selftests: coredump: add stackdump test")
> > 
> > from the mm-nonmm-unstable branch of the mm tree, and
> > 
> >   7cc55ae2737b ("fs/proc: do_task_stat: fix ESP not readable during coredump")
> > 
> > from the mm-hotfixes-unstable branch of the mm-hotfixes tree.
> 
> I'll drop the mm.git copies.
> 
> Christian,
> 
> hp2:/usr/src/mm> git log fs/proc | grep "Signed.*akpm" | wc -l 
> 1231
> 
> if you wish to change this then please discuss with me.

Ah sorry, I just saw this message now.
Sorry, since fs/proc/ is just listed as fsdevel I picked them up.
I'm happy to take them going forward unless it has obvious interactions
with mm.

Let me know what you think.

