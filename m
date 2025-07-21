Return-Path: <linux-next+bounces-7669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD01B0CCA9
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 23:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDCE543DF5
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 21:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2E5223322;
	Mon, 21 Jul 2025 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gZD1/fgd"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8572A17996
	for <linux-next@vger.kernel.org>; Mon, 21 Jul 2025 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753133752; cv=none; b=fNktk8S/Yl7qsE2bJIAgwxUkyqbHUerUpDfXtkNUuPIaOEvYugyYRk71x+ltEo78rTsOG9Nna8pDbAE74NJsUM9zWK05yBvWRFECtUpRu5dHUd/rXYUeuTMFQ7B7PywbDwr622eflSwxgemgjNUIXh4QwgpvmKJg4ZwRVpcFamw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753133752; c=relaxed/simple;
	bh=pIHkg1PF7m+SsM+AvWBAOfUApbaih6tece88slv0vUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=paz/5Nl7Heptt2vUaQMun/P3Wbuhla7BcMJiBUQn9o6lMfsMU1TXq23mLvrWdnUjFKviPrm3KL4+tVhGcsK7jF1S0aaSSyyOaf4Bz5nTyy+GvKQVS+PgAGTqbqaHkx/uEMJI7eiCEVIyNJt/kz7PQ03a/tNy8CtNOqHKd3F5JjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gZD1/fgd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753133749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNZK/xPSiNdRHNiKZgH5YF3Zh3xZYyyJT1VvgerLxOo=;
	b=gZD1/fgd1NYxPe5I5TMyLKHAQK6NQAqOwh+tDH4mTPN8SfssmTuB/tOzT/bRH9PHviQVvD
	SjI9IxfsSsG9VyJ6R8El1uAc44Op3o2rUZ5pPkUcxXH/tbTF5f5KdPRSXZ75liu89Xrxs5
	KpzVGyIAELhKKLTmyxxAKhHCPGORQxY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-DURfIlb6MhWRITQbQBn12g-1; Mon, 21 Jul 2025 17:35:47 -0400
X-MC-Unique: DURfIlb6MhWRITQbQBn12g-1
X-Mimecast-MFC-AGG-ID: DURfIlb6MhWRITQbQBn12g_1753133746
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234a102faa3so40583285ad.0
        for <linux-next@vger.kernel.org>; Mon, 21 Jul 2025 14:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133746; x=1753738546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNZK/xPSiNdRHNiKZgH5YF3Zh3xZYyyJT1VvgerLxOo=;
        b=MnQe8F+eRRqv70MBS6MKU5fVMpWSUiJeKlgZPD4R35SWvBEF5eLcXgqdma5gesUiKn
         f1wSqjN6cd5UMJfcTMuEaHTcra3iK3pSRmtVeguQgWxq/kEFupLTb9FUCpXm6Q+9BAk9
         BrW7iTib4NStqzPoMyaGQbvJlaIr2nNz0HooS2yFspHsfSgJDz8bn+xBqDI0E21LKmho
         u0sPxdG2cfpeT7Fwa92EMEWRHShciqknzAdYi//fTqz/bP3beGFJAxb73QaMSwYzSkGO
         oeIU0PxxC+gNx/IMXOZKqF+1/EsTNNPPjs8u7W7pOuZ8VzXBOahamwJki8z7iIMwVsBi
         1xpA==
X-Forwarded-Encrypted: i=1; AJvYcCUK3z3QzVfTXdQOGyGSzbrZJdCBLTCJ+RFdRfuHP416oPGG4si6VPmTzJONPLISGMc37jAKlkVYPGUv@vger.kernel.org
X-Gm-Message-State: AOJu0YyOgdXFtFQZhWxQzNdJl7MFC88B4NmdUHqN3f9uGUj18d/EqIjF
	/+HWZIii760nDzLos+Eoy8pCxLNCnLltz/4uyJHKWebBKx7smVNNlw3V5mN1Li/dlRMF5wBf5nL
	nq8h/4icejUD/wcdPtuWfmlbmmvqqRAMWPtEtxR7jzpp56t0/QWHjE2ZuHi2B/dw=
