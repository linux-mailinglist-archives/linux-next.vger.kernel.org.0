Return-Path: <linux-next+bounces-136-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 026587FE528
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 02:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912911F20C74
	for <lists+linux-next@lfdr.de>; Thu, 30 Nov 2023 01:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742F5628;
	Thu, 30 Nov 2023 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AuvTLSSP"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2686DC
	for <linux-next@vger.kernel.org>; Wed, 29 Nov 2023 17:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701306455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaB7sxRUp4UiPtrVF5Y50SK0RyEXN9nQyzM9BHGDG2U=;
	b=AuvTLSSPdEREihdXDhJrksrZxjqzzgrHSmQmZTEtm1vTrAYQ1oNbQK/aL346eyp0Zp0iRr
	VJxVOxyEPU3e7vy4Cfz50r7FXl4RBAu1ySrskXjrXmNbbbfdquCJq29QcsZTH14W24Gnpu
	zk0FxJgbFO/2aMooR86j2mc1d8DN3d8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-sv9f3qJEMk2-l9P1BxWwvA-1; Wed,
 29 Nov 2023 20:07:32 -0500
X-MC-Unique: sv9f3qJEMk2-l9P1BxWwvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A58380008A;
	Thu, 30 Nov 2023 01:07:32 +0000 (UTC)
Received: from localhost (unknown [10.72.112.126])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FCB52026D4C;
	Thu, 30 Nov 2023 01:07:30 +0000 (UTC)
Date: Thu, 30 Nov 2023 09:07:28 +0800
From: Baoquan He <bhe@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <ZWfgUJaNv0p8IS7K@MiWiFi-R3L-srv>
References: <20231130074350.7c758662@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130074350.7c758662@canb.auug.org.au>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

On 11/30/23 at 07:43am, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f8ff23429c62 ("kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP")
> 
> Fixes tag
> 
>   Fixes: commit 89cde455915f ("kexec: consolidate kexec and crash options into kernel/Kconfig.kexec")
           ~~~~~~
Sorry, my fault. I didn't read the
Documentation/process/submitting-patches.rst carefully.

Maybe Andrew can help remove the 'commit' after 'Fixes:', thanks.

> 
> has these problem(s):
> 
>   - leading word 'commit' unexpected



