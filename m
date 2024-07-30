Return-Path: <linux-next+bounces-3168-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E580A94119B
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 14:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99B3C1F21891
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 12:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E77819DFBF;
	Tue, 30 Jul 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKz9gHxE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D3186AEE;
	Tue, 30 Jul 2024 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722341557; cv=none; b=cPZCK/gmf+Br7pLKjG/aAAEBZHAB+F2ZXeZuI0eQv/4ccDsvKGxj4fztbTPS3uE8uDDTmYqUordKcmfjJijBrwxtZko5vSHoeXtw/PGefaYLbk8voxA+CbiS/Ne5cHKhTJQ7IjVJ6HivvR70/ryBktE9WVIuQ6B1Rk7EOZCC1i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722341557; c=relaxed/simple;
	bh=YQrm1TvqV0uuelPFISXxIWUf+doyA9P+r6cqTfNL/DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW60maRDHdcCiTwFTnfYqriYEmEfbmRddwAVhq48yp8EY1MRMd7GIk+m9O7bxC+oUwjPljGayF4a6WJyifa+Tpx/mh9UfaLnMaen3VjoNUfyVbRyOIjS9bBCMWmqczZVIu2SXXbfNBDN+Id6Qxzfe0XMw+oWSShP6/JDhNupGmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKz9gHxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB6EAC32782;
	Tue, 30 Jul 2024 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722341556;
	bh=YQrm1TvqV0uuelPFISXxIWUf+doyA9P+r6cqTfNL/DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKz9gHxE8KM8qobqi2rw1AIXk0GNdC0Hp5FGouCf6B1WeiOohFc9uY3mBbngY6Sv3
	 OsjwmtqWByy72XzHqivuSMlQIbxQoUwM6F3oFgujIJdFzvUsVUIQTkBUUVu3u4Tid0
	 vd1qtTvA446HQ6IPl5q4l9JAJ9hLe6niW0GeXvF+DcyKw0pXY1yhC8nkYw2+f8z7zI
	 r9apFvT3MpMldysicqjlKyM4mjTaC1AanehahtIffsXF3X1dvDEfb2e93obKv2uvYv
	 Zm0m4NEbY+oKUguNnLx4ZgZWYAgrH9K4eKXe0um6vOAjTWktVnFmHHARu9Ls+MOv6O
	 O2qsZAKQ7sKww==
Date: Tue, 30 Jul 2024 14:12:33 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240730-sitzplatz-vollbad-c269e4298a58@brauner>
References: <20240726100041.142b6e35@canb.auug.org.au>
 <20240730090059.721de7cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730090059.721de7cf@canb.auug.org.au>

On Tue, Jul 30, 2024 at 09:00:59AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 26 Jul 2024 10:00:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the vfs-brauner tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > In file included from fs/smb/server/unicode.c:14:
> > fs/smb/server/smb_common.h:46: error: "F_CREATED" redefined [-Werror]
> >    46 | #define F_CREATED       2
> >       | 
> > In file included from include/linux/fcntl.h:6,
> >                  from include/linux/fs.h:26,
> >                  from fs/smb/server/unicode.c:9:
> > include/uapi/linux/fcntl.h:20: note: this is the location of the previous definition
> >    20 | #define F_CREATED       (F_LINUX_SPECIFIC_BASE + 4)
> >       | 
> > cc1: all warnings being treated as errors
> > 
> > Caused by commit
> > 
> >   a621ce4eed14 ("fcntl: add F_CREATED")
> > 
> > Is that commit really intended for this merge window?
> > 
> > I have used the vfs-brauner tree from next-20240725 for today.
> 
> I am still getting this build failure.

Sorry, this is now fixed!

