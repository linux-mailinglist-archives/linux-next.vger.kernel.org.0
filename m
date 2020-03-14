Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3331918535B
	for <lists+linux-next@lfdr.de>; Sat, 14 Mar 2020 01:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbgCNAfQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 20:35:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43468 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726757AbgCNAfQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 20:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584146114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=btIWlwHO4JU3aOAw46JleS0jrUoaiiuQDvpeGyEbgqA=;
        b=OWlp8EXrXxReIMtcV4rmOqSfe8xssxgC+R8ls8QyF7O1tIRKT6SZWCmU6No3kjwJvHuMs/
        KJwYNj3gsZ+J6jKpP0BxfWenFw4n1e33IgfG9WZHL9qM4GZoI3Lire2dW9Jb64HXhpB4s6
        b3SbHCDVucVT4di+SmA64SMIaDfxl3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-cpvF39fAP22Ln-wvLpPAJw-1; Fri, 13 Mar 2020 20:35:12 -0400
X-MC-Unique: cpvF39fAP22Ln-wvLpPAJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55209184D264;
        Sat, 14 Mar 2020 00:35:11 +0000 (UTC)
Received: from localhost (ovpn-12-20.pek2.redhat.com [10.72.12.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B270B8FBE1;
        Sat, 14 Mar 2020 00:35:10 +0000 (UTC)
Date:   Sat, 14 Mar 2020 08:35:07 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200314003507.GN27711@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
 <20200313125627.GA8518@MiWiFi-R3L-srv>
 <20200314110954.580b58dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200314110954.580b58dd@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/14/20 at 11:09am, Stephen Rothwell wrote:
> Hi Baoquan,
> 
> On Fri, 13 Mar 2020 20:56:27 +0800 Baoquan He <bhe@redhat.com> wrote:
> >
> > I made below change, but I can't triger these warnings. Could you try
> > below patch, see if it's works?
> 
> I needed to add "ARCH=x86_64" to the "make allnoconfig" command line
> (and the subsequent "make") otherwise I get a 32 bit build.

Ok, I now see the warnings with 'allnoconfig ARCH=x86_64', thanks.

> 
> > From 9be668f1e30b6bb4ed5f4a07e7d3bb76d3f58f35 Mon Sep 17 00:00:00 2001
> > From: Baoquan He <bhe@redhat.com>
> > Date: Fri, 13 Mar 2020 20:25:54 +0800
> > Subject: [PATCH] mm/sparse.c: fix the building warning with !SPARSEMEM
> > 
> > Stephen reported below warnings are seen with allnoconfig on x86_64.
> > Fix it by making those dummy functions sub-section map handling visible
> > with CONFIG_SPARSEMEM enabled.
> > 
> > mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-Wunused-function]
> >   311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
> >       |            ^~~~~~~~~~~~~~~~~~~
> > mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used [-Wunused-function]
> >   306 | static bool is_subsection_map_empty(struct mem_section *ms)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~
> > mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-Wunused-function]
> >   301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr_pages)
> >       |            ^~~~~~~~~~~~~~~~~~~~
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> > ---
> >  mm/sparse.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index 362018e82e22..9e08d118719f 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -293,7 +293,7 @@ static int fill_subsection_map(unsigned long pfn, unsigned long nr_pages)
> >  
> >  	return rc;
> >  }
> > -#else
> > +#elif defined(CONFIG_SPARSEMEM)
> >  void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
> >  {
> >  }
> 
> This didn't make any difference as CONFIG_SPARSEMEM is set for the
> x86_64 allnoconfig build.

You are right, CONFIG_SPARSEMEM is set for x86_64. I will work out a
patch after testing. Thanks for these details.

