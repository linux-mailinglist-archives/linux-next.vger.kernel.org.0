Return-Path: <linux-next+bounces-7837-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953CB19BEB
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 09:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA9AE3AFD86
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475561E1E1B;
	Mon,  4 Aug 2025 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pBqB5/iB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A21A08A6;
	Mon,  4 Aug 2025 07:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754291365; cv=none; b=WL+ySAme9VGlOUGV+r/vtd4fQ1glX1zzogArCaFsmqnikMnBWQ+cTJJ9WDMmp5bKW043E/33HBRJOpKLat3gGhblrn8dKJy6KPVBWVn5YoS9nhnr0BtFN9dKKkRi5SXq5h57RynyhOQd3m1ztSibyp7pIyP24TtiotvYFndlLiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754291365; c=relaxed/simple;
	bh=n0NnbIXfcWi8tOe3X5UZ+aXQVZcahEXVA3GSPXELtR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVraIEMXxW1gKs7vfFfZuvug1PdNhhY2/uuKGmU4Z2xzN831ItW27Pb7HvLBAP9DgfMnRm+uIbwGDYfKEtMg8qpzsFyGIl7jYOahpkw6J4MtDeTjmkzOOvLy+nMAAxegGgcOzwZfALUsQYo5Uh9y6yUEr+UXngeCDgQ3yJEpNB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pBqB5/iB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96208C4CEE7;
	Mon,  4 Aug 2025 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754291364;
	bh=n0NnbIXfcWi8tOe3X5UZ+aXQVZcahEXVA3GSPXELtR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBqB5/iBDBVQAa+k/RVKONcE/zSYmeEJG6synO6CS9gl0lqAJ25PhfpE0nXpRdFfO
	 T41T5LUgEu3hSsVPceOQWQu0k54G5vd2id+quXtECCgKMuD+GR1XhVKTlNBRuMCXNU
	 OrHlguvfewLKrERiAqvHbzy1CyDr+Gz2uDt42sixvf/LZLr0toWkOT0RlwVic9hzFy
	 SnnGGXVf5R4sgO7B6Nkm67HmNMIOqAvWxstMXXDaFJ/CKNtyT3/VXzoF0wxonYv8CJ
	 +yq9A0Ti2ztOGy4E5E0BIVX3oi3g8LN1eFA2CKNRhXsH6go9c/pWG1flN2o2tFcFvl
	 vO9GjIfiIr6vg==
Date: Mon, 4 Aug 2025 09:09:19 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <aJBcn9jb2RseRwS3@example.org>
References: <20250730161223.63783458@canb.auug.org.au>
 <20250804112540.6b8ed4b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250804112540.6b8ed4b9@canb.auug.org.au>

On Mon, Aug 04, 2025 at 11:25:40AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 30 Jul 2025 16:12:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the kbuild tree, today's linux-next build (i386 defconfig)
> > failed like this:
> > 
> > ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
> > .vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined reference to `__builtin_memcmp'
> > 
> > Caused by commit
> > 
> >   c4b487ddc51f ("modpost: Create modalias for builtin modules")
> > 
> > I have reverted that commit, along with its parent and child, for
> > today.  It's parent commit
> > 
> >   66ef3890c628 ("modpost: Add modname to mod_device_table alias")
> > 
> > generated this warning in the i386 defconfig build:
> > 
> > scripts/mod/file2alias.c: In function ‘handle_moddevtable’:
> > scripts/mod/file2alias.c:1480:25: warning: variable ‘modnamelen’ set but not used [-Wunused-but-set-variable]
> >  1480 |         size_t typelen, modnamelen;
> >       |                         ^~~~~~~~~~
> 
> I am still reverting those commits.

I do not have my tree. Can you apply my fix for original commit instead of
revert ?

https://lore.kernel.org/all/20250730090025.2402129-1-legion@kernel.org/

-- 
Rgrds, legion


