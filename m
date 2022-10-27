Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2FE060F97E
	for <lists+linux-next@lfdr.de>; Thu, 27 Oct 2022 15:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236238AbiJ0Nnr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Oct 2022 09:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235480AbiJ0Nnq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2022 09:43:46 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DC2182C51
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 06:43:45 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id 7so978487ilg.11
        for <linux-next@vger.kernel.org>; Thu, 27 Oct 2022 06:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1J4lq/L0ZXt51amOGt77zumVwv0u+3GUs+B+Bj2JObY=;
        b=mEhLOAkV7uq3eF/iUNvOMrZNE7Rzuz9ApA7/ccJxeeAnNSUNagQ0a7xrH7x9PuKl/I
         9M/qI5tEMyVQ0shUCvvZEEvPZO6X928M6rGMlq1Sid/9LAyo7x/PddabU0cCdo6jmhAV
         QUZlJk+GhbJzDL5UVewGbp7bC3aHLk1sWkD5+YNJ0Y6u3GkEKRP/UsAPg9G/mVwLrtmd
         lwZkO04Q9Ckja5fev3nKju2WQS1xNbMQLL1bh4+uZR8TXfkZwuwOpMUPm7DU06z5OjGE
         tclzVzI0TmYgXq1wh1Z/uOfvF/E4TUy29IgbUbj2M7wX+rKZmKHAFPxuej7xaxiQlPqU
         gctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J4lq/L0ZXt51amOGt77zumVwv0u+3GUs+B+Bj2JObY=;
        b=gm1c++5dG5xwQy/GLWkkqV8Fq+nLCmoT6DyFb/0i4nrZR2OeWaljzSl9w9d9qNMnrR
         kH/zokGVoOwzot1ApGuK8tD8iQuBhhxzdOKudYWnDj/0BOG2ATdZRIllQ/1KkoobAjpz
         1/NF8RaYODburt0hy6b7QE8SeMIbEmL6L9vQq4Qjde29AYyJeQH1KzvO6HD5HNF/Pg3G
         sEl12++9dzK41VArwapNBKUGXX7BTwLNMWTlWPIViQEzX8Onvzfh088eBzH6j34pdZBp
         uXZvs0G4YD2Zrzdj6n4PZWnlKNosYNuZeZndXDO7VG9F6MXC/+QYZL7paxLHQeWljtot
         iSvA==
X-Gm-Message-State: ACrzQf3M4+Pa3YcdfRXqTngMQ7fnP06w3QCyuoWCOcdFjEy8n0lUDsPr
        7GE8hlq0NjuqNtE42QB8ADyBaRHcm2K534xT7nclekBYBRQ=
X-Google-Smtp-Source: AMsMyM779C8QOsdOcYVlOYxgNRm+7WXw+Bo6oj+p+AFyqa/yDMdoyk7G3hZJUXhuXbXwED7lovQ6X85rZVu1JuIK5kU=
X-Received: by 2002:a92:c890:0:b0:2ff:774e:5a16 with SMTP id
 w16-20020a92c890000000b002ff774e5a16mr18986845ilo.173.1666878224594; Thu, 27
 Oct 2022 06:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <202210261704.A5AAF0C@keescook>
In-Reply-To: <202210261704.A5AAF0C@keescook>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 27 Oct 2022 15:43:08 +0200
Message-ID: <CAG48ez0LRubkXO8aX3VwcF5isZ9z4fKTg48z4Ptr=4d778NcZw@mail.gmail.com>
Subject: Re: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
To:     coverity-bot <keescook@chromium.org>
Cc:     Nick Terrell <terrelln@fb.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 27, 2022 at 2:06 AM coverity-bot <keescook@chromium.org> wrote:
>
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221026 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Mon Oct 24 12:12:32 2022 -0700
>     2aa14b1ab2c4 ("zstd: import usptream v1.5.2")
>
> Coverity reported the following:
>
> *** CID 1525550:  Memory - corruptions  (OVERRUN)
> /lib/zstd/compress/huf_compress.c: 673 in HUF_buildCTableFromTree()
> 667                 min += nbPerRank[n];
> 668                 min >>= 1;
> 669         }   }
> 670         for (n=0; n<alphabetSize; n++)
> 671             HUF_setNbBits(ct + huffNode[n].byte, huffNode[n].nbBits);   /* push nbBits per symbol, symbol order */
> 672         for (n=0; n<alphabetSize; n++)
> vvv     CID 1525550:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "valPerRank" of 13 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
> 673             HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++);   /* assign value within rank, symbol order */
> 674         CTable[0] = maxNbBits;
> 675     }
> 676
> 677     size_t HUF_buildCTable_wksp (HUF_CElt* CTable, const unsigned* count, U32 maxSymbolValue, U32 maxNbBits, void* workSpace, size_t wkspSize)
> 678     {

I haven't looked at the other warnings, but from a glance this code
looks fine to me. Coverity is claiming that some symbols can have 255
bits, but we just went through HUF_setMaxHeight(), which enforced that
no symbols have more bits than HUF_TABLELOG_MAX.

Heuristic checks like this are likely to generate lots of false
positives in compression code, I think.
