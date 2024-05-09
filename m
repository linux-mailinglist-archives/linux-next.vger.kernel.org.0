Return-Path: <linux-next+bounces-2247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFF58C198D
	for <lists+linux-next@lfdr.de>; Fri, 10 May 2024 00:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21E6C1F22D6D
	for <lists+linux-next@lfdr.de>; Thu,  9 May 2024 22:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C26B12C484;
	Thu,  9 May 2024 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQ4Rhmyh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F223770E0;
	Thu,  9 May 2024 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294678; cv=none; b=uFwfZEPVoZ2DnSOoBqXOqvflJjSB62FE/cgtBmbYqT7W3IO5f2cggUxS3RKHQ3+QrlnfQncTPhcQ1V2/oYM5npM7COcLifVbn1iIROlqVUPygYP+/FABOTK9LtvCSQghf2VWiOaAuM0bvcSG2OxPZek8WEPRaKB+5Ywj7Udt9PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294678; c=relaxed/simple;
	bh=c+nbQXyOehEhG7ZjFayikevPi5/rcN82iRVA1iKV0Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMTxn3/LJvlbvpiUcvNwqdTMMcbQFIJTxACqoEy8jF0ryeaLjjC1llSpFb19RiwgNarExcT+yrtQWB34/lMT3gJ1B3+6C73zkRR09OQbV3ulO/526RIH+40Emh9shAkly5t+YcaryOHibG2+KpfDvAvE22vo7ZcpDwgQDYcVVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQ4Rhmyh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2af71daeec1so406403a91.0;
        Thu, 09 May 2024 15:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715294676; x=1715899476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEss7WBKPS6InHboF+8g/mtU9WWArZNA0eoVPu7Y/lE=;
        b=DQ4RhmyhLSu7Lgzv0Q2HMjQBS9tYiHnoUGz7uMrX7Gy7YBdPoLpNLA6yIgsIme4FAp
         PWnKn9ELBRyg3N971JHqUTPEMGZ38qjp9pqrj7qaxF5tWIuO45WjpSYVlv+eeV5ZSlJO
         Myp0lEI3j8yG7MeDbBDMasKROeuf5HlipDJaxLZ2UWqpqoTBI9vlpLHm2y2OyUA8IauI
         1KP+V76TfqWcjNWWVtAkdtp8gt91FLBMSMUSTHmN5o7TL/K5ylYwc9sk6nQun5sOuG+c
         Tn4/mgjsVFCc1t/vx/gTwL57eL0JhBzHkovIwbpcChli2XI16uTTq8NXcI0L3IMgHRT8
         dbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715294676; x=1715899476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEss7WBKPS6InHboF+8g/mtU9WWArZNA0eoVPu7Y/lE=;
        b=O+kFp1LpQih2FK3d/71RASIFYPfsn2YSDDTl483ORiPJJfuRdoFS5bfgqNZwwBFit6
         rVDnDL56GXKxR4I1MHGPcXt3M1mXNlIH9zsG848YiMWxCoEHJwgjx/+DCHy47zglVfaQ
         k35wCxOA1iy/AsAo81tCZfK9Eau/f8Nz9XtodEpwnhCZGnPf8srvb0Xi7U/FScmfgJoa
         jgJH7k9yPYSjuTi5aWFHGqa+Q20ynCbrd/QWrR5BOIqN0AEbzP65m0CaMEbvQMWwqjyC
         Ns6hwFXFJRU6lIpHFEIpvkiguF/cXgT9p080VyQSWIR9lZY+k6bnrA+ip0CsfuG7F3Gp
         ZjLw==
X-Forwarded-Encrypted: i=1; AJvYcCXrWtelUSYiEGYL3ChhCv6h+g06tx3CQqJYmRmhRZ1mPrm02K5eG0SwblaYdfiLx5tDtYCVAwrnzaAJvPxJHUo7HLhhWL1/Jx9fq4dLjlhdjVQScZQAaTUozsdcNQewWpG3qa0BAyQG2A==
X-Gm-Message-State: AOJu0YxCZ5cUVKLXpTE74jep3dYUUnSAdT07rbqEVlyH5FCLF/q9uphP
	mLHSOpeDVBBI5iRHfutJsRvQGIooMwnofUT1NN+rLk3qW53U4lH/oRHqtg==
X-Google-Smtp-Source: AGHT+IEe5CuNDyrYcVdQEmrGDHv7OrewQH9TxpgXOvGsuWlSt2sphWWldPHDDcZnrl1xg0aboUpHMA==
X-Received: by 2002:a17:90a:130a:b0:2b5:1cdc:9ac8 with SMTP id 98e67ed59e1d1-2b6cd305bd2mr846049a91.4.1715294676346;
        Thu, 09 May 2024 15:44:36 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67116629asm2028112a91.19.2024.05.09.15.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 15:44:35 -0700 (PDT)
Date: Fri, 10 May 2024 06:44:29 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>, Coly Li <colyli@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Mirvish <matthew@mm12.xyz>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <Zj1RzZdtfL7UQax1@visitorckw-System-Product-Name>
References: <20240509152745.08af752f@canb.auug.org.au>
 <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <te64v6zwwor6jkco6uiu2zz7ern6ijhyu5okfvdz3bmj3w5qfp@mx4zdniwymqj>

On Thu, May 09, 2024 at 03:58:57PM -0400, Kent Overstreet wrote:
> On Thu, May 09, 2024 at 03:27:45PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the refactor-heap tree got conflicts in:
> > 
> >   drivers/md/bcache/bset.c
> >   drivers/md/bcache/bset.h
> >   drivers/md/bcache/btree.c
> >   drivers/md/bcache/writeback.c
> > 
> > between commit:
> > 
> >   3a861560ccb3 ("bcache: fix variable length array abuse in btree_iter")
> > 
> > from the block tree and commit:
> > 
> >   afa5721abaaa ("bcache: Remove heap-related macros and switch to generic min_heap")
> > 
> > from the refactor-heap tree.
> > 
> > Ok, these conflicts are too extensive, so I am dropping the refactor-heap
> > tree for today.  I suggest you all get together and sort something out.
> 
> Coli and Kuan, you guys will need to get this sorted out quick if we
> want refactor-heap to make the merge window

Hi Coli and Kent,

If I understand correctly, the reported bug is because we attempted to
point (heap)->data to a dynamically allocated memory , but at that time
(heap)->data was not a regular pointer but a fixed size array with a
length of MAX_BSETS.

In my refactor heap patch series, I introduced a preallocated array and
decided in min_heap_init() whether the data pointer should point to an
incoming pointer or to the preallocated array. Therefore, I am
wondering if my patch might have unintentionally fixed this bug?

I am unsure how to reproduce the reported issue. Could you assist me in
verifying whether my assumption is correct?

Regards,
Kuan-Wei

