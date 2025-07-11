Return-Path: <linux-next+bounces-7468-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50351B01045
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 02:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CED11C8178A
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 00:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C3B8F77;
	Fri, 11 Jul 2025 00:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yf3Y15SM"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A5B663;
	Fri, 11 Jul 2025 00:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752194194; cv=none; b=V0yRjd1fwvkTcU1kStI0PndeRiP9TBscvVlCuNq9nq/5eOzJV833JbuQwmjYW1r0QS3PiRdvAM7Uu3gVETjVPiflM/xi8EsO5guIAnczSh5s9qH99T4f0vTnZOw7K8wPSu7D4/ODpOL5UzeGM2UJMajM3RwH+4W2KtsOzfjmp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752194194; c=relaxed/simple;
	bh=Po8vUnOhRBF8IeqIw0vCfKVNkWgDCOlqLqru9zQ6Mqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzzP4dtMR3/n6CNdZJaXVTezQuvFGb1aR5PqZwqDytyTsEkN3P9ungwxNQsMRA+D4qB7v/b5VfzW6y8fN0LeLTps2WdkrGKyBFU+lf9ElqMw/r7rWInDc/XsGjrGEx5vjYG65iB4cB3DoYDakI5xabOuYKI9MAnuAHaAtPmGrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yf3Y15SM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=//Z+i2Ub0h9pscQ8a583rxZLCBDnW13N4OS2udptcIM=; b=Yf3Y15SMGfV9bf03rDdIRrH8Om
	IPGFIM/ee/pMEe5vCAol6MY6cK+F/3GFBJzBCVPZf7lCu25iAuUSHyieyHoaySJhnYl3NZg3NLkM+
	ZKAT0KP7s0UBodD4IDjFU5dzsq0v4a8mYJTqEWmxuk50WxrDny/n4oFhLZC5Cg5GZ6wzH+INwt0f5
	dPnxPntHULA2h07nzESaA9EP2vTVqLlkdOj7JbjNCQbd3QtuNZfx6y2cjZsvANCPiXiTSwucLR6yO
	j6xKClSvZQxjKQOM2Y4X7COENTXsq7FMY4qgYv1m8odTeS8WEfD4Jcar63GFSBuERkdDzOfF1VO8Z
	ghsPzi5A==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua1kZ-0000000AyOs-3HUQ;
	Fri, 11 Jul 2025 00:36:28 +0000
Message-ID: <fd96200b-dcfd-4871-80a2-add053fd70cf@infradead.org>
Date: Thu, 10 Jul 2025 17:36:24 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
To: Andrew Morton <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Hildenbrand <david@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250710175446.128c7def@canb.auug.org.au>
 <20250710153017.c17ca59f1df36eec90db8b54@linux-foundation.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250710153017.c17ca59f1df36eec90db8b54@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/10/25 3:30 PM, Andrew Morton wrote:
> On Thu, 10 Jul 2025 17:54:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
>> Hi all,
>>
>> After merging the mm-unstable tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> mm/migrate.c:215: warning: Function parameter or struct member 'dst' not described in 'migrate_movable_ops_page'
>> mm/migrate.c:215: warning: Function parameter or struct member 'src' not described in 'migrate_movable_ops_page'
>> mm/migrate.c:215: warning: Function parameter or struct member 'mode' not described in 'migrate_movable_ops_page'
>> mm/migrate.c:215: warning: Excess function parameter 'page' description in 'migrate_movable_ops_page'
>>
>> Introduced by commit
>>
>>   d5967fb0bf8e ("mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()")
> 
> How about this?
> 
> --- a/mm/migrate.c~mm-migrate-factor-out-movable_ops-page-handling-into-migrate_movable_ops_page-fix
> +++ a/mm/migrate.c
> @@ -161,7 +161,9 @@ static void putback_movable_ops_page(str
>  
>  /**
>   * migrate_movable_ops_page - migrate an isolated movable_ops page
> - * @page: The isolated page.
> + * @dst: The destination page.
> + * @src: The source page.
> + * @mode: The migration mode.
>   *
>   * Migrate an isolated movable_ops page.
>   *
> _

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

