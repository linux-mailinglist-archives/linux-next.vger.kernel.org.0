Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B66E76070B
	for <lists+linux-next@lfdr.de>; Tue, 25 Jul 2023 06:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbjGYEMD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Jul 2023 00:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjGYEL4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Jul 2023 00:11:56 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7DE1BCC
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 21:11:52 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d0728058651so3408242276.1
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2023 21:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690258311; x=1690863111;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfSKEIdvDiXChG/0o+OpKXSikThIqoBp12joH4KG6gw=;
        b=PoRX9G9bv/It87yTRwxcp+1MQ7my6zVHV3vuUyQqWN4vYiW6cjqpELrv+g31I9xeYY
         s8JyLSJeI7jjz1odHqK+LCotLiaJWi4EcmLgD4qAfhiFca9yHSkM9HDyDaCFClqtdX1c
         8SUC2Tkm9/h57Q208E+4fJ5xVL08YBIBZrgXCrst4bQ9ZJLcmrzusd2pOcNXuF7oPeIg
         v76Ts+Sh+8NS0oal/fzapicBG+bsKTOI5amgiOFQ3GGF+9DTwzgub8ctvPDz+w/PHiWe
         tnnjBGBOW7/byVAT9f81cbgkcI5YiUo0DCIe2+5q8sEWO1qYAuDmX/5WJEJzj3t2XS3g
         9oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258311; x=1690863111;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfSKEIdvDiXChG/0o+OpKXSikThIqoBp12joH4KG6gw=;
        b=WtschnWLOm2Ok85leZTqzgG11jJ0DgMaNTLwr48GA5JtmgVXavenVhTdX4Avr962Bt
         t9cn81SvIUZLI41ZGSsC72dctmBYKcg1UtHt15Q8/k0sW/lABluMRewGxsc8FVwr2xp2
         br6hypHPRBLCIZm9X5UaIdTQBvxmYV9NeXzT++TQD7/SVXEWtjnhKX6nGSRDP8BKyB9y
         bokhQIwE3Z4he0cIicgIeob5g69SEtjwuZmQ19t4Bf+LXwG7mK7cAexV1rYf52Cp9GI1
         Agww22Nh4V5+6yHMkz7XWTz3/hDV04/8Qim60wYrx0MmQxOryAFv65Etyc4tNVpbDDkT
         wvJg==
X-Gm-Message-State: ABy/qLbADcubSO/PVzRm0WI4mqnQWFfihjCB5AyK+DNblBDcjhqDa57a
        Pz3oWaSPDaIBPua7TlMeshjjNfuxA5E2RsPFfTlrUQ==
X-Google-Smtp-Source: APBJJlEyAzXnvxyVs+M9uV3cC0NGEPwn1O5Jm9w54HLMJ1fOwrkySCg7J1mN7bZqr33RcepW15GYFA==
X-Received: by 2002:a25:2983:0:b0:d07:f1ed:51f7 with SMTP id p125-20020a252983000000b00d07f1ed51f7mr8005481ybp.43.1690258311474;
        Mon, 24 Jul 2023 21:11:51 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id u35-20020a25f823000000b00d07a7bbe4acsm1811961ybd.19.2023.07.24.21.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:11:51 -0700 (PDT)
Date:   Mon, 24 Jul 2023 21:10:59 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-hotfixes tree
In-Reply-To: <20230725135546.28334fe4@canb.auug.org.au>
Message-ID: <3084e97c-3a7d-ace8-2e9c-31642fd663df@google.com>
References: <20230725135546.28334fe4@canb.auug.org.au>
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

On Tue, 25 Jul 2023, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the mm-hotfixes tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/filesystems/tmpfs.rst:116: ERROR: Malformed table.
> Text in column margin in table line 4.
> 
> ===========  ==============================================================
> huge=never   Do not allocate huge pages.  This is the default.
> huge=always  Attempt to allocate huge page every time a new page is needed.
> huge=within_size Only allocate huge page if it will be fully within i_size.
>              Also respect madvise(2) hints.
> huge=advise  Only allocate huge page if requested with madvise(2).
> ===========  ==============================================================
> 
> Introduced by commit
> 
>   a0ebb5aa2de3 ("tmpfs: fix Documentation of noswap and huge mount options")

Sorry about that, Stephen: thanks for the report.

Randy, you're always my goto guy for how to get these Doc things right,
I hope you don't mind.  I just write the text as I want it to appear,
then get caught out by unfamiliar rules.

Please suggest a fixup to the fix patch if you can - thanks!

Hugh
