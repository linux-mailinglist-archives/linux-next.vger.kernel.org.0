Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFEE964AF37
	for <lists+linux-next@lfdr.de>; Tue, 13 Dec 2022 06:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbiLMFN3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Dec 2022 00:13:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiLMFMV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Dec 2022 00:12:21 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 357511EAF6
        for <linux-next@vger.kernel.org>; Mon, 12 Dec 2022 21:11:18 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 82so9723938pgc.0
        for <linux-next@vger.kernel.org>; Mon, 12 Dec 2022 21:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JvLJkRDl/eGYq65K9ozwiIdP/b76CWijrIthCHV3zSs=;
        b=oGT3p3M6GzVamSxM50ijyeGnSjnvVx36YIULutAUDtjYqesQbtoHyYcWGUY2mbk17g
         OVh47sasWuSn/or26+rWuljpB7i+81r1mCbGxkjwt/XS4exmFLUWP6bXofp6p4OGJBvB
         xeSFLdjMjvvt0pWfY0xQgs5z3tUBW+ByZ4KCR8DXinT+cVP5yrCnr1RO6Y5mbUtKdEPr
         knkyme9DFso8rrR0exh1QY09XMFIJaAn6LKfHHvhjgNqRrzKyQHR0viW2k9UyoFTocQA
         ALoJq5LFwOZEybezpbumx/I+4Rfq368I4sfPGUKiVW2OcBs+tolUimiNaSYEM6+4zCv3
         Rntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvLJkRDl/eGYq65K9ozwiIdP/b76CWijrIthCHV3zSs=;
        b=uZ3hqqhSpceegmJ4k3ABBgT0BaNOrz3fxdviduVx4AAnHqfwxv1bDxZE72pfUM2q0I
         suAvMjVnB0rrwRDH7f2Ihq4c4B193FvfNPe8ZKgF6PsUB/nWwmgaynNM7WD8pCuzxAKr
         Mqcx8R9cbFR0FmFsVI14n1gt2XELEHMpm4OdO5ox9B6Dy7v/poBad2b0cCun/wwMoS2q
         YGmq0ygrLCryBFmg4HuhIxo07zxzd6gWzPHsi/PIrwUny/D/WYV02C/UjpBrJaIxzZb3
         XlEeTGjR4bJWbL60NGVo3DuT+64DgaLMvrJ9HCnUhqaQ+cEvHdne3tAZ8kbtAI4PDkFa
         gldA==
X-Gm-Message-State: ANoB5pl3VG/fasTG15p57CkvU44L3maj6CWIDj1okJItLoEG+XoXExuX
        a//tJTiC3vl9Y3kEQPZjG1QGFnUnTSebW3Ed
X-Google-Smtp-Source: AA0mqf5BqehjB9PzmASzQdkp8C0QmkQtqyWW5CSO2zOr5GUoaj7Rgc5ibaoCPSozebo99SgOG1hN0w==
X-Received: by 2002:aa7:9697:0:b0:576:9252:d06 with SMTP id f23-20020aa79697000000b0057692520d06mr126120pfk.0.1670908277497;
        Mon, 12 Dec 2022 21:11:17 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id m3-20020a625803000000b0056bc30e618dsm6685108pfb.38.2022.12.12.21.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 21:11:17 -0800 (PST)
Date:   Tue, 13 Dec 2022 05:11:13 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kvm tree
Message-ID: <Y5gJcTo0mi6vTFW7@google.com>
References: <20221213154130.3f28c512@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213154130.3f28c512@canb.auug.org.au>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 13, 2022, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/virt/kvm/api.rst:7260: ERROR: Unexpected indentation.
> Documentation/virt/kvm/api.rst:7261: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Introduced by commit
> 
>   1f158147181b ("KVM: x86: Clean up KVM_CAP_X86_USER_SPACE_MSR documentation")

On it, should hit next soon.  Thanks!

https://lore.kernel.org/all/20221207000959.2035098-1-seanjc@google.com
