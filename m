Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E42184556
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 11:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCMKzf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 06:55:35 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40364 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726364AbgCMKzf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 06:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584096933;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OKE4vw7Aq1hkeMcRey40fPC/eJbamV54hF6NTYtSkDU=;
        b=J7Wxj2BN2OKItwppe0OxVSuFcILEg+1cKzi0MIKJBNjI3m1VvRKb+MUgbms6UejfuxypCw
        TOJk51uQTOxJx9IWUsf8v2Ids5osUqWFf1m8dprSYUrHh7m2lLvqf5QXvef1ZhvCJO3nYq
        Dg4SxlpAis0Mv5F3FVEL4hJrOtNHB1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-xiJ0T0aOOeuAPdCscmJDng-1; Fri, 13 Mar 2020 06:55:31 -0400
X-MC-Unique: xiJ0T0aOOeuAPdCscmJDng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF8B801E6C;
        Fri, 13 Mar 2020 10:55:30 +0000 (UTC)
Received: from localhost (ovpn-12-51.pek2.redhat.com [10.72.12.51])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B087C19C6A;
        Fri, 13 Mar 2020 10:55:29 +0000 (UTC)
Date:   Fri, 13 Mar 2020 18:55:26 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200313105526.GM27711@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313214214.4d2e2af6@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/13/20 at 09:42pm, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allnoconfig) produced this warning:

I tried with allnoconfig on x86_64, make doesn't trigger below warnings.

Hi Andrew,

Should we fix this kind of warning? If have to, I'll try to make several 
macro functions like subsection_map_init does for !CONFIG_SPARSEMEM.

> 
> mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-Wunused-function]
>   311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
>       |            ^~~~~~~~~~~~~~~~~~~
> mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used [-Wunused-function]
>   306 | static bool is_subsection_map_empty(struct mem_section *ms)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-Wunused-function]
>   301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
>       |            ^~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commits
> 
>   38eb09ac7c29 ("mm/sparse.c: introduce new function fill_subsection_map()")
>   334411156ba6 ("mm/sparse.c: introduce a new function clear_subsection_map()")
> 
> Or maybe laster patches.
> 
> -- 
> Cheers,
> Stephen Rothwell


