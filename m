Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF75E1EDB71
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 04:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgFDCzH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 22:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFDCzH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 22:55:07 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEA5C03E96D;
        Wed,  3 Jun 2020 19:55:06 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id dp10so2242509qvb.10;
        Wed, 03 Jun 2020 19:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+1jRoXPXgHZDeP30eSxZAHFvGE75NHGQIpkr64zYlkM=;
        b=R1lVXrMrRkN5dJ9c9Gf4SVMey4upZtT7TTmyU8YbdCr3ys/MRnbFTcU59mS/kYCvwe
         teBRlNniR4dXRyEZ8hEjsl/wnTHquMaJ8kG041pZqE0bPrOWjMWdp6+oC8cAISiVPSs7
         +3XSzvMnk+pdchMn5kGSWcUZPwAquB042joawQEJLEnuQlnqD9S2d3yBzPW3SoQw7bR/
         fsbDEdk8lkCom2p6I/ybc+AYHcM5yWCX1nSg6fMGd0jcAXJgbvEk2oSzkgMQ1blrpOdN
         hczyhbdRfcExp1arcxkHqZ3Sa2Z4qFruyUsKu8dWOVFmO1wrCIOtIwVB2U+/4oOaYRpo
         1/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+1jRoXPXgHZDeP30eSxZAHFvGE75NHGQIpkr64zYlkM=;
        b=aDPCvKH/WiuYzu5ZMYEOqXZbcFYFLYhbP1uXiYNrUsYFwfD6N3/RMrRv1IsFNxvp6r
         Y6MWCLd/+jLFDDwg1lSr2YuS/gUojkVvnsVn4Ie76RvO/o5im+5j3BxMU8fWM74QEson
         +WsH2O/DZZDFnjWS7srFqNLXUAmOZGixKkxziLqW53ynoN/iD+PQAz9kN3+9QMiTY0XW
         6Y3v8I/3btuhvzL5NMPnPiVWV+p6gB6SWbqz6x4Galz+4XQuZ1AXWlBxuT9sIJbJk/F4
         A3yngglh1k1fbsiA/2ixNLBkKXrNXlt1wB2WzZ1pYUzu1wNn3FeY33w5aQQrhL6h+7gd
         /qKg==
X-Gm-Message-State: AOAM532Z3U+fEY4+Pvv2uLqLCPinAJY9iaTbh6SbJ6pb29A/Zm9iP31R
        Cqrlpm3WdR6mknd2MY1zje4M1hNz
X-Google-Smtp-Source: ABdhPJyIDAXNVCLtGLiCOQRfgeDTiTBFb5hpg3eBjY/sEby1L01RBGH3tpC45346bLXn17yZF7D3oA==
X-Received: by 2002:ad4:4f23:: with SMTP id fc3mr2912897qvb.25.1591239305499;
        Wed, 03 Jun 2020 19:55:05 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:1172:51aa:9d42:fe87? ([2601:282:803:7700:1172:51aa:9d42:fe87])
        by smtp.googlemail.com with ESMTPSA id h50sm3907956qte.25.2020.06.03.19.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 19:55:04 -0700 (PDT)
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Steffen Klassert <steffen.klassert@secunet.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
References: <20200511130015.37103884@canb.auug.org.au>
 <20200602092040.5ef52300@canb.auug.org.au>
 <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
 <20200604112606.25ffde35@canb.auug.org.au>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <8d943a28-2e9f-9c61-9cff-899e907d6b86@gmail.com>
Date:   Wed, 3 Jun 2020 20:55:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604112606.25ffde35@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/3/20 7:26 PM, Stephen Rothwell wrote:
> 
> And now the net-next tree has been merged into Linus' tree without this fix :-(
> 

I took a look earlier and I think it is fine. Some code was moved around
in ipsec-next and I think the merge is good. I'll run the test cases
later this week and double check. Thanks for the reminder
