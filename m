Return-Path: <linux-next+bounces-2361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A198CA651
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 04:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08E68B226CF
	for <lists+linux-next@lfdr.de>; Tue, 21 May 2024 02:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B1E1078B;
	Tue, 21 May 2024 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAKjnEZE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52A8C1A;
	Tue, 21 May 2024 02:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716259459; cv=none; b=FwPTfRYwrKF90YDuf45tMzqUiFQV+QV7UuVyS7tZsBnaykPPowL+8J8isjZV8FPvkCaHSU0nJpcvrz+getSJTnrueqSMkjdzRjHcToNu35Glh0kXNe0tWVJZ3p+2djG0SiTcJqsz5pNmyzt2wuk7qRWwwpvLpqQ74j2ppLUcOPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716259459; c=relaxed/simple;
	bh=K2M+WLPCL4VOQVVxul+gz3FtVryJLgsF51Ub5a5UJxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFy1oEf6Rjakso+BNH7wqcifZno2p/6J83i8cfpio7CHs6YWQhz8cWQSWxuJY31dJLpmIXgT4gZcbC7qYOatRIf+C+Q4Uzg5qVktDjr+c2NAMjG1FBY+yN4m64NIDYFFNXsxwMg9WxqMoG7OLK/8/3VVhc/pUroS4WYUsyYhVsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAKjnEZE; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9a820d7c1so545087b6e.1;
        Mon, 20 May 2024 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716259457; x=1716864257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKWcTeR+u31MXEx70K6q7LJy0dqXYN3hgdkPeLlJHR8=;
        b=UAKjnEZELISqp5C4M+/do5CVjJH0lw09ujLanMVEmYmBpG+fNRblnPr6LzFYA2TSTm
         qM51oJOpt2+pe53thdmLa1PnRIDPqO7Vv1N+VomV1VSir4h33XonLD/tnaZDa6S3MsJT
         FxiNZipvgwUCjG5fwtgpcuCa4+31c9lhqp7FDDWt2RzTCrIL7bLqY4N9ekoduA0Z6tU0
         CLlDNP/9tBYYMkUNT5oWlSU6+GUlcUKsL4ooVbMBQEyqPUPbeuANlS+P6MurRSfqte8v
         ifJ8544ErFM9yywf+1ghB3OQlQpcHXqCQ82J5P8Hwbx8fNO9/DUmq50BLJCtAMbf2uE9
         k/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716259457; x=1716864257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKWcTeR+u31MXEx70K6q7LJy0dqXYN3hgdkPeLlJHR8=;
        b=sN0uQXDx67LjKY+KzySyhexRidp8qnbcISjikJryxdn0ZeL4VBX0rtVGRSz89xOxFG
         8fSQyhABkuh4zl0RZsNsLG+3OMigCA4PaELZZTCMX9GEmYpFqt3PwWK9ZEIRk/6ymAGq
         Lz1G4pA8gcP3B9kyr5eReeKGQKKivSJNJZcVhyn52ceyGUeW1DST4ApbHx4kB/o6guUH
         vVZqRO3SsqV3ld0VJwK8k2Ogt7kfS2/TEIrX+tPRTBuanLn0UP7YIEyPL4675yArks0G
         16DoLOrNXAFrU7iMhktTc6qDQ7ophzaRi0PHsloje5WD0HIQGzyr5hUA6az5IZhQADNO
         jl0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOT2dx6y67mDeFos8PieIyKwQc3/WVQ7C+ys+eQONIH8WSfD0JSd9E8+iQN4w+M35F202orZHC9Cxq0+9LPmmUEcnBuc68xkrh0B+BBi3HFBFeVAmlBVr6vkWJJjaHMbj9dVc6Hvxp9A==
X-Gm-Message-State: AOJu0Yz0IBZw98gJFu/kleH1VOVfkaConAtTpglIcOlX3YfLm/r8I4wf
	sTly05sMR+WCnoVCeG9vUdZ4dmf2clam+Z2a7HGow8/mngH3eNhmN/K+xg==
X-Google-Smtp-Source: AGHT+IEeH66UR/uGEDM+DQsewf2HS3SA3zaKukq7QJjQBEqpX+Zc8yb4b7qEXZsNlDTd1225opJD7g==
X-Received: by 2002:a05:6808:f03:b0:3c8:2be1:a65b with SMTP id 5614622812f47-3c996f53513mr38354075b6e.0.1716259456595;
        Mon, 20 May 2024 19:44:16 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65cfed58446sm6058924a12.74.2024.05.20.19.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 19:44:15 -0700 (PDT)
Date: Tue, 21 May 2024 10:44:11 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
	Coly Li <colyli@suse.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Mirvish <matthew@mm12.xyz>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: linux-next: manual merge of the refactor-heap tree with the
 block tree
Message-ID: <ZkwKe15cyhgRP4Qy@visitorckw-System-Product-Name>
References: <20240509152745.08af752f@canb.auug.org.au>
 <20240521121803.399705b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240521121803.399705b0@canb.auug.org.au>

On Tue, May 21, 2024 at 12:18:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 9 May 2024 15:27:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
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
> I am still dropping the refactor-heap tree ...

Hi Kent,

Are you still planning to send the pull request in this merge window?
I've sent the v5 patch series [1] to resolve the conflicts some time ago.
Is there anything missing from my side?

[1]: https://lkml.kernel.org/20240514084724.557100-1-visitorckw@gmail.com

Regards,
Kuan-Wei



