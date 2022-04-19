Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A24D850726F
	for <lists+linux-next@lfdr.de>; Tue, 19 Apr 2022 18:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354247AbiDSQEN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Apr 2022 12:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244370AbiDSQEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Apr 2022 12:04:12 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B699032EF1
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 09:01:28 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id md20-20020a17090b23d400b001cb70ef790dso2237246pjb.5
        for <linux-next@vger.kernel.org>; Tue, 19 Apr 2022 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yFkFjqpOiICUZKBBXqsv6xYMwtD9akgoqB/oPFVYH6s=;
        b=XUI8d/MUyS+Z6t573L3e0zuWKytIV2vZPTKhN/jpInIJdtPnyFpa3mkD2THyk7ulh+
         Kqkl8braNAE9j+cVqi7h+zsguIoHKpwdt1ulMzRFn9XAtlCXgEOceJ/X9P8kPhdyy6RS
         OVkWATHLx+hgWUtYYauSZ6X5JObL8xWSV6fUicas6A0xH3fX0hdPhsb3TMwEmzIgh/Gy
         I4vZggAjTylrVzA/eostCtJqoIKLdgQQ3CRHVlNXJeM70gzFnU/wRP+jUh75enA0xueE
         183IFLFuwju1wx0+xzjYChKiiozVGiLMpIX+hd8ZM54/iy97hS3wlE0UGmPbHw99186R
         82Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yFkFjqpOiICUZKBBXqsv6xYMwtD9akgoqB/oPFVYH6s=;
        b=fGDXK8dyBZ025jwOOJ2B4wiaQK/14+YsJrXHusDgTv95mk0hmPu+Vi9ODm8iNXRZOD
         OQDuHKSXSxCek2mcbCYNGpSjERGWofeFAi//izdbsNxJuRgcHJui1XgHYz3Yj9qyjnb+
         oUUP6bTWmrCN6EooMhW6fZ/GjFY63qadulmE7PBs6QPl6yGF3t31PfcC1IUFZKgjHd/Y
         qG3JktGwdI8q78WS+m+eZ5R3c5KKLpxcOFJIE2U8PIPLDWhOlC7zzB53lbLutMqvcJoX
         a9Cv52ch7E5ycxC1HjqmUNSH0NjdPeJ9qtOrEh4PEOWRwhHEvygDZLpw7j93oIzZBbxR
         3DSQ==
X-Gm-Message-State: AOAM533JTHIp3rUgbYqLaqy1ympZm/lEfOlyepUjq0gHyriS+EDZapyX
        UNvfpZ8mY77MtuskisSc36WXqg==
X-Google-Smtp-Source: ABdhPJz7yUN7JdXLKZI7zWnZgfsDj/Q4UEhY0oOMe0d/DOdZqQMBqZRMVdNAYhpKxscDLCxPy8+FKA==
X-Received: by 2002:a17:90a:2983:b0:1cb:8d6e:e10b with SMTP id h3-20020a17090a298300b001cb8d6ee10bmr19430845pjd.208.1650384087908;
        Tue, 19 Apr 2022 09:01:27 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090a718600b001d27a7d1715sm8704344pjk.21.2022.04.19.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:01:27 -0700 (PDT)
Date:   Tue, 19 Apr 2022 16:01:23 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>,
        Peter Gonda <pgonda@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm tree
Message-ID: <Yl7c06VX5Pf4ZKsa@google.com>
References: <20220419153423.644c0fa1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419153423.644c0fa1@canb.auug.org.au>
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

On Tue, Apr 19, 2022, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm tree, today's linux-next build (arm64 defconfig)
> failed like this:
> 
> arch/arm64/kvm/psci.c: In function 'kvm_prepare_system_event':
> arch/arm64/kvm/psci.c:184:32: error: 'struct <anonymous>' has no member named 'flags'
>   184 |         vcpu->run->system_event.flags = flags;
>       |                                ^
> 
> Caused by commit
> 
>   c24a950ec7d6 ("KVM, SEV: Add KVM_EXIT_SHUTDOWN metadata for SEV-ES")
> 
> In this commit, the uapi structure changes do not match the documentation
> changes :-(  Does it matter that the ABI may be changed by this commit
> (depending on the alignment of the structure members)?

Yeah, it's a bit of mess.  I believe we have a way out, waiting on Paolo to weigh in.

https://lore.kernel.org/all/YlisiF4BU6Uxe+iU@google.com