X-Gm-Gg: ASbGncvel/F1uUd1QPQAtbBq3mkOeakA3+RITJGIQBONi0Mf8ILTM0jJ9+NR1S0KbpF
	r9H9WmILoCZnNJmThX8oboCSt0bGgo2zHWBxK/m1RdqCISRm1fucw/PlBaeeYVQJfF4HZMCwedY
	4K8USoy2xvCSt/aveMs34h/O/VcIoBA5rsGZR6mwS0oMBhEcO/y+mHTFk5OWNic+fsV+8cfB+bH
	jj6CDU9P+9031z3y3K2/ZUuErBvY9I2fETvhxh2vdXFIEuGg9S0eDctFEuZ6/TzwjbACw/VVl+y
	YWNcOYXFMY31Rp3iY0zujjuj1UWnA1VSJWYJtmJbW5tF5Di7s+wVoiPUBPyf1L3b1z5e5YS0Xk4
	iI4HK0uivAw35xTdi9EvRMvJoDNU=
X-Received: by 2002:a17:902:c943:b0:234:bca7:292e with SMTP id d9443c01a7336-23e24edc25emr301841835ad.14.1753133746174;
        Mon, 21 Jul 2025 14:35:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmaPY5mypld4N9BcnGH03d5JyqrlB7F4HlS9rdNmADis0kNCJBZXkmGrCsg2jAEFmD4jbN6g==
X-Received: by 2002:a17:902:c943:b0:234:bca7:292e with SMTP id d9443c01a7336-23e24edc25emr301841615ad.14.1753133745762;
        Mon, 21 Jul 2025 14:35:45 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-59-70-29-229-84.dsl.bell.ca. [70.29.229.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b708244sm62593925ad.227.2025.07.21.14.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 14:35:45 -0700 (PDT)
Message-ID: <954b5aa4-0dbd-445f-8859-320fb6a1186d@redhat.com>
Date: Mon, 21 Jul 2025 17:35:42 -0400
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the slab tree with the mm-unstable
 tree
To: Matthew Wilcox <willy@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>
References: <20250721142001.3d1c8777@canb.auug.org.au>
 <aH6XIUX4xyo2pZfY@casper.infradead.org>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <aH6XIUX4xyo2pZfY@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-21 15:38, Matthew Wilcox wrote:
> On Mon, Jul 21, 2025 at 02:20:01PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the slab tree got a conflict in:
>>
>>    fs/proc/page.c
>>
>> between commit:
>>
>>    a602ee331e31 ("fs: stable_page_flags(): use snapshot_page()")
>>
>> from the mm-unstable tree and commit:
>>
>>    d8178294c53e ("proc: Remove mention of PG_slab")
>>
>> from the slab tree.
>>
>> I fixed it up (I just used the former version) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
> 
> I think the snapshot_page commit was incorrect in removing this comment.
> It is still valuable information.  I think the comment from d8178294c53e
> should remain in the tree after the resolution.

The comment wasn't just dropped, David suggested a new version for the comment
(which is similar to yours). The new comment is now part of set_ps_flags()
which is where we set this flag in the snapshot_page() implementation:

static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
                          const struct page *page)
{
         /*
          * Only the first page of a high-order buddy page has PageBuddy() set.
          * So we have to check manually whether this page is part of a high-
          * order buddy page.
          */
         if (PageBuddy(page))
                 ps->flags |= PAGE_SNAPSHOT_PG_BUDDY;
         else if (page_count(page) == 0 && is_free_buddy_page(page))
                 ps->flags |= PAGE_SNAPSHOT_PG_BUDDY;

         if (folio_test_idle(folio))
                 ps->flags |= PAGE_SNAPSHOT_PG_IDLE;
}


