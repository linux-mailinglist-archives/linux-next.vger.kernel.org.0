Return-Path: <linux-next+bounces-3292-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4293294F973
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 00:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3251B210A7
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 22:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A8F1957E9;
	Mon, 12 Aug 2024 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.b="hRgRrB4o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC00054759
	for <linux-next@vger.kernel.org>; Mon, 12 Aug 2024 22:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723500857; cv=none; b=Koe1+E9tLZxl9DkcyQUmDyl99PIdxJ3yhgTaxaRccfJNB9SJJWdqjUg0kGvWtEfX9RYxSb0bbVZYWwSKt84hoR/Sq6SC1AxeiQETTgmMY60nUuTpDmErtWaDJjKGRTFatEusJgC3c19trAezZWOLKUD3XycBdxnUf5v3NUeOCwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723500857; c=relaxed/simple;
	bh=5C1krAJ1oJcZnwKGgzLTXj3Ja5HLT0Q2IwevTgFEtV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzFs5Ozj9v/2H10+iJ9LUiiqFl10XCOOSlcts381H7XrQBoevfoV4SWLJv8VaoYrH6S86sxeJSNSK4MCHvLYsUbTquSCkHBZk1ocQSWL9ZM/bgzUcDyjMDDLAv/r48iAYZSn46f/HlT/vrt62kT2C+UyQV2yw5BNKglQHE2UntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu; spf=pass smtp.mailfrom=andrew.cmu.edu; dkim=pass (2048-bit key) header.d=cs.cmu.edu header.i=@cs.cmu.edu header.b=hRgRrB4o; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.cmu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrew.cmu.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bb5a4668faso29132136d6.2
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2024 15:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.cmu.edu; s=google-2021; t=1723500853; x=1724105653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BEBI0rSvxScgRvn2lJRJ3h9SLseLD39QMADZHzmF2os=;
        b=hRgRrB4ogvtaeXLZiiPtetmVtBxERNMdks/c0mbzjhKRNG5KdbXR3f6m32qjYhQh1F
         4Tibb202spj70DixENGYsx3IPuk7XkthLecvHccTWPb7VnUqJvfNfn2GuBOJ/dtkBg59
         ZxcOR2hoW+Q6bu9J+m0QNjBTDUEzsOrMqTiev0JhfHR5n1Bt50spa1fnqcwupbieJN98
         Rx2p2fp459JGMO39cVYbqdea5JtSJUiO56xyfDRyNhORpJmkn/kf3GnFes+JP3HxJQyD
         a8iIza1qC55jM9lLOZ8w/ulv91Erw0mK/sMuERymIPgVaCK87mjFzFuErQmuaf4i5iwU
         50dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723500853; x=1724105653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEBI0rSvxScgRvn2lJRJ3h9SLseLD39QMADZHzmF2os=;
        b=lrs+Lk1q5190YELCpzuOtxjwtiNbsPXUvEJSYYJT6na67BQ50GSPuL6+JPzJ5x+OuT
         +AIxv4ZPI6P4l6z/mDwbHKWu5XLoePZTyXuQguXtmV0YgReSzD4m35/9bfmE4lht5/+u
         n084x6wHcEO2+yH5iR0dI2qQdnjSFOFl8eT6lR2kG0N5dI6LDrWlM8mLokFesqswJnQT
         VZ9NdSeVEIuxJraUla4/2id9RlRFoo289sntk5v4Cyb/Zap9PhtDixMu8TzPQA15LZbH
         5gWEDDLswBX5ddGUi8qry6zuB/5sfmtWywj+DuFSlmv2ZmZLD9G7uCpSD7d7ttQgyRXn
         SXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWadHiy3kzM1BHPJ4JSJIWNAMjhCG9QmZl/hSVMe8uiEYiWUIJTsKtKH7p1t2Dup6c+gfaTV0/IHHfJbytverDeAYI33jhulWCnGg==
X-Gm-Message-State: AOJu0YyP4b46pGRaDt+syzv0h1NDjOZEhVNCyM+RePfFaLf9ez61u19v
	VVzQdUtC2uK1VHfuj3NKFnCSSM3L/0LDCSG/jH1CaReeH7Yhd6+VTN8Ca9Rn6w==
X-Google-Smtp-Source: AGHT+IG0Cziy2SsxyOzWXpFg85ddyMgvvtAARxFbB3pAbnIYfrcvc/i7Cah1M77odIaYos/myhaJPg==
X-Received: by 2002:a05:6214:3983:b0:6b7:a81a:1340 with SMTP id 6a1803df08f44-6bf4f8b427emr16533626d6.51.1723500852693;
        Mon, 12 Aug 2024 15:14:12 -0700 (PDT)
Received: from localhost.localhost (pool-74-98-231-160.pitbpa.fios.verizon.net. [74.98.231.160])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf43648a93sm12302636d6.24.2024.08.12.15.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 15:14:12 -0700 (PDT)
Date: Mon, 12 Aug 2024 22:14:10 +0000
From: Kaiyang Zhao <kaiyang2@cs.cmu.edu>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <ZrqJMqeE8Y7UIn09@localhost.localhost>
References: <20240812093016.148a433c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812093016.148a433c@canb.auug.org.au>

On Mon, Aug 12, 2024 at 09:30:16AM +1000, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> mm/memory.c: In function 'numa_migrate_check':
> mm/memory.c:5403:41: error: 'NUMA_HINT_FAULTS' undeclared (first use in this function)
>  5403 |         count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
>       |                                         ^~~~~~~~~~~~~~~~
> mm/memory.c:5403:41: note: each undeclared identifier is reported only once for each function it appears in
>
> Caused by commit
>
>   75747a26eec1 ("mm,memcg: provide per-cgroup counters for NUMA balancing operations")
>
> from the mm-unstable branch of the mm tree.
>
> CONFIG_NUMA_BALANCING is not set for this build.  I note that the
> preexisting calls to count_vm_numa_event() compile because it is
> implemented as a macro ...
>
> Not the best fix, but I applied the patch below.

Sorry about it. I should have tested with more configs. I'll send a v2
with a fix for this compilation error and the other compilation warning
about the documentation (and remember to run make htmldocs in the future).

Bear with me, from a newbie trying to learn...

Best,
Kaiyang Zhao

