Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC374EA0D1
	for <lists+linux-next@lfdr.de>; Mon, 28 Mar 2022 21:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343851AbiC1T4L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 15:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243536AbiC1T4J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 15:56:09 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9264724BFD
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 12:54:27 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id jo24so12732364qvb.5
        for <linux-next@vger.kernel.org>; Mon, 28 Mar 2022 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=WrEOFIQ8nddTmMjs0Ezvn7QeIOPamLyL9uH7CFNlwEE=;
        b=i++HAmVS08JASO6QZX/Xxgy/WbjC6B9It9btp8NtISWO1XdWybZMgkp+1n2749DK+l
         up+gAv1WXMOAS577OHEZWFKZMPYi3/4AWZJ0kZaCxHR4W81jgktIpfO58ct3RT56yILp
         LErunoEniN1dHor8JQot9XSKdQ5xk64soBcRbZV5HstN764lrWAVt5DAD/dVefgRs+wJ
         EMRJwG/WuH2REr2QGENSMRh8DBfiyGdtoulcD75XIoV4O36bAhbW2/9t0FVGbdk/8iik
         yh8kKIcF3o3k0FqsU4C9TvEzz2Yym5baprzy4dJ+InwYJgQ87txdeVTynshkpShpq0HX
         Xw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=WrEOFIQ8nddTmMjs0Ezvn7QeIOPamLyL9uH7CFNlwEE=;
        b=l7ILdsYhFe5LNbHoh6Mhn8sTmbGmhPUjqjfrOzUA9/Gz6f6Sqc1Vhve13cqcpty2FN
         VPKQTjbv/8EOyurmKuzkuSaprYiGZlJhWX4+lKP7USn8iyZrOyilfn1b7wy0lX/pfurj
         KqbJylstOptlbGjknAAh5H7pdBHy3ehXUmVS8QZ+lqrir8u+ZJaozoSscZlBBqDR1sPK
         +OVNqplVq6TEA4MdG13fR98ycIu6T9o4k3RiA62xcnKH6+u8pEm0dx2IlxABMOS+S9GK
         eZBNsA/wTI6blCYzbQaZvYhQO2RT7mI+GDAmjmoBGewwXdhORrIQe2kCTVnYOGItB8bQ
         N+zA==
X-Gm-Message-State: AOAM530U/MLSvJX828n/ml06HtSq8KwBkHPOdh4xWVPQYxqD1o4l1bkv
        l9VaZeC8JA8GMNsGEoqGUd3ciw==
X-Google-Smtp-Source: ABdhPJyKVt6eqEjiUmWY8SL0qm9MJdTACYj37suEPT1ul1RFDZ72gXR+7h0UKCfzCiuSD2ZSDfor7g==
X-Received: by 2002:a05:6214:caa:b0:441:4ba4:3ebd with SMTP id s10-20020a0562140caa00b004414ba43ebdmr22641386qvs.22.1648497266582;
        Mon, 28 Mar 2022 12:54:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id g9-20020a05620a108900b0067b13036bd5sm8239489qkk.52.2022.03.28.12.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 12:54:26 -0700 (PDT)
Date:   Mon, 28 Mar 2022 12:54:14 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Stephen Rothwell <sfr@canb.auug.org.au>
cc:     Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, linux-mm@kvack.org
Subject: Re: linux-next: build warnings after merge of the akpm-current
 tree
In-Reply-To: <20220324182725.63a454e3@canb.auug.org.au>
Message-ID: <224c2147-36fe-93ed-41a5-a4609b59b4a2@google.com>
References: <20220209170245.08968c92@canb.auug.org.au> <20220324182725.63a454e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 24 Mar 2022, Stephen Rothwell wrote:

> Hi all,
> 
> On Wed, 9 Feb 2022 17:02:45 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the akpm-current tree, today's linux-next build (htmldocs)
> > produced these warnings:
> > 
> > include/linux/mm_types.h:272: warning: Function parameter or member '__filler' not described in 'folio'
> > include/linux/mm_types.h:272: warning: Function parameter or member 'mlock_count' not described in 'folio'
> > 
> > Introduced by commit
> > 
> >   60a5c5ab0ba7 ("mm/munlock: maintain page->mlock_count while unevictable")
> 
> I am still getting these warnings.  That commit is now
> 
>   07ca76067308 ("mm/munlock: maintain page->mlock_count while unevictable")
> 
> in Linus' tree :-(

Sorry about that Stephen: back in Feb I expected Matthew to have strong
feelings about it, and it wouldn't have been helpful for me to mess it
around at that time.

But I'll reply to this now with my suggested patch: which Matthew may
not like (he may consider it a retrograde step), but unless he NAKs it
and comes up with something we all like better, it should do for now.

I did try to 'make htmldocs' for the first time, but was put off by all
the new packages I was asked to install - not a good use of time.  And
I'm so ignorant that I do not even know if "/* public: */" is a helpful
comment or a special annotation.

Patch follows...
Hugh
