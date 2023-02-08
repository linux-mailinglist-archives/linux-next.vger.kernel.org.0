Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B99768F104
	for <lists+linux-next@lfdr.de>; Wed,  8 Feb 2023 15:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjBHOlh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Feb 2023 09:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjBHOlg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Feb 2023 09:41:36 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F075A23119
        for <linux-next@vger.kernel.org>; Wed,  8 Feb 2023 06:41:35 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id r8so19490678pls.2
        for <linux-next@vger.kernel.org>; Wed, 08 Feb 2023 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MY39DmN1t/CwGVkTz3RSKkgjSBmeSu6BoRbYAh1MUvY=;
        b=dO8I/8yILz2OXAz/DqNPhHkpGypRFRqqHVzt9E7g/A8LYRe+CUuOHdd/aH2IsLumIn
         w+nGU+EgnHVi8e3njWacyl8qaXJqtZqJ59Cu9WSpdjOhtFd0II0AFTG8ocNuVgeJ10fq
         x/VwLjRc+XLegjwLMenFYSQZrAglY99YJiQ9Xj2xpJJbXuHpbbUmxD3JFxHpOiC1TOm4
         IWL3ftTHkbUvnOarZimZQKCuQmy4FbKT3XrExhg6cv4IcWiz4Ah72Sw1O9U8xkncGSUa
         mC/k2z3eVYXvf282xaVLHDGVzn1DS+/VMd1pdl0ol70K1yNBHLsQR+gLd9xmbIAbIkTG
         fHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MY39DmN1t/CwGVkTz3RSKkgjSBmeSu6BoRbYAh1MUvY=;
        b=HNilvGvi3KT2Oys4jqhippfbs1UaU4Jo7ogDyR+Wzw9Kp91aWAdQsojXqgKN4cjZS5
         5xYB9d2IzcKLwv7JRBQitsOmNJqbujWR+sTSoLIX9I9LCyMQymRr02nJ9ylWxQ7G3VCq
         2RRuCTyctphlxlODsJ9oX1UFGtz5gUYjbqBBb+r4N9534D19fdB/TfP0/Cp+y7staqxt
         mUWNclph+d2mHYBWnH0jHN+QvUpshc+i9gdao7BXibpPWegez4Si27Sni5NShwmw+GtS
         LXOeAhcuquGhETAWYQLAnKHfxUlVhA79WP3LG529HB4SV8xvLFVWTdeZFIdUARgtloDC
         aVsg==
X-Gm-Message-State: AO0yUKW0rQIoZ7yBEJK9vg3V4+F6HQFcKv3sIebVYPVWrKcLsHyoo0+G
        j6odJ41dB7eWjJRcceJStuWrsA==
X-Google-Smtp-Source: AK7set9PszDlu33edtyJyB704ckj0NH01sfPEeLwzJgPkBsfMZKTpBakYwwvdZ8jDNHz074lH07WRQ==
X-Received: by 2002:a17:902:8215:b0:189:b910:c6d2 with SMTP id x21-20020a170902821500b00189b910c6d2mr247077pln.1.1675867295354;
        Wed, 08 Feb 2023 06:41:35 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090a6e4f00b00230ba23daaesm1646773pjm.28.2023.02.08.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:41:34 -0800 (PST)
Date:   Wed, 8 Feb 2023 14:41:31 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Vipin Sharma <vipinsh@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kvm-x86 tree
Message-ID: <Y+O0mypSEC58zYPD@google.com>
References: <20230208153847.5c89b497@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208153847.5c89b497@canb.auug.org.au>
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

On Wed, Feb 08, 2023, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a `different
> commit (but the same patch):
> 
>   4dfd8e37fa0f ("KVM: selftests: Make reclaim_period_ms input always be positive")
> 
> This is commit
> 
>   c2c46b10d526 ("KVM: selftests: Make reclaim_period_ms input always be positive")
> 
> in Linus' tree.

My bad, dropped it from kvm-x86.

Thanks!
