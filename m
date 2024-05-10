Return-Path: <linux-next+bounces-2252-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26EB8C1CC5
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 05:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AE7FB20947
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 03:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4EC148844;
	Fri, 10 May 2024 03:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2+A3yFI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729BD14882B;
	Fri, 10 May 2024 03:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715310436; cv=none; b=aQ2x18ccNVyo/N09ZktGPxEbHlAtY9nV7L20KZE/2LLeqP455cK7nr34VetZrZhWBsMP5Pnx3CAaU5SmL/brfDGLj4Ol0AyZ/c1JfmZY0+4ZIHAlfVnkIbXjUu289Rf0t+i6P3viqtWVguNEzieEGPiX852KLhIgq3LLfZ27b+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715310436; c=relaxed/simple;
	bh=Na5tJlHqz8QEgBdxLiHuZ0FJpnvP58ur8r7XWRE/Hhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l79XiEQMigiYbUWj5JxgQZI/G1x1NDjBWQ85k+RfvnL+zi++fLASKs0VJaQIu1szYVVl/+/bk+i+MVVbozIzcK9C3Nv8byEABigk5Cyq1YIrrqb/b+v49OvvcB1HoS5CZr9sbYI8DrFUtkTNft7xTmKqFrBcqp5TmeiyfHP9o/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2+A3yFI; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ab48c14334so414930a91.3;
        Thu, 09 May 2024 20:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715310435; x=1715915235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFFaiOKvmV+vo0PVVMiVz0GTsIpZpZQBHjNqBGv0W2Q=;
        b=D2+A3yFI3zJRwSEphmJh+486G9tGZBara1PJpuM3o7VX23mdqgRc3qdRDJ3lAss1DY
         98IBW/mhgpNcxiT76zVwpTTinrvFLcBo2E+61GZRfxTI9fqfoSVO/zliZQUywcmoBgPi
         M0SzFE1fFz+hUhWnFWmZXgexBv/fLTpc7RYbDEas31vig7bJnBup8OK6SrjqqUajODtO
         /OnQn+AMjhWPVAyZDTJuHcdTyn0HqfkD6ILWBs2RnrDotxmvATseNwgXJ/K74baZ2SE6
         Cin+c+LQo+ftQ79eiGQUHeNdJCgSez00/xVve/JsX7LSDYYgpD+yETrGJbhobBnN5Px0
         SrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715310435; x=1715915235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFFaiOKvmV+vo0PVVMiVz0GTsIpZpZQBHjNqBGv0W2Q=;
        b=de7ZMRvLGrCXxuGZTuMn2iqDmCL+IJJ0QErqprRmxdPTTW+Z7jt8yh1Ksig8GGkd98
         POZodwVao4MqDGRrevoAx/3w22f47A1SCKu7uJqDj7wHVKeZxdhzY8MJkN/HyZfmXh2+
         2tcbAfXaCVchV/OgGW+R/wg+jVe7b2gW+3aWISb2x4OMKiCV5K+mqrWLMsoAhBAwwVQf
         BwYqWVyNZMYPTDHKIyKe9oe2udzGUGCnKbHt0GU8wYHteICGGTBMdo5N0k609aY0MubI
         uzkpePz0BVParXNlCvUVp6ENLcBJP1gHYEd6/xDP1JLfkCjXrTRTkKqK7EQGq7Oos/du
         1WTw==
X-Forwarded-Encrypted: i=1; AJvYcCWk0DCT88iHBAJmsKDHbSb604KJ2A4f3wBLWNUk2jViurEovIYyWGdHgl08IB7qj5r1aBEigdvywq/NG3YTh2KZ0A9YDCopcX6o+HL7Cb9xTWh0YkIl3WikmylRPzPYRul/03GDn+d1ig==
X-Gm-Message-State: AOJu0Yw4fC4v7hSJsxQcWzAIc6BNgpkryQR2ENbL52yg7IT5gHOnJ1Id
	1XkbUJQe/p8NLOfetISEtYxjLRM7vjTWbHxqg7DObIO66gLo1W4K
X-Google-Smtp-Source: AGHT+IEm+YoP63MbMDQYKGhh1+7KLCRrn2E64x8AMMX/NDxeEs/aba9hKiTeO5WwH3JBVZnnXwjvrQ==
X-Received: by 2002:a17:902:da8f:b0:1eb:2e59:d6a with SMTP id d9443c01a7336-1ef44049772mr16873055ad.3.1715310434774;
        Thu, 09 May 2024 20:07:14 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b0csm21558645ad.176.2024.05.09.20.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 20:07:14 -0700 (PDT)
Date: Fri, 10 May 2024 11:07:11 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Mirvish <matthew@mm12.xyz>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <Zj2PX6Fy3BEnQc50@visitorckw-System-Product-Name>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
 <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
 <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <buehluxvo234sj7onzl6wwjmuslmnkh7g6vnpru23kpti6qmpp@7nqak2ser7mw>

On Thu, May 09, 2024 at 07:16:31PM -0400, Kent Overstreet wrote:
> On Fri, May 10, 2024 at 06:44:29AM +0800, Kuan-Wei Chiu wrote:
> > On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> > > On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > > > 
> > > >   drivers/md/bcache/bset.c
> > > >   drivers/md/bcache/bset.h
> > > >   drivers/md/bcache/btree.c
> > > >   drivers/md/bcache/writeback.c
> > > > 
> > > > between commit:
> > > > 
> > > >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > > > 
> > > > from the block tree and commit:
> > > > 
> > > >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > > > 
> > > > from the refactor-heap tree.
> > > > 
> > > > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > > > tree for today.  I suggest you all get together and sort something out.
> > > 
> > > Coli and Kuan, you guys will need to get this sorted out quick if we
> > > want refactor-heap to make the merge window
> > 
> > Hi Coli and Kent,
> > 
> > If I understand correctly, the reported bug is because we attempted to
> > point (heap)->data to a dynamically allocated memory , but at that time
> > (heap)->data was not a regular pointer but a fixed size array with a
> > length of MAX_BSETS.
> > 
> > In my refactor heap patch series, I introduced a preallocated array and
> > decided in min_heap_init() whether the data pointer should point to an
> > incoming pointer or to the preallocated array. Therefore, I am
> > wondering if my patch might have unintentionally fixed this bug?
> > 
> > I am unsure how to reproduce the reported issue. Could you assist me in
> > verifying whether my assumption is correct?
> 
> This is a merge conflict, not a runtime. Can you rebase onto Coli's
> tree? We'll have to retest.

Oh, sorry for the misunderstanding I caused. When I mentioned "bug" [1]
earlier, I was referring to the bug addressed in
3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter"),
not a merge conflict.

Here are the results after the rebase:
https://github.com/visitorckw/linux.git refactor-heap

[1]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2039368

Regards,
Kuan-Wei

